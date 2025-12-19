# qino Research — Specification

This document defines the structure and semantics of research workspaces.

---

## 1. Purpose of Research Workspaces

Research is **pre-concept** work:
- Explorative, uncertain, provisional
- May never become a concept
- Moves faster than concept development
- Accepts inconclusive results as valuable data

Research workspaces answer:
- What explorations are active?
- What qualities have been calibrated?
- What experiments are running?
- What has graduated to concepts-repo?

---

## 2. Folder Structure

```
research-repo/
├── manifest.json              # Central registry
├── explorations/              # Open-ended research threads
│   └── [id]/
│       ├── thread.md          # Living exploration document
│       └── fragments/         # Collected material
├── calibrations/              # Quality refinement outputs
│   └── [quality]/
│       ├── research.md        # Core principles, distinctions
│       ├── transformations.md # Transformation attempts
│       └── examples/          # Test corpus
├── experiments/               # Controlled tests
│   └── [date]_[id]/
│       ├── hypothesis.md      # What we're testing
│       ├── test-data/         # Crafted inputs
│       ├── results/           # Outputs and observations
│       └── analysis.md        # What we learned
└── graduated/                 # Archive of promoted work
    └── [date]_[id]/
        └── graduation-record.md
```

---

## 3. Manifest Schema

```json
{
  "version": 1,
  "type": "research",
  "explorations": [...],
  "calibrations": [...],
  "experiments": [...],
  "graduated": [...]
}
```

### 3.1 Exploration Entry

```json
{
  "id": "exploration-id",
  "name": "Human Readable Name",
  "path": "explorations/exploration-id/thread.md",
  "status": "active",
  "started": "2025-12-19T00:00:00Z",
  "last_touched": "2025-12-19T00:00:00Z",
  "threads": [
    "thread description — atmospheric sense"
  ]
}
```

**Status values:**
- `active` — Currently being explored
- `paused` — Set aside, may return
- `graduated` — Moved to concepts-repo
- `archived` — No longer active, kept for reference

**Threads:**
Similar to `held_threads` in concepts, but for research. Open questions being pursued.

### 3.2 Calibration Entry

```json
{
  "id": "quality-name",
  "name": "Quality Name",
  "path": "calibrations/quality-name/",
  "quality": "the aesthetic quality being calibrated",
  "status": "complete",
  "completed": "2025-12-19T00:00:00Z"
}
```

**Status values:**
- `in_progress` — Calibration ongoing
- `complete` — Principles extracted

### 3.3 Experiment Entry

```json
{
  "id": "experiment-id",
  "name": "Experiment Name",
  "path": "experiments/2025-12-19_experiment-id/",
  "hypothesis": "What we're testing",
  "status": "pending",
  "linked_calibration": "optional-calibration-id"
}
```

**Status values:**
- `pending` — Not yet started
- `running` — In progress
- `complete` — Finished with conclusions
- `inconclusive` — Finished without clear conclusions (still valuable)

### 3.4 Graduated Entry

```json
{
  "id": "graduated-item-id",
  "type": "note",
  "destination": "concepts-repo/notes/2025-12-19_item.md",
  "graduated": "2025-12-19T00:00:00Z",
  "source": "original-exploration-id"
}
```

**Type values:**
- `note` — Graduated as a note in concepts-repo
- `concept` — Graduated as a concept seed

---

## 4. Exploration Format

### thread.md

```markdown
# [Exploration Title]

**Started:** YYYY-MM-DD
**Status:** active|paused|graduated|archived

---

## The Question

[What drew you to this exploration?]

---

## [Section 1]

[Exploration content...]

---

## [Section 2]

[More content...]

---

## Open Threads

- [Thread 1 — atmospheric description]
- [Thread 2 — atmospheric description]
```

Explorations are freeform. Sections emerge from the work, not from a template.

### fragments/

Collected material that feeds the exploration:
- External sources
- Notes from other contexts
- Screenshots, diagrams
- Anything relevant

---

## 5. Calibration Format

Calibrations follow the structure produced by `attune:calibrate`:

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

[How calibration was conducted]

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

Test corpus used during calibration.

---

## 6. Experiment Format

### hypothesis.md

```markdown
# Hypothesis

[Clear statement of what we're testing]

## Background

[Context that led to this experiment]

## Method

[How we'll test this]

## Expected Outcomes

[What we expect to find if hypothesis is correct/incorrect]
```

### test-data/

Crafted inputs for the experiment. Named clearly.

### results/

Outputs and observations. May include:
- Generated outputs
- Comparison notes (from attune:compare)
- Screenshots
- Metrics

### analysis.md

```markdown
# Analysis

## Observations

[What we noticed]

## Conclusions

[What we learned — or "inconclusive" with notes on why]

## Implications

[What this suggests for future work]
```

---

## 7. Graduation

When research crystallizes into something worth preserving in concepts-repo.

### To Note

1. Distill to essence (5-10 words)
2. Create note file in concepts-repo
3. Add references to relevant concepts
4. Archive source in graduated/
5. Update research manifest

### To Concept Seed

1. Create minimal concept.md (just Real-World Impulse)
2. Copy relevant material to origins/
3. Add held_threads from exploration
4. Archive source in graduated/
5. Update both manifests

### graduation-record.md

```markdown
# Graduation: [title]

**Graduated:** YYYY-MM-DDTHH:MM:SSZ
**Destination:** [path in concepts-repo]
**Type:** note|concept

## What Moved

[Essence or summary]

## What Remains

[Threads or material that stayed in research]

## Why Now

[What made this ready]
```

---

## 8. Lifecycle Rules

### Exploration Creation

1. Create folder `explorations/[id]/`
2. Initialize thread.md with starting question
3. Create fragments/ directory
4. Add entry to manifest with status "active"

### Exploration Update

When exploration evolves:
- Update thread.md content
- Update last_touched in manifest
- Add/update threads array as open questions emerge

### Calibration Creation

Calibrations are typically created by `attune:calibrate`:
1. Create folder `calibrations/[quality]/`
2. Generate research.md and transformations.md
3. Add entry to manifest

### Experiment Lifecycle

1. **pending** — Created, not started
2. **running** — Test data created, in progress
3. **complete** — Analysis written, conclusions drawn
4. **inconclusive** — Analysis written, no clear conclusions

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
- `conceptsRepo` — Path to graduation destination
- `linkedConcepts` — Array of related concept IDs
- `description` — Human-readable purpose

---

## 10. Design Principles

### Research Welcomes Uncertainty

Unlike concepts (which stabilize), research can remain uncertain indefinitely. An exploration without conclusions is still valuable — it maps the territory.

### Graduation is Optional

Not all research becomes concepts. Some explorations inform thinking without ever graduating. That's fine.

### Fast Iteration

Research moves faster than concept development. Experiments can be created, run, and concluded in a single session.

### Accept Inconclusive Results

"Inconclusive" is a valid experiment outcome. It means we learned that this approach doesn't yield clear answers — useful data.

### Threads are Lightweight

Unlike concepts' 7-section structure, explorations have whatever sections emerge. Threads are just open questions, not requirements.
