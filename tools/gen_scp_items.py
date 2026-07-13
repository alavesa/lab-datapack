#!/usr/bin/env python3
"""Item textures for the seven SCP objects (v0.20).

16x16 pixel-art PNGs, written the same struct+zlib way as the Keycards
readers - no PIL, fixed seeds, byte-identical on every run:

  scp268        a tweed flat cap (gray-brown)
  scp1499       a Soviet gas mask (dark green)
  scp714        the jaded ring (green jade)
  scp018        the Super Ball (red rubber)
  scp427        the Lovers' Talisman (silver locket)
  scp1033       the 33 Second Man's pocket watch (brass)
  scp038_bark   trunk texture for the Everything Tree entity model
  scp038_leaves canopy texture (with apple-ish fruit) for the same

Run from the repo root:  python3 tools/gen_scp_items.py
"""
import os, random, struct, zlib

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

TEX = os.path.join(os.path.dirname(__file__), "..", "resource-pack",
                   "assets", "lab", "textures", "item")

def blank():
    return [[(0, 0, 0, 0)] * 16 for _ in range(16)]

def put(px, x, y, c):
    if 0 <= x < 16 and 0 <= y < 16:
        px[y][x] = c

# ---------------------------------------------------------------- SCP-268
rng = random.Random(268)
px = blank()
CAP = (94, 78, 60, 255); CAP_D = (70, 57, 44, 255); CAP_L = (112, 95, 74, 255)
# dome: widening rows
dome = {5: (6, 9), 6: (5, 10), 7: (4, 11), 8: (3, 12), 9: (3, 12), 10: (2, 12)}
for y, (x0, x1) in dome.items():
    for x in range(x0, x1 + 1):
        put(px, x, y, CAP_D if rng.random() < 0.22 else CAP)
# brim: forward to the right
for x in range(2, 15):
    put(px, x, 11, CAP_D)
for x in range(11, 15):
    put(px, x, 10, CAP_D)
# tweed flecks + button
for _ in range(10):
    put(px, rng.randint(3, 11), rng.randint(6, 10), CAP_L)
put(px, 7, 5, CAP_D)
png(os.path.join(TEX, "scp268.png"), px)

# ---------------------------------------------------------------- SCP-1499
rng = random.Random(1499)
px = blank()
RUB = (52, 66, 46, 255); RUB_D = (38, 48, 34, 255); GLASS = (156, 168, 170, 255)
GLASS_D = (98, 110, 116, 255); FILT = (88, 90, 80, 255)
mask = {2: (5, 10), 3: (4, 11), 4: (3, 12), 5: (3, 12), 6: (3, 12), 7: (3, 12),
        8: (4, 11), 9: (4, 11), 10: (5, 10), 11: (5, 10)}
for y, (x0, x1) in mask.items():
    for x in range(x0, x1 + 1):
        put(px, x, y, RUB_D if (x in (x0, x1) or rng.random() < 0.12) else RUB)
# eyepieces
for ex in (5, 9):
    for dx in (0, 1):
        for dy in (0, 1):
            put(px, ex + dx, 4 + dy, GLASS)
    put(px, ex, 5, GLASS_D)
# filter canister, low center
for y in (12, 13, 14):
    for x in (6, 7, 8, 9):
        put(px, x, y, FILT if y < 14 else RUB_D)
put(px, 7, 12, (110, 112, 100, 255)); put(px, 8, 13, (70, 72, 62, 255))
png(os.path.join(TEX, "scp1499.png"), px)

# ---------------------------------------------------------------- SCP-714
rng = random.Random(714)
px = blank()
JADE = (74, 146, 94, 255); JADE_D = (48, 108, 68, 255); JADE_L = (120, 186, 134, 255)
ring = {3: (6, 9), 4: (4, 11), 5: (3, 12), 6: (3, 12), 7: (2, 13), 8: (2, 13),
        9: (3, 12), 10: (3, 12), 11: (4, 11), 12: (6, 9)}
hole = {5: (6, 9), 6: (5, 10), 7: (5, 10), 8: (5, 10), 9: (5, 10), 10: (6, 9)}
for y, (x0, x1) in ring.items():
    for x in range(x0, x1 + 1):
        put(px, x, y, JADE_D if rng.random() < 0.2 else JADE)
for y, (x0, x1) in hole.items():
    for x in range(x0, x1 + 1):
        put(px, x, y, (0, 0, 0, 0))
