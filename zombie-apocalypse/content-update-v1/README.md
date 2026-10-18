# Content update v1 (no season timer)

This update intentionally excludes any world reset or 100-day timer.

The downloadable bundle produced for this project contains:
- A worldgen datapack based on the supplied fixed-city archive, with wider spacing, larger city exclusion zones, surface heightmap projection, and no broad terrain adaptation.
- A gameplay datapack with automatic thirst drain and a persistent actionbar thirst indicator, plus rare combat-knife, field-rifle, and armoured-vest loot.
- Updated Java and Geyser/Bedrock resource packs with additional UV-compatible recoloured zombie/husk variants and custom item icon assets.
- EliteMobs custom bosses and item definitions.

## Known limitations
- Vanilla Java does not permit a datapack to place a custom HUD directly above the hunger bar; this version displays thirst in the actionbar, which is compatible with Geyser clients.
- Terrain projection cannot guarantee that every block of a large schematic fits all slopes and shorelines. Test new chunks and adjust templates/foundations where needed.
- Custom Bedrock item icons need explicit Geyser custom-item mappings to appear as the corresponding Java custom item models.
- The supplied archive did not include the tool-leveling plugin JAR or version. Compatibility work requires the exact plugin name/version and API/config details.
- The changes have not been live-tested; install on a staging copy first.
