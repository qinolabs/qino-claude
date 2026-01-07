# qino-util

Development utilities for qino tool authors.

---

## What is this?

When you're building qino tools, there are several files that need to stay in sync: the command file, the manifest, the README, and version files. `qino-util` automates this coordination so you never forget a step.

---

## Commands

| Command | What it does |
|---------|--------------|
| `/qino-util:add-command [tool] [name]` | Guided workflow for adding a new command with optional agent scaffolding. |
| `/qino-util:verify [tool?]` | Check for drift between files, manifest, and READMEs. |

---

## Typical Workflow

### Adding a new command

```
/qino-util:add-command qino-concept new-feature
```

The command will:
1. Scaffold the command file from a template
2. Optionally scaffold an agent file
3. Update the tool's README.md
4. Sync the manifest
5. Offer to bump the version

### Checking for drift

```
/qino-util:verify
```

Run this before releases to catch:
- Commands missing from the manifest
- Manifest entries pointing to non-existent files
- Commands missing from README documentation
- Missing version.json files

---

## Installation

This tool is primarily for use within the qino-claude repository itself. Copy to your `.claude/` directory if needed:

```
commands/qino-util/       →  .claude/commands/qino-util/
references/qino-util/     →  .claude/references/qino-util/
```

---

## Philosophy

Automation over discipline. Rather than relying on memory to update all the right files, we automate the coordination. The verify command serves as a safety net — even if you add commands manually, drift will be caught before it causes problems downstream.
