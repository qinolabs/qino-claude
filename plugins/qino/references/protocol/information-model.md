# Information Model — Structure vs Trail

> **For agents:** Start with [protocol.md](./protocol.md) — the unified agent reference, ordered for consumption (operations first, then structure, then concepts). This document provides deeper conceptual grounding.

The qino protocol distributes information across two complementary forms: **structure** (nodes and edges) and **trail** (journal entries). Understanding when each is appropriate is fundamental to working with protocol workspaces.

---

## The Core Distinction

### Structure (Nodes)

Nodes are **addressable**, **connectable**, and **persistent**. They carry identity and participate in relationships.

A node is the right container when:
- The content can be referenced by other nodes
- Edges would be meaningful (sparked-by, references, informs)
- The material may be revisited, extended, or composed with other material
- There's a "what" that deserves a name

### Trail (Journal)

The journal is **temporal**, **atmospheric**, and **flow-oriented**. Entries mark moments without requiring structure.

A journal entry is the right container when:
- The content is arrival context, session framing, or working notes
- The observation is complete in itself — no edges needed
- The moment matters but the content doesn't need its own identity
- It's about the "that" of something happening

### The Test

> Would this benefit from edges pointing to or from it?

If yes → node. If no → journal entry.

---

## Universal Vocabulary

Protocol workspaces share a type vocabulary that works across concept spaces, research territories, and implementation projects.

### Core Types

| Type | What it holds | When to create |
|------|---------------|----------------|
| **session** | Bounded work — what was tried, observed, decided | End of focused work period |
| **finding** | What persisted beyond the session that produced it | When something emerged that others should encounter |
| **view** | Curated attention subset | When a graph becomes unwieldy and focus helps |
| **navigator** | Orientation for a building territory | When exploration maps terrain for construction |

### Type Relationships

```
session ──sparked-by──→ finding
session ──references──→ navigator
finding ──informs──→ concept
view ──curates──→ [subset of graph]
```

Sessions are evidence — they don't require synthesis or conclusions. Findings are what crystallized. The session→finding edge traces provenance.

### Derived Types

Different workspace contexts may add specialized types:

| Context | Additional Types |
|---------|-----------------|
| Concept workspaces | concept, ecosystem, capture, facet |
| Implementation workspaces | iteration, implementation |
| Research workspaces | inquiry (open question being followed) |

These extend, not replace, the core vocabulary.

---

## Journal Scopes

Protocol supports two journal levels:

### Root Journal (`/journal.md`)

The workspace's temporal record. Entries here concern:
- Cross-node session context
- Arrival framing ("starting work on X, coming from Y")
- Workspace-level observations
- Capture echoes (brief notes when nodes are created)

### Node Journal (`/nodes/{node}/journal.md`)

A node's local development trail. Entries here concern:
- Session work within this node's scope
- Local observations during exploration
- Progress notes on a specific investigation

### Choosing the Right Scope

| Question | Scope |
|----------|-------|
| Does this concern multiple nodes? | Root journal |
| Is this about arriving at the workspace? | Root journal |
| Is this within one node's investigation? | Node journal |
| Would anyone exploring this node benefit? | Node journal |

When in doubt, use the root journal — it's the default temporal surface.

---

## Research Types → Protocol Vocabulary

The legacy research-spec.md defined three types: **inquiries**, **qualities**, and **arcs**. These map cleanly to protocol vocabulary:

### Inquiries → sessions + findings

An "inquiry" was an open-ended thread with a question. In protocol terms:
- The question itself is a **node** (type: inquiry or finding)
- Work sessions pursuing the question are **session nodes** with `sparked-by` edges
- What crystallized becomes **finding nodes** with `informs` edges

The difference: instead of a single `thread.md` accumulating content, sessions are discrete and findings are addressable.

### Qualities → sessions + findings

A "quality" was aesthetic refinement with examples. In protocol terms:
- The quality itself is a **node** (type: finding — the crystallized sensibility)
- Calibration attempts are **session nodes**
- The final research.md content lives in `story.md` + `content/`

### Arcs → sessions

An "arc" was emergence captured retrospectively. In protocol terms:
- Arcs are **session nodes** with rich edges showing what touched what
- The narrative shape lives in `story.md`
- Artifacts referenced become edges rather than inline lists

### What Changes

| Legacy | Protocol |
|--------|----------|
| Three separate directories (inquiries/, qualities/, arcs/) | Single nodes/ with typed entries |
| manifest.json registry | graph.json with typed nodes + edges |
| Separate thread.md / research.md formats | story.md + content/ structure |
| No relationships between types | Edges connect everything |

### What Stays

The *experience* stays the same:
- Open questions being followed → inquiry/finding nodes
- Aesthetic refinement → session nodes with finding outcome
- Emergence capture → session nodes with rich provenance edges

The structure just becomes navigable.

---

## Journal Entry Format

Entries use context markers for machine parsing:

```markdown
## [title]

<!-- context: [scope] -->

[content]
```

Common context scopes:
- `session/2026-02-07` — dated session marker
- `capture` — echo of a capture node creation
- `arrival` — framing on arriving at workspace
- `observation` — standalone observation

Example:

```markdown
## Session: emergence-experiments upgrade

<!-- context: session/2026-02-07 -->

Upgraded navigator to sub-graph structure. The MCP auto-detection worked as expected — graph.json presence triggers sub-graph treatment.

Open thread: should sub-graphs inherit parent's type vocabulary or define their own?
```

---

## Summary

| Dimension | Structure (Nodes) | Trail (Journal) |
|-----------|------------------|-----------------|
| Identity | Named, typed, addressable | Timestamped, contextual |
| Relationships | Edges connect nodes | Entries flow sequentially |
| Navigation | Graph traversal | Chronological reading |
| Lifecycle | Can be extended, composed | Append-only |
| Purpose | What emerged | That something happened |

The protocol doesn't force choices — it provides the vocabulary so the right container is obvious when you need it.
