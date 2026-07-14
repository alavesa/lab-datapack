#!/usr/bin/env python3
"""SCP-1033-RU bracelet texture + the SCP:CB "equipped" white frames.

Replaces the old pocket-watch scp1033.png with the ceramic bracelet of
SCP-1033-RU, and generates the *_on variants for every toggleable trinket
(scp714, scp427, scp1033): the SAME icon with a one-pixel white frame around
it - the Containment Breach equipped-item look. The plugin swaps the item's
custom_model_data string to <id>_on when the trinket is activated.

Run from the repo root:  python3 tools/gen_trinkets.py
(after gen_scp_items.py if you regenerate everything from scratch)
"""
import json, os, struct, zlib

HERE = os.path.dirname(__file__)
TEX = os.path.join(HERE, "..", "resource-pack", "assets", "lab", "textures", "item")
MODELS = os.path.join(HERE, "..", "resource-pack", "assets", "lab", "models", "item")
ITEMS = os.path.join(HERE, "..", "resource-pack", "assets", "minecraft", "items")

def write_png(path, px):
    h, w = len(px), len(px[0])
    rows = b"".join(b"\x00" + b"".join(bytes(p) for p in line) for line in px)
    def chunk(tag, data):
        return struct.pack(">I", len(data)) + tag + data + struct.pack(">I", zlib.crc32(tag + data))
    data = (b"\x89PNG\r\n\x1a\n"
            + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 6, 0, 0, 0))
            + chunk(b"IDAT", zlib.compress(rows, 9)) + chunk(b"IEND", b""))
    with open(path, "wb") as f:
        f.write(data)
    print(path)

def read_png(path):
    """Reads back our own PNGs (RGBA8, non-interlaced, filter 0 rows)."""
    raw = open(path, "rb").read()
    pos, w = 8, 0
    idat = b""
    while pos < len(raw):
        length = struct.unpack(">I", raw[pos:pos+4])[0]
        tag = raw[pos+4:pos+8]
        body = raw[pos+8:pos+8+length]
        if tag == b"IHDR":
            w, h = struct.unpack(">II", body[:8])
        elif tag == b"IDAT":
            idat += body
        pos += 12 + length
    flat = zlib.decompress(idat)
    stride = w * 4 + 1
    px = []
    for y in range(len(flat) // stride):
        row = flat[y*stride+1:(y+1)*stride]
        assert flat[y*stride] == 0, "only filter-0 rows supported"
        px.append([tuple(row[x*4:x*4+4]) for x in range(w)])
    return px

# ------------------------------------------- SCP-1033-RU: ceramic bracelet
px = [[(0, 0, 0, 0)] * 16 for _ in range(16)]
BONE = (226, 219, 202, 255); BONE_D = (196, 186, 164, 255); CRACK = (150, 138, 116, 255)
import math
for y in range(16):
    for x in range(16):
        d = math.hypot(x - 7.5, y - 7.5)
        if 4.2 <= d <= 6.8:
            px[y][x] = BONE_D if d > 6.1 or d < 4.9 else BONE
# hairline cracks + the twelve probe pores hinted as darker points
for x, y in [(3, 6), (11, 3), (12, 10), (5, 12), (8, 2), (2, 9)]:
    px[y][x] = CRACK
write_png(os.path.join(TEX, "scp1033.png"), px)

# --------------------------------------------------- the equipped variants
for base in ["scp714", "scp427", "scp1033"]:
    icon = read_png(os.path.join(TEX, base + ".png"))
    for i in range(16):  # 1px white frame, SCP:CB style
        icon[0][i] = icon[15][i] = (255, 255, 255, 255)
        icon[i][0] = icon[i][15] = (255, 255, 255, 255)
    write_png(os.path.join(TEX, base + "_on.png"), icon)
    with open(os.path.join(MODELS, base + "_on.json"), "w") as f:
        json.dump({"parent": "minecraft:item/generated",
                   "textures": {"layer0": "lab:item/" + base + "_on"}}, f, indent=2)

# ------------------------------------------------- dispatch case additions
for base, file in [("scp714", "gold_nugget.json"), ("scp427", "heart_of_the_sea.json"),
                   ("scp1033", "clock.json")]:
    path = os.path.join(ITEMS, file)
    d = json.load(open(path))
    cases = d["model"]["cases"]
    if not any(c["when"] == base + "_on" for c in cases):
        cases.append({"when": base + "_on",
                      "model": {"type": "minecraft:model", "model": "lab:item/" + base + "_on"}})
        json.dump(d, open(path, "w"), indent=2)
        print(f"{file}: +{base}_on")
print("trinkets done")
