---
title: Your demon
parent: Features
nav_order: 1
description: A card when your demon isn't out. Click it to summon the one you chose.
---

# Your demon

A warlock fights with a demon at their side. When yours isn't out, Felbound shows a card. Click it and it summons the demon.

## What it does

- A card titled **Summon your Imp** (or Voidwalker, Succubus, Felhunter) appears when you have no demon out, or your demon is dead.
- Click the card to summon that demon. The card glows while it waits for you.
- Any demon counts. If you chose the Voidwalker and the Imp is out, there is no card.
- It stays hidden in combat and while you are mounted.
- Every demon except the Imp costs a Soul Shard. With no shard in your bags, the card says **No Soul Shard: the Imp needs none** in red, and a click does nothing.
- Until you know any of the four demons, there is no card.

### Which demon it summons

| Choice | Summons |
| --- | --- |
| **Auto** (default) | The Voidwalker once you know it, the Imp before that. |
| **Imp**, **Voidwalker**, **Succubus** or **Felhunter** | That demon. If you don't know it yet, it falls back to Auto. |

Auto never picks the Succubus or the Felhunter. Choose them by name if you want them.

## How to use it

1. Type `/fel` and open the **Demon & armor** page.
2. Click **Demon to summon** to step through the choices (right-click goes back). The line under it says which demon that means right now, for example "Now: Voidwalker".
3. Out of combat, when the card shows, click it.

## Settings

In `/fel`, page **Demon & armor**:

| Setting | Default | What it does |
| --- | --- | --- |
| Remind me to summon my demon | On | Shows the card when your demon isn't out. |
| Demon to summon | Auto | Which demon the card summons. See the table above. |

## Good to know

**The card says "No Soul Shard" but I want the Imp now.**
The card does not switch to the Imp by itself. Set **Demon to summon** to **Imp**, or summon it from your spellbook.

**Why can't I click it in combat?**
The game does not let addons cast for you in combat. The card is hidden in combat anyway.

**Can I move it?**
Yes, like every Felbound frame. See [Layout](layout.html).
