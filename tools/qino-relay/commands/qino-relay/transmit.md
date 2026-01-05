---
description: Create a research transmission from selected arcs
allowed-tools: Read, Write, Edit, Glob, Bash
argument-hint: "(arc-id) | (arc-id arc-id ...)"
---

# /qino-relay:transmit

Create a research transmission — the Student walking alongside readers through arc material.

## Overview

The journal shares meaningful findings from your internal research process. The Student is a **reader companion** — someone who has learned this material and walks alongside readers as they encounter it.

**Flow:**
1. **Arc selection** — which arc(s) to transmit
2. **Gather context** — arc files + student.md + recent transmissions + concepts registry
3. **Reader journey prep** — notes on what readers would struggle with
4. **Prose agent** — writes in Student's voice (as companion), knows available concepts
5. **Editorial agent** — reviews voice integrity and reader-companionship
6. **Post-prose** — update student.md, concepts.md, manifest, snapshots

The prose agent sees everything. The constraint is *voice for the reader* — not just voicing the arc, but voicing the reader's journey through it.

---

## Arguments

Arguments: `$ARGUMENTS`

- **Arc IDs** (optional): One or more arc IDs to include. If empty, suggest recent arcs.

---

## Before You Begin

### Locate the Research Workspace

Find the research workspace via `.claude/qino-config.json`:

```bash
cat .claude/qino-config.json
```

The research workspace is either:
- Current directory if `repoType: "research"`
- Path specified in `researchRepo` field

### Locate or Initialize Journal

Check if `journal/` exists in the research workspace:

```
research-workspace/
├── manifest.json
├── arcs/
└── journal/               ← Check for this
    ├── student.md
    ├── manifest.json
    └── transmissions/
```

If no journal exists, this is the first transmission — see First Transmission Initialization below.

---

## Phase 1: Arc Selection

### If Arc IDs Provided

Confirm the arcs exist:

```bash
ls [research-workspace]/arcs/*[arc-id]*.md
```

### If No Arc IDs Provided

Read the research manifest and find recent arcs:

```bash
cat [research-workspace]/manifest.json
```

Present recent arcs:

```
─────────────────────────────────────────────────────────────────
recent arcs

  1 → [Arc Title]
      essence: [one sentence]
      span: [date range]

  2 → [Arc Title]
      essence: [one sentence]
      span: [date range]

  3 → [Arc Title]
      essence: [one sentence]
      span: [date range]

─────────────────────────────────────────────────────────────────
which arc(s)? (comma-separated, e.g., "1" or "1,2")
─────────────────────────────────────────────────────────────────
```

Wait for user selection.

---

## Phase 2: Gather Context

Read and hold:

1. **Arc file(s):** Full content from `[research-workspace]/arcs/`
2. **student.md:** Current Student state from `[research-workspace]/journal/student.md`
3. **Recent transmissions:** Last 1-2 transmissions for threading context
4. **Journal manifest:** To get next transmission number
5. **Concepts registry:** Read `[research-workspace]/journal/concepts.md` for already-referenced concepts
6. **Concepts manifest:** Read `[concepts-repo]/manifest.json` for available concept shapes (via `conceptsRepo` in qino-config.json)

---

## Phase 2.5: Reader Journey Prep

Before spawning the prose agent, create reader journey notes. The Student is a reader companion — these notes help voice the reader's encounter with the material.

1. **Consider the reader**: Someone curious but without comprehensive qino knowledge
2. **Write brief notes** to `[transmission-dir]/reader-journey.md`:

```markdown
# Reader Journey — Transmission NNN

## They Won't Already Know
- [Concepts, vocabulary, context they're missing]

## They Might Struggle With
- [Abstractions, non-obvious connections, subtle distinctions]

## Questions They'd Ask
- [What a curious newcomer would genuinely want to know]

## Make Concrete
- [What needs examples or grounding]
```

3. **Pass these notes to the prose agent** along with arc content

See `.claude/references/qino-relay/reader-journey-guide.md` for detailed guidance.

---

## Phase 3: Initialize Working Directory

Create the transmission working directory:

```bash
mkdir -p [research-workspace]/journal/transmissions/NNN-wip
```

Write initial process.md:

```markdown
# Process Log — Transmission NNN

## Metadata
- **Created:** [ISO timestamp]
- **Arcs:** [arc titles]

---
```

---

## Phase 4: Prose Agent

Spawn the prose agent with full context:

