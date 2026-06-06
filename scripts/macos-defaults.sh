#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

APPLY=0
BACKUP_DIR="$HOME/.mac-os-for-windoze/backups/defaults-$(date +%Y%m%d-%H%M%S)"
BACKED_UP_DOMAINS=""

usage() {
  cat <<'USAGE'
Usage: scripts/macos-defaults.sh [--dry-run|--apply]

Prints recommended macOS defaults by default. With --apply, prompts before each
setting and backs up touched defaults domains under ~/.mac-os-for-windoze/.
USAGE
}

SETTINGS=(
  "NSGlobalDomain|AppleShowAllExtensions|-bool|true|Show all file extensions"
  "NSGlobalDomain|KeyRepeat|-int|2|Use a faster key repeat rate"
  "NSGlobalDomain|InitialKeyRepeat|-int|15|Shorten delay until key repeat"
  "com.apple.finder|ShowPathbar|-bool|true|Show Finder path bar"
  "com.apple.finder|ShowStatusBar|-bool|true|Show Finder status bar"
  "com.apple.finder|FXPreferredViewStyle|-string|Nlsv|Prefer Finder list view"
  "com.apple.dock|show-recents|-bool|false|Hide recent apps from the Dock"
  "com.apple.screencapture|location|-string|$HOME/Desktop|Save screenshots to Desktop"
)

backup_domain() {
  local domain backup_file safe_domain
  domain="$1"

  case " $BACKED_UP_DOMAINS " in
    *" $domain "*)
      return 0
      ;;
  esac

  mkdir -p "$BACKUP_DIR"
  safe_domain="$(printf '%s' "$domain" | tr -c 'A-Za-z0-9._-' '_')"
  backup_file="$BACKUP_DIR/$safe_domain.plist"

  if [[ "$domain" == "NSGlobalDomain" ]]; then
    defaults export -g "$backup_file" >/dev/null 2>&1 || true
  else
    defaults export "$domain" "$backup_file" >/dev/null 2>&1 || true
  fi

  BACKED_UP_DOMAINS="$BACKED_UP_DOMAINS $domain"
  info "Backed up $domain to $backup_file"
}

apply_setting() {
  local domain key kind value description
  IFS='|' read -r domain key kind value description <<< "$1"

  if [[ "$APPLY" == "0" ]]; then
    printf '%-34s %s %s %s\n' "$description:" "$domain" "$key" "$value"
    print_command defaults write "$domain" "$key" "$kind" "$value"
    return 0
  fi

  if confirm "$description?"; then
    backup_domain "$domain"
    defaults write "$domain" "$key" "$kind" "$value"
  else
    warn "Skipped: $description"
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      APPLY=0
      shift
      ;;
    --apply)
      APPLY=1
      shift
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

if [[ "$APPLY" == "0" ]]; then
  info "Dry run. No defaults will be changed."
else
  warn "Apply mode. Each setting will ask before changing anything."
fi

for setting in "${SETTINGS[@]}"; do
  apply_setting "$setting"
done

if [[ "$APPLY" == "1" ]]; then
  info "Some changes may require restarting affected apps or logging out."
fi
