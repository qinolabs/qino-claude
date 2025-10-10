---
description: Sync dev-assistant tool files from malao-apps development repository
---

# Sync Dev Assistant

Pulls the latest version of dev-assistant (formerly story-driven-dev) tool files from the malao-apps repository where active development happens.

## What It Does

Copies the current state of dev-assistant files from malao-apps to this repository.

**Core Commands:**
- `/Users/philhradecs/Code/malao/malao-apps/.claude/commands/core/project-init.md`
- `/Users/philhradecs/Code/malao/malao-apps/.claude/commands/core/iteration-plan.md`
- `/Users/philhradecs/Code/malao/malao-apps/.claude/commands/core/update-commands.md`

**Instructions:**
- `/Users/philhradecs/Code/malao/malao-apps/.claude/instructions/exploration-behavior.md`

**Templates:**
- `/Users/philhradecs/Code/malao/malao-apps/.claude/templates/exploration-process.md`
- `/Users/philhradecs/Code/malao/malao-apps/.claude/templates/commands-template.md`
- `/Users/philhradecs/Code/malao/malao-apps/.claude/templates/guide-template.md`
- `/Users/philhradecs/Code/malao/malao-apps/.claude/templates/intelligence-library.md`
- `/Users/philhradecs/Code/malao/malao-apps/.claude/templates/iteration-framework-template.md`

To this repository:
- `tools/dev-assistant/commands/core/`
- `tools/dev-assistant/instructions/`
- `tools/dev-assistant/templates/`

## When to Use

Run this after making improvements to the dev-assistant system while working on real projects in malao-apps.

## Process

1. Copy all core command files
2. Copy instruction files
3. Copy template files
4. Verify files were updated successfully
5. Report what changed

## Execution

```bash
# Core commands
cp /Users/philhradecs/Code/malao/malao-apps/.claude/commands/core/project-init.md \
   /Users/philhradecs/Code/qinolabs/qino-claude/tools/dev-assistant/commands/core/project-init.md

cp /Users/philhradecs/Code/malao/malao-apps/.claude/commands/core/iteration-plan.md \
   /Users/philhradecs/Code/qinolabs/qino-claude/tools/dev-assistant/commands/core/iteration-plan.md

cp /Users/philhradecs/Code/malao/malao-apps/.claude/commands/core/update-commands.md \
   /Users/philhradecs/Code/qinolabs/qino-claude/tools/dev-assistant/commands/core/update-commands.md

# Instructions
cp /Users/philhradecs/Code/malao/malao-apps/.claude/instructions/exploration-behavior.md \
   /Users/philhradecs/Code/qinolabs/qino-claude/tools/dev-assistant/instructions/exploration-behavior.md

# Templates
cp /Users/philhradecs/Code/malao/malao-apps/.claude/templates/exploration-process.md \
   /Users/philhradecs/Code/qinolabs/qino-claude/tools/dev-assistant/templates/exploration-process.md

cp /Users/philhradecs/Code/malao/malao-apps/.claude/templates/commands-template.md \
   /Users/philhradecs/Code/qinolabs/qino-claude/tools/dev-assistant/templates/commands-template.md

cp /Users/philhradecs/Code/malao/malao-apps/.claude/templates/guide-template.md \
   /Users/philhradecs/Code/qinolabs/qino-claude/tools/dev-assistant/templates/guide-template.md

cp /Users/philhradecs/Code/malao/malao-apps/.claude/templates/intelligence-library.md \
   /Users/philhradecs/Code/qinolabs/qino-claude/tools/dev-assistant/templates/intelligence-library.md

cp /Users/philhradecs/Code/malao/malao-apps/.claude/templates/iteration-framework-template.md \
   /Users/philhradecs/Code/qinolabs/qino-claude/tools/dev-assistant/templates/iteration-framework-template.md

# Verify
echo "✓ Core commands synced (3 files)"
echo "✓ Instructions synced (1 file)"
echo "✓ Templates synced (5 files)"
```

After execution, confirm to user that all files have been synced successfully.