```
Use agent: relay-prose
ultrathink: Voice work benefits from deliberation.

Pass to agent:
- The transmission directory path
- The arc file content(s) — full text
- The student.md content
- Recent transmission content (for threading)
- The reader journey notes
- The next transmission number
- The concepts registry (concepts.md) — what concepts readers already know
- The concepts manifest — available concepts the Student can reference
```

The prose agent:
- Reads the arc(s) as source material
- Knows the Student's current state
- Uses reader journey notes to voice the reader's encounter
- Writes the transmission in the Student's companion voice
- Presents draft to orchestrator

**The constraint is voice for the reader.** The prose agent sees everything. The Student walks alongside a reader encountering this material — asking their questions, voicing their struggle, making abstract concrete.

---

## Phase 5: Editorial Review

When the prose agent presents its draft, spawn the editorial agent:

```
Use agent: relay-editorial
ultrathink: Careful review benefits from deliberation.

Pass to agent:
- The path to the draft: [transmission-dir]/transmission.md
- The path to process.md: [transmission-dir]/process.md
- The pass number: 1 (or 2 for second pass)
```

The editorial agent:
1. Reads the draft transmission
2. Checks voice integrity (Student's voice, not summary voice)
3. Returns either `APPROVED` or specific line-level edits

---

## Phase 6: Revision Loop

**If APPROVED:** Proceed to Phase 7.

**If NEEDS REVISION:**

1. Editorial returns edits:
   ```
   NEEDS REVISION (N issues)

   Line 23: "I realized that..." → show realization through question
   Line 45: summary mode — Student should discover, not report
   ```

2. Pass edits to prose agent:
   ```
   Apply these specific edits to [transmission-dir]/transmission.md
   Do not rewrite sections not flagged.
   ```

3. Second editorial pass if needed

**Maximum 2 editorial passes.**

---

## Phase 7: Finalize Directory

Rename working directory to match title:

1. Extract title from transmission.md frontmatter
2. Convert to kebab-case slug
3. Rename: `mv [journal]/transmissions/NNN-wip [journal]/transmissions/NNN-slug`

---

## Phase 8: Post-Prose Updates

### Emergent Analysis

Read the approved transmission and detect:
- **Vocabulary introduced:** terms defined, concepts named
- **Connections made:** cross-arc insights, threading references
- **Questions opened/closed:** explicit uncertainties
- **Concepts referenced:** ecosystem concepts from frontmatter `concepts` array (for concepts.md update)

### Student State Update

Suggest updates to student.md:

```
─────────────────────────────────────────────────────────────────
student.md updates

  reflections   [suggested internal note]
  vocabulary    [terms introduced]
  connections   [insights to add]
  questions     [opened / closed]

─────────────────────────────────────────────────────────────────
confirm updates? (y/n/edit)
─────────────────────────────────────────────────────────────────
```

Apply confirmed updates to `[research-workspace]/journal/student.md`.

### Concepts Registry Update

Detect new concepts referenced in the transmission:

1. **Parse transmission frontmatter** for `concepts` array (list of concept IDs)
2. **Compare against concepts.md** — which concepts are already registered?
3. **For each new concept:**
   - Look up the concept in `[concepts-repo]/manifest.json`
   - Read the concept file to extract shape (first paragraph of "Real-World Impulse" section, condensed to one sentence)
   - Prepare entry for concepts.md

Present new concepts for confirmation:

```
─────────────────────────────────────────────────────────────────
concepts.md updates

  adding   qino-relay
           Shape: [extracted/derived shape]
           First appeared: NNN — [Transmission Title]

  adding   qino-sense
           Shape: [extracted/derived shape]
           First appeared: NNN — [Transmission Title]

─────────────────────────────────────────────────────────────────
confirm updates? (y/n/edit)
─────────────────────────────────────────────────────────────────
```

For each confirmed concept, append to `[research-workspace]/journal/concepts.md`:

```markdown
---

## [concept-id]

**Shape:** [One sentence description]

**First appeared:** NNN — [Transmission Title]
```

### Create Snapshot

```bash
cp [journal]/student.md [journal]/transmissions/NNN-slug/student.md
```

### Update Manifest

Update `[research-workspace]/journal/manifest.json`:
- Add new transmission to transmissions array (lean format — IDs only, no prose)
- Include `relay_version` from `.claude/references/qino-relay/version.json`
- Update lastTransmission number

```json
{
  "number": 1,
  "slug": "what-you-notice",
  "title": "What You Notice",
  "date": "2026-01-05",
  "relay_version": "0.22.4",
  "arcs": ["qualities-of-attention"],
  "threads": ["activation-through-use", "tool-shapes-hands"],
  "concepts": ["tech-qino-lens", "cli-qino-scribe"]
}
```

The manifest is an index — prose (context, essence) lives in transmission frontmatter.

---

## First Transmission Initialization

When no journal exists:

1. **Create directory structure**
   ```bash
   mkdir -p [research-workspace]/journal/transmissions
   ```

2. **Create initial student.md**
   ```markdown
   # The Student

   This file holds the Student's accumulated learning across transmissions. Some sections flow into each transmission's "Where I Am Now" coda; others are context for the prose agent.

   ---

   ## Reflections

   *What the Student notices about their own learning. Meta-learning, not content insights.*

   **Format:** Dated entries, 1-2 sentences each. First person.
   **Flows to:** `metaLearning` field in transmission coda (most recent relevant reflection).

   ### [Date]
   [What the Student noticed about how they're learning, not what they learned]

   ---

   ## What Has Been Transmitted

   *Vocabulary readers now share. The Student can reference without re-explaining.*

   **Format:** `term` — definition (Transmission NNN)
   **Flows to:** Prose agent context only. Not in transmission StudentState.
   **Purpose:** Threading. The Student knows what words readers already have.

   ---

   ## Connections Noticed

   *Cross-transmission insights. Patterns that recur across different material.*

   **Format:** Statement with transmission references. One line each.
   **Flows to:** `connectionsNoticed[]` in transmission coda (relevant subset).
   **Quality:** Names a connection, not just lists related things.

   ---

   ## Questions Held

   *Uncertainties the Student carries forward. May resolve, may transform, may remain open.*

   **Format:** Question or tension. Brief context optional.
   **Flows to:** `questionsHeld[]` in transmission coda (relevant subset).
   **Lifecycle:** Some close, some stay open, some transform into new questions.

   ---

   ## Recent Memory

   *Threading context. What's vivid enough to reference without re-explaining.*

   **Format:** `Transmission NNN: [title]` — 1-2 sentence summary of key movement.
   **Flows to:** Prose agent context only. Not in transmission StudentState.
   **Lifecycle:** Keep 2-3 most recent. Older transmissions migrate their vocabulary, connections, and questions to other sections.
   ```

3. **Create manifest.json**
   ```json
   {
     "version": 1,
     "transmissions": [],
     "lastTransmission": 0
   }
   ```

4. **Proceed with transmission**

---

## Transmission Directory Structure

```
journal/transmissions/NNN-slug/
├── process.md         ← Process log
├── transmission.md    ← The transmission
└── student.md         ← Student state snapshot
```

No prep.md. The arc is the source; the transmission is the voice.

---

## Completion

When done, announce:

```
─────────────────────────────────────────────────────────────────
transmission NNN — [Title]

  [One line: what the Student moved through]

  holding: [key question or connection]

─────────────────────────────────────────────────────────────────
updated

  student    [reflections, vocabulary, connections]
  concepts   [new concepts added, if any]
  manifest   transmission NNN added

─────────────────────────────────────────────────────────────────
                                                      [word count]
```

---

## Why No Prep Layer (But Reader Journey Notes)

The prep layer in qino-scribe exists because git commits must be *transformed* into story material. Commits are raw; they need interpretation.

Arcs are different. Arcs are already interpreted. They have essence, path, shape. The arc IS the content.

**But the Student is a reader companion, not just a voice.**

The Student has learned this material. But readers haven't. Reader journey notes help the prose agent voice the *reader's* encounter with the material — their questions, their struggle, their need for concreteness.

This isn't a transformation layer. The arc content stays visible. But the Student walks alongside a reader, not just through the material.

---

## Reference Documents

- `.claude/references/qino-relay/voice.md` — The Student's voice patterns
- `.claude/references/qino-relay/student-guide.md` — How the Student works
- `.claude/references/qino-relay/transmission-format.md` — Format specification
- `.claude/references/qino-relay/reader-journey-guide.md` — Reader journey prep

---

## Guardrails

- Student is a companion, not a discoverer — voices the reader's journey
- Uncertainty is genuine to the reader's experience, not performed
- Arc content stays recognizable (dates, names, chains)
- Questions are ones a reader would ask
- First person, present tense
- Difficulty is visible, not edited out
- Abstract material gets made concrete
- Reader feels accompanied, not lectured
