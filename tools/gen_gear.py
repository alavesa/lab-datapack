#!/usr/bin/env python3
"""Facility gear + SCP-427 visuals: NVG, restraints, the opened locket and
the flesh beast.

- nvg icon + the pumpkinblur OVERLAY override (assets/minecraft/textures/
  misc/pumpkinblur.png): green phosphor circle vignette with scanlines -
  wearing the carved-pumpkin goggles shows the world through creeper eyes.
- lab_ziptie / lab_handcuffs icons + dispatches (string / chain).
- scp427_on REDRAWN as an OPENED locket (two portraits) with the white
  equipped frame; the closed state stays the plain silver locket.
- scp427_1: the flesh beast's element model + texture + item definition
  (assets/lab/items/scp427_1.json) for the invisible-ravager rider.

Run from the repo root:  python3 tools/gen_gear.py  (after gen_trinkets.py)
"""
import json, math, os, struct, zlib

HERE = os.path.dirname(__file__)
RP = os.path.join(HERE, "..", "resource-pack", "assets")

def write_png(path, px):
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

def blank(n=16):
    return [[(0, 0, 0, 0)] * n for _ in range(n)]

TEX = os.path.join(RP, "lab", "textures", "item")
MODELS = os.path.join(RP, "lab", "models", "item")
ITEMS = os.path.join(RP, "minecraft", "items")

def flat_model(name):
    os.makedirs(MODELS, exist_ok=True)
    with open(os.path.join(MODELS, name + ".json"), "w") as f:
        json.dump({"parent": "minecraft:item/generated",
                   "textures": {"layer0": "lab:item/" + name}}, f, indent=2)

def dispatch(base, cases_map, fallback):
    path = os.path.join(ITEMS, base + ".json")
    if os.path.exists(path):
        d = json.load(open(path))
    else:
        d = {"model": {"type": "minecraft:select",
                       "property": "minecraft:custom_model_data",
                       "cases": [],
                       "fallback": {"type": "minecraft:model", "model": fallback}}}
    have = {c["when"] for c in d["model"]["cases"]}
    for when, model in cases_map.items():
        if when not in have:
            d["model"]["cases"].append({"when": when,
                "model": {"type": "minecraft:model", "model": model}})
    json.dump(d, open(path, "w"), indent=2)
    print(f"{base}.json: {list(cases_map)}")

# ------------------------------------------------------------ NVG icon
px = blank()
CASE = (44, 52, 46, 255); LENS = (60, 220, 90, 255); LENS_D = (24, 110, 44, 255)
for x0 in (2, 9):
    for y in range(5, 11):
        for x in range(x0, x0 + 5):
            d = math.hypot(x - (x0 + 2), y - 7.5)
            px[y][x] = LENS if d < 1.6 else (LENS_D if d < 2.4 else CASE)
for x in range(7, 9):
    px[7][x] = CASE
for x in range(2, 14):
    px[4][x] = (30, 34, 32, 255)  # head strap
write_png(os.path.join(TEX, "lab_nvg.png"), px)
flat_model("lab_nvg")
dispatch("carved_pumpkin", {"lab_nvg": "lab:item/lab_nvg"}, "minecraft:block/carved_pumpkin")

# --------------------------------------------- the goggle view overlay
# assets/minecraft/textures/misc/pumpkinblur.png - 128x128 scales fine
n = 128
overlay = [[(0, 0, 0, 255)] * n for _ in range(n)]
cx = cy = (n - 1) / 2
for y in range(n):
    for x in range(n):
        d = math.hypot(x - cx, y - cy) / (n * 0.48)
        if d < 0.72:
            alpha = 46 if y % 4 else 78          # green glass + scanlines
            overlay[y][x] = (30, 255, 90, alpha)
        elif d < 0.80:
            t = (d - 0.72) / 0.08                 # soft rim
            overlay[y][x] = (10, 90, 30, int(120 + 135 * t))
write_png(os.path.join(RP, "minecraft", "textures", "misc", "pumpkinblur.png"), overlay)

# ------------------------------------------------------------ restraints
px = blank()
TIE = (235, 235, 235, 255); TIE_D = (180, 180, 180, 255)
for i in range(3, 13):                            # a looped ziptie
    px[3][i] = px[12][i] = TIE
    px[i][3] = px[i][12] = TIE
