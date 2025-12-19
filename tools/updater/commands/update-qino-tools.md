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

### Step 2: Check Versions (Local vs Remote)

For each tool in the manifest:

1. **Check local version** — look for `.claude/references/{tool-name}/version.json`
   - If exists, read the `version` field
   - If doesn't exist, tool isn't installed

2. **Check remote version** — fetch from GitHub:
   ```bash
   curl -sL "https://raw.githubusercontent.com/qinolabs/qino-claude/main/tools/{tool-name}/references/{tool-name}/version.json"
   ```
   Parse the `version` field from the response.

3. **Compare** — determine which tools need updating:
   - Not installed → skip (unless user wants to install)
   - Installed, same version → skip
   - Installed, different version → needs update

Report to user:
```
Checking versions...

  design-adventure: 0.5.2 (up to date)
  design-sprint: not installed
  qino-concept: 0.11.0 (up to date)
  qino-scribe: 0.13.4 → 0.14.0 (update available)
  qino-attune: 0.13.0 (up to date)
  qino-dev: 0.9.0 (up to date)

1 tool has updates available.
```

Note: Tools use bundle-aligned versioning — each tool's version matches the bundle release where it was last significantly changed.

If no tools need updating, report "All tools up to date." and stop.

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

**Only process tools that need updating** (identified in Step 2).

For each tool that needs updating:

1. **Create directories** — extract unique directory paths from the tool's `dest` values:
   ```bash
   mkdir -p .claude/commands/core
   mkdir -p .claude/references/dev-assistant/instructions
   # etc. — only for this tool's files
   ```

2. **Fetch files** — download all files for this tool:
   ```bash
   BASE_URL="https://raw.githubusercontent.com/qinolabs/qino-claude/main"

   # For each file entry in this tool's manifest:
   curl -sL "$BASE_URL/{src}" -o .claude/{dest}
   ```

Example: if only `qino-scribe` needs updating, only fetch its 7 files — not all 40+ files across all tools.

### Step 6: Report Results

Report only the tools that were updated:

```
Update complete:
  qino-scribe: 0.13.4 → 0.14.0 (9 files)

9 files updated.
```

Tools that were already up to date are not mentioned (they weren't touched).

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
