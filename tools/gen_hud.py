#!/usr/bin/env python3
"""The HUD font (lab:hud): a second actionbar line, below the first.

Eleven battery-bar glyphs (U+E200..U+E20A = 0..10 segments, red at 2 and
under) drawn with NEGATIVE ascent, so they render ~12px below the normal
actionbar text line - right above the hotbar, SCP:CB style. Plus a set of
negative/positive space advances (powers of two) the ActionBars hub uses to
pull the bar back under the center of the message above it.

Run from the repo root:  python3 tools/gen_hud.py
"""
import json, os, struct, zlib

HERE = os.path.dirname(__file__)
RP = os.path.join(HERE, "..", "resource-pack", "assets", "lab")

def png(path, px):
    h, w = len(px), len(px[0])
    rows = b"".join(b"\x00" + b"".join(bytes(p) for p in line) for line in px)
    def chunk(t, d):
        return struct.pack(">I", len(d)) + t + d + struct.pack(">I", zlib.crc32(t + d))
    data = (b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 6, 0, 0, 0))
            + chunk(b"IDAT", zlib.compress(rows, 9)) + chunk(b"IEND", b""))
    os.makedirs(os.path.dirname(path), exist_ok=True)
    open(path, "wb").write(data)
    print(path)

W, H = 46, 8   # [##########] - brackets + 10 segments of 4px + gaps
providers = []
for n in range(11):
    px = [[(0, 0, 0, 0)] * W for _ in range(H)]
    frame = (168, 168, 168, 255)
    for y in range(1, 7):                      # brackets
        px[y][0] = px[y][1] = frame
        px[y][W - 2] = px[y][W - 1] = frame
    lit = (68, 235, 100, 255) if n > 2 else (235, 70, 60, 255)
    dark = (44, 46, 48, 200)
    for seg in range(10):
        x0 = 3 + seg * 4
        color = lit if seg < n else dark
        for y in range(1, 7):
            for x in range(x0, x0 + 3):
                px[y][x] = color
    name = f"hud_battery_{n}.png"
    png(os.path.join(RP, "textures", "font", name), [row[:] for row in px])
    providers.append({"type": "bitmap", "file": f"lab:font/{name}",
                      "ascent": -4, "height": 8,
                      "chars": [chr(0xE200 + n)]})

# -------------------------------------------------------------------------
# Blink + Sprint meters (the bottom-left vitals, SCP:CB style). Two 10-segment
# bars plus a tiny icon each. Drawn LOWER than the battery (METER_ASCENT) so
# they sit down at the XP-bar level; the ActionBars hub pushes the whole pair
# far to the left. Blink is cyan (red when nearly spent); sprint reuses the
# green battery ramp (E200..E20A) since low-stamina-red already fits.
METER_ASCENT = -12   # lower = down toward the XP-bar row (more negative = lower)

def bar(n, lit_hi, lit_lo):
    px = [[(0, 0, 0, 0)] * W for _ in range(H)]
    frame = (168, 168, 168, 255)
    for y in range(1, 7):
        px[y][0] = px[y][1] = frame
        px[y][W - 2] = px[y][W - 1] = frame
    lit = lit_hi if n > 2 else lit_lo
    dark = (44, 46, 48, 200)
    for seg in range(10):
        x0 = 3 + seg * 4
        color = lit if seg < n else dark
        for y in range(1, 7):
            for x in range(x0, x0 + 3):
                px[y][x] = color
    return px

# Blink bars: cyan, red when nearly spent. U+E210..U+E21A
for n in range(11):
    name = f"hud_blink_{n}.png"
    png(os.path.join(RP, "textures", "font", name),
        bar(n, (70, 220, 235, 255), (235, 70, 60, 255)))
    providers.append({"type": "bitmap", "file": f"lab:font/{name}",
                      "ascent": METER_ASCENT, "height": 8, "chars": [chr(0xE210 + n)]})

# Re-emit the green battery bars at the meter row too, for the sprint bar.
# U+E230..U+E23A (same art as E200.. but lower ascent so it lines up with blink).
for n in range(11):
    name = f"hud_stam_{n}.png"
    png(os.path.join(RP, "textures", "font", name),
        bar(n, (68, 235, 100, 255), (235, 70, 60, 255)))
    providers.append({"type": "bitmap", "file": f"lab:font/{name}",
                      "ascent": METER_ASCENT, "height": 8, "chars": [chr(0xE230 + n)]})

# Icons: an eye (blink, U+E220) and a boot (sprint, U+E221), 8x8, meter row.
def icon(pixels):
    return pixels

EYE = [
    "........",
    "........",
    "..####..",
    ".#.CC.#.",
    "#..CC..#",
    ".#.CC.#.",
    "..####..",
    "........",
]
BOOT = [
    "........",
    ".GG.....",
    ".GG.....",
    ".GG.....",
    ".GG.....",
    ".GGGGG..",
    ".GGGGGG.",
    "........",
]
def glyph_from(rows, col):
    out = []
    for r in rows:
        line = []
        for ch in r:
            if ch == '.':
                line.append((0, 0, 0, 0))
            elif ch == '#':
                line.append((200, 200, 200, 255))
            elif ch == 'C':
                line.append(col)
            elif ch == 'G':
                line.append(col)
            else:
                line.append((0, 0, 0, 0))
        out.append(line)
    return out

png(os.path.join(RP, "textures", "font", "hud_eye.png"),
    glyph_from(EYE, (70, 220, 235, 255)))
providers.append({"type": "bitmap", "file": "lab:font/hud_eye.png",
                  "ascent": METER_ASCENT, "height": 8, "chars": [chr(0xE220)]})
png(os.path.join(RP, "textures", "font", "hud_boot.png"),
    glyph_from(BOOT, (68, 235, 100, 255)))
providers.append({"type": "bitmap", "file": "lab:font/hud_boot.png",
                  "ascent": METER_ASCENT, "height": 8, "chars": [chr(0xE221)]})

# spacing glyphs: powers of two in both directions, composed by the hub
advances = {}
for i, size in enumerate([1, 2, 4, 8, 16, 32, 64, 128, 256]):
    advances[chr(0xE300 + i)] = -size
    advances[chr(0xE310 + i)] = size
providers.insert(0, {"type": "space", "advances": advances})

os.makedirs(os.path.join(RP, "font"), exist_ok=True)
with open(os.path.join(RP, "font", "hud.json"), "w") as f:
    json.dump({"providers": providers}, f, indent=2, ensure_ascii=False)
print("lab:hud font written")
