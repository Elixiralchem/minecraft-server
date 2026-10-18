# Zombie Apocalypse content update v2

This additive update expands the existing content pack with 12 new survival-item textures and loot definitions.

## Added content
- Melee/tools: Emergency Crowbar, Field Hatchet, Sledgehammer, Spiked Baseball Bat, Bolt Cutters, Lockpick Set.
- Ranged weapons: Tactical Shotgun, Compact SMG, Marksman Rifle.
- Survival gear: Wasteland Gas Mask, Field Pack, Medic Satchel.
- Matching Java item model/texture assets and Bedrock texture PNGs are included in the downloadable v2 bundle.

The shotgun, SMG, and marksman rifle use the datapack's ray-hit system and consume one gold nugget per shot. EliteMobs custom item YAMLs provide progression/reward versions of melee tools and crossbow-style ranged rewards. EliteMobs reward variants do not call the datapack firearm functions.

## Install
1. Back up the existing world, datapacks, Java resource pack, Geyser pack, and `plugins/EliteMobs/`.
2. Replace the old `zs` datapack with `zs_gameplay_thirst_gear_v3.zip`; do not install both versions simultaneously.
3. Install the Java pack and merge the Geyser pack as described in the bundle README.
4. Copy the new YAMLs from `EliteMobs/customitems/` into the server's matching EliteMobs customitems directory.
5. Restart or reload according to the installed EliteMobs version, then test loot and weapon behaviour in a staging world.

## Limitations
- Built around the supplied EliteMobs 10.9.1 / Minecraft 1.21.4 baseline; not live-tested.
- Bedrock texture PNGs are included, but explicit Geyser custom-item mappings are still required for Bedrock custom item models.
- Lockpicks, bolt cutters, gas mask, field pack, and medic satchel are themed/cosmetic items; this update does not add lock mechanics, gas exposure, inventory capacity, or new medical systems.
- No real-life season reset timer is included.
