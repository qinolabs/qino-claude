---
description: Check for drift between files, manifest, and READMEs
allowed-tools: Read, Glob, Bash
argument-hint: "[tool-name?]"
---

# Verify

Detect drift between actual files, the manifest, and README documentation.

---

## Task

Before releases or when something feels off, verify that:
1. All command files are registered in the manifest
2. All manifest entries point to files that exist
3. All commands are documented in their tool's README
4. All tools have version.json files

---

## Flow

### 1. Determine Scope

If argument provided:
- Verify only that tool

If no argument:
- Verify all non-archived tools in `tools/`

Get list of tools to verify:
```bash
ls -d tools/*/ | grep -v archived | xargs -n1 basename
```

### 2. Check Manifest Drift

Run the sync-manifest script in dry-run mode:
```bash
./scripts/sync-manifest.sh
```

Capture output. Parse for:
- Lines starting with `+` → files missing from manifest
- Lines starting with `-` → manifest entries pointing to missing files

### 3. Check README Coverage

For each tool:

**3a. List actual command files:**
```bash
find tools/{tool}/commands -name "*.md" -type f
```

Extract command names from paths.

**3b. Parse README commands table:**

Read `tools/{tool}/README.md`.

Find the Commands table section.

Extract command names from table rows (pattern: `| \`/namespace:name\` |`).

**3c. Compare:**
- Commands in files but not in README → "missing from README"
- Commands in README but no file → "stale README entry"

### 4. Check Version Files

For each tool:
- Check if `tools/{tool}/references/{tool}/version.json` exists
- If missing, flag it

### 5. Generate Report

Format results clearly:

```
## Manifest Drift

{tool-name}:
  + {path} (file exists, not in manifest)
  - {path} (in manifest, file missing)

## README Coverage

{tool-name}:
  + /{namespace}:{command} (command exists, not in README)
  - /{namespace}:{command} (in README, file missing)

{tool-name}: ✓ all commands documented

## Version Files

{tool-name}: ✓ version.json exists
{tool-name}: ✗ version.json missing

## Summary

{n} tool(s) need attention.
{or}
All tools verified. No drift detected.
```

### 6. Suggest Fixes

If issues found:

```
To fix manifest drift:
  ./scripts/sync-manifest.sh --write

To add missing README entries:
  /qino-util:add-command {tool} {command}
  (or manually edit tools/{tool}/README.md)
```

---

## Example Output

```
## Manifest Drift

qino-universal:
  + tools/qino-universal/commands/qino/arc.md

qino-research:
  - tools/qino-research/commands/qino-research/experiment.md
  - tools/qino-research/commands/qino-research/graduate.md

## README Coverage

qino-concept: ✓ all commands documented
qino-scribe: ✓ all commands documented
qino-universal: ✓ all commands documented

## Version Files

qino-concept: ✓ version.json exists
qino-research: ✓ version.json exists
qino-scribe: ✓ version.json exists
qino-universal: ✓ version.json exists

## Summary

2 tools need attention.

To fix manifest drift:
  ./scripts/sync-manifest.sh --write
```

---

## Do NOT:

- Make any changes — this is read-only verification
- Check archived tools (they're frozen)
- Fail silently — always report what was checked
- Skip the summary — users need a clear status
