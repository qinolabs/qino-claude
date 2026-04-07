# Gesture System Modernization — Proposal Draft

Outcome of the gesture review session (2026-04-06). Grounded in qino-os MCP features, the autonomous iteration loops document, and the trust-the-ecosystem design principle.

**Core thesis**: Many workflows reimplemented in procedural steps what the MCP server now provides as structural features. The fewer routing decisions the skill makes, the clearer and more reliable the system becomes.

### Naming

| Thing | Name | Why |
|-------|------|-----|
| Skill | `qino` | Entry point for all ecosystem work |
| Agent: graph + practice | `os` | It IS the qino-os interface — reads activity, explores nodes, writes annotations, creates captures |
| Agent: building | `build` | Implementation, concept translation, experiments |
| Workflow: continue building | `iteration` | Arriving at an app, syncing concept, continuing the build |
| Workflow: new app from concept | `new-app` | Translating concept to technical reality, scaffolding |
| Reference | `deck-actualization` | Four-part reading format (domain language) |
| Reference | `ecology-lenses` | 8 ecology lenses for concept exploration |
| Reference | `experiment-methodology` | Iteration loops + measurement-as-inquiry |

---

## 1. Protocol Change: Captures Become Nodes

**Current**: Captures are flat files at `.qino/captures/`, outside any graph. Separate path resolution, discovery, and composting patterns.

**Proposed**: Captures are graph nodes with `type: "capture"`. Created via `create_node`.

### What changes

- `create_node(type: "capture", story: "the thought")` replaces flat file writes
- Captures are discoverable via `search_nodes`, surface in `read_activity`
- Edges can be added at creation (if the connection is clear) or later
- "Composting" becomes natural — the capture is already in the graph
- No separate path resolution, no `.qino/captures/` convention

### Files to update

- `agents/protocol-structure.md` — remove "Captures" section describing flat files, replace with: "When someone wants to hold a thought, create a capture node. The graph it goes in depends on context — usually the workspace you're currently in."
- `references/protocol/protocol-spec.md` — remove flat-file capture descriptions, keep `capture` as a node type
- Remove capture path resolution from any remaining workflow or agent references

### What to decide

- Do we keep `.qino/captures/` as a legacy fallback (MCP server unavailable), or remove entirely?
- Should the os agent add a `sparked-by` edge when the user mentions a specific node during capture?

---

## 2. Workflow File Changes

### Already done (this session)

**Removed** (8 files):
- `concept-setup.md`, `research-setup.md`, `dev-setup.md` — MCP `init_workspace` replaces
- `workspace-init.md` — MCP `init_workspace` replaces
- `navigate.md` — navigators retired
- Legacy `home.md`, `explore.md`, `capture.md` — protocol versions replaced them

**Moved** (6 files): `protocol/` → top level, directory removed

**Modernized** (2 files): `concept-init.md`, `research-init.md` — now use MCP `create_node`

**Rewrote**: `SKILL.md` — removed legacy/protocol dual-track, all deleted workflows, navigator references

### Proposed: Delete entirely

| File | Reason |
|------|--------|
| `home.md` | `read_activity` IS the arrival surface. Voice principles move to os agent persona. |
| `capture.md` | `create_node(type: "capture")` is the whole operation. |
| `orientation.md` | `read_activity` with empty workspaces → orient naturally. |
| `lab.md` | `write_annotation` IS the lab — annotation is always available, not a mode. |
| `bug.md` | `create_node(type: "finding")` + `sparked-by` edge. Build agent awareness. |
| `test.md` | Ecology lenses are a reasoning reference, not a procedure. |
| `explore.md` | `read_node` provides all data. Working modes are how the os agent thinks. |
| `import.md` | Agent handles "bring in these notes" naturally with `create_node`. |
| `arc.md` | Arcs never used in practice. Absorbed by qino-lingo tooling. |
| `arc-open.md` | Same — arc lifecycle retired. |
| `arc-link.md` | Same. |
| `arc-close.md` | Same. |
| `attune.md` | Stale (last touched Jan 14). Defer modernization. |
| `compare.md` | Stale (last touched Jan 14). Defer modernization. |

### Proposed: Convert to reference document

