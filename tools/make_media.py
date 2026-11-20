"""Draws Felbound's textures into Media/ (TGA, power-of-two sizes).

Run from the addon folder:  python3 tools/make_media.py
Card textures are white with alpha so the game can tint them; the emblem is drawn in colour.
"""
import math
import random
from PIL import Image, ImageDraw, ImageFilter

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


def emblem(size=256):
    """The Felbound emblem: a fel-green flame between two small horns, in a ring."""
    s = size * 4
    c = s / 2
    img = Image.new("RGBA", (s, s), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    d.ellipse([s * 0.10, s * 0.10, s * 0.90, s * 0.90], outline=(110, 220, 80, 230), width=int(s * 0.035))
    horn = (190, 200, 180, 255)
    d.polygon([(c - s * 0.20, s * 0.62), (c - s * 0.32, s * 0.30), (c - s * 0.12, s * 0.55)], fill=horn)
    d.polygon([(c + s * 0.20, s * 0.62), (c + s * 0.32, s * 0.30), (c + s * 0.12, s * 0.55)], fill=horn)
    flame = [(c, s * 0.22), (c + s * 0.12, s * 0.46), (c + s * 0.09, s * 0.66), (c, s * 0.74),
             (c - s * 0.09, s * 0.66), (c - s * 0.12, s * 0.46)]
    d.polygon(flame, fill=(120, 235, 70, 255))
    inner = [(c, s * 0.38), (c + s * 0.055, s * 0.52), (c, s * 0.66), (c - s * 0.055, s * 0.52)]
    d.polygon(inner, fill=(215, 255, 180, 255))
    glow = img.filter(ImageFilter.GaussianBlur(s * 0.03))
    return Image.alpha_composite(glow, img).resize((size, size), Image.LANCZOS)


def icon(size):
    bg = Image.new("RGBA", (size, size), (0, 0, 0, 255))
    d = ImageDraw.Draw(bg)
    for y in range(size):
        t = y / size
        d.line([(0, y), (size, y)], fill=(int(14 + 14 * (1 - t)), int(22 + 22 * (1 - t)), int(14 + 12 * (1 - t)), 255))
    e = emblem(size * 2).resize((size, size), Image.LANCZOS)
    return Image.alpha_composite(bg, e)


def save(img, name):
    img.save(OUT + name + ".tga")
    print("wrote", OUT + name + ".tga", img.size)


if __name__ == "__main__":
    save(smoke(), "Smoke")
    save(rune(), "Rune")
    save(rim(), "Rim")
    save(emblem(256), "Logo256")
    save(emblem(64), "Logo64")
    save(icon(64), "Icon64")
    save(icon(128), "Icon128")
