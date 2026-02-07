# Protocol Structure Supplement

Read this alongside `agents/concept.md` when `protocol: "qino"` is detected in the workspace config. These sections **replace** the File Structure Awareness, Facets, and Ecosystem Work sections in concept.md — all other principles (alive thread, mirror/echo, momentum, tone, reasoning, draft awareness, core intent) remain unchanged.

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
| `capture` | A thought, observation, discovery — first-class | Light touch — it exists as a node; it has edges to what sparked it |
| `facet` | A navigable aspect of a parent concept | Same depth as concept, but awareness of parent context |
| `arc` | A temporal container tracking emergence | Read for context; arcs accumulate naturally |
| `navigator` | An orientation document for building | Reference for terrain; not actively explored like concepts |

**Ecosystem nodes** follow the same principle as ecosystem work in concept.md: distinction-making that shapes the whole. Hold the diverging movement longer.

## Edge Awareness

Edges in `graph.json` carry typed relationships with context sentences. They are structural — not just tags.

**Read edges to understand:**
- What a concept references (vocabulary, principles)
- What a capture was sparked by
- What extends what (continuity chains)
- How facets relate to each other

**Create edges when:**
- A new capture connects to existing nodes (always include context)
- Exploration reveals a relationship not yet captured
- Cross-concept signals surface during work

**Edge context** is a short sentence — why this relationship exists. Not a label; a breath of meaning.

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
- A capture is created (echo with `<!-- context: capture -->`)
- A significant shift happens during exploration
- The user explicitly asks to note something in the journal

**Never overwrite** existing journal content. Append only, at the bottom.

## Capture-as-Node Convention

In the protocol, captures are **not** files in a `notes/` directory. They are first-class nodes in the graph:

- Type: `"capture"`
- Directory: `nodes/<capture-id>/`
- Contains: `node.json`, `story.md`, optionally `content/capture.md`
- Connected: via edges in `graph.json` to related nodes

**When creating a capture:**
1. Generate an id from the essence (kebab-case, descriptive)
2. Create `nodes/<id>/node.json` (type: "capture")
3. Create `nodes/<id>/story.md` (the captured thought)
4. Add node entry to root `graph.json`
5. Add edges to connected nodes (if connections detected)
6. Append echo to `journal.md`

**Cross-concept signals** during exploration also create capture nodes (not notes files).

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
