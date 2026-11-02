#!/usr/bin/env bash
# One-time setup: checks ffmpeg + node, makes a python venv with the cut-out model, installs the skill for Claude Code.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
VENV="$HOME/.reel-effects-venv"

need() { command -v "$1" >/dev/null 2>&1 || { echo "missing: $1. $2"; exit 1; }; }
need ffmpeg "install it with: brew install ffmpeg"
need node "install it from https://nodejs.org (the LTS button)"
need python3 "install it with: brew install python"
ffmpeg -hide_banner -encoders 2>/dev/null | grep -q libvpx-vp9 || { echo "your ffmpeg has no vp9 encoder (needed for the iphone effect). brew install ffmpeg fixes it"; exit 1; }

if [ ! -x "$VENV/bin/python" ]; then
  echo "making the python environment in $VENV"
  python3 -m venv "$VENV"
fi
"$VENV/bin/pip" install --quiet --upgrade pip
"$VENV/bin/pip" install --quiet pillow numpy scipy "rembg[cpu]==2.0.85"

mkdir -p "$HOME/.claude/skills"
DEST="$HOME/.claude/skills/reel-effects"
if [ -e "$DEST" ] && ! grep -q "^name: reel-effects" "$DEST/SKILL.md" 2>/dev/null; then
  echo "$DEST already exists and isn't this skill, so i've left it alone. rename it and run setup again"; exit 1
fi
rm -rf "$DEST"
cp -R "$HERE/skills/reel-effects" "$HOME/.claude/skills/reel-effects"

echo
echo "all set. open claude code in the folder with your clip and say: give this clip the clothesline effect"
echo "(the first cut-out downloads a ~170 MB model, so the first run is slower)"
