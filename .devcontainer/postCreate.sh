#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get --yes install sl

for shell_rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
  if ! grep -Fq 'export PATH="$PATH:/usr/games"' "$shell_rc" 2>/dev/null; then
    printf '\nexport PATH="$PATH:/usr/games"\n' >> "$shell_rc"
  fi
done
