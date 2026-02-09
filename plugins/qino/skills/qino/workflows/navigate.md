# Navigate Workflow

**Execution:** inject (optional spawn for research during creation)
**Voice:** Grounded. Cartographic. Holding the whole territory so you can move through it.
**Agent:** none (direct mode — uses qino-lab MCP tools)

---

## What Navigators Are

A navigator is a **living orientation document** for a territory being actively explored or built. It maps what exists, carries meaning about why each piece matters, and records how understanding evolves across sessions.

Navigators are **graph nodes** with `type: "navigator"` in the workspace root graph. They appear in qino-lab at `http://localhost:4020`.

**Navigators are not:**
- Plans (they don't prescribe tasks or timelines)
- Arcs (arcs are live containers that trace inquiry as it moves; navigators map terrain for building. Arcs follow emergence, navigators orient construction)
- Implementation docs (those are per-app technical context; navigators span multiple apps, concepts, and ecosystem patterns)

**Navigators are:**
- Cross-session persistent context — more explicit than built-in memory, more structured than conversation
- Terrain maps with meaning — not just file paths, but why each piece matters to this territory
- Documentation as a byproduct — session logs naturally record how understanding evolved
- Temporary — they exist while the possibility space is active. When work completes, they become archival documentation.

### Navigator Structure

```
nodes/[navigator-id]/
  node.json          # type: "navigator", status: "active"
  story.md           # Territory essence, what sparked it, open frontier
  content/
    terrain.md       # Full terrain: sections, reading order, open questions, session log
  nodes/             # Sub-graph for session nodes (optional, for heavy navigators)
    session-001/
    session-002/
```

---

## Task

Three modes based on user intent:

### Mode 1: Activate Navigator

**Triggers:** "use the active navigator", "activate navigator for [territory]", "navigate [territory]", "orient me on [territory]"

1. **Find navigator nodes:**
   - `read_graph` on the root graph
   - Filter nodes by `type: "navigator"` and `status: "active"`

2. **If user specified a territory**, match by node ID or title.

3. **If multiple active navigators**, show them:
   ```
   active navigators

     emergence-experiments — emergence mechanics, readiness lenses, world simulation
     lens-ecosystem — lens architecture, crossing constraints, ecosystem design

   Which territory?
   ```

4. **Load the matched navigator:**
   - `read_node` to get story + content files
   - Read `content/terrain.md` for full terrain map

5. **Output activation surface:**
   ```
   ┌─────────────────────────────────────────┐
   │ [navigator name]                        │
   │                                         │
   │ direction                               │
   │ [direction from story.md]               │
   │                                         │
   │ terrain                                 │
   │ [count] sections mapped                 │
   │ [count] open questions                  │
   │                                         │
   │ last session                            │
   │ [date] — [first line of last entry]     │
   │                                         │
   └─────────────────────────────────────────┘

   Navigator loaded. Working with full terrain awareness.

   Open questions:
     [list top 3-5 open questions from navigator]

   Where do you want to focus?
   ```

6. **The navigator is now active context.** For the remainder of the session:
   - Use terrain references when the user asks about connections or next steps
   - Use reading order when orienting someone new to the territory
   - Use open questions when the user asks "what's next" or "where should we dig in"
   - Reference specific file paths from the terrain map when pointing to code or docs

### Mode 2: Create Navigator

**Triggers:** "map this concept", "create a navigator for [territory]", "show me the terrain for [territory]", "map the terrain"

Creating a navigator requires deep exploration — reading across repos, understanding connections, synthesizing into an annotated map. This is substantial work.

#### Phase 1 — Research (spawn, optional)

When the territory requires deep cross-repo reading, spawn an Explore agent to read broadly and return a synthesis. Skip if the conversation already carries sufficient momentum/context.

```
Task tool with subagent_type: "Explore"
prompt: "Read broadly across [repos/directories] to map the terrain for [territory].
         Return: key files with significance, connections between them,
         open questions, and a suggested reading order."
```

#### Phase 2 — Graph Creation (inject)

Using research output or conversation momentum:

1. **Create the navigator node:**
   - `create_node` with:
     - `type: "navigator"`
     - `status: "active"`
     - `dir`: descriptive directory name (e.g., `lens-ecosystem`)
     - `title`: territory name
     - `story`: territory essence — what sparked it, what the open frontier looks like, sibling navigators
     - `edges`: connections to related concept nodes in the graph

2. **Write terrain content:**
   - Write `content/terrain.md` via the Write tool to the node's content directory
   - Structure:

   ```markdown
   # [Territory Name] — Terrain

   > [One-line essence of what this territory is about]

   ## Direction

   [1-2 paragraphs: where this is heading. Prospective, not retrospective.
    What comes next, what the open frontier looks like.]

   ---

   ## Terrain

   ### [Section Name]

   [Brief intro: why this section matters to this territory]

   | What | Where | Why It Matters Here |
   |------|-------|---------------------|
   | **[item]** | `path/to/file` | [Specific judgment about significance] |
   | ... | ... | ... |

   [Pattern extraction or key insight from this section]

   ### [Next Section]
   ...

   ---

   ## Reading Order

   For entering this territory fresh:

   1. **[First thing to read]** -> `path` — [why this comes first]
   2. **[Second]** -> `path` — [what this builds on]
   ...

   ---

   ## Open Questions

   ### [Question Group]
   - [Specific question]
   - [Specific question]
   ...

   ---

   ## Session Log

   ### [Date] — Session 1: [Brief Title]

   **What happened**: [2-3 sentences]

   **Key moves**: [bullet points of conceptual shifts or discoveries]

   **What was produced**: [artifacts created]

   **What shifted**: [what understanding changed]

   **What remains alive**: [seeds for next session]
   ```

3. **Record in journal:**
   - `write_journal_entry` capturing the creation

4. **Output confirmation:**
   ```
   Navigator created: [navigator-id]

   [terrain section count] terrain sections
   [question count] open questions
   [reading order count] steps in reading order

   Navigator is now active for this session.
   ```

#### Quality Requirements

- Every terrain entry has a "Why It Matters Here" column — meaning, not just location
- Reading order is pedagogical — sequenced for understanding, not alphabetical
- Open questions are genuine unknowns, grouped by sub-territory
- Session log captures the first session (the creation session itself)
- No shallow navigators — deep reading required for creation (a shallow navigator is worse than none)

### Mode 3: Update Session Log

**Triggers:** "update the navigator", "log this session", "record what we found"

This can also happen **implicitly** when a navigator-aware session ends — offer to update the session log.

1. **Load the active navigator:**
   - `read_node` to get current state
   - Read `content/terrain.md` for current terrain

2. **Assess what happened this session:**
   - What was the user working on?
   - What conceptual shifts or discoveries occurred?
   - What artifacts were produced?
   - What questions were resolved? What new questions surfaced?
   - What remains alive for next time?

3. **Draft updates to `content/terrain.md`:**
   - **Session log**: append a new entry
   - **Terrain sections**: add new discoveries if relevant
   - **Open questions**: remove resolved, add new
   - **Direction**: update if shifted

4. **Show proposed changes** and wait for confirmation.

5. **Apply changes:**
   - Edit `content/terrain.md` via the Edit tool (filesystem)
   - `write_journal_entry` capturing the session

---

## Navigator Awareness in Other Workflows

When a navigator is active (read at session start), its terrain and open questions inform other workflows:

**In dev-work:** The arrival surface gains a navigator reference. When the user asks "what's next" and a navigator has open questions, those are surfaced alongside iteration status.

**In explore:** If exploring a concept that a navigator's terrain references, the navigator's annotations provide context about why that concept matters to the active territory.

**In home:** Active navigators appear in the arrival surface.

**In lab mode:** If a navigator is active while in lab mode, the terrain carries into graph-mediated work. See `workflows/lab.md` for navigator awareness within lab mode.

---

## Lifecycle

| Phase | What Happens |
|-------|-------------|
| **Created** | Deep exploration produces initial navigator with terrain, reading order, open questions, first session log entry |
| **Active** | Updated across sessions. Terrain grows. Questions resolve and new ones surface. Session log accumulates. |
| **Completed** | Work resolves. Navigator status changes to "completed". The node remains in the graph as archival documentation of how a territory was explored and built. |

---

## Do NOT:

- Create navigators for trivial or single-file territories — navigators are for cross-cutting possibility spaces
- Update the navigator without showing proposed changes first
- Treat the navigator as a task list — it maps terrain and holds questions, it doesn't assign work
- Remove session log entries — they're the temporal record
- Create a navigator without deep reading — a shallow navigator is worse than none (it gives false confidence about terrain coverage)