| Current workflow | Proposed reference | What it carries |
|------------------|--------------------|-----------------|
| `deck.md` | `references/deck-actualization.md` | Four-part reading format (temporal reorientation, delta narrative, candidate articulations, opening question). Voice guidance. Agent consults when producing a deck reading. |
| `test.md` | `references/ecology-lenses.md` | The 8 ecology lenses. Agent consults during exploration when testing is relevant. |

### Proposed: Rename and keep as explicit workflows

| Current | New name | Why it earns its place |
|---------|----------|----------------------|
| `dev-work.md` | `iteration.md` | Genuine multi-source orchestration: implementation node + concept sync + git history + iteration discovery + drift detection + multi-app scoping |
| `dev-init.md` | `new-app.md` | Facilitated concept-to-technical translation. Dialogue process with app scaffolding. |

### What to decide

- `concept-init.md` and `research-init.md` — keep as spawn workflows, or dissolve into os agent persona? They're now just "dialogue → `create_node`". The dialogue phases (surface the impulse, surface the question) are valuable but could be persona behavior.

---

## 3. SKILL.md Simplification

### Current structure (after today's cleanup)

- Context detection (5 steps)
- Momentum detection
- Quick route (7 signal categories)
- 10 routing tables (concept work, arc work, research, deck, bug, implementation, orientation, lab)
- Execution mode table (19 entries)
- Subagent type table (3 entries)

### Proposed structure

```
1. Context detection
   - Read qino-config.json for repoType
   - If no config → first-time arrival, help orient

2. Routing (two paths)
   - Build intent (build, implement, what's next, continue [app]) → spawn build agent
   - Everything else → os agent in inject mode

3. Momentum detection
   - If conversation carries momentum, pass as context to agent
```

That's the whole skill. Two routing paths, no explicit commands.

### What the os agent handles without routing

The os agent in inject mode + MCP tools handles all of:
- Arrival/orientation (`read_activity`)
- Node exploration (`read_node`)
- Deck actualization (`read_decks` + format reference)
- Capture (`create_node` with type "capture")
- Concept creation (`create_node` with dialogue)
- Research inquiry creation (`create_node` with dialogue)
- Ecology testing (consulting lenses reference during exploration)
- Annotation writing (always available, not a mode)

### What the build agent handles

- `iteration.md` (orchestration across implementation + concept + git)
- `new-app.md` (facilitated translation + app scaffolding)
- Experimental iteration loops (from experiment-methodology reference)
- Bug filing as finding nodes
- The listening step and measurement-inquiry discipline

### What to decide

- Does the research agent survive as a separate subagent_type, or fold into build? The research-init dialogue could be os agent behavior. The experiment loop discipline lives with build.
- Does bug filing live with os agent (any context) or build agent (implementation context)?

---

## 4. Agent Persona Restructuring

### OS Agent — the qino-os interface

Replaces: concept agent. Name: `qino:os` (subagent_type).

**MCP tool fluency** (primary capability):
- `read_activity` for arrival/orientation
- `read_node` for exploration
- `read_decks` for deck work
- `read_graph` for workspace structure
- `create_node` for captures, concepts, inquiries
- `write_annotation` for signals (reading, connection, tension, proposal)
- `add_edge` for discovered connections
- `search_nodes` for cross-workspace discovery

**Behavioral principles** (from dissolved workflows):
- On arrival: call `read_activity`, respond to what's there. If action items need attention, surface them. If nothing → help orient.
- On node exploration: call `read_node`, ground your opening in what you actually found — name the material, the tensions, the connections. Don't ask a generic question.
- On capture intent: `create_node(type: "capture")`. Brief. Don't interrogate.
- On deck intent: `read_decks`, match to intent, read members, produce actualization (consult deck-actualization reference).
- On annotation: always available. Write readings, connections, tensions, proposals as they arise. No special mode needed.
- Working modes (expanding, deepening, restructuring, inhabiting) — part of how the agent thinks during exploration, not separate procedures.

**Grounded opening principle**:
- Scoped to facilitated concept exploration only (not dev work, not day-to-day coding)
- Ground in what you actually read: name specific material, tensions, connections from `read_node`
- Enable variation — this is a principle, not a script

