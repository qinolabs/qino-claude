---
description: Update qino-claude tools from GitHub to latest versions
---

# Update Tools

Update all qino-claude tools to their latest versions from GitHub.

## Process

Follow these steps in order:

### Step 1: Fetch Manifest

First, fetch the tools manifest to discover available tools and files:

```bash
curl -sL "https://raw.githubusercontent.com/qinolabs/qino-claude/main/tools/manifest.json"
```

Parse the JSON to get:
- List of tool names (keys under `tools`)
- For each tool: description and files array
- Each file has `src` (path in repo) and `dest` (path in `.claude/`)

### Step 2: Check Current Versions

For each tool in the manifest, check if it's installed by looking for its version.json:

`.claude/references/{tool-name}/version.json`

Read the `version` field from each file that exists. If a file doesn't exist, that tool isn't installed.

Report to user:
```
Available tools:
  dev-assistant: 1.5.0 (installed)
  design-sprint: 2.1.0 (installed)
  design-adventure: not installed
  qino-concept: not installed
  qino-scribe: not installed
  updater: 1.0.0 (installed)
```

### Step 3: Fetch Migrations

Fetch the migrations file to check for breaking changes:
```bash
curl -sL "https://raw.githubusercontent.com/qinolabs/qino-claude/main/tools/updater/migrations.md"
```

Parse it to find migrations between installed versions and latest.

### Step 4: Show Migration Actions (if any)

If migrations require actions (deletions, renames, user changes), display them:

```
Migration required (v1.0.0 → v1.1.0):

DELETE (old files to remove):
  - .claude/references/qino-concept/old-spec.md

RENAME (files that moved):
  - .claude/commands/qino/start.md → .claude/commands/qino/home.md

USER ACTION (manual changes needed):
  - Update concept files: change 'start_command' to 'home_command'
```

**Ask user to confirm** before proceeding with deletions and renames.

If confirmed:
- Delete listed files
- Rename listed files (if source exists)

### Step 5: Create Directories and Fetch Files

For each tool in the manifest, create necessary directories and fetch all files.

**Directory creation**: Extract unique directory paths from all `dest` values and create them:
```bash
mkdir -p .claude/commands/core
mkdir -p .claude/commands/qino
mkdir -p .claude/commands/scribe
mkdir -p .claude/agents
mkdir -p .claude/references/dev-assistant/instructions
mkdir -p .claude/references/dev-assistant/templates
mkdir -p .claude/references/dev-assistant/examples
mkdir -p .claude/references/design-sprint
mkdir -p .claude/references/design-adventure
mkdir -p .claude/references/qino-concept
mkdir -p .claude/references/qino-scribe
mkdir -p .claude/references/updater
```

**File fetching**: For each file in each tool, construct the curl command:
```bash
BASE_URL="https://raw.githubusercontent.com/qinolabs/qino-claude/main"

# For each file entry in manifest:
curl -sL "$BASE_URL/{src}" -o .claude/{dest}
```

Example for a file with `src: "tools/dev-assistant/commands/core/project-init.md"` and `dest: "commands/core/project-init.md"`:
```bash
curl -sL "$BASE_URL/tools/dev-assistant/commands/core/project-init.md" -o .claude/commands/core/project-init.md
```

Process all tools from the manifest this way.

### Step 6: Report Results

Count total files fetched from the manifest.

Read the version.json files to get new versions and report:

```
Update complete:
  dev-assistant: 1.5.0 → 1.6.0
  design-sprint: 2.1.0 (unchanged)
  design-adventure: 1.0.0 (new)
  qino-concept: 1.0.0 (new)
  qino-scribe: 0.1.0 (new)
  updater: 1.0.0 (unchanged)

42 files updated.
```

If there were USER ACTION items from migrations, remind the user:

```
Reminder - manual action needed:
  - Update concept files: change 'start_command' to 'home_command'
```

**Always include this note:**

```
Note: The updated commands will be available when you start a new conversation.
```

## Notes

- Tools and files are discovered dynamically from the manifest
- Files are fetched from the `main` branch of qinolabs/qino-claude
- Project-specific files (guides, concepts, generated commands) are not affected
- Requires `curl` (available by default on macOS and most Linux)
