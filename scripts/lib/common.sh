#!/usr/bin/env bash

project_root() {
  local source_dir
  source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  cd "$source_dir/../.." && pwd
}

info() {
  printf 'info: %s\n' "$*"
}

warn() {
  printf 'warn: %s\n' "$*" >&2
}

die() {
  printf 'error: %s\n' "$*" >&2
  exit 1
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

confirm() {
  local prompt answer
  prompt="$1"

  if [[ ! -t 0 ]]; then
    warn "No interactive input available; defaulting to no for: $prompt"
    return 1
  fi

  printf '%s [y/N] ' "$prompt"
  read -r answer

  case "$answer" in
    y|Y|yes|YES|Yes)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

print_command() {
  printf '+'
  printf ' %q' "$@"
  printf '\n'
}

run_or_print() {
  local dry_run
  dry_run="$1"
  shift

  if [[ "$dry_run" == "1" ]]; then
    print_command "$@"
  else
    "$@"
  fi
}
