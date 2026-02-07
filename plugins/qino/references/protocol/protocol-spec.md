# Qino Protocol — Structure Reference

The qino protocol organizes workspaces as directed graphs of typed nodes. Each node is a directory with metadata, impulse, and content. Relationships between nodes are typed edges with context.

This reference documents the data model for protocol-aware workflows.

**See also:** [Information Model](./information-model.md) for the conceptual foundation — structure vs trail, the session/finding vocabulary, and journal scopes.

---

## Workspace Config

A protocol workspace declares itself in `.claude/qino-config.json`:

```json
{
  "repoType": "workspace",
  "protocol": "qino",
  ...
}
```

The `protocol` field activates protocol-aware routing. When absent, the workspace uses the legacy manifest-based model.

---

## Graph Structure

### `graph.json`

The root registry. Lives at workspace root (or inside any node that has sub-nodes).

```json
{
  "id": "graph-id",
  "title": "Graph title",
  "nodes": [
    {
      "id": "node-id",
      "title": "Node Title",
      "type": "concept",
      "status": "active",
      "dir": "node-id"
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
| `id` | yes | Unique identifier within this graph |
| `title` | yes | Display title |
| `type` | yes | Node type (see below) |
| `status` | yes | `"active"` or `"archived"` |
| `dir` | yes | Directory name under `nodes/` |

**Edge fields:**

| Field | Required | Description |
|-------|----------|-------------|
| `source` | yes | Source node id |
| `target` | yes | Target node id |
| `type` | yes | Relationship type (see below) |
| `context` | no | Why this relationship exists — a sentence |

### Node Types

| Type | Meaning | Typical content |
|------|---------|-----------------|
| `concept` | A developed idea with impulse, content, possibly facets | `story.md`, `content/`, possibly sub-graph |
| `ecosystem` | Cross-cutting system-level work (language, principles) | `story.md`, `content/` |
| `capture` | A thought, observation, or discovery — first-class | `story.md`, `content/` |
| `facet` | A navigable aspect of a parent concept (lives in sub-graph) | `story.md`, `content/` |
| `arc` | A temporal container tracking emergence | `story.md`, `content/` |
| `navigator` | An orientation document for a building territory | `story.md`, `content/` |

### Edge Types

| Type | Meaning | Example |
|------|---------|---------|
| `references` | Uses vocabulary or ideas from target | concept → ecosystem language |
| `sparked-by` | Originated from encounter with target | capture → concept |
| `extends` | Builds on or continues target | capture B → capture A |
| `facet-of` | Is a navigable aspect of target | facet → concept (in sub-graphs, implicit via nesting) |
| `informs` | Provides input to target without being part of it | research → concept |

---

## Node Structure

Each node is a directory under `nodes/`:

```
nodes/<dir>/
  node.json          # Metadata (title, type, status, created, tags, held_threads)
  story.md           # The impulse — what this node IS, in a breath
  content/           # Developed material (concept.md, capture.md, etc.)
  annotations/       # Marginal notes, observations (optional)
  graph.json         # Sub-graph (optional — means this node has facets/sub-nodes)
  nodes/             # Sub-nodes (present when graph.json exists)
```

### `node.json`

```json
{
  "title": "Node Title",
  "type": "concept",
  "status": "active",
  "created": "2025-12-08",
  "tags": ["modality", "relational"],
  "held_threads": [
    "thread description — something held for later"
  ]
}
```

Fields:

| Field | Required | Description |
|-------|----------|-------------|
| `title` | yes | Display title |
| `type` | yes | Same as in graph.json entry |
| `status` | yes | `"active"` or `"archived"` |
| `created` | no | ISO date string |
| `tags` | no | Array of strings |
| `held_threads` | no | Array of threads being held — same principle as legacy manifest |

### `story.md`

The impulse. One or two sentences that capture what this node IS. Not a summary — a seed. The reader should feel the concept's center of gravity.

### `content/`

Developed material. File names are descriptive — `concept.md`, `capture.md`, `crossing-threshold.md`, etc. No rigid naming convention; the content describes itself.

### `annotations/`

Optional. Marginal notes, observations about the content that don't belong in the content itself. Think of these as post-its on the page.

---

## Sub-Graph Recursion

A node with facets contains its own `graph.json` and `nodes/` directory:

```
nodes/qino-world/
  node.json
  story.md
  content/concept.md
  graph.json              ← sub-graph registry
  nodes/
    crossing-threshold/
      node.json
      story.md
      content/crossing-threshold.md
    attunement/
      node.json
      story.md
      content/attunement.md
```

The sub-graph's `graph.json` has the same schema as the root — nodes and edges. Sub-graph nodes are typed `"facet"` and edges describe relationships between facets.

**Navigation**: Exploring a facet is the same operation as exploring any node — the path just goes deeper. The agent resolves the node path from the appropriate graph level.

**Facet count**: To know how many facets a concept has, check for `graph.json` inside the node directory. If present, read its `nodes` array.

---

## Journal

### `journal.md`

Root-level file. The workspace's temporal record — a bidirectional channel between user and system.

Structure uses context markers in HTML comments:

```markdown
## section-title

<!-- context: section-context -->

Content paragraph.

## another-section

<!-- context: another-context -->

More content.
```

Context markers are metadata for machine parsing. The journal is append-oriented — new entries go at the bottom with their own section and context marker.

**Capture echo**: When a capture node is created, a brief echo is appended to the journal:

```markdown
## [capture title]

<!-- context: capture -->

[essence sentence]. Connected to [node-title] via [edge-type].
```

---

## Structure Mapping (Legacy → Protocol)

| Legacy (manifest-based) | Protocol (graph-based) | Notes |
|--------------------------|------------------------|-------|
| `manifest.json` concepts[] | `graph.json` nodes[] | Graph adds typed relationships |
| `notes/YYYY-MM-DD_*.md` | Nodes with type `"capture"` + edges | Captures are first-class graph nodes |
| `concepts/<id>/concept.md` | `nodes/<dir>/story.md` + `content/` | story = impulse; content/ = full material |
| `concepts/<id>/facets/` | Sub-graph (`nodes/<dir>/graph.json` → `nodes/`) | Facets are navigable |
| `held_threads` in manifest | `held_threads` in `node.json` | Same field, per-node instead of global |
| `revisions.md` | `journal.md` context markers + git | Journal IS the revision trail |
| Note references (multi-concept) | Graph edges (typed, with context) | Relationships are structural |
| `concepts/<id>/origins/` | No direct equivalent | Origins not yet part of protocol |
| `notes-archive.json` | No direct equivalent | Archival via node status field |
