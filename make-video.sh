#!/bin/zsh
# Makes the two web sizes of the hero clip that the page versions look for:
#   video/hero-1080.mp4  — desktop
#   video/hero-720.mp4   — phones
# Usage:  ./make-video.sh /path/to/kling-clip.mp4
# Uses avconvert, which ships with macOS, so nothing has to be installed.
set -e
SRC="$1"
if [ ! -f "$SRC" ]; then echo "usage: $0 <source.mp4>"; exit 1; fi
cd "$(dirname "$0")"
mkdir -p video
avconvert --source "$SRC" --preset Preset1920x1080 --output video/hero-1080.mp4 --replace --progress
avconvert --source "$SRC" --preset Preset1280x720  --output video/hero-720.mp4  --replace --progress
echo; ls -la video
