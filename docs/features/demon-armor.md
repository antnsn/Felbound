---
title: Demon Armor
parent: Features
nav_order: 2
description: A countdown before Demon Armor or Demon Skin runs out, and a card when it is gone. Click to cast.
---

# Demon Armor

Demon Armor gives you armor and health back over time. Felbound tells you before it runs out and when it is gone, and casts it again with one click.

## What it does

- Before you learn Demon Armor, it follows **Demon Skin** instead. The card shows the name of the spell you have. Both count as armor, so either one up keeps it quiet.
- When your armor has 2 minutes left (you can change this), you get a warning in the middle of the screen and in chat, for example "Demon Armor: 2 min left".
- After the warning, a card counts down the time left. Click it to cast your armor again.
- When the armor is gone, a faded card says **Missing: click to cast**, and you get one reminder: "Demon Armor is gone, rebuff". The reminder waits until you are out of combat and alive.
- Right after you log in or change zones, it waits a few seconds before it calls the armor missing, so it doesn't warn while the game is still loading your buffs.
- Until you know Demon Skin, there is no card.

## How to use it

1. Type `/fel` and open the **Demon & armor** page.
2. Under **Demon Armor**, check that **Show** is ticked. Tick **Sound** if you want a sound with each warning.
3. Set **Warn with time left** to how early you want the warning.
4. Out of combat, click the card when it shows.

## Settings

In `/fel`, page **Demon & armor**, section **Demon Armor**:

| Setting | Default | What it does |
| --- | --- | --- |
| Show | On | The warning and the cards. Off turns the whole feature off. |
| Sound | Off | Plays the raid warning sound with the warning and with the "gone" reminder. |
| When missing | On | Shows the "Missing: click to cast" card and the reminder when the armor is gone. Off: you only get the warning before it runs out. |
| Warn with time left | 2 min | When the warning and the countdown start. 1 to 10 minutes. |

## Good to know

**The chat says "Demon Armor" but I cast Demon Skin.**
The warning text always says Demon Armor. The card title shows the spell you actually have.

**Clicking does nothing in combat.**
The game does not let addons cast for you in combat. The countdown keeps running, and the click works again once the fight is over.

**What about combat?**
Forever can hide your buffs from addons in combat. Felbound then counts down from the time it last saw, and the "gone" reminder waits until the fight is over.
