---
title: Buff key
parent: Features
nav_order: 6
description: One key that casts what the cards ask for.
---

# Buff key

Press one key, out of combat, and Felbound casts what the top card asks for: no need to move the mouse to the card.

## What it does

- Each press casts **one** spell: the one you would get by clicking the first card that has something to cast.
- The order is always the same:
  1. **Your demon**, when the [demon card](demon.html) asks you to summon it.
  2. **Demon Armor** (or Demon Skin), when the [armor card](demon-armor.html) shows its countdown or says it is missing.
  3. **Healthstone, then Soulstone**, when the [stone card](healthstone-and-soulstone.html) asks for one.
- The order is fixed. It doesn't depend on where the cards sit on your screen.
- A card that can't be clicked doesn't count: a demon or stone card that says it needs a Soul Shard, the [Soul Shards](soul-shards.html) card, and the [Well-Rested and Well Fed](well-rested-and-well-fed.html) cards.
- When nothing is needed, a press says "nothing to buff right now." in chat.

Warlocks have no buff to cast on the group, so the key only ever casts on you.

## How to use it

1. Type `/fel` and open the **Extras** page.
2. Under **Buff key**, click the button next to **Key** (it says "Click to set"), then press the key you want, for example Shift-Q. Esc cancels.
3. Out of combat, press the key until it says there is nothing to buff.

## Settings

In `/fel`, page **Extras**, section **Buff key**:

| Setting | Default | What it does |
| --- | --- | --- |
| Key | Not set | The key itself. **Clear** removes it. |

There is no separate on/off switch: with no key set, there is no buff key. What the key casts follows the card settings: turn a card off and the key skips it too.

## Good to know

**Does it work in combat?**
No. The game does not let addons cast for you in combat, so the key does nothing until combat ends.

**It does nothing while my frames are unlocked.**
While the frames are unlocked, the cards show sample text and can't be clicked, so the key has nothing to cast. Lock them again.

**Does it replace what the key did before?**
Only while Felbound is loaded. The key is bound on top of your normal key bindings and doesn't change them. Clear it and the key does what it did before.
