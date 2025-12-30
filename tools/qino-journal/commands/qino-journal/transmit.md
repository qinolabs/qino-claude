---
description: Create a research transmission from selected arcs
allowed-tools: Read, Write, Edit, Glob, Bash
argument-hint: "(arc-id) | (arc-id arc-id ...)"
---

# /qino-journal:transmit

Create a research transmission — the Student voicing arc material for readers.

## Overview

The journal stays close to source. Arcs are content, not fuel. The Student's job is to *encounter* the material with genuine uncertainty, not to invent from constraint.

**Flow:**
1. **Arc selection** — which arc(s) to transmit
2. **Gather context** — arc files + student.md + recent transmissions
3. **Prose agent** — writes in Student's voice (sees everything)
4. **Editorial agent** — reviews voice integrity
5. **Post-prose** — update student.md, manifest, snapshots

No prep layer. The prose agent sees the arc directly. The constraint is *voice*, not *content*.

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
Use agent: journal-prose
ultrathink: Voice work benefits from deliberation.

Pass to agent:
- The transmission directory path
- The arc file content(s) — full text
- The student.md content
- Recent transmission content (for threading)
- The next transmission number
```

The prose agent:
- Reads the arc(s) as source material
- Knows the Student's current state
- Writes the transmission in the Student's voice
- Presents draft to orchestrator

**No prep layer.** The prose agent sees everything. The constraint is voice, not content.

---

## Phase 5: Editorial Review

When the prose agent presents its draft, spawn the editorial agent:

```
Use agent: journal-editorial
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

### Create Snapshot

```bash
cp [journal]/student.md [journal]/transmissions/NNN-slug/student.md
```

### Update Manifest

Update `[research-workspace]/journal/manifest.json`:
- Add new transmission to transmissions array
- Update lastTransmission number

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

   ## Reflections
   *Short internal meta-learning notes. The Student's own noticing.*

   ## What Has Been Transmitted
   *Vocabulary readers know. The Student can reference without re-explaining.*

   ## Connections Noticed
   *Cross-transmission insights. Accumulated seeing.*

   ## Questions Held
   *Uncertainties carried forward. May resolve, may remain open.*

   ## Recent Memory
   *Threading context. Recent transmissions vivid, older ones echoes.*
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
  manifest   transmission NNN added

─────────────────────────────────────────────────────────────────
                                                      [word count]
```

---

## Why No Prep Layer

The prep layer in qino-scribe exists because git commits must be *transformed* into story material. Commits are raw; they need interpretation. The prose agent must NOT see "parser refactor" — only the world behavior that emerged from prep.

Arcs are different. Arcs are already interpreted. They have essence, chain, shape. The arc IS the content — it just needs to be voiced.

**The constraint in qino-journal is voice, not content.**

The prose agent sees the arc directly. The Student encounters the actual material. The editorial agent ensures voice integrity. No transformation layer needed.

---

## Reference Documents

- `references/qino-journal/voice.md` — The Student's voice patterns
- `references/qino-journal/student-guide.md` — How the Student works
- `references/qino-journal/transmission-format.md` — Format specification

---

## Guardrails

- Student discovers, not explains
- Genuine uncertainty, not performed humility
- Arc content stays recognizable (dates, names, chains)
- Questions open, not close
- First person, present tense
- Confusion isn't edited out
- Something new is noticed, not just reported
