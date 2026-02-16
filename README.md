# Claude Config

This repo capture basic settings files and skills for a local Claude Code instance.

## Global settings

For all users use a `managed-settings.json` in `/etc/claude-code/`.

## User settings

For current settings use `settings.json` in `~/.claude/settings.json`

## Skills

All in the `skills` directory.

Inspiration or partial copy from:

* https://github.com/anthropics/skills/tree/main/skills
* https://github.com/openclaw/openclaw/tree/main/skills
* https://github.com/travisvn/awesome-claude-skills
* https://github.com/trailofbits/skills

## Install

To install choose a location then we clone and symlink:

1. `CLAUDE_SETTINGS_DIR="~/code/"`
2. `git clone git@github.com:claudesettings $CLAUDE_SETTINGS_DIR`
3. `ln -s $CLAUDE_SETTINGS_DIR/skills ~/.claude/skills`
4. `ln -s $CLAUDE_SETTINGS_DIR/agents ~/.claude/agents`
5. `ln -s $CLAUDE_SETTINGS_DIR/settings.json ~/.claude/settings.json`

To update run `git pull` and reload claude.

