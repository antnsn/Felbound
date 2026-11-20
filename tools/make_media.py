"""Draws Felbound's textures into Media/ (TGA, power-of-two sizes).

Run from the addon folder:  python3 tools/make_media.py
Card textures are white with alpha so the game can tint them; the emblem is drawn in colour.
"""
import math
import random
from PIL import Image, ImageDraw, ImageFilter

import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "LibBound", "tools"))
from paint import Canvas, bar, disc, grow, leaf, lick, mask, minus, poly, radial_disc, rays, ring, sparkle, union  # noqa: E402

S = 1024

OUT = "Media/"


def smoke(size=128, seed=13):
    """Rising smoke wisps, tileable, white on alpha."""
    rnd = random.Random(seed)
    img = Image.new("L", (size, size), 0)
    d = ImageDraw.Draw(img)
    for _ in range(30):
        x = rnd.randrange(size)
        y = rnd.randrange(size)
        pts = []
        for k in range(8):
            pts.append((x + math.sin(k * 0.9 + x) * 6, y - k * 9))
        for dx in (-size, 0, size):
            for dy in (-size, 0, size):
                d.line([(px + dx, py + dy) for px, py in pts], fill=rnd.randint(50, 110), width=rnd.randint(3, 7))
    img = img.filter(ImageFilter.GaussianBlur(4))
    out = Image.new("RGBA", (size, size), (255, 255, 255, 0))
    out.putalpha(img)
    return out


def rune(size=32):
    """An angular fel rune in the top-left corner."""
    s = size * 4
    img = Image.new("L", (s, s), 0)
    d = ImageDraw.Draw(img)
    w = int(s * 0.05)
    d.line([(s * 0.08, s * 0.08), (s * 0.55, s * 0.08)], fill=255, width=w)
    d.line([(s * 0.08, s * 0.08), (s * 0.08, s * 0.55)], fill=255, width=w)
    d.line([(s * 0.20, s * 0.20), (s * 0.40, s * 0.40)], fill=230, width=w)
    d.line([(s * 0.40, s * 0.20), (s * 0.20, s * 0.40)], fill=200, width=int(w * 0.7))
    glow = img.filter(ImageFilter.GaussianBlur(s * 0.03))
    img = Image.composite(img, glow, img).resize((size, size), Image.LANCZOS)
    out = Image.new("RGBA", (size, size), (255, 255, 255, 0))
    out.putalpha(img)
    return out


def rim(size=64, width=5):
    img = Image.new("L", (size, size), 0)
    d = ImageDraw.Draw(img)
    for i in range(width * 2):
        v = int(255 * (1 - i / (width * 2)) ** 2)
        d.rectangle([i, i, size - 1 - i, size - 1 - i], outline=v)
    img = img.filter(ImageFilter.GaussianBlur(1.2))
    out = Image.new("RGBA", (size, size), (255, 255, 255, 0))
    out.putalpha(img)
    return out


def horn(s, side):
    """A curved, tapering horn from the base by the flame out past the ring."""
    pts_l, pts_r = [], []
    for k in range(25):
        t = k / 24
        # centre line: from base (0.36, 0.60) sweeping out and up to the tip (0.10, 0.10)
        x = 0.37 - 0.25 * t - 0.06 * math.sin(t * math.pi)
        y = 0.62 - 0.40 * t - 0.12 * t * t
        w = 0.065 * (1 - t) ** 0.9 + 0.004
        a = math.atan2(-0.40 - 0.24 * t, -0.25 - 0.06 * math.pi * math.cos(t * math.pi))
        nx, ny = -math.sin(a), math.cos(a)
        pts_l.append((x + nx * w, y + ny * w)); pts_r.append((x - nx * w, y - ny * w))
    pts = pts_l + pts_r[::-1]
    if side > 0:
        pts = [(1 - x, y) for x, y in pts]
    return poly(s, pts)


