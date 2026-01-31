# qino Research — Specification

This document defines the structure and semantics of research workspaces.

---

## 1. Purpose of Research Workspaces

Research is where ideas can **move before they stabilize**:
- Explorative, uncertain, provisional
- May never become a concept — and that's fine
- Moves faster than concept development
- Accepts inconclusive results as valuable data

Research workspaces answer:
- What inquiries are active?
- What qualities have been refined?
- What arcs have been captured?

---

## 2. Folder Structure

```
research-repo/
├── manifest.json              # Central registry
├── inquiries/                 # Open-ended research threads (was: explorations)
│   └── [id]/
│       ├── thread.md          # Living inquiry document
│       └── fragments/         # Collected material
├── qualities/                 # Aesthetic refinement (was: calibrations)
│   └── [quality]/
│       ├── research.md        # Core principles, distinctions
│       ├── transformations.md # Transformation attempts
│       └── examples/          # Test corpus
└── arcs/                      # Emergence patterns
    └── YYYY-MM-DD_[id].md     # Arc capture
```

---

## 3. Three Experiential Types

### Inquiries (following threads)

Open-ended following of threads. An inquiry starts with a question and accumulates observations, connections, partial answers.

**When to create:** When a question feels alive enough to hold across sessions.

### Qualities (refining aesthetics)

Aesthetic sensibility refinement. A quality starts vague and accumulates examples until principles crystallize.

**When to create:** When an aesthetic quality matters but isn't yet speakable.

### Arcs (emergence patterns)

How inquiry moved through the ecosystem — what touched what, what crystallized.

**When to create:** After a session where multiple threads connected, or something emerged that wasn't planned.

---

## 4. Manifest Schema

```json
{
  "version": 1,
  "type": "research",
  "inquiries": [...],
  "qualities": [...],
  "arcs": [...]
}
```

### 4.1 Inquiry Entry

```json
{
  "id": "inquiry-id",
  "name": "Human Readable Name",
  "path": "inquiries/inquiry-id/thread.md",
  "status": "active",
  "started": "2025-12-19T00:00:00Z",
  "last_touched": "2025-12-19T00:00:00Z",
  "threads": [
    "thread description — atmospheric sense"
  ],
  "sourceRepo": "../other-repo"
}
```

**Optional fields:**
- `sourceRepo` — Path to originating repo (only present for cross-repo inquiries)

**Status values:**
- `active` — Currently being explored
- `paused` — Set aside, may return
- `complete` — Finished (conclusions reached or question dissolved)

**Threads:**
Open questions being pursued within the inquiry.

### 4.2 Quality Entry

```json
{
  "id": "quality-name",
  "name": "Quality Name",
  "path": "qualities/quality-name/",
  "quality": "the aesthetic quality being refined",
  "status": "complete",
  "completed": "2025-12-19T00:00:00Z"
}
```

**Status values:**
- `in_progress` — Refinement ongoing
- `complete` — Principles extracted

### 4.3 Arc Entry

```json
{
  "id": "arc-id",
  "title": "Arc Title",
  "path": "arcs/2025-12-29_arc-id.md",
  "span": {
    "start": "2025-12-29",
    "end": "2025-12-29"
  },
  "repos": ["concepts-repo", "qino-research"],
  "status": "captured"
}
```

**Key fields for querying:**
- `span` — date range (for git matching when scribe queries)
- `repos` — which repos were involved (for scoping)

**Status values:**
- `captured` — Arc recorded

---

## 5. Inquiry Format

### thread.md

```markdown
# [Inquiry Title]

**Started:** YYYY-MM-DD
**Status:** active|paused|complete

---

## The Question

[What drew you to this inquiry?]

---

## [Section 1]

[Inquiry content...]

---

## [Section 2]

[More content...]

---

## Open Threads

- [Thread 1 — atmospheric description]
- [Thread 2 — atmospheric description]
```

Inquiries are freeform. Sections emerge from the work, not from a template.

### fragments/

Collected material that feeds the inquiry:
- External sources
- Notes from other contexts
- Screenshots, diagrams
- Anything relevant

---

## 6. Quality Format

Qualities follow the structure produced by `attune:calibrate`:

### research.md

```markdown
# [Quality] — Research

## Core Principle

[One-sentence definition of what qualifies]

## What Qualifies vs. What Doesn't

| ✓ Works | ✗ Doesn't Work |
|---------|----------------|
| [pattern] | [anti-pattern] |

## Key Distinctions

1. [Distinction 1]
2. [Distinction 2]

## Inspiration Index

| Source | Why Relevant | How It Guides |
|--------|--------------|---------------|
| [concept] | [relevance] | [application] |
```

