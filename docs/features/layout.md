---
title: Layout
parent: Features
nav_order: 9
description: Move and resize every frame, snap them to a grid, and the minimap button.
---

# Layout

Put every Felbound frame exactly where you want it, and open Felbound from the minimap.

## What it does

### Moving and resizing frames

- Unlocking shows **every** Felbound card with sample text, so you can place cards that are normally hidden: your demon, Demon Armor, the stone card, Soul Shards, Well-Rested and Well Fed.
- Drag a card to move it. Cards snap to a grid around the center of your screen. Hold **Shift** while dragging to place a card freely.
- Scroll the **mouse wheel** over a card to make it bigger or smaller (50% to 250%).
- While unlocked, a small bar at the top of the screen sets the grid size (**-** and **+**, or the mouse wheel; hold Shift for 1 pixel steps), turns **Snap** on or off, and has a **Lock** button.
- **Reset positions** puts every card back in its default place and size.

### Minimap button

| Click | Does |
| --- | --- |
| Left-click | Opens the options (`/fel`). |
| Shift-click or middle-click | Unlocks the frames (and locks them again). |
| Drag | Moves the button around the minimap. |

The button works with minimap addons such as EllesmereUI, SexyMap, ElvUI, MinimapButtonBag and broker bars. Where the game has an addon menu (the puzzle-piece button), Felbound is listed there too, with the same clicks. The game's **Settings > AddOns** list also has a Felbound entry with an **Open options** button.

## How to use it

1. Type `/fel unlock`, Shift-click the minimap button, or click **Unlock frames** at the bottom of the `/fel` window.
2. Drag cards into place. Scroll on a card to resize it.
3. Click **Lock** on the bar at the top, type `/fel lock`, or click **Lock frames** in the `/fel` window.
4. Made a mess? `/fel reset` (or **Reset positions** in `/fel`) puts everything back.

## Settings

In `/fel`, page **Skin**, section **General**:

| Setting | Default | What it does |
| --- | --- | --- |
| Minimap button (left-click options, shift-click unlock) | On | Shows or hides the minimap button. Also `/fel minimap`. |

The grid has no options page. Change it on the bar shown while frames are unlocked, or with `/fel grid`:

| Command | Does |
| --- | --- |
| `/fel grid` | Turns snapping on or off (on by default). |
| `/fel grid 30` | Sets the grid size (4 to 100, default 20) and turns snapping on. |

## Good to know

**Not in combat.**
Unlocking, locking, moving, resizing and resetting frames all wait until you leave combat.

**Cards can't be clicked while unlocked.**
Unlocked cards show sample text and only move. Lock them to click them again.

**Closing the options window** locks the frames again, but only if you unlocked them with the options' own button. Frames unlocked with `/fel unlock` stay unlocked until you lock them.

**The options window and the travel panel** are not moved with unlock. Drag the options window by its title bar. The [travel panel](travel-panel.html) always sits next to the game menu.