def emblem(size=256):
    """The Felbound emblem, painted (tools in LibBound/tools/paint.py)."""
    s = S
    cv = Canvas(s)
    ground = radial_disc(cv, 0.40, (34, 58, 28), (6, 12, 7))
    # summoning circle in the ground: a star and runes, lit faintly from within
    star = mask(s); d = ImageDraw.Draw(star)
    pts = [(s / 2 + math.sin(k * 2 * math.pi / 5) * s * 0.30, s / 2 - math.cos(k * 2 * math.pi / 5) * s * 0.30) for k in range(5)]
    for k in range(5):
        d.line([pts[k], pts[(k + 2) % 5]], fill=255, width=int(s * 0.008))
    d.ellipse([s * 0.18, s * 0.18, s * 0.82, s * 0.82], outline=255, width=int(s * 0.008))
    rnd = random.Random(5)
    for k in range(20):
        a = (k + 0.5) * 2 * math.pi / 20
        x, y = s / 2 + math.sin(a) * s * 0.345, s / 2 - math.cos(a) * s * 0.345
        t = s * 0.014
        if rnd.random() < 0.5:
            d.line([(x, y - t), (x, y + t)], fill=255, width=int(s * 0.006)); d.line([(x - t, y), (x + t, y - t)], fill=255, width=int(s * 0.006))
        else:
            d.polygon([(x, y - t), (x + t, y + t), (x - t, y + t)], outline=255)
    cv.light(star.filter(ImageFilter.GaussianBlur(6)), (60, 200, 50), alpha=0.9)
    cv.light(star, (90, 230, 70), alpha=0.55)
    # the ring: dark iron with a green sheen
    rg = ring(s, 0.415, 0.375)
    cv.glow(rg, (90, 255, 60), 22, 0.55)
    cv.paint(rg, top=(120, 140, 110), bottom=(30, 38, 30), bevel=8, gloss=0.5)
    # horns, breaking out of the ring
    for side in (-1, 1):
        h = horn(s, side)
        cv.shadow(h, radius=14, dx=0, dy=12, strength=0.8)
        cv.paint(h, top=(250, 240, 214), bottom=(96, 78, 58), bevel=16, gloss=0.7, light=0.8, dark=0.9)
    # the fel flame: a tall tongue and four smaller ones around it
    fl = union(lick(s, 0.50, 0.70, 0.56, 0.10, lean=0.05, wiggle=-0.03),
               lick(s, 0.44, 0.72, 0.36, 0.07, lean=-0.10, wiggle=0.02),
               lick(s, 0.56, 0.72, 0.40, 0.07, lean=0.11, wiggle=-0.02),
               lick(s, 0.40, 0.73, 0.20, 0.05, lean=-0.07, wiggle=0.01),
               lick(s, 0.60, 0.73, 0.22, 0.05, lean=0.08, wiggle=-0.01))
    cv.glow(fl, (60, 255, 30), 50, 0.8)
    cv.paint(fl, top=(200, 255, 120), bottom=(20, 110, 18), bevel=14, gloss=0.35, light=0.55, dark=0.7)
    core = union(lick(s, 0.50, 0.70, 0.36, 0.055, lean=0.03, wiggle=-0.02),
                 lick(s, 0.46, 0.71, 0.18, 0.035, lean=-0.05), lick(s, 0.54, 0.71, 0.20, 0.035, lean=0.05))
    cv.light(core.filter(ImageFilter.GaussianBlur(14)), (120, 230, 60), alpha=0.8)
    cv.light(core.filter(ImageFilter.GaussianBlur(5)), (210, 255, 160), alpha=0.45)
    # sparks rising
    sp = mask(s); d = ImageDraw.Draw(sp)
    rnd = random.Random(11)
    for _ in range(14):
        x, y, r = rnd.uniform(0.36, 0.64), rnd.uniform(0.10, 0.40), rnd.uniform(0.004, 0.010)
        d.ellipse([(x - r) * s, (y - r) * s, (x + r) * s, (y + r) * s], fill=255)
    cv.light(sp.filter(ImageFilter.GaussianBlur(3)), (180, 255, 120), 1.0)
    return cv.image(size)


def icon(size):
    bg = Image.new("RGBA", (size, size), (0, 0, 0, 255))
    d = ImageDraw.Draw(bg)
    for y in range(size):
        t = y / size
        d.line([(0, y), (size, y)], fill=(int(14 + 14 * (1 - t)), int(22 + 22 * (1 - t)), int(14 + 12 * (1 - t)), 255))
    e = emblem(size * 2).resize((size, size), Image.LANCZOS)
    return Image.alpha_composite(bg, e)


def _finish(img, size):
    """White line art at 4x: a soft glow under it, down to size, as alpha."""
    glow = img.filter(ImageFilter.GaussianBlur(img.size[0] * 0.012))
    img = Image.composite(img, glow, img).resize((size, size), Image.LANCZOS)
    out = Image.new("RGBA", (size, size), (255, 255, 255, 0))
    out.putalpha(img)
    return out

def crest(size=256):
    """The card crest: a summoning circle, star and runes."""
    s = size * 4
    c = s / 2
    img = Image.new("L", (s, s), 0)
    d = ImageDraw.Draw(img)
    w = int(s * 0.018)
    d.ellipse([s * 0.06, s * 0.06, s * 0.94, s * 0.94], outline=255, width=w)
    d.ellipse([s * 0.16, s * 0.16, s * 0.84, s * 0.84], outline=230, width=w)
    pts = [(c + math.sin(k * 2 * math.pi / 5) * s * 0.34, c - math.cos(k * 2 * math.pi / 5) * s * 0.34) for k in range(5)]
    for k in range(5):
        d.line([pts[k], pts[(k + 2) % 5]], fill=255, width=w)
    rnd = random.Random(7)
    for k in range(15):
        a = (k + 0.5) * 2 * math.pi / 15
        x, y = c + math.sin(a) * s * 0.39, c - math.cos(a) * s * 0.39
        t = s * 0.022
        kind = rnd.randrange(3)
        if kind == 0:
            d.line([(x - t, y - t), (x + t, y + t)], fill=210, width=int(w * 0.7))
            d.line([(x - t, y + t), (x + t, y - t)], fill=210, width=int(w * 0.7))
        elif kind == 1:
            d.line([(x, y - t), (x, y + t)], fill=210, width=int(w * 0.7))
            d.line([(x - t, y - t * 0.3), (x + t, y - t * 0.3)], fill=210, width=int(w * 0.7))
        else:
            d.polygon([(x, y - t), (x + t, y + t), (x - t, y + t)], outline=210)
    return _finish(img, size)


def save(img, name):
    img.save(OUT + name + ".tga")
    print("wrote", OUT + name + ".tga", img.size)


if __name__ == "__main__":
    save(smoke(), "Smoke")
    save(rune(), "Rune")
    save(crest(), "Crest")
    save(rim(), "Rim")
    save(emblem(256), "Logo256")
    save(emblem(64), "Logo64")
    save(icon(64), "Icon64")
    save(icon(128), "Icon128")
    emblem(1024).save("Felbound.png")  # the CurseForge project picture
    print("wrote Felbound.png (1024, 1024)")
