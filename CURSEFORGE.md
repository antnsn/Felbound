<!-- summary (CurseForge "Summary" field, at most 256 characters):
Warlock helper for WoW: Forever: one-click cards to summon your demon, keep Demon Armor up and make a Healthstone or Soulstone, a warning when Soul Shards run low, and Ritual of Summoning and Unending Breath beside the Escape menu.
-->

# Felbound

**The warlock helper for World of Warcraft: Forever: your demon, your armor, your stones and shards, explained.**

Felbound reminds you of what a warlock needs between fights: a demon that isn't out, Demon Armor that ran out, a missing Healthstone or Soulstone, and Soul Shards running low. Every card is one click away from fixing it.

**Full guide: https://antnsn.github.io/Felbound/**

**Beta:** Felbound is new. Spell IDs come from Classic and are checked on Forever before 0.1.0; tell us what doesn't work.

## Your demon
- **No demon out** (out of combat, not mounted): click the card to summon the one you chose. Auto summons the Voidwalker once you know it, else the Imp.
- Says when the summon needs a **Soul Shard** and you have none.

## Armor, stones and shards
- **Demon Armor** (Demon Skin before it): a card when it's missing or about to run out. Click to cast.
- **Healthstone** (and **Soulstone**, if you turn it on): a card when there's none in your bags. Click to make one.
- **Soul Shards**: a warning when you're down to a few (3 by default).

## Travel
- **Press Escape**: beside the game menu you get Ritual of Summoning, Unending Breath and your Hearthstone.

## Also in it
- **Buff key** (Extras page): out of combat, each press casts the next thing a card asks for.
- **Well Rested and Well Fed**: a countdown before they run out, with a sound if you like.
- **Explained**: hover over a card or button for a plain-word explanation of what it does and why (can be turned off).
- **Your layout**: every frame can be moved, snapped to a grid and scaled (`/fel unlock`).
- **Three skins**: the warlock look, Blizzard and Flat.
- Loads on warlocks only.

## Commands
- `/fel`: open the options
- `/fel help`: list every command
- `/fel unlock`: show every frame so you can drag it into place
- `/fel lock`: lock the frames again
- `/fel reset`: put every frame back where it started
- `/fel grid [size]`: snap to a grid while moving, or set its size
- `/fel minimap`: show or hide the minimap button
- `/fel explain`: turn the plain-word explanations in tooltips on or off

## Ideas and contributions
- **Missing something?** New features are added on request: leave a comment here.
- **Feel free to contribute**: the code is on GitHub, https://github.com/antnsn/Felbound (issues and pull requests welcome).

## The Bound family
Felbound is one of the Bound addons, one per class, built on the same core: Lightbound (paladin), Chronobound (mage), Stormbound (shaman), Packbound (hunter), Spiritbound (priest), Felbound (warlock) and Dreambound (druid). They look like their class but work the same way, so if you know one, you know them all.

## Changelog
<!-- changelog:start -->
### 0.1.0 beta 4

- **Minimap button** works with minimap addons (EllesmereUI, SexyMap, ElvUI, MinimapButtonBag, broker bars): it is a LibDBIcon button now. Its place on the minimap is kept.

### 0.1.0 beta 3

- **New icon**: hand-painted class art for the icon, the emblem and the faint crest behind the cards.

### 0.1.0 beta 2

- **New look**: a painted icon and emblem, and a faint class crest behind every card and in the corner of the options window and the travel panel (the Blizzard and Flat skins stay plain).

### 0.1.0 beta 1

- First test build: demon card (click to summon the chosen demon, says when a Soul Shard is missing), Demon Armor / Demon Skin timer, Healthstone and Soulstone cards, a Soul Shard warning, Ritual of Summoning and Unending Breath beside the Escape menu, Well-Rested and Well Fed, explanations, movable frames, Fel, Blizzard and Flat skins. Built on LibBound-1.0.
<!-- changelog:end -->