put(px, 5, 4, JADE_L); put(px, 4, 5, JADE_L); put(px, 6, 4, JADE_L)
put(px, 10, 11, JADE_D); put(px, 11, 10, JADE_D)
png(os.path.join(TEX, "scp714.png"), px)

# ---------------------------------------------------------------- SCP-018
rng = random.Random(18)
px = blank()
BALL = (176, 44, 38, 255); BALL_D = (122, 28, 26, 255); BALL_L = (224, 96, 70, 255)
for y in range(16):
    for x in range(16):
        if (x - 7.5) ** 2 + (y - 7.5) ** 2 <= 42:
            d = (x - 5) ** 2 + (y - 5) ** 2
            c = BALL_L if d <= 5 else (BALL_D if d >= 60 else BALL)
            if rng.random() < 0.08:
                c = BALL_D
            put(px, x, y, c)
png(os.path.join(TEX, "scp018.png"), px)

# ---------------------------------------------------------------- SCP-427
rng = random.Random(427)
px = blank()
AG = (188, 194, 202, 255); AG_D = (128, 134, 146, 255); AG_L = (232, 236, 240, 255)
# chain arc
for x, y in ((5, 1), (4, 2), (3, 3), (3, 4), (10, 1), (11, 2), (12, 3), (12, 4), (6, 0), (7, 0), (8, 0), (9, 0)):
    put(px, x, y, AG_D)
# locket oval
oval = {5: (6, 9), 6: (5, 10), 7: (4, 11), 8: (4, 11), 9: (4, 11), 10: (4, 11),
        11: (5, 10), 12: (5, 10), 13: (6, 9), 14: (7, 8)}
for y, (x0, x1) in oval.items():
    for x in range(x0, x1 + 1):
        put(px, x, y, AG_D if x in (x0, x1) else AG)
# hinge seam + shine
for y in range(6, 13):
    put(px, 8, y, AG_D)
put(px, 6, 7, AG_L); put(px, 6, 8, AG_L); put(px, 5, 9, AG_L)
put(px, 7, 5, AG_L)
png(os.path.join(TEX, "scp427.png"), px)

# ---------------------------------------------------------------- SCP-1033
rng = random.Random(1033)
px = blank()
AU = (196, 156, 68, 255); AU_D = (140, 106, 42, 255); FACE = (232, 226, 208, 255)
HAND = (44, 40, 36, 255)
# crown + bow
put(px, 7, 0, AU_D); put(px, 8, 0, AU_D); put(px, 7, 1, AU); put(px, 8, 1, AU)
for y in range(16):
    for x in range(16):
        d = (x - 7.5) ** 2 + (y - 8.5) ** 2
        if d <= 40:
            put(px, x, y, FACE if d <= 26 else (AU_D if d >= 34 else AU))
# hour ticks
for x, y in ((7, 4), (8, 4), (7, 13), (8, 13), (3, 8), (3, 9), (12, 8), (12, 9)):
    put(px, x, y, AU_D)
# hands: minute up-left, hour right (reads a little past the hour)
for x, y in ((7, 8), (6, 7), (5, 6), (7, 7)):
    put(px, x, y, HAND)
for x, y in ((8, 8), (9, 8), (10, 9)):
    put(px, x, y, HAND)
png(os.path.join(TEX, "scp1033.png"), px)

# ---------------------------------------------------------------- SCP-038
rng = random.Random(38)
px = [[None] * 16 for _ in range(16)]
for y in range(16):
    for x in range(16):
        n = rng.random()
        c = (86, 62, 40, 255) if n < 0.55 else ((66, 47, 30, 255) if n < 0.85 else (104, 78, 52, 255))
        px[y][x] = c
for x in (2, 6, 11, 14):  # vertical grain
    for y in range(16):
        if rng.random() < 0.7:
            px[y][x] = (58, 41, 26, 255)
png(os.path.join(TEX, "scp038_bark.png"), px)

rng = random.Random(3838)
px = [[None] * 16 for _ in range(16)]
for y in range(16):
    for x in range(16):
        n = rng.random()
        c = (58, 96, 44, 255) if n < 0.5 else ((42, 74, 34, 255) if n < 0.85 else (80, 122, 58, 255))
        px[y][x] = c
for _ in range(4):  # fruit that is not fruit
    fx, fy = rng.randint(1, 13), rng.randint(1, 13)
    px[fy][fx] = (172, 40, 34, 255)
    px[fy][fx + 1] = (198, 62, 48, 255)
    px[fy + 1][fx] = (146, 32, 30, 255)
png(os.path.join(TEX, "scp038_leaves.png"), px)

print("scp item textures done")
