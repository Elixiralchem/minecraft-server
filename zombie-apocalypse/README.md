# Zombie Apocalypse — EliteMobs content pack

Target baseline: **EliteMobs 10.9.1 / Minecraft 1.21.4** (the versions found in the supplied server bundle).

This is an additive configuration pack for the existing server. It does not replace the existing datapacks, Java resource pack, Bedrock/Geyser pack, or EliteMobs configuration wholesale.

## Contents

- Four custom zombie-apocalypse bosses: **The Living Dead**, **The Screamer**, **The Brute**, and **The Plague Carrier**.
- Four custom survival items: **Scrap Cleaver**, **Ranger's Carbine** (represented by a crossbow), **Reinforced Field Vest**, and **Antibiotic Dose** (a named potion).
- A cautious installation guide and admin smoke-test commands.

## Install

1. Back up the live server's `plugins/EliteMobs/` directory.
2. Copy the YAML files from `EliteMobs/custombosses/` into the matching folder in the live `plugins/EliteMobs/custombosses/`.
3. Copy the YAML files from `EliteMobs/customitems/` into the matching folder in `plugins/EliteMobs/customitems/`.
4. Do **not** overwrite your existing files with the same name unless you have compared them first. These files use new names to avoid collisions.
5. Restart the server (preferred for a first install) and inspect the console for EliteMobs YAML/config errors.

## Test

Use the EliteMobs commands supported by your installed build; common commands are:

- `/em reload` — reload EliteMobs configuration if supported by your build.
- `/em spawncustom The_Living_Dead`
- `/em spawncustom The_Screamer`
- `/em spawncustom The_Brute`
- `/em spawncustom The_Plague_Carrier`

If your build's custom-boss command syntax differs, use `/em help` and the in-game tab completion. These boss files are defined as custom bosses; this pack does **not** silently add them to natural spawning.

## Important compatibility notes

- Bosses are summonable encounters so you can tune difficulty before enabling world-wide spawning.
- Item YAMLs define EliteMobs items, not custom 3D models. The names and lore will work without adding new model assets; custom icons/models require matching Java resource-pack models and Bedrock/Geyser mappings.
- EliteMobs is not a general tool-leveling plugin. This pack adds combat/loot progression through EliteMobs. It does not claim to implement tool XP/levels.
- This pack has not been live-tested on your server. Test on a staging copy before production.
