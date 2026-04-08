---
author: agent
signal: proposal
created: 2026-04-08T03:35:21+02:00
---
## Modernize attune + compare agents; rename `references/dev/` → `references/build/`

Surfaced during the v3.3.0 release while checking whether `plugins/qino/references/dev/version.json` and `plugins/qino/references/attune/version.json` (both still at 3.1.0) needed bumping. Neither did — the reference content was unchanged since 3.1.0, which is the bundle-aligned discipline working correctly. But the investigation exposed two distinct debts worth naming explicitly, with different shapes and different sequencing.

### Debt A — `references/dev/` rename (mechanical)

`dev` → `build` at v3.2.0 renamed the **agent** (`agents/dev.md` → `agents/build.md`) but left the **reference directory** at its old path. The directory still carries live content that the build agent and build workflows depend on — deletion is not an option.

**Callsites for `references/dev/*` in the current codebase** (6 total across 3 files):

| File | Line | Reference |
|---|---|---|
| `plugins/qino/agents/build.md` | 96 | `references/dev/repo-conventions.md` |
| `plugins/qino/agents/build.md` | 111 | `references/dev/repo-conventions.md` |
| `plugins/qino/agents/build.md` | 117 | `references/dev/repo-conventions.md` |
| `plugins/qino/skills/qino/workflows/new-app.md` | 8–10, 194 | `references/dev/{repo-conventions,home-pattern,template-guidance}.md` |
| `plugins/qino/skills/qino/workflows/iteration.md` | 8–10, 258 | `references/dev/{repo-conventions,home-pattern,template-guidance,drift-signals}.md` |

Files inside `references/dev/`: `drift-signals.md`, `home-pattern.md`, `repo-conventions.md`, `template-guidance.md`, `templates/`, `version.json`. All are load-bearing for build work — none are residue from the retired `dev` agent persona.

**Proposed move**: `git mv plugins/qino/references/dev plugins/qino/references/build`, then update the 6 callsites with a single `sed`/`grep` pass. The `version.json` stays at `3.1.0` because the content hasn't actually changed — the rename is a path cleanup, not new material. Bundle-aligned versioning holds.

**Scope discipline**: this is a pure mechanical rename. It doesn't need to wait on Debt B (the attune/compare design work). It could land as a small follow-up commit — `"Rename references/dev/ → references/build/ to match agent rename"` — with no changelog entry, since no user-visible behavior changes.

### Debt B — Attune and Compare modernization (design work)

The [Compare/Attune section in README](../../../README.md#deep-work--compare-and-attune-paused-pending-graph-native-redesign) is marked `(paused, pending graph-native redesign)`. The `references/attune/` directory still contains two files — `calibrate-process.md` and `compare-session.md` — both predating the protocol/graph architecture. They describe attune and compare as file-based facilitation flows, not as operations against nodes and their neighborhoods.

The earlier annotation [`004-standalone-attune-agent-had-stance-th.md`](./004-standalone-attune-agent-had-stance-th.md) flagged an important loss from the v3.2.0 decomposition: the standalone `qino-attune-agent.md` (commit `9f9fa2b`) carried a **stance** — *"you might be wrong, the human might see something you missed"* — that dissolved when attune was flattened into concept agent + workflow + references. When attune is revisited, that stance needs to be recovered from `9f9fa2b`, not reconstructed from scratch.

The graph-native shape described in the current README:

> **Compare** places two nodes' neighborhoods side by side (not just content, but edges, annotations, recent activity), and lets you perceive difference across the full context, not just the text.
>
> **Attune** pulls candidates from across the workspace to calibrate qualities like what makes a good edge context sentence or what distinguishes a living node from a dead one.

Both operate on the **graph**, not on plain files. The existing `references/attune/*.md` content describes the former shape and would need to be substantially rewritten (not translated).

**Scope**: this is genuine design work, not mechanical cleanup. It properly belongs in qino-concepts territory — exploring what compare and attune *are* in a graph-native ecology — before landing in qino-claude as agent personas + references.

**Likely shape when it lands**:
- **Compare**: a new agent (or an extension of the os agent) that reads two nodes, surfaces their neighborhoods side by side, and asks parallel-mirror questions about structural equivalents. Uses `read_node` / `read_graph` / connected signals — no new MCP tools needed.
- **Attune**: a new agent that pulls calibration candidates via `search_nodes` (possibly filtered by a quality signal), runs the iterative calibration loop, and saves the resulting distinctions as a content file on a `quality` node. The stance from `9f9fa2b` gets re-injected here.
- **`references/attune/` content**: fully rewritten, not migrated. The existing `calibrate-process.md` and `compare-session.md` files become historical residue — kept for reference or composted.

### Sequencing

Debt A (rename) can land any time — it's path cleanup with no design weight. It should NOT wait on Debt B.

Debt B (modernization) needs concept-level exploration first. A qino-concepts node for `compare-and-attune-graph-native` would be the appropriate starting point, with the investigation feeding back into a future qino-claude iteration that lands agents + references together. Don't start the plugin-level work until the concept exploration has produced a shape.

### What this proposal does NOT include

- No proposal to retire the `references/attune/` directory now. The files are stale for the graph-native future but they remain the closest existing description of what attune and compare *do* — wait for replacement material before removing them.
- No plugin version bump speculation. Whatever Debt A or B eventually ships, the plugin version bumps naturally according to bundle-aligned versioning.
- No concept-level design sketch. That belongs in qino-concepts, not in this annotation.
