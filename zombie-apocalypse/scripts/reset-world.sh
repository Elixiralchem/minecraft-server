#!/usr/bin/env bash
# Guarded seasonal reset helper for a Java server with Geyser/Floodgate.
# Configure WORLD_DIRS and BACKUP_DIR before enabling any scheduler.
# This script only resets configured world directories; it deliberately preserves
# plugins/, playerdata outside the world directories, and resource packs.
set -Eeuo pipefail
umask 077

: "${BACKUP_DIR:?Set BACKUP_DIR to a directory with enough free space}"
: "${WORLD_DIRS:?Set WORLD_DIRS to a space-separated list of world directories}"
: "${RESET_CONFIRM:?Set RESET_CONFIRM=YES_I_HAVE_BACKED_UP_AND_TESTED to proceed}"

if [[ "$RESET_CONFIRM" != "YES_I_HAVE_BACKED_UP_AND_TESTED" ]]; then
  echo "Refusing reset: confirmation token is incorrect." >&2
  exit 2
fi
if [[ "$EUID" -eq 0 ]]; then
  echo "Refusing to run as root. Run as the Minecraft server owner." >&2
  exit 2
fi

read -r -a worlds <<< "$WORLD_DIRS"
if [[ ${#worlds[@]} -eq 0 ]]; then
  echo "No world directories configured." >&2; exit 2
fi

stamp="$(date -u +%Y%m%dT%H%M%SZ)"
mkdir -p "$BACKUP_DIR"
backup="$BACKUP_DIR/world-reset-$stamp.tar.gz"

for world in "${worlds[@]}"; do
  [[ -n "$world" ]] || continue
  [[ -d "$world" ]] || { echo "Missing world directory: $world" >&2; exit 2; }
  case "$(realpath "$world")/" in
    "$(realpath "$BACKUP_DIR")/"*) echo "World directory must not be inside the backup directory." >&2; exit 2 ;;
  esac
done

echo "Worlds to archive and reset:"
printf ' - %s\n' "${worlds[@]}"
echo "Backup: $backup"
echo "This permanently replaces the configured world folders after a verified archive."
read -r -p 'Type RESET_NOW to continue: ' answer
[[ "$answer" == "RESET_NOW" ]] || { echo "Cancelled."; exit 0; }

# Server must already be stopped cleanly by the operator/service manager.
tar -czf "$backup" -- "${worlds[@]}"
tar -tzf "$backup" >/dev/null
echo "Backup archive verified."

for world in "${worlds[@]}"; do
  rm -rf -- "$world"
done
echo "World folders removed. Start the server to generate fresh terrain."
echo "Backup retained at: $backup"
