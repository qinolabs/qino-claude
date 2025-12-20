---
description: Update qino-claude tools from GitHub to latest versions
---

# Update Tools

Update all qino-claude tools to their latest versions from GitHub (or from a local checkout in dev mode).

## Process

Follow these steps in order:

### Step 0: Check for Dev Mode

Check `.claude/qino-config.json` for a `toolsLink` field:

```bash
cat .claude/qino-config.json 2>/dev/null
```

**If `toolsLink` exists and contains a valid path:**
1. Store the path as `DEV_SOURCE` (resolve relative paths from project root)
2. Verify `$DEV_SOURCE/tools/manifest.json` exists
3. Report: `Dev mode: sourcing from [path]`
4. For ALL subsequent steps, use **local mode** commands (with `cp` and `cat`) instead of **normal mode** (with `curl`)

**If `toolsLink` is absent or null:**
- Use **normal mode** (fetch from GitHub with `curl`)

### Step 1: Get Manifest

Get the tools manifest to discover available tools and files:

**Local mode:**
```bash
cat $DEV_SOURCE/tools/manifest.json
```

**Normal mode:**
```bash
curl -sL "https://raw.githubusercontent.com/qinolabs/qino-claude/main/tools/manifest.json"
```

Parse the JSON to get:
- List of tool names (keys under `tools`)
- For each tool: description, files array, and archived status
- Each file has `src` (path in repo) and `dest` (path in `.claude/`)

**Skip archived tools** — tools with `"archived": true` should be excluded from version checking and updating. They remain in the manifest for reference but are not actively maintained.

### Step 2: Check Versions (Local vs Remote)

**In dev mode, skip version checking entirely** — proceed directly to Step 5 and copy all files. Dev mode is for testing local changes; version comparison isn't meaningful.

**In normal mode**, for each tool in the manifest:

1. **Check local version** — look for `.claude/references/{tool-name}/version.json`
   - If exists, read the `version` field
   - If doesn't exist, tool isn't installed

2. **Check remote version:**
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
  qino-concept: 0.11.0 (up to date)
  qino-scribe: 0.13.4 → 0.14.0 (update available)
  qino-dev: 0.9.0 (up to date)

1 tool has updates available.
```

Note: Tools use bundle-aligned versioning — each tool's version matches the bundle release where it was last significantly changed.

If no tools need updating, report "All tools up to date." and stop.

### Step 3: Get Migrations

Get the migrations file to check for breaking changes:

**Local mode:**
```bash
cat $DEV_SOURCE/tools/updater/migrations.md
```

**Normal mode:**
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

**In dev mode**: process all non-archived tools (copy everything).

**In normal mode**: only process tools that need updating (identified in Step 2).

For each tool to update:

1. **Create directories** — extract unique directory paths from the tool's `dest` values:
   ```bash
   mkdir -p .claude/commands/core
   mkdir -p .claude/references/dev-assistant/instructions
   # etc. — only for this tool's files
   ```

2. **Get files** — copy or download all files for this tool:

   **Local mode:**
   ```bash
   # For each file entry in this tool's manifest:
   cp $DEV_SOURCE/{src} .claude/{dest}
   ```

   **Normal mode:**
   ```bash
   BASE_URL="https://raw.githubusercontent.com/qinolabs/qino-claude/main"

   # For each file entry in this tool's manifest:
   curl -sL "$BASE_URL/{src}" -o .claude/{dest}
   ```

3. **In dev mode only — mark versions as dev:**

   After copying files, modify each tool's version.json to append `-dev` suffix:

   For each `.claude/references/{tool-name}/version.json`:
   - Read the file
   - Change `"version": "X.Y.Z"` to `"version": "X.Y.Z-dev"`
   - Write it back

   This ensures artifacts produced during development correctly reflect they came from unreleased code.

Example: if only `qino-scribe` needs updating, only fetch its 7 files — not all 40+ files across all tools.

### Step 6: Report Results

**In dev mode:**
```
Dev sync complete:
  design-adventure: 0.12.0-dev (6 files)
  qino-concept: 0.12.0-dev (9 files)
  qino-scribe: 0.12.0-dev (10 files)
  ...

45 files synced from local checkout.
```

**In normal mode:**
```
Update complete:
  qino-scribe: 0.13.4 → 0.14.0 (9 files)

9 files updated.
```

In normal mode, tools that were already up to date are not mentioned.

If there were USER ACTION items from migrations, remind the user:

```
Reminder - manual action needed:
  - Update concept files: change 'start_command' to 'home_command'
```

**Always include this note:**

```
Note: The updated commands will be available when you start a new conversation.
```

## Dev Mode

To source tools from a local checkout instead of GitHub, add `toolsLink` to your `.claude/qino-config.json`:

```json
{
  "repoType": "concept",
  "toolsLink": "../qino-claude"
}
```

Remove or set to `null` to return to normal (GitHub) mode:

```json
{
  "repoType": "concept",
  "toolsLink": null
}
```

This is useful for testing tool changes before pushing/releasing.

## Notes

- Tools and files are discovered dynamically from the manifest
- In normal mode, files are fetched from the `main` branch of qinolabs/qino-claude
- In dev mode, files are copied from your local checkout
- Project-specific files (guides, concepts, generated commands) are not affected
- Requires `curl` for normal mode (available by default on macOS and most Linux)
