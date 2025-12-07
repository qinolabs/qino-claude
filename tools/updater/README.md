# Updater

Keep your qino-claude tools up to date with a single command.

---

## What is this?

Once you've installed qino-claude tools in a project, this utility lets you update them to the latest versions from GitHub without manual copying.

Run `/update-qino-tools` and Claude handles the rest — checking versions, applying migrations, and fetching latest files.

---

## Installation

Copy the command file to your project:

```
commands/update-qino-tools.md  →  your-project/.claude/commands/update-qino-tools.md
```

That's it. The `/update-qino-tools` command is now available.

---

## Usage

In Claude Code:

```
/update-qino-tools
```

### What happens

1. **Manifest fetch** — Fetches `manifest.json` from GitHub to discover available tools
2. **Version check** — Reads `version.json` from each tool's references directory
3. **Migration check** — Fetches `migrations.md` from GitHub to find required changes
4. **Confirmation** — If files need to be deleted or renamed, asks for confirmation
5. **Fetch** — Downloads all tool files listed in the manifest
6. **Report** — Shows what changed and any manual actions needed

### Example output

```
Available tools:
  dev-assistant: 1.5.0 (installed)
  design-sprint: 2.1.0 (installed)
  design-adventure: not installed
  qino-concept: not installed
  qino-scribe: not installed
  updater: 1.0.0 (installed)

No migrations required.

Fetching latest files...

Update complete:
  dev-assistant: 1.5.0 → 1.6.0
  design-sprint: 2.1.0 (unchanged)
  design-adventure: 1.0.0 (new)
  qino-concept: 1.0.0 (new)
  qino-scribe: 0.1.0 (new)
  updater: 1.0.0 (unchanged)

40 files updated.
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

The command dynamically fetches all files listed in `manifest.json`. Current structure:

```
.claude/
  commands/
    core/                    # dev-assistant commands
    qino/                    # qino-concept commands
    scribe/                  # qino-scribe commands
    design-sprint.md
    design-adventure.md
    update-qino-tools.md
  agents/
    design-sprint.md
    design-adventure.md
    qino-concept-agent.md
    qino-scribe-agent.md
  references/
    dev-assistant/
      version.json
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
    qino-scribe/
      version.json
      chronicle-spec.md
      chapter-format.md
      voice-guide.md
    updater/
      migrations.md
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

## Migrating from previous versions

### From early v0.2.0 builds

The command was renamed from `update-tools` to `update-qino-tools`:

```bash
mv .claude/commands/update-tools.md .claude/commands/update-qino-tools.md
```

---

## Notes

- Updates come from the `main` branch of [qino-claude](https://github.com/qinolabs/qino-claude)
- Tools and files are discovered dynamically from `manifest.json`
- New tools added to the repo are automatically available on next update
- Tool files are overwritten — local changes will be lost
- Project-specific files (guides, concepts, generated commands) are not affected
- Requires `curl` (available by default on macOS and most Linux systems)

---

## Questions?

This tool is part of [qino-claude](https://github.com/qinolabs/qino-claude).
