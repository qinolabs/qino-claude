# Protocol Structure Supplement

Read this alongside `agents/concept.md` or `agents/dev.md` when `protocol: "qino"` is detected in the workspace config.

**For concept workflows:** These sections **replace** the File Structure Awareness, Facets, and Ecosystem Work sections in concept.md — all other principles (alive thread, mirror/echo, momentum, tone, reasoning, draft awareness, core intent) remain unchanged.

**For dev workflows:** The "Dev Structure (Protocol)" section below supplements `agents/dev.md` — replacing legacy path references with protocol equivalents.

**For operational decisions** (when to journal, when to create nodes, when to add edges), consult `references/protocol/protocol.md` — Part 1: Operations.

---

## File Structure Awareness (Protocol)

`graph.json` is your registry. It lists all nodes (with type, status, dir) and edges (with type, context). Use the `dir` field to locate node directories under `nodes/`.

Key behavioral rules:
- Read `graph.json` first for any operation that needs to know what exists
- Each node is a directory: `nodes/<dir>/` containing `node.json`, `story.md`, `content/`
- `story.md` is the impulse — read it to feel the concept's center, not to get a summary
- `content/` holds developed material — file names are descriptive, not rigid
- `annotations/` (if present) holds marginal notes about the content
- `node.json` contains metadata: title, type, status, created, tags, held_threads

## Node Type Awareness

Nodes have types that shape how you engage:

| Type | What it is | How to engage |
|------|-----------|---------------|
| `concept` | A developed idea with impulse, content, possibly facets | Full exploration: alive thread, work modes, sub-graph |
| `ecosystem` | Cross-cutting system-level work | Hold questions longer — distinction-making, not just development |
| `facet` | A navigable aspect of a parent concept | Same depth as concept, but awareness of parent context |
| `arc` | A temporal container tracking emergence | Read for context; arcs accumulate naturally |
| `navigator` | An orientation document for building | Reference for terrain; not actively explored like concepts |

**Ecosystem nodes** follow the same principle as ecosystem work in concept.md: distinction-making that shapes the whole. Hold the diverging movement longer.

## Edge Awareness

Edges in `graph.json` connect nodes with a context sentence that explains why the connection matters.

**Read edges to understand neighborhood:** Which nodes are nearby? What does the context sentence tell you about how they relate to your current work? Follow edges whose context is relevant.

**Create edges when:**
- Exploration reveals a relationship not yet captured
- Cross-concept signals surface during work

**Edge context** is a short sentence — why this relationship exists, and how future agents should understand it. Write a context sentence that helps future agents understand why this connection matters for their work. Don't classify — describe. A good context sentence reads like a note left for someone who will arrive here later: "this node's emergence patterns informed the cycle design here" or "tension between these two approaches shaped the architecture."

## Sub-Graph Navigation

A node that has facets contains its own `graph.json` and `nodes/` directory. This is **recursive** — the same structure at every level.

**Detection**: Check for `graph.json` inside a node directory. If present, this node has a navigable sub-graph.

**Facet count**: Read the sub-graph's `graph.json` → `nodes` array length.

**Offering navigation**: When arriving at a concept with facets, include:
```
[title] has facets:
  [facet-1]
  [facet-2]
explore a facet, or stay at this level?
```

**Exploring a facet** is the same operation as exploring any node — resolve the path from the sub-graph and proceed. The parent context remains ambient.

**Creating facets**: In the protocol, facets are full nodes in a sub-graph. To create a facet:
1. Create `nodes/<parent>/nodes/<facet-dir>/` with `node.json`, `story.md`
2. Add node entry to `nodes/<parent>/graph.json`
3. Add edges to other facets if relationships are clear
4. If this is the first facet, create the sub-graph's `graph.json` first

## Journal Awareness

`journal.md` at the workspace root is a bidirectional channel. It uses context markers:

```markdown
## section-title

<!-- context: context-type -->

Content.
```

**Read journal** for temporal awareness — what happened recently, what context markers exist.

**Append to journal** when:
- A significant shift happens during exploration
- The user explicitly asks to note something in the journal

