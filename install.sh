#!/usr/bin/env bash
# Copy the dotfiles in this repo into $HOME according to the map below.
# If a different file already exists, ask before replacing it; the old one is
# kept as <name>.bak.<timestamp>. Works on macOS (bash 3.2) and Linux.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d%H%M%S)"

# "<path in this repo>|<path relative to $HOME>"
MAP=(
  "git/gitconfig|.gitconfig"
  "git/gitk|.config/git/gitk"
)

for entry in "${MAP[@]}"; do
  src="$REPO/${entry%%|*}"
  dest="$HOME/${entry#*|}"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ ! -L "$dest" ] && cmp -s "$src" "$dest"; then
      echo "same     $dest"
      continue
    fi
    if [ ! -t 0 ]; then
      echo "skip     $dest (exists; run interactively to replace)"
      continue
    fi
    read -r -p "WARNING: $dest already exists and differs. Replace it? [y/N] " answer
    case "$answer" in
      [yY]*) mv "$dest" "$dest.bak.$STAMP"; echo "backup   $dest.bak.$STAMP" ;;
      *) echo "skip     $dest"; continue ;;
    esac
  fi
  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
  echo "copy     $dest"
done
