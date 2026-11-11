#!/bin/sh
# Swap ~ originals for stow symlinks. Originals are backed up to ~/.agent-dotfiles-backup.
set -e
cd "$(dirname "$0")"
B=~/.agent-dotfiles-backup; mkdir -p "$B"
for p in claude agents codex copilot; do
  (cd "$p" && find . -type f | while read -r f; do
    f=${f#./}; t=~/"$f"
    if [ -e "$t" ] && [ ! -L "$t" ]; then mkdir -p "$B/$(dirname "$f")"; mv "$t" "$B/$f"; fi
  done)
done
stow --no-folding -v claude agents codex copilot
