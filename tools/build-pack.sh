#!/usr/bin/env bash
# Builds the combined scp_and_chemistry resource pack from all five repos and
# publishes it to the rolling 'pack-latest' release on lab-datapack, so the
# server can point at ONE stable URL forever:
#
#   resource-pack=https://github.com/alavesa/lab-datapack/releases/download/pack-latest/scp_and_chemistry.zip
#   resource-pack-sha1=<printed by this script - update it on EVERY pack change>
#
# A stale sha1 makes every client silently reject the download and ALL custom
# models vanish at once - that is what this script exists to prevent.
set -euo pipefail

HOME_DIR=/Users/piia
OUT=${1:-$HOME_DIR/scp_and_chemistry.zip}

rm -f "$OUT"
(cd "$HOME_DIR/Lab/resource-pack" && zip -rq "$OUT" pack.mcmeta assets -x "*.DS_Store")
for repo in ScpMobs Cars Scp914 IdCards; do
  (cd "$HOME_DIR/$repo/resource-pack" && zip -rq "$OUT" assets -x "*.DS_Store")
done

SHA1=$(shasum -a 1 "$OUT" | cut -d' ' -f1)
echo "built: $OUT"
echo "sha1:  $SHA1"

gh release view pack-latest -R alavesa/lab-datapack >/dev/null 2>&1 \
  || gh release create pack-latest -R alavesa/lab-datapack \
       --title "scp_and_chemistry - rolling latest" --notes "(placeholder)"
gh release upload pack-latest "$OUT" -R alavesa/lab-datapack --clobber
gh release edit pack-latest -R alavesa/lab-datapack --notes "Always the newest combined resource pack (Lab + ScpMobs + Cars + Scp914 + IdCards). Updated in place - the download URL below never changes.

server.properties:
\`\`\`
resource-pack=https://github.com/alavesa/lab-datapack/releases/download/pack-latest/scp_and_chemistry.zip
resource-pack-sha1=$SHA1
\`\`\`

IMPORTANT: update resource-pack-sha1 to the value above every time this pack changes (or leave it empty to skip verification). A stale sha1 makes clients silently reject the pack and every custom model disappears."
echo "published: https://github.com/alavesa/lab-datapack/releases/tag/pack-latest"
