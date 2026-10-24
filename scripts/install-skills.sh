#!/usr/bin/env sh
# Copies the SandHouse skills to ~/.agents/skills, where Codex, Cursor and
# OpenCode all look for them. (Claude Code gets them from the plugin instead;
# pass --claude to copy them to ~/.claude/skills as well.)
#
#   ./scripts/install-skills.sh            # ~/.agents/skills
#   ./scripts/install-skills.sh --claude   # and ~/.claude/skills
set -eu

here=$(cd "$(dirname "$0")/.." && pwd)
from="$here/plugins/sandhouse/skills"

install_to() {
    mkdir -p "$1"
    for skill in "$from"/*/; do
        name=$(basename "$skill")
        rm -rf "${1:?}/$name"
        cp -R "$skill" "$1/$name"
        echo "installed $name -> $1/$name"
    done
}

install_to "$HOME/.agents/skills"
if [ "${1:-}" = "--claude" ]; then
    install_to "$HOME/.claude/skills"
fi
