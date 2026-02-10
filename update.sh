#!/usr/bin/env bash
set -euo pipefail

GLOBAL_SETTINGS_DIR="/etc/claude"
GLOBAL_SETTINGS_NAME="managed-settings.json"
GLOBAL_SETTINGS_FILE="$GLOBAL_SETTINGS_DIR/$GLOBAL_SETTINGS_NAME"

sudo mkdir -p $GLOBAL_SETTINGS_DIR

if [[ -f "$GLOBAL_SETTINGS_FILE" ]]; then
    sudo mv $GLOBAL_SETTINGS_FILE $GLOBAL_SETTINGS_FILE-$(date '+%Y-%m-%d-%H-%M-%S').old
    sudo cp $GLOBAL_SETTINGS_NAME $GLOBAL_SETTINGS_DIR
fi

ln -sf "$(pwd)/skills" ~/.claude/skills