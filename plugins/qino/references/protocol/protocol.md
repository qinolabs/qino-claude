# Qino Protocol — Agent Reference

This document is ordered for agent consumption: **operations first** (what to do), then **structure** (how files work), then **concepts** (why this design).

---

# Part 1: Operations

Quick reference for file-level decisions. When in doubt, consult this section.

## Graph Operations

| Trigger | Action | Details |
|---------|--------|---------|
| Node created | Add to graph.json | Entry with id, dir, title, type, status |
| Edge discovered | Add to graph.json edges[] | Include context sentence (why this relationship) |
| Node archived | Update status in graph.json | Set `"status": "archived"` |
| Sub-graph created | Add graph.json inside node | Node gains `hasSubGraph: true` indicator |

### When to Create a Node

Create a node when:
- Content can be referenced by other nodes (edges would be meaningful)
- Material may be revisited, extended, or composed
- There's a "what" that deserves a name and identity

**Node creation checklist:**
1. Generate id from essence (kebab-case, descriptive)
2. Create `nodes/<id>/node.json` (type, status)
3. Create `nodes/<id>/story.md` (the impulse — one or two sentences)
4. Add node entry to `graph.json`
5. Add edges to connected nodes (with context sentences)
6. Append echo to `journal.md` (see Journal Operations)

### When to Create an Edge

Create an edge when:
- A node uses vocabulary or ideas from another (`references`)
- A node originated from encounter with another (`sparked-by`)
- A node builds on or continues another (`extends`)
- A node provides input to another (`informs`)

**Edge context** is a sentence, not a label. It answers "why does this relationship exist?"

---

## Journal Operations

| Trigger | Context Marker | Template |
|---------|---------------|----------|
| Session begins | `session/YYYY-MM-DD` | "Starting [work description]. Coming from [context]." |
| Session ends | `session/YYYY-MM-DD` | "Completed [summary]. Open: [threads if any]." |
| Node created | `capture` | "[title]. Connected to [node] via [edge-type]." |
| Structural change | `migration` | "[what changed]. [counts]." |
| Observation | `observation` | "[the observation]" |

### When to Journal

**Always journal:**
- Node creation (echo with title and primary connection)
- Session boundaries (start and end)
- Structural migrations (schema changes, bulk operations)

**Consider journaling:**
- Observations that don't need their own node but are worth preserving
- Decisions made during exploration that affect future work
- Context that would help someone arriving later

**Never journal:**
- Content that would benefit from edges (create node instead)
- Routine file operations (git handles provenance)
- Ephemeral working notes

### Journal Scope Decision

| Question | Scope |
|----------|-------|
| Does this concern multiple nodes? | Root journal |
| Is this about arriving at the workspace? | Root journal |
| Is this within one node's investigation? | Node journal |
| Would anyone exploring this node benefit? | Node journal |

Default to root journal when unclear.

---

## Node Operations

### story.md

The impulse. One or two sentences capturing what this node IS — its center of gravity.

**Write story.md when:** Node is created.

**Update story.md when:** The node's essence shifts (rare — most updates go to content/).

### content/

Developed material. File names are descriptive (`concept.md`, `thread.md`, `arc.md`).

**Add to content/ when:** Material develops beyond the impulse.

**File naming:** Describe what's inside. No rigid convention.

### annotations/

Marginal notes about the content. Post-its, not part of the content itself.

**Add annotation when:** You notice something about the content worth preserving but not integrating.

**Annotation format:** Numbered markdown files with signal type (reading, connection, tension, proposal).

### node.json

Metadata: title, type, status, created, tags, held_threads.

**Update node.json when:**
- Status changes (active → archived)
- Tags added or removed
- Held threads accumulate or resolve

---

## Type-Specific Operations

### capture (quick thought, observation)

- story.md holds the complete thought (may not need content/)
- Always add edges to what sparked it
- Always echo to journal

### session (bounded work)

- story.md summarizes what the session was about
- content/arc.md or similar holds the detailed record
- Edges show what was touched, what emerged

### finding (crystallized insight)

- story.md captures the insight in a breath
- content/ holds supporting material if needed
- Often has `sparked-by` edges from sessions

### view (curated subset)

- story.md explains the curation purpose
- view.json lists focal node and included nodes
- `curates` edges connect to included nodes

---

# Part 2: Structure

File formats and schema. Reference when you need to know *how* files work.

