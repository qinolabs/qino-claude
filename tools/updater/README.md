# Updater

Keep your qino-claude tools up to date with a single command.

---

## What is this?

Once you've installed qino-claude tools in a project, this utility lets you update them to the latest versions from GitHub without manual copying.

Run `/update-tools` and Claude handles the rest — checking versions, applying migrations, and fetching latest files.

---

## Installation

Copy the command file to your project:

```
commands/update-tools.md  →  your-project/.claude/commands/update-tools.md
```

That's it. The `/update-tools` command is now available.

---

## Usage

In Claude Code:

```
/update-tools
```

### What happens

1. **Version check** — Reads `version.json` from each tool's references directory
2. **Migration check** — Fetches `migrations.md` from GitHub to find required changes
3. **Confirmation** — If files need to be deleted or renamed, asks for confirmation
4. **Fetch** — Downloads all 32 tool files from GitHub
5. **Report** — Shows what changed and any manual actions needed

### Example output

```
Installed tools:
  dev-assistant: 1.5.0
  design-sprint: 2.1.0
  design-adventure: not installed
  qino-concept: not installed

No migrations required.

Fetching latest files...

Update complete:
  dev-assistant: 1.5.0 → 1.6.0
  design-sprint: 2.1.0 (unchanged)
  design-adventure: 1.0.0 (new)
  qino-concept: 1.0.0 (new)

32 files updated.
```

---

## Handling breaking changes

When tool files are renamed, moved, or deleted between versions, the update command:

1. Shows what needs to change
2. Asks for confirmation before deleting or renaming files
3. Reminds you of any manual actions needed in your project files

Example migration prompt:
```
Migration required (v1.0.0 → v1.1.0):

DELETE (old files to remove):
  - .claude/references/qino-concept/old-spec.md

USER ACTION (manual changes needed):
  - Update concept files: change 'start_command' to 'home_command'

Proceed with deletions? [y/n]
```

---

## What gets updated

The command fetches files to these paths:

```
.claude/
  commands/
    core/                    # dev-assistant commands
    qino/                    # qino-concept commands
    design-sprint.md
    design-adventure.md
  agents/
    design-sprint.md
    design-adventure.md
    qino-concept-agent.md
  references/
    dev-assistant/
      version.json           # version tracking
      instructions/
      templates/
      examples/
    design-sprint/
      version.json
    design-adventure/
      version.json
      personas-spec.md
      output-spec.md
      atmosphere-guide.md
    qino-concept/
      version.json
      concept-spec.md
      manifest-project-spec.md
      design-philosophy.md
      ecosystem-spec.md
      manifest-ecosystem-spec.md
```

---

## Version tracking

Each tool has a `version.json` in its references directory:

```json
{
  "tool": "qino-concept",
  "version": "1.0.0",
  "description": "Gentle space for developing ideas through conversation"
}
```

The update command reads these to determine what's installed and whether migrations apply.

---

## Notes

- Updates come from the `main` branch of [qino-claude](https://github.com/qinolabs/qino-claude)
- Tool files are overwritten — local changes will be lost
- Project-specific files (guides, concepts, generated commands) are not affected
- Requires `curl` (available by default on macOS and most Linux systems)

---

## Questions?

This tool is part of [qino-claude](https://github.com/qinolabs/qino-claude).
