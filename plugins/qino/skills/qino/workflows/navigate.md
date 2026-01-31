# Navigate Workflow

**Execution:** spawn
**Voice:** Grounded. Cartographic. Holding the whole territory so you can move through it.
**Agent:** dev

---

## What Navigators Are

A navigator is a **living orientation document** for a territory being actively explored or built. It maps what exists, carries meaning about why each piece matters, and records how understanding evolves across sessions.

Navigators live at `navigators/` in the implementation repo (typically `qinolabs-repo/navigators/`).

**Navigators are not:**
- Plans (they don't prescribe tasks or timelines)
- Arcs (arcs are live containers that trace inquiry as it moves; navigators map terrain for building. Arcs follow emergence, navigators orient construction)
- Implementation docs (those are per-app technical context; navigators span multiple apps, concepts, and ecosystem patterns)

**Navigators are:**
- Cross-session persistent context — more explicit than built-in memory, more structured than conversation
- Terrain maps with meaning — not just file paths, but why each piece matters to this territory
- Documentation as a byproduct — session logs naturally record how understanding evolved
- Temporary — they exist while the possibility space is active. When work completes, they become archival documentation.

---

## Task

Three modes based on user intent:

### Mode 1: Activate Navigator

**Triggers:** "use the active navigator", "activate navigator for [territory]", "navigate [territory]", "orient me on [territory]"

1. **List available navigators:**
   - Glob `navigators/*.md` in the implementation repo
   - Read the header of each (first ~15 lines: title, territory, status, direction)

2. **If user specified a territory**, match by filename or territory field.

3. **If multiple active navigators**, show them:
   ```
   active navigators

     emergence-lab — emergence mechanics, readiness lenses, world simulation
     [other] — [brief from direction field]

   Which territory?
   ```

4. **Read the matched navigator fully.**

5. **Output activation surface:**
   ```
   ┌─────────────────────────────────────────┐
   │ [navigator name]                        │
   │                                         │
   │ direction                               │
   │ [direction field content]               │
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

1. **Identify the territory:**
   - What concept, app, or cross-cutting concern is being mapped?
   - What repos and directories are relevant?

2. **Read broadly.** For a typical territory, check:
   ```
   concepts-repo/
     concepts/[related]/concept.md
     concepts/[related]/facets/
     ecosystem/ (domain language, design principles, lens docs)
     notes/ (related notes)

   qinolabs-repo/
     implementations/[related]/ (implementation.md, iterations/)
     implementations/docs/ (cross-app architecture)
     apps/[related]/ (actual codebase — schema, services, routes)

   qino-research/
     explorations/ (related research)
     arcs/ (related arcs)
   ```

3. **Synthesize into navigator structure:**

   ```markdown
   # [Territory Name]

   > [One-line essence of what this territory is about]

   **Territory**: [what this navigator covers — apps, concepts, systems]
   **Status**: Active
   **Since**: [date]

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

   ### [Date] — Session [N]: [Brief Title]

   **What happened**: [2-3 sentences]

   **Key moves**: [bullet points of conceptual shifts or discoveries]

   **What was produced**: [artifacts created]

   **What shifted**: [what understanding changed]

   **What remains alive**: [seeds for next session]
   ```

4. **Key quality requirements:**
   - Every terrain entry has a "Why It Matters Here" column — meaning, not just location
   - Reading order is pedagogical — sequenced for understanding, not alphabetical
   - Open questions are genuine unknowns, grouped by sub-territory
   - Session log captures the first session (the creation session itself)

5. **Save** to `navigators/[territory-name].md`

6. **Output confirmation:**
   ```
   Navigator created: navigators/[name].md

   [terrain section count] terrain sections
   [question count] open questions
   [reading order count] steps in reading order

   Navigator is now active for this session.
   ```

### Mode 3: Update Session Log

**Triggers:** "update the navigator", "log this session", "record what we found"

This can also happen **implicitly** when a navigator-aware session ends — the dev agent should offer to update the session log.

1. **Read the active navigator's session log** to understand previous entries.

2. **Assess what happened this session:**
   - What was the user working on?
   - What conceptual shifts or discoveries occurred?
   - What artifacts were produced?
   - What questions were resolved? What new questions surfaced?
   - What remains alive for next time?

3. **Draft a session log entry:**
   ```markdown
   ### [Date] — Session [N]: [Brief Title]

   **What happened**: [2-3 sentences]

   **Key moves**: [bullet points]

   **What was produced**: [list artifacts]

   **What shifted**: [what understanding changed]

   **What remains alive**: [seeds]
   ```

4. **Also update other navigator sections if relevant:**
   - New terrain discovered → add to terrain map
   - Questions resolved → remove or annotate in open questions
   - New questions surfaced → add to open questions
   - Direction shifted → update direction section
   - Reading order changed → update reading order

5. **Show proposed changes** and wait for confirmation.

6. **Apply** to navigator file.

---

## Navigator Awareness in Other Workflows

When a navigator is active (read at session start), its terrain and open questions inform other workflows:

**In dev-work:** The arrival surface gains a navigator reference. When the user asks "what's next" and a navigator has open questions, those are surfaced alongside iteration status.

**In explore:** If exploring a concept that a navigator's terrain references, the navigator's annotations provide context about why that concept matters to the active territory.

**In home:** Active navigators appear in the arrival surface.

---

## Lifecycle

| Phase | What Happens |
|-------|-------------|
| **Created** | Deep exploration produces initial navigator with terrain, reading order, open questions, first session log entry |
| **Active** | Updated across sessions. Terrain grows. Questions resolve and new ones surface. Session log accumulates. |
| **Completed** | Work resolves. Navigator becomes archival documentation of how a territory was explored and built. Status field changes to "Completed" with completion date. |

Completed navigators stay in `navigators/` — they're valuable as documentation.

---

## Do NOT:

- Create navigators for trivial or single-file territories — navigators are for cross-cutting possibility spaces
- Update the navigator without showing proposed changes first
- Treat the navigator as a task list — it maps terrain and holds questions, it doesn't assign work
- Remove session log entries — they're the temporal record
- Create a navigator without deep reading — a shallow navigator is worse than none (it gives false confidence about terrain coverage)
