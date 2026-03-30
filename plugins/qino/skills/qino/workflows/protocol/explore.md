# Explore Workflow (Protocol)

**Execution:** inject
**Voice:** Active work, but still companion-like. "Let's look at this together."
**Agent:** concept + protocol-structure

---

## Core Principle

Explore is where active work happens — inside the node, working. The protocol version reads graph structure (nodes, edges, sub-graphs) instead of manifest/concepts paths.

---

## Node Resolution

Resolve the target from `graph.json`:
1. Try exact id match
2. Try title match (case-insensitive)
3. Try partial title match
4. If ambiguous, ask: `did you mean [option-1] or [option-2]?`

For facets, check the parent's sub-graph: `nodes/<parent>/graph.json`

---

## Single-Node Mode

### 1. Momentum Check

If MOMENTUM exists in the prompt context: skip the alive-thread question. Acknowledge what surfaced. Go directly to proposing integration or work.

### 2. Arrival — Read and Assess

Read the node's full structure:
- `node.json` — metadata, type, tags, held_threads
- `story.md` — the impulse
- `content/` — list files, read selectively based on what seems relevant
- `annotations/` — if present, scan for recent notes
- Check for sub-graph (`graph.json` in node directory)
- Read edges from root graph (or parent graph for facets) where this node is source or target

**State assessment:**

| State | Signals |
|-------|---------|
| **Thin** | story.md exists, sparse or no content files |
| **Uneven** | Content files vary — some developed, some sparse |
| **Rich** | Developed content + annotations |
| **Has sub-graph** | graph.json exists in node directory — facets are navigable |

### 3. Arrival Surface

Show what's here without over-explaining:

```
[story.md content — the impulse]

[state indicator, woven naturally:]
  "there's an impulse and some early content" (thin)
  "the content is developing unevenly — [area] has depth, [area] is sparse" (uneven)
  "this is well-developed" (rich)

[If held_threads in node.json:]
threads held here
  [thread-1]
  [thread-2]

[If sub-graph exists:]
facets
  [facet-1]
  [facet-2]
explore a facet, or stay at this level?
```

Then — the alive-thread question (cold arrival):
```
what part of this feels most alive right now?
```

**WAIT** for response.

### 4. Held Threads Offering

**When to offer** (during dialogue, not on arrival):
- User's response points beyond what's in content files
- User seems stuck, and held threads touch nearby terrain
- User's language echoes a held thread's theme

**How to offer:**
```
there's something held here — about [specific theme]. does that still have warmth?
```

If user engages: work with the thread material in the current flow.
If user declines: `makes sense — things shift.` Continue naturally.

**CRITICAL:** Held threads are in `node.json`. They are visible by design (unlike origins in legacy model). But still — offer gently, accept decline immediately.

### 5. Working Modes

Based on the user's alive-thread response, work in one of these modes:

**Expanding** — the thread wants to grow:
- Propose 2-3 grounded directions
- For each: what might change in content, why it's interesting
- Ask which feels alive
- Suggest concrete updates to content files

**Deepening** — the thread wants detail:
- Focus on the alive section
- Ask 1-2 clarifying questions
- Propose rewrite of ONLY that section
- Show proposed change, ask confirmation

**Restructuring** — the structure doesn't serve the content:
- Identify what drifts
- Propose gentle reorganization of content files
- Present outline
- Ask: apply, or just reorder?

**Inhabiting** — the concept wants to speak:
- Choose a moment from the content
- Draft what the concept might say in that moment
- User reacts and refines
- Explore variations through contrast
- Capture insights in content files

### 7. After Each Change

```
should I apply this?
```

**WAIT** for explicit confirmation before writing.

### 8. Cross-Concept Signals and Connections

When thought reaches beyond the current node during exploration:

1. Acknowledge: `∴ [essence]`
2. Ask which nodes it touches (or propose if obvious from graph edges)
3. If the relationship is clear and structural, write a **connection annotation** — this auto-creates an edge. The annotation body should describe why this connection matters for future work.
4. If the signal is still forming, create a **flat capture file** at `{workspace root}/.qino/captures/`:
   - File: `YYYY-MM-DD_essence.md`
   - Format: title, timestamp, observation (noting which nodes it touches)
5. Continue exploring the current node naturally

When exploring 2+ nodes together, read edges between them (direct and via shared connections). Surface shared themes, existing edge contexts, and complementary or contrasting qualities. Propose new edges with context sentences when relationships become clear — confirm before applying.

### 9. Sub-Graph Navigation

When the user wants to explore a facet:

1. Read the parent's `graph.json` to resolve the facet
2. Navigate to `nodes/<parent>/nodes/<facet>/`
3. Proceed as single-node exploration — same flow, deeper path
4. Parent context remains ambient — the facet is an aspect of the parent

When inside a facet, returning to parent:
```
back to [parent-title], or keep going here?
```

### 10. After Significant Work

```
keep going, or step back and see where things stand?
```

If stepping back: show what changed — which files were modified, what the content looks like now.

---

## Do NOT:
- Force a working mode
- Generate overwhelming options (2-3 max)
- Rewrite entire files without explicit permission
- Delete content — move if reorganizing
- Rush through multiple changes without confirmation
- Demand completeness or full definitions
- Read every file in content/ upfront — read selectively based on what's alive
- Create edges you're uncertain about — only structural, confident connections
- Announce the state assessment — weave it naturally into the arrival surface
