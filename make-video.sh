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

# ── Service-row clips for version 2 (added 2026-10-04) ──
# The two WhatsApp helmet-cam clips are 478x850 files with the real 16:9 picture in rows 290–559.
# This crops the black bars, drops the sound, caps the bitrate and trims the sticker intro off clip B.
# Needs ffmpeg (brew install ffmpeg). Run from this folder:
#   ffmpeg -y -i "WhatsApp Video 2026-10-03 at 18.03.25.mp4" -vf "crop=478:270:0:290,fps=30" -an -c:v libx264 -crf 26 -maxrate 1400k -bufsize 2800k -preset slow -pix_fmt yuv420p -movflags +faststart video/crown.mp4
#   ffmpeg -y -ss 1.8 -i "WhatsApp Video 2026-10-03 at 18.03.30.mp4" -vf "crop=478:270:0:290,fps=30" -an -c:v libx264 -crf 26 -maxrate 1400k -bufsize 2800k -preset slow -pix_fmt yuv420p -movflags +faststart video/dismantle.mp4
# Posters (first frame, 478x270): img/row-crown.jpg and img/row-dismantle.jpg.
