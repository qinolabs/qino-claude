# 03 — Agent Personas and References

Rewrite the os agent persona. Create reference documents. Simplify SKILL.md to two routing paths.

## Why

After iterations 01-02, all dissolved workflow behaviors need a home. The os agent persona absorbs them. Three reference documents capture the specialized knowledge that workflows carried. And SKILL.md drops from 10 routing tables to 2 paths.

## Changes

### Create reference documents

Extract from workflow files before they're deleted (if not already deleted in iter 02, extract from git history or from the proposal's description).

**`references/deck-actualization.md`**
- Source: `workflows/deck.md`
- Content: Four-part reading format (temporal reorientation, delta narrative, candidate articulations, opening question). Voice guidance (intimate, interpretive, resuming a conversation). Annotation saving (signal: `reading` on the deck node).
- After extraction: delete `workflows/deck.md`

**`references/ecology-lenses.md`**
- Source: `workflows/test.md`
- Content: The 8 ecology lenses. When to apply (during exploration, when the user asks to test or notice). How to present findings (observations, not verdicts).

**`references/experiment-methodology.md`**
- Source: `implementations/experimentation-methodology/content/02-autonomous-iteration-loops.md` + `03-measurement-and-inquiry.md`
- Content: The five-part loop (measure, compare, decide, record, listen). Significance shifts (orienting → tracking → diverging → arriving). The handoff between instruments. Recording metric-question relationships. In-process simulation patterns. Results accumulation (JSONL). Anti-patterns.
- This is general methodology, lives at plugin level in references.

### Retire stale references

- `references/research/arc-spec.md` — arcs retired
- `references/research/research-spec.md` — assess relevance; research inquiry creation is now os agent behavior, experiment methodology has its own reference
- `references/concept/manifest-project-spec.md` — legacy manifest format, no longer used

### Rewrite os agent persona (`agents/os.md`)

The os agent file needs a full rewrite. It should carry:

**Identity**: The qino-os interface. Works with the living graph through MCP tools.

**MCP tool fluency** — the primary capability section:
- `read_activity` for arrival/orientation
- `read_node` for exploration (returns story, content, annotations, connected signals, neighborhood, sub-graph)
- `read_decks` for deck work
- `read_graph` for workspace structure
- `create_node` for captures, concepts, inquiries, findings
- `write_annotation` for signals (reading, connection, tension, proposal)
- `add_edge` for discovered connections
- `search_nodes` for cross-workspace discovery
- `resolve_annotation` for lifecycle management

**Behavioral principles** — absorbed from dissolved workflows:
- On arrival: `read_activity`, respond to what's there. Surface action items. If no workspaces → help orient.
- On exploration: `read_node`, ground your opening in what you found — name the material, tensions, connections. Don't ask a generic question.
- On capture: `create_node(type: "capture")`. Brief. Don't interrogate.
- On deck: `read_decks`, match intent, read members, produce actualization (consult deck-actualization reference).
- On concept creation: brief dialogue to surface the impulse, then `create_node`.
- On inquiry creation: brief dialogue to surface the question, then `create_node(type: "inquiry")`.
- Annotation: always available. Write readings, connections, tensions, proposals as they arise.
- Working modes (expanding, deepening, restructuring, inhabiting) — part of how the agent thinks, not procedures.

**Grounded opening** (replaces generic alive-thread):
- Scoped to facilitated concept exploration, not dev work or day-to-day coding
- Ground in what `read_node` returned — name specific material, tensions, connections
- Enable variation: this is a principle, not a script

**Voice**: Don't push. Receive. 1-2 grounded suggestions. No metrics, no progress bars, no hollow encouragement.

**References**: deck-actualization, ecology-lenses, workspaces (for setup), domain language, design principles.

### Update build agent persona (`agents/build.md`)

Add:
- Experiment methodology reference awareness
- Bug filing: `create_node(type: "finding")` with `sparked-by` edge
- The listening step: surface "does this metric still address the question?"
- Significance phase awareness (orienting → tracking → diverging → arriving)

Rename internal references from "dev" to "build" if not done in iter 01.

### Simplify SKILL.md

Replace the entire routing system with:

```markdown
## Routing

Three paths:

### Build intent → spawn build agent

Signals: "build", "implement", "what's next for [app]", "continue [app]", 
"plan iteration", "next steps", "work on [app]", any app name with action intent.

Spawn `qino:build` with the appropriate workflow:
- New app from concept → `workflows/new-app.md`
- Everything else → `workflows/iteration.md`

### Setup intent → os agent with setup workflow

Signals: "/qino setup", "set up qino", "initialize workspace", 
or no workspace context + clear setup intent.

Os agent reads `workflows/setup.md` and `references/workspaces.md`, 
then facilitates the conversational onboarding.

### Everything else → os agent (inject mode)

The os agent handles arrival, exploration, deck reading, capture, 
concept creation, inquiry creation, ecology testing, annotation, 
and orientation — all through MCP tools and persona principles.

No workflow file needed. The agent reads the graph and responds.
```

Remove:
- All routing tables (concept work, arc work, research, deck, bug, implementation, orientation, lab)
- Execution mode table
- Subagent type table (reduce to 2 entries: `qino:os`, `qino:build`)
- Protocol detection step (everything is protocol)
- Ecosystem concept detection (os agent handles via node type awareness)
- Navigator signals (retired)
- Lab mode signals (dissolved)
- Bug signals (build agent handles)

Keep:
- Context detection (read qino-config.json)
- Momentum detection (pass to agent)
- Inject vs spawn explanation (os = inject, build = spawn)

## Verification

- Three new reference files exist in `references/`
- `agents/os.md` carries all dissolved workflow behaviors
- `agents/build.md` has experiment methodology
- SKILL.md is short — context detection, two routing paths, momentum
- `workflows/` contains only `iteration.md` and `new-app.md`
- No remaining references to deleted workflows, old agent names, or legacy concepts
