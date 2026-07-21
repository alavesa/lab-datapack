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


def sprinkler_button():
    # a red industrial "fire alarm" push button on a housing plate
    px = blank()
    HOUSE = (200, 40, 30, 255)     # red alarm housing
    HOUSE_D = (140, 22, 18, 255)
    rect(px, 3, 3, 12, 12, HOUSE_D)
    rect(px, 4, 4, 11, 11, HOUSE)
    # the pressable button in the middle
    rect(px, 6, 6, 9, 9, (240, 230, 230, 255))
    rect(px, 6, 6, 9, 6, (255, 255, 255, 255))   # top sheen
    rect(px, 6, 9, 9, 9, (180, 170, 170, 255))   # bottom shade
    # bolt corners
    px[4][4] = BLACK; px[4][11] = BLACK
    px[11][4] = BLACK; px[11][11] = BLACK
    return px


png(os.path.join(TEX, "lab_extinguisher.png"), extinguisher())
png(os.path.join(TEX, "lab_extinguisher_mount.png"), mount())
png(os.path.join(TEX, "lab_sprinkler_button.png"), sprinkler_button())

for name in ("lab_extinguisher", "lab_extinguisher_mount", "lab_sprinkler_button"):
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
for name in ("lab_extinguisher", "lab_extinguisher_mount", "lab_sprinkler_button"):
    if name not in have:
        cases.append({"when": name, "model": {"type": "minecraft:model", "model": "lab:item/" + name}})
os.makedirs(ITEMS, exist_ok=True)
with open(brick, "w") as f:
    json.dump(data, f, indent=2)
print(brick, "-> +extinguisher cases")

# --------------------------------------------------------------- gas mask
# All three gas-mask tiers share ONE model (lab_gasmask) on carved_pumpkin, and
# the worn first-person view is the retextured pumpkin overlay (misc/pumpkinblur).

def gas_mask():
    px = blank()
    MASK = (54, 62, 50, 255)      # olive-drab rubber
    MASK_D = (34, 40, 32, 255)
    GLASS = (150, 200, 210, 255)  # goggle glass
    GLASS_D = (90, 130, 140, 255)
    FILT = (40, 44, 40, 255)      # filter canister
    rect(px, 4, 3, 11, 13, MASK)
    rect(px, 4, 3, 4, 13, MASK_D)
    rect(px, 3, 5, 3, 11, MASK_D)   # left cheek
    rect(px, 12, 5, 12, 11, MASK)   # right cheek
    # two round goggles
    rect(px, 5, 5, 7, 7, GLASS); px[5][5] = GLASS_D; px[7][7] = GLASS_D
    rect(px, 8, 5, 10, 7, GLASS); px[5][10] = GLASS_D; px[7][8] = GLASS_D
    # filter canister at the chin
    rect(px, 6, 11, 9, 14, FILT)
    rect(px, 7, 14, 8, 15, MASK_D)
    return px

png(os.path.join(TEX, "lab_gasmask.png"), gas_mask())
with open(os.path.join(MODELS, "lab_gasmask.json"), "w") as f:
    json.dump({"parent": "minecraft:item/generated", "textures": {"layer0": "lab:item/lab_gasmask"}}, f, indent=2)

pumpkin = os.path.join(ITEMS, "carved_pumpkin.json")
if os.path.exists(pumpkin):
    pdata = json.load(open(pumpkin))
else:
    pdata = {"model": {"type": "minecraft:select", "property": "minecraft:custom_model_data",
                       "cases": [], "fallback": {"type": "minecraft:model", "model": "minecraft:item/carved_pumpkin"}}}
pcases = pdata["model"]["cases"]
if "lab_gasmask" not in {c.get("when") for c in pcases}:
    pcases.append({"when": "lab_gasmask", "model": {"type": "minecraft:model", "model": "lab:item/lab_gasmask"}})
with open(pumpkin, "w") as f:
    json.dump(pdata, f, indent=2)
print(pumpkin, "-> +gasmask case")

# The worn overlay: retexture misc/pumpkinblur into a gas-mask view - two clear
# goggle holes, the rest a dark rubber vignette. (Affects any worn carved pumpkin,
# but on this server that's the gas mask.) 256x256.
def pumpkinblur():
    # A gas-mask view: two big clear goggle holes with a soft rubber gasket ring,
    # and a dark (neutral, not green) vignette everywhere else so you can still see
    # the world but it's masked. 256x256.
    N = 256
    px = [[(0, 0, 0, 0)] * N for _ in range(N)]
    eyes = [(94, 116, 72), (162, 116, 72)]   # (cx, cy, r) - big goggles
    GASKET = 16                               # soft ring width around each lens
    for y in range(N):
        for x in range(N):
            dmin = 1e9
            for cx, cy, r in eyes:
                d = ((x - cx) ** 2 + (y - cy) ** 2) ** 0.5 - r
                if d < dmin:
                    dmin = d
            if dmin <= 0:
                px[y][x] = (0, 0, 0, 0)                      # clear glass
            elif dmin <= GASKET:
                a = int(230 * (dmin / GASKET))               # fade into the rubber
                px[y][x] = (14, 14, 16, a)
            else:
                edge = max(abs(x - N / 2), abs(y - N / 2)) / (N / 2)
                a = int(150 + 80 * edge)                     # neutral dark, lighter than before
                px[y][x] = (12, 12, 14, min(235, a))
    return px

misc = os.path.join(os.path.dirname(__file__), "..", "resource-pack", "assets", "minecraft", "textures", "misc")
png(os.path.join(misc, "pumpkinblur.png"), pumpkinblur())
print("misc/pumpkinblur.png -> gas-mask first-person overlay")
