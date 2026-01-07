---
description: Assess scribe system integrity after changes
allowed-tools: Read, Write, Glob, Bash
argument-hint: "[save] to persist results"
---

# /qino-scribe:diagnose

Assess the integrity of the scribe system. Run after significant changes to verify coherence, proportionality, and alignment.

## Overview

The scribe system has multiple interdependent components:
- Commands (orchestration)
- Agents (prep, prose, editorial)
- References (voice, craft, principles, foundation, layers, disturbance, story-lenses)
- Lens integrations (qino-lens sensitivities)

Changes in one component can create drift, contradiction, or gaps in others. This diagnostic surfaces issues before they appear in chapter output.

---

## Arguments

Arguments: `$ARGUMENTS`

- **save** — Write results to `diagnostics/[timestamp].md` for comparison

---

## The Components

Read these files to understand the current system state:

### Commands
- `commands/qino-scribe/chapter.md` — Main orchestration

### Agents
- `agents/scribe-prep.md` — World, Disturbance, Beat layers
- `agents/scribe-prose.md` — Fantasy author writing from constraint
- `agents/scribe-editorial.md` — Review and verification

### References
- `references/qino-scribe/voice.md` — Craft devices, line-level and chapter-level patterns
- `references/qino-scribe/craft.md` — Chapter format, world.md structure, arc shapes
- `references/qino-scribe/principles.md` — Relational substrate
- `references/qino-scribe/foundation.md` — World-seed configuration fields
- `references/qino-scribe/layers.md` — Layer flow, checkpoint formats
- `references/qino-scribe/disturbance.md` — Git diff interpretation
- `references/qino-scribe/story-lenses.md` — Twelve story lenses and sensitivities

### Lens Integration
- `../references/qino-lens/narrator.md`
- `../references/qino-lens/wanderer.md`
- `../references/qino-lens/companion.md`
- `../references/qino-lens/newcomer.md`

---

## Diagnostic Categories

### 1. Specificity/Universality

**Question:** Which patterns are truly universal to storytelling vs. specific to genre/world/preference?

**Check:**
- Read `voice.md` patterns — which assume a specific kind of story?
- Read `foundation.md` — are all configurable aspects captured?
- Read `principles.md` — are these universal or genre-specific?

**Flag if:**
- Patterns prescribe outcomes that should be configured (like hospitality was)
- World-specific assumptions are embedded in universal guidance
- Configuration options are missing for reasonable alternatives

**Report format:**
```
SPECIFICITY/UNIVERSALITY

Universal patterns (correctly so):
- [pattern] — applies to all storytelling

Patterns that may be too specific:
- [pattern] — assumes [specific thing], could be configured as [option]

Missing configuration options:
- [aspect] — no way to configure [reasonable alternative]
```

---

### 2. Proportionality

**Question:** Is space allocation appropriate across instruction types?

**Check:**
- Count lines in each reference file
- Compare: line-level vs chapter-level guidance
- Compare: constraints ("don't") vs possibilities ("available when")
- Compare: principle statements vs examples

**Flag if:**
- One category dominates inappropriately
- Important categories are underspecified
- Examples outnumber principles by >3:1 or <1:1

**Report format:**
```
PROPORTIONALITY

File sizes:
- voice.md: [lines] lines
- craft.md: [lines] lines
- principles.md: [lines] lines
- [etc.]

Balance:
- Line-level patterns: [count] patterns, [lines] lines
- Chapter-level patterns: [count] patterns, [lines] lines
- Constraints: [count]
- Possibilities: [count]
- Principles: [count]
- Examples: [count]

Observations:
- [imbalance or healthy ratio]
```

---

### 3. Signal/Noise

**Question:** Are instructions clear, non-redundant, and verifiable?

**Check:**
- Grep for similar concepts across files — are they stated consistently?
- Identify instructions that appear in multiple places
- Identify instructions that can't be verified (too vague)
- Identify instructions that conflict

**Flag if:**
- Same concept, different wording, in different files
- Instructions contradict each other
- Instructions are stated but never checked

**Report format:**
```
SIGNAL/NOISE

Redundancies:
- "[concept]" appears in: [file1], [file2] — consistent? [yes/no]

Conflicts:
- [file1] says: "[instruction]"
- [file2] says: "[conflicting instruction]"

Unverifiable:
- "[instruction]" — how would editorial check this?

Stated but not checked:
- "[instruction]" in [file] — not in editorial focus
```

