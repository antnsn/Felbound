---
title: Getting started
nav_order: 2
description: Install Felbound and set it up in a few minutes.
---

# Getting started
{: .no_toc }

From install to a warlock whose demon, armor and stones are taken care of.
{: .fs-6 .fw-300 }

1. TOC
{:toc}

---

## 1. Install it

Pick one:

- **CurseForge app or WowUp:** search for **Felbound** and click Install.
- **By hand:** download it from [CurseForge](https://www.curseforge.com/wow/addons/felbound) or from [GitHub Releases](https://github.com/antnsn/Felbound/releases) (the `Felbound-<version>.zip` file, not the green "Code > Download ZIP" button). Unzip it into your `World of Warcraft\_forever_\Interface\AddOns` folder, so you get a folder called `Felbound` there.

Start the game (or type `/reload` if it was already running) and log in on your warlock.

Felbound only loads on warlocks. On any other character it does nothing, says so in chat, and turns itself off for that character from the next login. The AddOns list can turn it on again.

## 2. Open the options

Type `/fel` in chat, or click the Felbound button on your minimap.

The options window has one page per feature on the left: **Demon & armor**, **Stones & shards**, **Travel**, **Extras** and **Skin**. Everything except the Soulstone reminder is on by default, so you mostly turn off what you don't want.

## 3. Pick your demon

1. In `/fel`, open the **Demon & armor** page.
2. Click the **Demon to summon** button to step through the choices (right-click goes back).

**Auto** (the default) summons the Voidwalker once you know it, and the Imp before that. Pick a demon by name if you want that one every time. More in [Your demon](features/demon.html).

## 4. Play

Cards show up when something is missing:

- no demon out,
- Demon Armor about to run out or gone,
- no Healthstone in your bags,
- Soul Shards running low.

Click a card to fix it. Clicks work out of combat only, and most cards stay hidden in combat anyway.

{: .tip }
Want one key instead of clicking cards? Set the **Buff key** on the **Extras** page. Each press casts what the top card asks for. See [Buff key](features/buff-key.html).

## 5. Put the frames where you want them

1. Type `/fel unlock`, Shift-click the minimap button, or click **Unlock frames** at the bottom of the `/fel` window. Every Felbound card shows with sample text.
2. Drag each card where you want it. Scroll the mouse wheel over a card to resize it.
3. Type `/fel lock` or click **Lock** on the bar at the top of the screen.

`/fel reset` puts every frame back where it started. More in [Layout](features/layout.html).

Using EllesmereUI, ElvUI or another flat UI? Pick the **Flat** skin on the **Skin** page in `/fel`. See [Skins](features/skins.html).

## That's it

Everything else works on its own. When you want to know what a card means or change how something behaves, look it up under [Features](features/).