### transformations.md

```markdown
# [Quality] — Transformations

## Process

[How refinement was conducted]

## Transformation Attempts

### Example 1

**Original:** [failed example]

| Attempt | Source | Result | Feedback |
|---------|--------|--------|----------|
| 1 | [technique] | [output] | [response] |

**Final:** [working version] or "intractable"

## Extracted Principles

1. [Principle from successful transformations]
2. [Another principle]

## Anti-Patterns

- [What consistently failed]
```

### examples/

Test corpus used during refinement.

---

## 7. Arc Format

```markdown
# [Arc Title]

**Span:** YYYY-MM-DD (to YYYY-MM-DD if multi-day)
**Essence:** [One sentence — what moved]

---

## What Touched What

- [starting point] — where inquiry began
- [what it touched] — concept, inquiry, note
- [what it touched]
- [what emerged]

## The Shape

[Narrative of how the arc traveled — not transcript, but the shape of movement.
Describe what happened without categorizing it.]

## What Emerged

**Artifacts:**
- [notes created or touched]
- [inquiries opened or updated]
- [concepts touched]

**Threads:**
- [questions opened for future inquiry]

## Scribe Context

[Only if relevant to implementation work:]
- Repo: [which repo]
- Relevant commits: [if known]
- Chapter context: [what scribe should know]
```

---

## 8. Information Flow

### Into arcs (capture)

Session work → artifacts created → arc capture (`/qino:arc`)

Arcs record:
- What dates this work spanned
- What repos were involved
- What artifacts were created (verifiable links)
- The narrative shape (for understanding)

### Out of arcs (query)

**For scribe (chapter prep):**

When scribe-prep agent prepares a chapter:

1. Get git range from manifest (`last_ref..HEAD`)
2. Extract date range from commits (earliest to latest commit dates)
3. Check if current repo has `researchRepo` configured in `.claude/qino-config.json`
4. If yes, query research manifest for arcs where:
   - `span.start` ≤ latest commit date AND `span.end` ≥ earliest commit date
   - `repos` array contains current repo name (or is empty)
5. Read matching arc files
6. Include relevant inquiry context in prep.md Grounding section

This reveals what inquiry was happening alongside the code changes — the conceptual work that may illuminate the commits.

**For relay (research transmissions):**

When relay creates a transmission:

1. Query arcs by recency (most recent first)
2. Find arcs that haven't been transmitted
3. Use arc's narrative shape to structure transmission
4. The Student walks alongside readers through the arc's path

See `qino-relay` for implementation.

**Key principle:** The matching is agent work, not deterministic code. Arcs provide context; the agent decides relevance.

---

## 9. qino-config for Research Repos

```json
{
  "repoType": "research",
  "conceptsRepo": "../concepts-repo",
  "linkedConcepts": ["concept-1", "concept-2"],
  "description": "Research space description"
}
```

**Fields:**
- `repoType` — Must be "research"
- `conceptsRepo` — Path to concepts destination
- `linkedConcepts` — Array of related concept IDs
- `description` — Human-readable purpose

---

## 10. Cross-Repo Research

Research commands can be invoked from non-research repos that have a `researchRepo` configured.

### How It Works

When `/qino-research:init` (or other research commands) runs:

1. Check current repo's `.claude/qino-config.json`
2. If `repoType: "research"` → use current directory as workspace
3. If `researchRepo` field exists → use that path as research workspace
4. If neither → error: "no research workspace configured"

### Example: Tool Repo Config

```json
{
  "repoType": "tool",
  "researchRepo": "../qino-research",
  "conceptsRepo": "../concepts-repo"
}
```

Running `/qino-research:init` from this repo will:
- Create inquiries in `../qino-research/inquiries/`
- Update manifest at `../qino-research/manifest.json`
- Record `sourceRepo` in the inquiry entry for context

---

## 11. Design Principles

### Research Welcomes Uncertainty

Unlike concepts (which stabilize), research can remain uncertain indefinitely. An inquiry without conclusions is still valuable — it maps the territory.

### Arcs are Evidence

Arcs don't need maintenance — they're evidence of ecosystem participation. They accumulate as ecosystem memory without requiring upkeep.

### Fast Iteration

Research moves faster than concept development. Inquiries can evolve rapidly; arcs hold the shape of movement while it's happening.

### Accept Inconclusive Results

An inquiry without clear conclusions is still valuable. It means we learned something about the territory.

### Threads are Lightweight

Unlike concepts' 7-section structure, inquiries have whatever sections emerge. Threads are just open questions, not requirements.
