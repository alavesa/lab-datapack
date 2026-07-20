#!/usr/bin/env bash
# Builds the ONE combined resource pack for the whole server - SCP + chemistry
# + flashlights + guns - and publishes it to the rolling 'pack-latest' release
# on lab-datapack, so server.properties can point at one URL forever:
#
#   resource-pack=https://github.com/alavesa/lab-datapack/releases/download/pack-latest/scp_and_chemistry.zip
#   resource-pack-sha1=<printed by this script - update it on EVERY pack change>
#
# Sources that define the same assets/minecraft/items/<item>.json (e.g. the
# flashlight and the lab pipette both live on carrot_on_a_stick) get their
# select CASES MERGED instead of the last copy clobbering the first - packs
# overwriting each other's dispatch files is exactly how "all the 3D models
# broke" once, and this script exists so it cannot happen again.
set -euo pipefail

OUT=${1:-$HOME/scp_and_chemistry.zip}

OUT="$OUT" python3 <<'EOF'
import json, os, shutil, sys, zipfile

home = os.path.expanduser("~")  # all repos live side by side in the home dir
SOURCES = [  # first source wins for pack.mcmeta and duplicate non-dispatch files
    home + "/Lab/resource-pack",
    home + "/ScpMobs/resource-pack",
    home + "/Cars/resource-pack",
    home + "/Scp914/resource-pack",
    home + "/IdCards/resource-pack",
    home + "/Flashlights Resource Pack",
    home + "/Guns/resource-pack",
    home + "/Terminal/resource-pack",
    home + "/Keycards/resource-pack",
    home + "/Doors/resource-pack",
    home + "/Facility/resource-pack",
]
out = os.environ["OUT"]

files = {}   # relpath -> abspath (first source wins)
merged = {}  # relpath -> merged dispatch dict
for src in SOURCES:
    for base, _, names in os.walk(src):
        for name in names:
            if name == ".DS_Store" or name == "pack.mcmeta" and src != SOURCES[0]:
                continue
            full = os.path.join(base, name)
            rel = os.path.relpath(full, src)
            if not (rel == "pack.mcmeta" or rel.startswith("assets" + os.sep)):
                continue
            is_dispatch = rel.startswith(os.path.join("assets", "minecraft", "items")) and rel.endswith(".json")
            is_atlas = rel.startswith(os.path.join("assets", "minecraft", "atlases")) and rel.endswith(".json")
            if rel in files or rel in merged:
                if is_dispatch:
                    current = merged.get(rel) or json.load(open(files.pop(rel)))
                    extra = json.load(open(full))
                    have = {c["when"] if isinstance(c["when"], str) else json.dumps(c["when"])
                            for c in current["model"]["cases"]}
                    added = [c for c in extra["model"]["cases"]
                             if (c["when"] if isinstance(c["when"], str) else json.dumps(c["when"])) not in have]
                    current["model"]["cases"].extend(added)
                    merged[rel] = current
                    print(f"  merged {rel}: +{len(added)} case(s) from {src}")
                elif is_atlas:
                    current = merged.get(rel) or json.load(open(files.pop(rel)))
                    extra = json.load(open(full))
                    have = [json.dumps(s, sort_keys=True) for s in current["sources"]]
                    added = [s for s in extra["sources"]
                             if json.dumps(s, sort_keys=True) not in have]
                    current["sources"].extend(added)
                    merged[rel] = current
                    print(f"  merged {rel}: +{len(added)} atlas source(s) from {src}")
                else:
                    print(f"  WARN: duplicate {rel} - keeping the first copy ({files[rel]})")
            else:
                files[rel] = full

if "pack.mcmeta" not in files:
    sys.exit("no pack.mcmeta found in the first source")
if os.path.exists(out):
    os.remove(out)
with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as z:
    for rel in sorted(files):
        z.write(files[rel], rel.replace(os.sep, "/"))
    for rel in sorted(merged):
        z.writestr(rel.replace(os.sep, "/"), json.dumps(merged[rel], indent=2))
print(f"{len(files) + len(merged)} files -> {out}")
EOF

SHA1=$(shasum -a 1 "$OUT" | cut -d' ' -f1)
echo "built: $OUT"
echo "sha1:  $SHA1"

gh release view pack-latest -R alavesa/lab-datapack >/dev/null 2>&1 \
  || gh release create pack-latest -R alavesa/lab-datapack \
       --title "scp_and_chemistry - rolling latest" --notes "(placeholder)"
gh release upload pack-latest "$OUT" -R alavesa/lab-datapack --clobber
gh release edit pack-latest -R alavesa/lab-datapack --notes "The ONE resource pack for the whole server: Lab chemistry + SCP items, ScpMobs, Cars, Scp914, IdCards, Flashlights and Guns - colliding item dispatches merged. Disable/delete all the individual packs; this replaces every one of them. Updated in place - the URL below never changes.

server.properties:
\`\`\`
resource-pack=https://github.com/alavesa/lab-datapack/releases/download/pack-latest/scp_and_chemistry.zip
resource-pack-sha1=$SHA1
\`\`\`

IMPORTANT: update resource-pack-sha1 to the value above every time this pack changes (or leave it empty to skip verification). A stale sha1 makes clients silently reject the pack and every custom model disappears."
echo "published: https://github.com/alavesa/lab-datapack/releases/tag/pack-latest"