**Never overwrite** existing journal content. Append only, at the bottom.

## Captures

Captures are **not** graph nodes. They are independent flat files under the workspace root (`{workspace root}/.qino/captures/`), outside any graph.

- Format: `YYYY-MM-DD_essence.md` — title, timestamp, content
- No node.json, no graph.json entries, no edges
- Pull-based composting: user explicitly points to a capture when they want to absorb it into a concept

**Cross-concept signals** during exploration also create flat capture files (not graph nodes).

## Held Threads (Protocol)

Same principle as legacy — offer without reading, hold without pushing. But held threads live in `node.json` per-node, not in a global manifest.

```json
{
  "held_threads": [
    "thread description"
  ]
}
```

**Offer when**: user's response echoes a held thread's theme, or user seems stuck with relevant threads nearby.

**Never**: read or surface held threads unprompted. Offer gently, accept decline immediately.

---

## Dev Structure (Protocol)

Read this section alongside `agents/dev.md` when `protocol: "qino"` is detected. These translations replace legacy paths throughout the dev agent's workflows.

### Path Translations

| Legacy Path | Protocol Path | Notes |
|-------------|---------------|-------|
| `implementations/[app]/implementation.md` | `{nodesDir}/{app}/story.md` | Technical context, stack, boundaries, flags |
| `implementations/[app]/iterations/` | `{nodesDir}/{app}/content/` | Iteration files with `NN-name.md` pattern |
| `implementations/[app]/iterations/01-foundation.md` | `{nodesDir}/{app}/content/01-foundation.md` | Same naming convention, different parent |
| `implementations/graph.json` (manual entries) | `graph.json` with `nodesDir` (auto-discovery) | No manual node registration needed |
| `manifest.json` (concept `last_touched`) | Git log on concept path | No stored timestamps |
| `concepts/[id]/concept.md` | `{conceptsRepo}/nodes/{concept-id}/story.md` | Concept impulse + content/ for developed material |

### Key Protocol Files per App

```
{nodesDir}/{app}/
  node.json         # Identity: title, type, status, created
  story.md          # Technical context (replaces implementation.md)
  content/          # Iteration files (replaces iterations/)
    01-foundation.md
    02-feature-name.md
  annotations/      # Proposals, observations (if present)
```

### Concept Sync (Edge-Based)

On arrival at an implementation node:
1. Read the implementation graph's edges for the current app node
2. Find edges with label `"concept grounds"` — the target is a cross-graph reference (e.g., `"qino-concepts:qino-world"`)
3. Parse the target: prefix is the workspace path, suffix is the concept node ID
4. Resolve the concept workspace path relative to the root workspace
5. `git -C {conceptsPath} log -1 --format=%ci -- {nodesDir}/{concept-id}/` → last concept change
6. `git log -1 --format=%ci -- {nodesDir}/{app}/` → last implementation work
7. If concept is more recent, surface a brief diff summary
8. Offer: Review / Reconcile / Acknowledge

If no `"concept grounds"` edge exists, the implementation has no linked concept — skip sync.

### Cross-Repo Resolution

- Concept impulse: `{conceptsRepo}/nodes/{concept-id}/story.md`
- Concept content: `{conceptsRepo}/nodes/{concept-id}/content/`
- Concept metadata: `{conceptsRepo}/nodes/{concept-id}/node.json`
- Resolve concept workspace from `"concept grounds"` edge target prefix (may be relative path like `"qino-concepts"`)

### Iteration Discovery

- Scan `{nodesDir}/{app}/content/` directory
- Sort files by prefix number (`01-`, `02-`, etc.)
- Read status from each file (look for status markers: Not started / In progress / Complete)
- Current iteration = first file without "Complete" status
- No graph.json iteration array needed — content/ IS the source of truth

### Drift → Concept Update

When drift is detected and user chooses to update the concept:
- Invoke concept agent with context about the drift
- Concept agent edits `story.md` or files in `content/` at `{conceptsRepo}/nodes/{concept-id}/`
- Control returns to dev context
- No stored timestamp to update — git tracks the change automatically