px[4][4] = px[4][5] = TIE_D                       # ratchet head
px[3][4] = px[4][3] = TIE_D
for i in range(6, 10):
    px[i][7] = TIE_D                              # loose tail
write_png(os.path.join(TEX, "lab_ziptie.png"), px)
flat_model("lab_ziptie")
dispatch("string", {"lab_ziptie": "lab:item/lab_ziptie"}, "minecraft:item/string")

px = blank()
IRON = (168, 172, 178, 255); IRON_D = (110, 114, 120, 255)
for ccx in (5, 10):                               # two cuffs + link
    for y in range(16):
        for x in range(16):
            d = math.hypot(x - ccx, y - 8)
            if 2.0 <= d <= 3.2:
                px[y][x] = IRON if (x + y) % 2 else IRON_D
px[8][7] = px[8][8] = IRON_D
write_png(os.path.join(TEX, "lab_handcuffs.png"), px)
flat_model("lab_handcuffs")
dispatch("chain", {"lab_handcuffs": "lab:item/lab_handcuffs"}, "minecraft:item/chain")

# ------------------------------------ SCP-427 opened locket (active state)
px = blank()
SILVER = (198, 202, 210, 255); SILVER_D = (140, 144, 152, 255)
GOLD = (216, 186, 90, 255); PORTRAIT = (222, 188, 160, 255); HAIR = (90, 60, 40, 255)
for half in (2, 9):                                # two opened halves
    for y in range(4, 12):
        for x in range(half, half + 5):
            edge = y in (4, 11) or x in (half, half + 4)
            px[y][x] = SILVER_D if edge else SILVER
    for y in range(6, 10):                         # tiny portraits inside
        for x in range(half + 1, half + 4):
            px[y][x] = PORTRAIT
    px[6][half + 1] = px[6][half + 2] = px[6][half + 3] = HAIR
px[3][8] = px[2][8] = GOLD                         # hinge + chain stub
for i in range(16):                                # the SCP:CB equipped frame
    px[0][i] = px[15][i] = (255, 255, 255, 255)
    px[i][0] = px[i][15] = (255, 255, 255, 255)
write_png(os.path.join(TEX, "scp427_on.png"), px)  # replaces the framed-closed art

# --------------------------------------------------- SCP-427-1, the beast
btex = blank()
FLESH = (156, 62, 54, 255); FLESH_D = (110, 38, 34, 255); BONE = (222, 210, 190, 255)
import random
rng = random.Random(427)
for y in range(16):
    for x in range(16):
        r = rng.random()
        btex[y][x] = FLESH_D if r < 0.3 else (BONE if r > 0.965 else FLESH)
write_png(os.path.join(RP, "lab", "textures", "block", "scp427_1.png"), btex)

beast = {
    "textures": {"particle": "lab:block/scp427_1", "flesh": "lab:block/scp427_1"},
    "elements": []
}
def box(f, t):
    beast["elements"].append({"from": f, "to": t,
        "faces": {face: {"texture": "#flesh"} for face in
                  ("north", "south", "east", "west", "up", "down")}})
box([2, 6, 0], [14, 15, 14])     # heaving torso
box([4, 12, 12], [12, 18, 18])   # a head that is mostly mouth
box([2, 0, 2], [5, 6, 5])        # legs
box([11, 0, 2], [14, 6, 5])
box([2, 0, 9], [5, 6, 12])
box([11, 0, 9], [14, 6, 12])
box([0, 8, 4], [2, 14, 10])      # growths
box([14, 9, 5], [16, 14, 9])
model_dir = os.path.join(RP, "lab", "models", "entity")
os.makedirs(model_dir, exist_ok=True)
json.dump(beast, open(os.path.join(model_dir, "scp427_1.json"), "w"), indent=2)
items_dir = os.path.join(RP, "lab", "items")
os.makedirs(items_dir, exist_ok=True)
json.dump({"model": {"type": "minecraft:model", "model": "lab:entity/scp427_1"}},
          open(os.path.join(items_dir, "scp427_1.json"), "w"), indent=2)
print("scp427_1 model + item definition")
print("gear done")
