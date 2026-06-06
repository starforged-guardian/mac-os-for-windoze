#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

ROOT="$(project_root)"

if ! command_exists ruby; then
  warn "Ruby is not available; skipping Markdown link validation."
  exit 0
fi

ruby - "$ROOT" <<'RUBY'
require "find"
require "pathname"

root = Pathname.new(ARGV.fetch(0)).realpath
errors = []

Find.find(root.to_s) do |path|
  next unless path.end_with?(".md")
  file = Pathname.new(path)
  text = file.read

  text.scan(/!?\[[^\]]*\]\(([^)\s]+)(?:\s+["'][^"']*["'])?\)/).flatten.each do |raw_target|
    target = raw_target.sub(/#.*/, "")
    next if target.empty?
    next if target =~ %r{\A[a-z][a-z0-9+.-]*:}i

    candidate =
      if target.start_with?("/")
        root.join(target.sub(%r{\A/+}, ""))
      else
        file.dirname.join(target)
      end

    unless candidate.exist?
      errors << "#{file.relative_path_from(root)} links to missing target: #{raw_target}"
    end
  end
end

if errors.empty?
  puts "All local Markdown links are valid."
else
  warn = errors.map { |error| "  - #{error}" }.join("\n")
  abort "Broken local Markdown links:\n#{warn}"
end
RUBY
