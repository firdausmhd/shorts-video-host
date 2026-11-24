#!/usr/bin/env bash
# Usage: scripts/publish.sh YYYY-MM-DD file1.mp4 [file2.mp4 ...]
# Copies videos into videos/<date>/, commits, pushes, and prints public raw URLs
# (these URLs are what Windsor's upload_video needs as video_url).
set -euo pipefail
DATE="$1"; shift
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$REPO_ROOT/videos/$DATE"
mkdir -p "$DEST"
for f in "$@"; do
  size=$(stat -c%s "$f")
  if [ "$size" -gt 104857600 ]; then echo "ERROR: $f is >100 MB (Windsor limit)" >&2; exit 1; fi
  cp "$f" "$DEST/"
done
cd "$REPO_ROOT"
git add "videos/$DATE"
git commit -m "Add shorts for $DATE"
git push origin HEAD:main
for f in "$@"; do
  echo "https://raw.githubusercontent.com/firdausmhd/shorts-video-host/main/videos/$DATE/$(basename "$f")"
done
