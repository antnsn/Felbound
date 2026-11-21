<p align="center"><img src="Felbound.png" width="180" alt="Felbound"></p>

# Felbound

A warlock helper for **WoW: Forever**, part of the Bound family (Lightbound, Chronobound,
Stormbound, Packbound, Spiritbound).

- **Demon**: a card when your demon isn't out (out of combat, not mounted). Click it to summon the
  one you chose (Auto: the Voidwalker once you know it, else the Imp). It tells you when the
  summon needs a Soul Shard and you have none.
- **Armor**: a card when Demon Armor (Demon Skin before it) is missing or running out. Click to cast.
- **Stones**: a card when you have no Healthstone (and no Soulstone, if you turn that on). Click
  to make one.
- **Soul Shards**: says when you're down to a few (3 by default).
- **Travel**: press Escape, and beside the game menu you get Ritual of Summoning, Unending Breath
  and your Hearthstone.
- **Buff key** (Extras page): out of combat, each press casts the next thing a card asks for.
- **Well-Rested and Well Fed** timers, plain-word explanations in tooltips, movable frames
  (`/fel unlock`), three skins (Fel, Blizzard, Flat).

Type `/fel` for the options, `/fel help` for the commands.

## Install

1. Open [Releases](https://github.com/antnsn/Felbound/releases) and download
   `Felbound-<version>.zip` (not the green "Code > Download ZIP" button).
2. Unzip it into `World of Warcraft/_forever_/Interface/AddOns/`, so you get `AddOns/Felbound`.
3. Restart the game. Felbound only loads on warlocks.

## Development

Built on [LibBound](https://github.com/antnsn/LibBound), developed in the folder next to it.

```bash
tools/sync-libbound.sh
for f in *.lua; do luac5.1 -p "$f"; done
~/.luarocks/bin/luacheck .
wowbench check . && wowbench test .
wowbench pack . --set-version 0.1.0
python3 tools/make_media.py
```

## License

GPL-3.0-or-later: GNU General Public License, version 3 or (at your option) any later
version; see [LICENSE](LICENSE). LibBound-1.0 (in `Libs/LibBound`) is MIT, see its own LICENSE.
