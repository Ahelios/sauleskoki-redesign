#!/bin/zsh
# Builds the finished website (version 2 only) into ../sauleskoki-site, ready for uploading to the host.
#   ./build-site.sh
# Paths change from ../img/ to img/, the analytics tag comes back, and only the files the page uses are copied.
set -e
cd "$(dirname "$0")"
SRC=v2-mezs/index.html
OUT=../sauleskoki-site
mkdir -p "$OUT"
find "$OUT" -mindepth 1 -maxdepth 1 ! -name .git -exec rm -rf {} +
# 1. the page: paths one level up become local, the analytics tag replaces its placeholder comment
sed -e 's#\.\./img/#img/#g' -e 's#\.\./video/#video/#g' -e 's#\.\./favicon\.ico#favicon.ico#g' \
    -e 's#  <!-- Analytics: add back the pulse.sauleskoki.lv script when this goes live -->#  <script defer src="https://pulse.sauleskoki.lv/script.js" data-website-id="11ee7640-b185-4126-b54d-96a91c604951"></script>#' \
    "$SRC" > "$OUT/index.html"
grep -q 'pulse.sauleskoki.lv/script.js' "$OUT/index.html" || { echo "analytics tag was not inserted"; exit 1; }
if grep -q '\.\./' "$OUT/index.html"; then echo "a path still points one folder up:"; grep -o '\.\./[^"]*' "$OUT/index.html" | head; exit 1; fi
# 2. every photo and clip the page refers to
n=0
for f in $(grep -oE '(img|video)/[A-Za-z0-9/_.-]+\.(jpg|mp4)' "$OUT/index.html" | sort -u); do
  [ -f "$f" ] || { echo "missing in the project: $f"; exit 1; }
  mkdir -p "$OUT/$(dirname "$f")"; cp "$f" "$OUT/$f"; n=$((n+1))
done
# 3. the small root files
cp favicon.ico og-image.jpg "$OUT/"
cp deploy/robots.txt deploy/sitemap.xml deploy/llms.txt "$OUT/"
cp deploy/SITE-README.md "$OUT/README.md"
echo "built $OUT: index.html + $n photos/clips + favicon, og-image, robots, sitemap, llms, README"
du -sh "$OUT" | awk '{print "size: "$1}'