---

### 4. Principle/Example Coherence

**Question:** Do examples demonstrate only what principles state?

**Check:**
- For each pattern in voice.md:
  - What does the principle say?
  - What do the examples show?
  - Do examples encode unstated preferences?

**Flag if:**
- Examples show things the principle doesn't mention
- Positive/negative examples differ on dimensions not discussed
- Examples accidentally model specific content choices

**Report format:**
```
PRINCIPLE/EXAMPLE COHERENCE

Aligned:
- [pattern]: principle and examples match

Drift:
- [pattern]: principle says [X], but examples also show [Y unstated]

Accidental encoding:
- [pattern]: examples model [specific choice] not required by principle
```

---

### 5. Agent Architecture

**Question:** Is agent separation principled and complete?

**Check:**
- What does each agent receive?
- What doesn't cross agent boundaries?
- Do agents have what they need?
- Do agents have access to things they shouldn't?

**Flag if:**
- Agent needs something it can't access
- Agent can access something that breaks intended separation
- Handoff doesn't include required information

**Report format:**
```
AGENT ARCHITECTURE

Prep Agent receives:
- [list]
Prep Agent cannot access:
- [list]

Prose Agent receives:
- [list]
Prose Agent cannot access:
- [list]

Editorial Agent receives:
- [list]
Editorial Agent cannot access:
- [list]

Gaps:
- [agent] needs [thing] but can't access it

Leaks:
- [agent] can access [thing] that breaks separation
```

---

### 6. Terminology Consistency

**Question:** Are concepts named consistently across the system?

**Check:**
- Key terms: wanderer, world behavior, story lens, sensitivity, pattern, principle
- Grep each term across all files
- Check if same concept has different names in different places

**Flag if:**
- Same concept, different names
- Same name, different concepts
- Outdated terminology from previous versions

**Report format:**
```
TERMINOLOGY CONSISTENCY

Consistent:
- "wanderer" — used consistently across [N] files
- "story lens" — used consistently

Inconsistent:
- "[concept]" also called "[other name]" in [file]

Outdated:
- "[old term]" in [file] — should be "[new term]"
```

---

### 7. Reference Authority

**Question:** Do agents know where to look for what?

**Check:**
- Each agent's "Reference Authority" or "Before Writing" section
- Are all referenced files still current?
- Are any referenced files outdated/merged/removed?
- Are there files that should be referenced but aren't?

**Flag if:**
- Reference to non-existent file
- Reference to file that was merged elsewhere
- Missing reference to relevant file

**Report format:**
```
REFERENCE AUTHORITY

Prep Agent references:
- [file] — exists? [yes/no], current? [yes/no]

Prose Agent references:
- [file] — exists? [yes/no], current? [yes/no]

Editorial Agent references:
- [file] — exists? [yes/no], current? [yes/no]

Missing references:
- [agent] should reference [file] for [purpose]
```

---

## Output Format

After running all checks, produce a summary:

```
─────────────────────────────────────────────────────────────────
SCRIBE DIAGNOSTIC — [timestamp]

  version    [git commit hash]
  status     [HEALTHY | ATTENTION NEEDED | CRITICAL]

─────────────────────────────────────────────────────────────────
SUMMARY

  [category]     [status]    [brief note]
  [category]     [status]    [brief note]
  ...

─────────────────────────────────────────────────────────────────
```

Then the full report for each category.

---

## Saving Results

If `save` argument provided:

```bash
mkdir -p diagnostics
```

Write to `diagnostics/[YYYY-MM-DD-HHMMSS].md`:

```markdown
# Scribe Diagnostic — [timestamp]

**Git commit:** [hash]
**Status:** [status]

---

[Full report content]
```

This allows comparison across versions:
- What changed since last diagnostic?
- Did a fix introduce new issues?
- Is the system trending toward coherence or drift?

---

## When to Run

Run this diagnostic:
- After merging reference files
- After adding new patterns or principles
- After changing agent boundaries
- After significant calibration sessions
- Before releasing a new version of qino-scribe

The diagnostic doesn't fix issues — it surfaces them for human decision.
