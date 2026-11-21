---
title: Well-Rested and Well Fed
parent: Features
nav_order: 7
description: A warning before Well-Rested or Well Fed runs out, with a countdown card.
---

# Well-Rested and Well Fed

Two buffs that help while leveling, and run out without much notice. Felbound tells you before they do.

## What it does

- **Well-Rested** comes from sleeping in a Cozy Sleeping Bag and gives more experience for a while.
- **Well Fed** comes from buff food: better stats, and on Forever more experience too.
- When one of them is about to run out, you get a warning in the middle of the screen, in chat and with a sound, for example "Well Fed: 3 min left".
- After the warning, a card counts down the time left.
- Well Fed also tells you in chat and on screen when it is gone: "Well Fed is gone".
- Optionally, a faded card stays up after the buff is gone ("Buff has run out"), with one rebuff warning. The warning waits until you are out of combat and alive.
- These cards are reminders only: clicking them does nothing.

## How to use it

1. Type `/fel` and open the **Extras** page.
2. Each buff has its own section. Click **Test** to see and hear the warning.
3. Set **Warn with time left** to how early you want the warning.

## Settings

In `/fel`, page **Extras**. The sections **Well-Rested** and **Well Fed** have the same settings:

| Setting | Default | What it does |
| --- | --- | --- |
| Warn | On | The warning before the buff runs out. Off also turns off the countdown card. |
| Sound | On | Plays the raid warning sound with the warning. |
| Countdown card | On | The card that counts down after the warning. |
| Keep following it after it's gone (rebuff warning) | Off | Keeps a "Buff has run out" card up after the buff is gone, with one rebuff warning. |
| Warn with time left | 5 min (Well-Rested), 3 min (Well Fed) | When the warning starts. 1 to 30 minutes. |

The **Test** button shows the warning as if the buff had that much time left.

## Good to know

**Nothing happens right after I log in.**
Right after you log in or change zones, Felbound waits a few seconds for the game to load your buffs.

**"Well Fed is gone" and the rebuff warning at the same time?**
No. With **Keep following it after it's gone** on, you get the card and the rebuff warning instead of the plain "is gone" message.
