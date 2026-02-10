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

copy_dir() {
    local name="$1"
    local dest="$CLAUDE_HOME/$name"
    if [[ -d "$dest" ]]; then
        echo -e "\nBacking up existing $dest"
        mv "$dest" "$dest-$(date '+%Y-%m-%d-%H-%M-%S').old"
    fi
    echo "Copy $name to $CLAUDE_HOME"
    cp -R "$name" "$CLAUDE_HOME"
    
    if command -v tree &> /dev/null; then
        tree $dest
    fi
}

copy_dir skills
copy_dir agents