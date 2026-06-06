#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

section() {
  printf '\n== %s ==\n' "$1"
}

detect_chip() {
  local brand model
  brand="$(sysctl -n machdep.cpu.brand_string 2>/dev/null || true)"
  if [[ -n "$brand" ]]; then
    printf '%s\n' "$brand"
    return 0
  fi

  if [[ "$(uname -m)" == "arm64" ]]; then
    model="$(sysctl -n hw.model 2>/dev/null || true)"
    if [[ -n "$model" ]]; then
      printf 'Apple Silicon (%s)\n' "$model"
    else
      printf 'Apple Silicon\n'
    fi
    return 0
  fi

  uname -p
}

value_or_unknown() {
  local label output
  label="$1"
  shift

  printf '%-24s' "$label:"
  if output="$("$@" 2>/dev/null)" && [[ -n "$output" ]]; then
    printf '%s\n' "${output%%$'\n'*}"
  else
    printf 'unknown\n'
  fi
}

section "System"
value_or_unknown "Product" sw_vers -productName
value_or_unknown "macOS version" sw_vers -productVersion
value_or_unknown "Build" sw_vers -buildVersion
value_or_unknown "Architecture" uname -m
value_or_unknown "Chip" detect_chip

section "Developer Basics"
printf '%-24s' "Shell:"
printf '%s\n' "${SHELL:-unknown}"

printf '%-24s' "Homebrew:"
if command_exists brew; then
  brew --version | sed -n '1p'
  printf '%-24s%s\n' "Homebrew path:" "$(command -v brew)"
else
  printf 'missing\n'
  # shellcheck disable=SC2016
  printf '  Install hint: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"\n'
fi

printf '%-24s' "Xcode CLT:"
if xcode-select -p >/dev/null 2>&1; then
  xcode-select -p
else
  printf 'missing\n'
  printf '  Install hint: xcode-select --install\n'
fi

printf '%-24s' "Rosetta:"
if [[ "$(uname -m)" == "arm64" ]]; then
  if pkgutil --pkg-info com.apple.pkg.RosettaUpdateAuto >/dev/null 2>&1; then
    printf 'installed\n'
  else
    printf 'not installed or not detected\n'
    printf '  Install hint: softwareupdate --install-rosetta --agree-to-license\n'
  fi
else
  printf 'not needed on Intel Mac\n'
fi

section "Security And Backup"
printf '%-24s' "FileVault:"
if command_exists fdesetup; then
  filevault_output="$(fdesetup status 2>/dev/null || true)"
  if [[ -n "$filevault_output" ]]; then
    printf '%s\n' "${filevault_output%%$'\n'*}"
  else
    printf 'unknown\n'
  fi
else
  printf 'unknown\n'
fi

printf '%-24s' "Time Machine:"
if command_exists tmutil; then
  tmutil_output="$(tmutil destinationinfo 2>/dev/null || true)"
  if [[ -n "$tmutil_output" && "$tmutil_output" != *"No destinations configured"* ]]; then
    printf '%s\n' "${tmutil_output%%$'\n'*}"
  else
    printf 'no destination detected\n'
  fi
else
  printf 'unknown\n'
fi

section "Permission Hints"
cat <<'HINTS'
Window switchers and window managers may need Accessibility and Screen Recording.
Keyboard and mouse tools may need Input Monitoring.
Review: System Settings > Privacy & Security
Review: System Settings > General > Login Items & Extensions
HINTS
