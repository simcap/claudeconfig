#!/usr/bin/env bash
set -euo pipefail

CLAUDE_HOME="$HOME/.claude"
SETTINGS_NAME="settings.json"
SETTINGS_FILE="$CLAUDE_HOME/$SETTINGS_NAME"

if [[ -f "$SETTINGS_FILE" ]]; then
    echo "Backing up existing user settings $SETTINGS_FILE"
    sudo mv $SETTINGS_FILE $SETTINGS_FILE-$(date '+%Y-%m-%d-%H-%M-%S').old
fi

echo "Copy over latest $SETTINGS_NAME file"
cp $SETTINGS_NAME $CLAUDE_HOME

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