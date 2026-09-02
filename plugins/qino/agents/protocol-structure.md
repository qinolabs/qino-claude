# Protocol Structure Supplement

Read this alongside `agents/os.md` when `protocol: "qino"` is detected in the workspace config.

**For os agent workflows:** These sections **replace** the File Structure Awareness, Facets, and Ecosystem Work sections in os.md — all other principles (alive thread, mirror/echo, momentum, tone, reasoning, draft awareness, core intent) remain unchanged.

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

**Ecosystem nodes** follow the same principle as ecosystem work in concept.md: distinction-making that shapes the whole. Hold the diverging movement longer.

## Edge Awareness

Edges in `graph.json` connect nodes with a context sentence that explains why the connection matters.

**Read edges to understand neighborhood:** Which nodes are nearby? What does the context sentence tell you about how they relate to your current work? Follow edges whose context is relevant.

**Create edges when:**
- Exploration reveals a relationship not yet captured
- Cross-concept signals surface during work

**The edge set is the node's record of its relationships — point to it, don't restate it.** When a node's prose (story or content) starts enumerating related nodes and *why* they matter, that data already lives in the edges, each with its own context sentence. A prose copy drifts as the graph grows; the edges stay current. Leave a short pointer that tells the reader to follow the edges — not a bulleted table that duplicates them. (Exemplar: `qino-concepts:offered-field`'s "Manifestations across contexts" — a two-sentence pointer where an earlier draft carried a drifting table.)

**Edge context** is a short sentence — why this relationship exists, and how future agents should understand it. Write a context sentence that helps future agents understand why this connection matters for their work. Don't classify — describe. A good context sentence reads like a note left for someone who will arrive here later: "this node's emergence patterns informed the cycle design here" or "tension between these two approaches shaped the architecture."

## Structure Decisions: Edges vs. Sub-Graphs vs. Content Files

Three ways to organize information. Each has different signal propagation, and the choice shapes what future agents can see.

**Content files** (`content/01.md`, `content/02.md`) — flat history within a node. All annotations on the node flow to neighbors via `connectedSignals`. Use for: iteration history, research that should stay visible from outside, sequential work on one concern.

**Edges between separate nodes** — full bidirectional signal flow. Annotations on either node propagate to the other's neighborhood. Use for: peers that should see each other's signals, cross-cutting patterns, related initiatives, sequential experiments where each run's findings should inform the next.

**Sub-graphs** (node contains its own `graph.json` + `nodes/`) — containment boundary. Signals inside the sub-graph do NOT propagate to the parent's neighbors. Only annotations on the parent node itself flow outward. Use for: internal structure that shouldn't flood the neighborhood — facets of a concept, sessions of an experiment, implementation detail beneath an initiative.

**The key question**: does this information need to flow outward to neighbors, or is it internal detail?

- Research sessions inside an exploration → sub-graph (internal, doesn't flood)
- A cross-cutting discovery from that research → write annotation on the PARENT node (bubbles up to neighbors)
- Sequential evaluation runs → flat peers with edges (each run's signals visible to adjacent runs)
- Facets of a concept → sub-graph (natural containment, explore on demand)

**Prefer edges over sub-graphs** unless you specifically need containment. A sub-graph without outward edges is invisible to autonomous agents navigating the graph. An edge-connected structure is alive — signals flow, neighborhoods grow, agents can follow paths.

**Bubbling up from sub-graphs**: When something important surfaces inside a sub-graph, write an annotation on the parent node or create a cross-graph edge from the child to an external node. This is how sub-graph discoveries become visible to the broader ecosystem.

## Sub-Graph Navigation

A node that has facets contains its own `graph.json` and `nodes/` directory. This is **recursive** — the same structure at every level.

**Detection**: Check for `graph.json` inside a node directory. If present, this node has a navigable sub-graph.

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

Captures are graph nodes with `type: "capture"`. Created via `create_node` in the current workspace's graph.

- `create_node(type: "capture", title: "essence", story: "the thought")`
- Discoverable via `search`, surface in `read_activity`
- Edges can be added at creation (e.g., `sparked-by` if the user mentions a specific node) or later
- No special path resolution — captures live in whatever graph the agent is working in

**Cross-concept signals** during exploration also become capture nodes (with edges to the nodes they touch).

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
