---
description: Update qino-claude tools from GitHub to latest versions
---

# Update Tools

Update all qino-claude tools to their latest versions from GitHub (or from a local checkout in dev mode).

## Process

### Step 1: Check for Dev Mode

Check `.claude/qino-config.json` for a `toolsLink` field:

```bash
cat .claude/qino-config.json 2>/dev/null
```

**If `toolsLink` exists and contains a valid path:**
- Store the path as `DEV_SOURCE` (resolve relative paths from project root)
- Verify `$DEV_SOURCE/tools/manifest.json` exists
- Report: `Dev mode detected: sourcing from [path]`

**If `toolsLink` is absent or null:**
- Use normal mode (fetch from GitHub)

### Step 2: Ensure Script Exists

The sync script should be at `.claude/scripts/sync-qino-tools.sh`. If it doesn't exist, bootstrap it:

**In dev mode:**
```bash
mkdir -p .claude/scripts
cp "$DEV_SOURCE/tools/updater/scripts/sync-qino-tools.sh" .claude/scripts/
chmod +x .claude/scripts/sync-qino-tools.sh
```

**In normal mode:**
```bash
mkdir -p .claude/scripts
curl -sL "https://raw.githubusercontent.com/qinolabs/qino-claude/main/tools/updater/scripts/sync-qino-tools.sh" -o .claude/scripts/sync-qino-tools.sh
chmod +x .claude/scripts/sync-qino-tools.sh
```

### Step 3: Run Sync Script

**In dev mode:**
```bash
.claude/scripts/sync-qino-tools.sh --dev "$DEV_SOURCE"
```

**In normal mode:**
```bash
.claude/scripts/sync-qino-tools.sh
```

The script handles:
- Fetching the manifest
- Comparing versions (skipped in dev mode)
- Creating directories
- Copying/downloading files
- Marking versions with `-dev` suffix (dev mode only)
- Reporting results

### Step 4: Check for Migrations

After the script completes, check for migrations between old and new versions:

**In dev mode:** Skip migrations (dev mode is for testing)

**In normal mode:**
```bash
cat .claude/references/updater/migrations.md
```

Parse for any required actions between the versions that were just updated. If there are manual actions needed, report them to the user.

## Dev Mode

To source tools from a local checkout instead of GitHub, add `toolsLink` to your `.claude/qino-config.json`:

```json
{
  "repoType": "concept",
  "toolsLink": "../qino-claude"
}
```

Remove or set to `null` to return to normal (GitHub) mode.

## Notes

- Tools and files are discovered dynamically from the manifest
- In normal mode, files are fetched from the `main` branch of qinolabs/qino-claude
- In dev mode, files are copied from your local checkout
- Project-specific files (guides, concepts, generated commands) are not affected
- Requires `curl` and `jq` for the sync script
