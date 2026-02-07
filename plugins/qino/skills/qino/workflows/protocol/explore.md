# Explore Workflow (Protocol)

**Execution:** inject
**Voice:** Active work, but still companion-like. "Let's look at this together."
**Agent:** concept + protocol-structure

---

## Core Principle

Explore is where active work happens — inside the node, working. The protocol version reads graph structure (nodes, edges, sub-graphs) instead of manifest/concepts paths.

---

## Mode Detection

- 1 node argument → **Single-node mode**
- 2+ node arguments → **Relationship mode**

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
| **Has connected captures** | Edges from capture-type nodes point here |

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

[If connected captures exist:]
captures touching this
  [capture-title] — [edge-context]

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

### 5. Capture Offering

**When to offer** (during dialogue):
- User's alive-thread echoes a capture's essence (check capture nodes connected via edges)
- User is uncertain, and a relevant capture exists

**How to offer:**
```
you captured something about [essence] — does it connect here?
```

If engages: read the capture's story.md, surface it, work with it.
If declines: acknowledge, continue.

### 6. Working Modes

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

### 8. Cross-Concept Signals

When thought reaches beyond the current node during exploration:

1. Acknowledge: `∴ [essence]`
2. Ask which nodes it touches (or propose if obvious from graph edges)
3. Create a **capture node** via the capture flow:
   - `nodes/<id>/node.json`, `story.md`
   - Add to `graph.json` with edges to source and target nodes
   - Append echo to `journal.md`
4. Continue exploring the current node naturally

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

## Relationship Mode (2+ nodes)

1. Resolve each node from graph.json
2. Read each node's `story.md` and key content
3. Read edges between them (direct and via shared connections)
4. Begin: `let's see what lives between these...`
5. Surface initial observations:
   - Shared themes in stories
   - Existing edges and their contexts
   - Complementary or contrasting qualities
6. Ask: `when you think of these together, what feels connected?`
7. **WAIT**
8. Generate relational understanding (clear observations, not formal map)
9. Propose new edges for `graph.json` with contexts
10. Ask: `should I add these connections?`
11. **WAIT** for confirmation
12. Apply changes (add edges to graph.json)
13. Offer: `keep going, or step back?`

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
