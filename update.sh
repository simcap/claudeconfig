#!/usr/bin/env bash
set -euo pipefail

GLOBAL_SETTINGS_DIR="/etc/claude"
GLOBAL_SETTINGS_NAME="managed-settings.json"
GLOBAL_SETTINGS_FILE="$GLOBAL_SETTINGS_DIR/$GLOBAL_SETTINGS_NAME"

sudo mkdir -p $GLOBAL_SETTINGS_DIR

if [[ -f "$GLOBAL_SETTINGS_FILE" ]]; then
    echo "Backing up existing $GLOBAL_SETTINGS_FILE"
    sudo mv $GLOBAL_SETTINGS_FILE $GLOBAL_SETTINGS_FILE-$(date '+%Y-%m-%d-%H-%M-%S').old
fi

echo "Copy over latest $GLOBAL_SETTINGS_NAME file"
sudo cp $GLOBAL_SETTINGS_NAME $GLOBAL_SETTINGS_DIR

CLAUDE_HOME="$HOME/.claude"
GLOBAL_SKILLS_DIR="$CLAUDE_HOME/skills"

if [[ -d "$GLOBAL_SKILLS_DIR" ]]; then
    echo "Backing up existing skills $GLOBAL_SKILLS_DIR"
    sudo mv $GLOBAL_SKILLS_DIR $GLOBAL_SKILLS_DIR-$(date '+%Y-%m-%d-%H-%M-%S').old
fi

echo "Copy skills to $CLAUDE_HOME"
cp -R skills "$CLAUDE_HOME"

if command -v tree; then
    tree $GLOBAL_SKILLS_DIR
fi