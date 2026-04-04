---
description: Check plugin consistency
allowed-tools: Read, Glob, Bash
argument-hint: "[plugin-name?]"
---

# Verify

Check that plugin files are consistent and properly structured.

---

## Task

Verify that:
1. All plugins have required structure (.claude-plugin/, agents/, references/)
2. All plugins have version.json files
3. READMEs document available commands/skills

---

## Flow

### 1. Determine Scope

If argument provided:
- Verify only that plugin

If no argument:
- Verify all plugins in `plugins/`

```bash
ls -d plugins/*/
```

### 2. Check Plugin Structure

For each plugin, verify:
- `.claude-plugin/plugin.json` exists
- `agents/` directory exists (if plugin uses agents)
- `references/` directory exists

### 3. Check Version Files

For each plugin:
- Check for version.json files in `references/*/`
- Flag if missing

### 4. Check README

For each plugin:
- Verify README.md exists
- Check that documented commands/skills exist as files

### 5. Check Bundled MCP Server

If `plugins/qino/.mcp.json` exists:
- Verify `plugins/qino/servers/dist/server/index.js` exists
- Verify `plugins/qino/servers/dist/ui/index.html` exists and contains `/assets/` (built SPA)
- Report file sizes and modification dates

### 6. Generate Report

```
## Plugin Structure

{plugin}: ✓ valid structure
{plugin}: ✗ missing .claude-plugin/plugin.json

## Version Files

{plugin}: ✓ version.json exists
{plugin}: ✗ version.json missing

## Bundled MCP Server

qino: ✓ server bundle (1.5 MB, 2026-04-04)
qino: ✓ viewer SPA (built, 2026-04-04)
{or}
qino: ✗ server bundle missing — run build:plugin in qinolabs-repo

## Summary

{n} plugin(s) need attention.
{or}
All plugins verified.
```

---

## Do NOT:

- Make any changes — this is read-only verification
- Check archived tools (they're frozen in tools/archived/)