## Workspace Config

A protocol workspace declares itself in `.claude/qino-config.json`:

```json
{
  "repoType": "workspace",
  "protocol": "qino",
  "types": {
    "concept": { "color": "emerald" },
    "capture": { "color": "amber" }
  },
  "statuses": {
    "active": { "treatment": "default" },
    "archived": { "treatment": "muted" }
  }
}
```

The `protocol: "qino"` field activates protocol-aware behavior.

---

## Graph Structure

### graph.json

Root registry. Lives at workspace root or inside any node with sub-nodes.

```json
{
  "id": "graph-id",
  "title": "Graph Title",
  "nodes": [
    {
      "id": "node-id",
      "dir": "node-id",
      "title": "Node Title",
      "type": "concept",
      "status": "active"
    }
  ],
  "edges": [
    {
      "source": "node-a",
      "target": "node-b",
      "type": "references",
      "context": "why this relationship exists"
    }
  ]
}
```

**Node entry fields:**

| Field | Required | Description |
|-------|----------|-------------|
| id | yes | Unique identifier within this graph |
| title | yes | Display title |
| type | yes | Node type from workspace vocabulary |
| status | yes | `"active"` or `"archived"` |
| dir | yes | Directory name under nodes/ |

**Edge fields:**

| Field | Required | Description |
|-------|----------|-------------|
| source | yes | Source node id |
| target | yes | Target node id |
| type | yes | Relationship type |
| context | no | Why this relationship exists |

---

## Node Structure

Each node is a directory under `nodes/`:

```
nodes/<dir>/
  node.json          # Metadata
  story.md           # The impulse
  content/           # Developed material
  annotations/       # Marginal notes (optional)
  graph.json         # Sub-graph (optional)
  nodes/             # Sub-nodes (when sub-graph exists)
```

### node.json

```json
{
  "title": "Node Title",
  "type": "concept",
  "status": "active",
  "created": "2025-12-08",
  "tags": ["modality"],
  "held_threads": ["thread description"]
}
```

### story.md

The impulse. One or two sentences capturing the node's center of gravity.

### content/

Developed material. File names are descriptive.

### annotations/

Optional. Numbered markdown files with signal types.

---

## Journal Structure

### journal.md

Root-level temporal record. Uses context markers:

```markdown
## Section Title

<!-- context: context-type -->

Content paragraph.
```

Context markers are metadata for machine parsing. Append-only — new entries at bottom.

---

## Sub-Graph Recursion

A node with facets contains its own `graph.json` and `nodes/`:

```
nodes/parent-concept/
  node.json
  story.md
  graph.json         ← sub-graph
  nodes/
    facet-a/
    facet-b/
```

Same schema at every level. Navigation is recursive.

---

# Part 3: Concepts

Why this structure exists. For deeper understanding.

## Structure vs Trail

The protocol distributes information across two complementary forms:

**Structure (Nodes)** — addressable, connectable, persistent. Carries identity, participates in relationships.

**Trail (Journal)** — temporal, atmospheric, flow-oriented. Marks moments without requiring structure.

### The Test

> Would this benefit from edges pointing to or from it?

If yes → node. If no → journal entry.

---

## Universal Vocabulary

| Type | What it holds | When to create |
|------|---------------|----------------|
| session | Bounded work — what was tried, observed, decided | End of focused work period |
| finding | What persisted beyond the session | When something emerged others should encounter |
| view | Curated attention subset | When graph becomes unwieldy |
| navigator | Orientation for building territory | When exploration maps terrain for construction |

Sessions are evidence. Findings are what crystallized. The `sparked-by` edge traces provenance.

---

## Edge Semantics

| Type | Meaning |
|------|---------|
| references | Uses vocabulary or ideas from target |
| sparked-by | Originated from encounter with target |
| extends | Builds on or continues target |
| informs | Provides input without being part of target |
| curates | View includes this node |

Edge context is a sentence answering "why does this connection exist?"

---

## Journal Scopes

**Root journal** (`/journal.md`) — workspace temporal record:
- Cross-node session context
- Arrival framing
- Workspace-level observations
- Capture echoes

**Node journal** (`/nodes/{node}/journal.md`) — local development trail:
- Session work within this node
- Local observations
- Progress notes

---

## The Principle

Structure captures *what emerged*. Trail captures *that something happened*.

Neither replaces the other. The protocol provides vocabulary so the right container is obvious.
