#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

QUESTIONS=(
  "Copy|Command-C"
  "Paste|Command-V"
  "Cut|Command-X"
  "Undo|Command-Z"
  "Save|Command-S"
  "Find|Command-F"
  "Quit the current app|Command-Q"
  "Close the current window or tab|Command-W"
  "Switch apps|Command-Tab"
  "Switch windows in the current app|Command-Grave"
  "Open Spotlight|Command-Space"
  "Lock the screen|Control-Command-Q"
  "Take a screenshot region|Command-Shift-4"
  "Open screenshot and recording panel|Command-Shift-5"
  "Move selected file to Trash|Command-Delete"
  "Rename selected file in Finder|Return"
  "Go to parent folder in Finder|Command-Up"
  "Open selected Finder item|Command-Down"
  "Force quit apps|Option-Command-Esc"
  "Emoji and symbols|Control-Command-Space"
)

usage() {
  cat <<'USAGE'
Usage: scripts/shortcut-drill.sh [--count NUMBER]

Runs terminal flashcards for Windows-to-Mac shortcut muscle memory.
USAGE
}

COUNT="${#QUESTIONS[@]}"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --count)
      [[ $# -ge 2 ]] || die "--count requires a value"
      COUNT="$2"
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

[[ "$COUNT" =~ ^[0-9]+$ ]] || die "--count must be a number"

info "Mac shortcut drill. Press Enter to reveal each answer."
printf '\n'

index=0
asked=0
while [[ "$asked" -lt "$COUNT" ]]; do
  item="${QUESTIONS[$index]}"
  prompt="${item%%|*}"
  answer="${item#*|}"

  printf 'Windows action: %s\n' "$prompt"
  printf 'Mac shortcut: '
  read -r _
  printf '%s\n\n' "$answer"

  asked=$((asked + 1))
  index=$(((index + 1) % ${#QUESTIONS[@]}))
done
