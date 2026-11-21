---
title: Skins
parent: Features
nav_order: 8
description: Pick how Felbound looks, Fel, classic Blizzard or flat, to match the rest of your UI.
---

# Skins

Felbound comes in three looks. They all work the same way, only the frames look different, so you can match the rest of your UI.

## The three skins

| Skin | Looks like | Good with |
|:--|:--|:--|
| **Fel** (default) | Charcoal and fel green: smoke behind the cards, runes in the corners, a faint warlock crest, and a slow green rim while a card needs you. | The default UI, or if you like the warlock look. |
| **Blizzard** | The game's own grey and silver tooltips, dialogs and buttons, white text. | A mostly default UI where green would stand out. |
| **Flat** | Thin black edges on dark grey, Arial Narrow text. Fel green stays as the one accent. | EllesmereUI, ElvUI and other flat UI packs. |

The Blizzard and Flat skins have no crest, smoke or runes.

## How to switch

1. Type `/fel` and open the **Skin** page.
2. Click the **Skin** button to step through the skins (right-click goes back).
3. Click **Reload now**, or type `/reload` later. The new skin shows after the reload.

The skin is saved with your other Felbound settings.

## What changes, and what doesn't

A skin changes the frames: colors, borders, fonts, buttons and check boxes in the options window, the cards and the travel panel.

Colors that tell you something stay the same in every skin: red for anything missing or running low.

## Settings

In `/fel`, page **Skin**:

| Setting | Default | What it does |
| --- | --- | --- |
| Skin | Fel | Fel, Blizzard or Flat. Applies after a reload. |

The same page also has the **General** switches: **Explain things in tooltips** (see [Explanations in tooltips](explanations.html)) and the **Minimap button** (see [Layout](layout.html#minimap-button)).

## Good to know

**Why does it need a reload?**
Felbound builds its frames once, when you log in. Switching in the middle of a session would leave some frames in the old look and some in the new one, so the switch waits for the next reload.
