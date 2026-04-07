# 01 — Structural Cleanup and Naming

Safe changes: renaming, removing clearly dead files, updating references.

## Why

The gesture review identified 27 workflows where only 2 earn their place. Before dissolving workflows into agent personas (iteration 02-03), rename the survivors and remove the obviously dead files. This makes subsequent iterations cleaner — they operate on the final names.

## Changes

### Rename workflows

| Current | New | Location |
|---------|-----|----------|
| `workflows/dev-work.md` | `workflows/iteration.md` | `git mv` |
| `workflows/dev-init.md` | `workflows/new-app.md` | `git mv` |

Update internal references within each file (headers, agent references).

### Rename agents

| Current | New | subagent_type |
|---------|-----|---------------|
| `agents/concept.md` | `agents/os.md` | `qino:os` |
| `agents/dev.md` | `agents/build.md` | `qino:build` |

Files to update with new agent names:
- `SKILL.md` — all routing tables, subagent type table, agent references
- `workflows/iteration.md` — agent reference at top
- `workflows/new-app.md` — agent reference at top
- `workflows/deck.md` — agent reference (until converted to reference doc in iter 03)
- Any other workflow that references `concept` or `dev` agent

Also update the Claude Code agent definitions:
- `.claude/agents/` — if there are `qino:concept` or `qino:dev` agent files, rename
- Check `qino-claude/plugins/qino/.claude-plugin/plugin.json` for agent references

### Delete clearly dead files

These are either never used, stale, or absorbed by other tooling:

| File | Reason |
|------|--------|
| `workflows/arc.md` | Arcs never used in practice, absorbed by qino-lingo |
| `workflows/arc-open.md` | Same |
| `workflows/arc-link.md` | Same |
| `workflows/arc-close.md` | Same |
| `workflows/attune.md` | Stale since Jan 14. Defer modernization. |
| `workflows/compare.md` | Stale since Jan 14. Defer modernization. |
| `workflows/import.md` | Agent handles "bring in notes" naturally with create_node |

### Retire research agent

- Remove or archive `agents/research.md`
- Remove `qino:research` from SKILL.md subagent types
- Remove research-specific routing from SKILL.md
- `research-init.md` stays for now (dissolved in iteration 02)

### Respect parallel session work

`workflows/setup.md` and `references/workspaces.md` were created in a parallel session. Do NOT modify or delete them. They represent new onboarding work that survives into the simplified system.

Note: `setup.md` currently creates workspace files manually (graph.json, qino-config.json, nodes/). A future pass should reconcile this with MCP `init_workspace` — setup carries the dialogue, `init_workspace` handles the file creation.

### Update SKILL.md

Minimal update — use new names, remove arc/attune/compare/import references. Keep the current structure; full simplification happens in iteration 03.

## Verification

- `git grep "concept.md\|dev.md\|qino:concept\|qino:dev"` in qino-claude/ — should find zero references to old names
- `git grep "arc-open\|arc-link\|arc-close\|attune\|compare\|import"` in workflows/ — should find zero
- All remaining workflow files reference the correct agent names
- The skill still routes correctly with new names (manual test)
