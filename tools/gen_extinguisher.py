#!/usr/bin/env python3
"""Fire-extinguisher item art for the Labra plugin (v0.22).

Two 16x16 pixel-art models, both dispatched off BRICK via custom_model_data
strings (same trick as lab_medkit):

  lab_extinguisher        the red canister the player holds / sprays with
  lab_extinguisher_mount  the wall bracket it hangs in

Pure stdlib, fixed pixels - byte-identical every run.
Run from the repo root:  python3 tools/gen_extinguisher.py
"""
import json, os, struct, zlib

ROOT = os.path.join(os.path.dirname(__file__), "..", "resource-pack", "assets", "lab")
TEX = os.path.join(ROOT, "textures", "item")
MODELS = os.path.join(ROOT, "models", "item")
ITEMS = os.path.join(os.path.dirname(__file__), "..", "resource-pack", "assets", "minecraft", "items")


def png(path, px):
    h, w = len(px), len(px[0])
    rows = b"".join(b"\x00" + b"".join(bytes(p) for p in line) for line in px)
    def chunk(tag, data):
        return struct.pack(">I", len(data)) + tag + data + struct.pack(">I", zlib.crc32(tag + data))
    data = (b"\x89PNG\r\n\x1a\n"
            + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 6, 0, 0, 0))
            + chunk(b"IDAT", zlib.compress(rows, 9)) + chunk(b"IEND", b""))
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "wb") as f:
        f.write(data)
    print(path)


def blank():
    return [[(0, 0, 0, 0)] * 16 for _ in range(16)]

def rect(px, x0, y0, x1, y1, c):
    for y in range(y0, y1 + 1):
        for x in range(x0, x1 + 1):
            if 0 <= x < 16 and 0 <= y < 16:
                px[y][x] = c

RED   = (196, 34, 30, 255)
RED_D = (140, 22, 20, 255)
RED_H = (232, 78, 70, 255)
BLACK = (24, 24, 28, 255)
GREY  = (150, 150, 158, 255)
GREY_D = (90, 90, 98, 255)
STEEL = (120, 124, 132, 255)
STEEL_D = (74, 78, 86, 255)


def extinguisher():
    px = blank()
    # body: a red cylinder, columns 5..10, rows 5..14
    rect(px, 5, 5, 10, 14, RED)
    rect(px, 5, 5, 5, 14, RED_D)     # left shade
    rect(px, 10, 5, 10, 14, RED_H)   # right highlight
    rect(px, 6, 6, 9, 6, RED_H)      # top sheen
    rect(px, 5, 14, 10, 14, RED_D)   # base rim
    # neck + valve (top)
    rect(px, 7, 3, 8, 4, GREY)
    rect(px, 6, 2, 9, 2, GREY_D)     # handle bar
    # nozzle/hose hanging down the right
    rect(px, 11, 3, 11, 3, BLACK)
    rect(px, 12, 3, 12, 8, BLACK)    # hose
    rect(px, 12, 9, 13, 10, BLACK)   # horn
    # a little label
    rect(px, 7, 9, 8, 11, (235, 235, 235, 255))
    return px


def mount():
    px = blank()
    # wall backplate
    rect(px, 4, 3, 12, 13, STEEL_D)
    rect(px, 5, 4, 11, 12, STEEL)
    # two bracket arms that cradle the canister
    rect(px, 3, 6, 4, 7, GREY_D)
    rect(px, 12, 6, 13, 7, GREY_D)
    rect(px, 3, 10, 4, 11, GREY_D)
    rect(px, 12, 10, 13, 11, GREY_D)
    # bolt holes
    px[5][6] = BLACK; px[5][10] = BLACK
    px[11][6] = BLACK; px[11][10] = BLACK
    return px


png(os.path.join(TEX, "lab_extinguisher.png"), extinguisher())
png(os.path.join(TEX, "lab_extinguisher_mount.png"), mount())

for name in ("lab_extinguisher", "lab_extinguisher_mount"):
    os.makedirs(MODELS, exist_ok=True)
    with open(os.path.join(MODELS, name + ".json"), "w") as f:
        json.dump({"parent": "minecraft:item/generated",
                   "textures": {"layer0": "lab:item/" + name}}, f, indent=2)
    print(os.path.join(MODELS, name + ".json"))

# Add both to the BRICK custom_model_data dispatch (merge, don't clobber).
brick = os.path.join(ITEMS, "brick.json")
if os.path.exists(brick):
    data = json.load(open(brick))
else:
    data = {"model": {"type": "minecraft:select", "property": "minecraft:custom_model_data",
                      "cases": [], "fallback": {"type": "minecraft:model", "model": "minecraft:item/brick"}}}
cases = data["model"]["cases"]
have = {c.get("when") for c in cases}
for name in ("lab_extinguisher", "lab_extinguisher_mount"):
    if name not in have:
        cases.append({"when": name, "model": {"type": "minecraft:model", "model": "lab:item/" + name}})
os.makedirs(ITEMS, exist_ok=True)
with open(brick, "w") as f:
    json.dump(data, f, indent=2)
print(brick, "-> +extinguisher cases")
