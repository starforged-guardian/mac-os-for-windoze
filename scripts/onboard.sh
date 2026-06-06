#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

ROOT="$(project_root)"
DRY_RUN=0
PROFILE="windows-feel"

usage() {
  cat <<'USAGE'
Usage: scripts/onboard.sh [--dry-run] [--profile windows-feel|power-user|dev|all]

Installs reviewed Homebrew profiles after confirmation. In dry-run mode, prints
the commands it would run and makes no changes.
USAGE
}

homebrew_install_hint() {
  cat <<'HINT'
Homebrew is not installed or is not on PATH.

Official Homebrew install command:

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

After installing Homebrew, restart your terminal and rerun this script.
HINT
}

profile_file() {
  case "$1" in
    windows-feel)
      printf '%s/brewfiles/windows-feel.Brewfile\n' "$ROOT"
      ;;
    power-user)
      printf '%s/brewfiles/power-user.Brewfile\n' "$ROOT"
      ;;
    dev)
      printf '%s/brewfiles/dev.Brewfile\n' "$ROOT"
      ;;
    *)
      return 1
      ;;
  esac
}

run_profile() {
  local profile file
  profile="$1"
  file="$(profile_file "$profile")"

  [[ -f "$file" ]] || die "Missing Brewfile: $file"

  info "Profile: $profile"
  info "Brewfile: $file"

  if [[ "$DRY_RUN" == "1" ]]; then
    run_or_print "$DRY_RUN" brew bundle --file="$file"
    return 0
  fi

  if confirm "Install or update Homebrew items for profile '$profile'?"; then
    brew bundle --file="$file"
  else
    warn "Skipped profile: $profile"
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --profile)
      [[ $# -ge 2 ]] || die "--profile requires a value"
      PROFILE="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "Unknown argument: $1"
      ;;
  esac
done

case "$PROFILE" in
  windows-feel|power-user|dev|all)
    ;;
  *)
    die "Unknown profile: $PROFILE"
    ;;
esac

if ! command_exists brew; then
  homebrew_install_hint
  if [[ "$DRY_RUN" == "1" ]]; then
    warn "Continuing dry run without Homebrew."
  else
    exit 1
  fi
else
  info "Homebrew: $(brew --version | head -n 1)"
fi

if [[ "$PROFILE" == "all" ]]; then
  run_profile windows-feel
  run_profile power-user
  run_profile dev
else
  run_profile "$PROFILE"
fi
