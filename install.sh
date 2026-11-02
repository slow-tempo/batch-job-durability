#!/usr/bin/env bash
# Install the batch-job-durability skills.
# Usage: ./install.sh [target-dir]   (default: ~/.agents/skills)
set -euo pipefail
TARGET="${1:-$HOME/.agents/skills}"
for skill in batch-job-durability; do
  mkdir -p "$TARGET/$skill"
  cp "$(dirname "$0")/skills/$skill/SKILL.md" "$TARGET/$skill/SKILL.md"
  echo "installed $skill → $TARGET/$skill"
done
