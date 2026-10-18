# Seasonal reset setup

The bundled `scripts/reset-world.sh` is a **manual, guarded reset tool**, not an active scheduler. It intentionally asks for multiple confirmations and expects the server to have been stopped cleanly first. Do not schedule this interactive script as-is.

Before enabling an automatic 100-real-life-day season:
1. Identify the exact server service name and world folder names (often `world`, `world_nether`, and `world_the_end`, but do not assume).
2. Configure a separate backup directory with enough space.
3. Test the reset against a copied staging server and verify that the new world regenerates with the intended datapacks.
4. Decide whether player inventories, advancements, statistics, and ender chests should reset. Minecraft stores some player state inside world folders, so deleting those folders can wipe it too.
5. Only then add a systemd timer/cron job that stops the correct service cleanly, archives the configured world folders, runs the reset, and starts the service. The timer must persist the last successful reset timestamp and use a 100-day interval; it must not reset repeatedly on every restart.

This repository does not yet contain a server-specific automatic timer because the live service name, world directory paths, and desired player-data policy have not been verified. Guessing those values could erase the wrong data.
