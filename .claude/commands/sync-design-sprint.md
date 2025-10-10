---
description: Sync design-sprint tool files from malao-apps development repository
---

# Sync Design Sprint

Pulls the latest version of design-sprint tool files from the malao-apps repository where active development happens.

## What It Does

Copies the current state of design-sprint files from:
- `/Users/philhradecs/Code/malao/malao-apps/.claude/commands/design-sprint.md`
- `/Users/philhradecs/Code/malao/malao-apps/.claude/agents/design-sprint.md`

To this repository:
- `tools/design-sprint/commands/design-sprint.md`
- `tools/design-sprint/agents/design-sprint.md`

## When to Use

Run this after making improvements to the design-sprint system while working on real projects in malao-apps.

## Process

1. Copy command file from malao-apps
2. Copy agent file from malao-apps
3. Verify files were updated successfully
4. Report what changed (if possible to detect)

## Execution

```bash
# Copy latest command file
cp /Users/philhradecs/Code/malao/malao-apps/.claude/commands/design-sprint.md \
   /Users/philhradecs/Code/qinolabs/qino-claude/tools/design-sprint/commands/design-sprint.md

# Copy latest agent file
cp /Users/philhradecs/Code/malao/malao-apps/.claude/agents/design-sprint.md \
   /Users/philhradecs/Code/qinolabs/qino-claude/tools/design-sprint/agents/design-sprint.md

# Verify updates
head -15 /Users/philhradecs/Code/qinolabs/qino-claude/tools/design-sprint/commands/design-sprint.md
```

After execution, confirm to user that files have been synced.