**References the agent can consult:**
- Deck actualization format
- Ecology lenses
- Domain language (pointer)
- Design principles (pointer)

### Build Agent — implementation and experimentation

Replaces: dev agent. Name: `qino:build` (subagent_type).

**Workflows:**
- `iteration.md` — continue building (concept sync, iteration discovery, drift detection)
- `new-app.md` — translate concept to technical reality (facilitated dialogue + scaffolding)

**Experimental methodology** (from autonomous-iteration-loops + measurement-and-inquiry):
- The loop: measure, compare, decide, record, listen
- The listening step: "does this metric still address the question we started with?"
- Significance shifts (orienting → tracking → diverging → arriving) — notice the transition
- The handoff: when the experiment "arrives," record it explicitly and transition from building (quantitative) to encounter (qualitative)
- `write_annotation` maps naturally: `reading` for findings, `tension` for metric-question divergence, `proposal` for next instrument needed

**Bug filing:**
- `create_node(type: "finding")` with `sparked-by` edge to the affected app
- Gather context from conversation, fill gaps through brief dialogue

### What to decide

- How much of the os agent persona is in the agent file vs. reference documents? Risk: too much in persona = agent file becomes unwieldy. Risk: too much in references = agent doesn't read them proactively.
- Should MCP tool awareness be in the agent persona or in SKILL.md's context passing?

---

## 5. Reference Documents

### New references to create

| Reference | Source material | Content |
|-----------|----------------|---------|
| `references/deck-actualization.md` | Current `workflows/deck.md` | Four-part reading format, voice guidance, annotation saving |
| `references/ecology-lenses.md` | Current `workflows/test.md` | The 8 ecology lenses, how to apply during exploration |
| `references/experiment-methodology.md` | `02-autonomous-iteration-loops.md` + `03-measurement-and-inquiry.md` | The five-part loop (measure, compare, decide, record, listen). How significance shifts (orienting → tracking → diverging → arriving). The handoff between instruments — when quantitative work creates conditions for qualitative encounter. Recording the relationship between metric and question, not just the number. Anti-patterns. |

### Existing references to keep

- `references/protocol/protocol-spec.md` — protocol data model (to be updated: captures as nodes)
- `references/protocol/protocol.md` — agent operations reference
- `references/concept/` — concept specs
- `references/dev/` — repo conventions, home pattern, template guidance

### Existing references to retire

- `references/research/arc-spec.md` — arcs retired
- `references/research/research-spec.md` — assess whether still relevant after research agent decision

### What to decide

- Does `experiment-methodology.md` live in references (plugin-level) or in implementation docs (repo-level)? The source docs are implementation-specific but the methodology is general.

---

## 6. Implementation Sequence

Proposed order:

1. **Protocol update** — captures as nodes (protocol-spec.md, protocol-structure.md)
2. **Create reference documents** — extract from workflows before removing them (deck-actualization, ecology-lenses, experiment-methodology)
3. **Rename workflows** — dev-work → iteration, dev-init → new-app
4. **Rename agents** — concept → os, dev → build (update agent files, SKILL.md, subagent_type references)
5. **Update os agent persona** — absorb dissolved workflow behaviors, MCP tool fluency
6. **Remove dissolved workflows** — all files listed in "Delete entirely" above
7. **Simplify SKILL.md** — two routing paths (build intent → build agent, everything else → os agent)
8. **Update build agent** — add experiment methodology, confirm scope
9. **Test** — walk through common scenarios to verify the simplified system routes correctly

### What to decide first

- The protocol question: captures as nodes, and whether to keep `.qino/captures/` as fallback
- Whether concept-init and research-init stay as workflows or dissolve
- Whether research agent survives or folds into build

---

## Summary

| Before | After |
|--------|-------|
| 27 workflows | 3 workflows (`iteration.md`, `new-app.md`, `setup.md`) |
| 3 agents (concept, dev, research) | 2 agents (`os`, `build`) |
| 10 routing tables in SKILL.md | 2 routing paths |
| 19-entry execution mode table | Gone |
| Separate modes for home, explore, capture, lab, bug, test, deck, arc, navigate | OS agent handles all via MCP tools |
| Flat file captures outside graph | Capture nodes in graph |
| Legacy/protocol dual-track | Protocol only |
