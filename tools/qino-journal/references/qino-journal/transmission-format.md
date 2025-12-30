# Transmission Format

This document specifies the structure of transmission files.

---

## File Location

```
research-workspace/journal/transmissions/NNN-slug/
├── process.md         ← Process log
├── prep.md            ← Prep artifact
├── transmission.md    ← The transmission
└── student.md         ← Student state snapshot
```

**Naming:**
- NNN = 3-digit number, zero-padded (001, 002, ...)
- slug = kebab-case of title

---

## transmission.md Structure

```markdown
---
number: 1
slug: recognition-through-indirection
title: Recognition Through Indirection
date: 2025-12-29
arcs:
  - id: recognition-through-indirection
    title: Recognition Through Indirection
  - id: qualities-of-attention
    title: Qualities of Attention
threads:
  - ecosystem-modality tension
  - ecology language question
  - crystallization
reflection: |
  The pattern came before the naming. I keep forgetting this.
  When I try to name too early, the pattern goes rigid.
---

## Abstract

*Moving through two arcs today: "Recognition Through Indirection" and "Qualities of Attention."
Both emerged from building qino-world — the first about meaning preserved through distance,
the second about style as a quality of seeing.*

---

[Transmission body — 600-900 words]

[The Student's field notes. First person, present tense.
Questions, discoveries, confusion. Thinking aloud.]

---

## The Student

**Questions I'm holding:**
- Does naming enable perception, or close it?
- What happens at the membrane between levels?

**Connections I've noticed:**
- The tension between ecosystem and modality keeps appearing...

---

## Threads

**[[ecosystem-modality tension]]**
Holding both levels without collapsing either. The ecosystem has its logic;
individual tools have theirs. The tension is generative, not a problem to solve.

**[[crystallization]]**
When vague quality becomes speakable. Not definition — recognition.
The moment when "I know it when I see it" becomes "here is what makes it work."
```

---

## Frontmatter Fields

| Field | Type | Description |
|-------|------|-------------|
| `number` | integer | Transmission number (1, 2, 3...) |
| `slug` | string | URL-safe identifier |
| `title` | string | Human-readable title |
| `date` | string | ISO date (YYYY-MM-DD) |
| `arcs` | array | Arcs this transmission moves through |
| `arcs[].id` | string | Arc identifier |
| `arcs[].title` | string | Arc title |
| `threads` | array | Thread names referenced in body |
| `reflection` | string | Student's meta-learning note (multiline) |

---

## Sections

### Abstract

1-3 sentences orienting the reader:
- What arcs are being explored
- What question opens
- Contextualizes without spoiling

The abstract is *not* a summary. It's an invitation.

### Body

The Student's field notes. 600-900 words.

**Structure emerges from the inquiry:**
- No required sections
- Questions drive movement
- Confusion is texture
- Discovery happens in the prose

**Grounded in specific material:**
- Dates
- Arc names
- Concrete observations

### The Student Section

The Student's state at this moment:
- Questions held
- Connections noticed

This is temporal — reflects where the Student was when writing.

### Threads Section

Definitions for threads referenced in the body:
- 2-3 lines each
- For hover/click context
- Written for readers who haven't seen the thread before

---

## Reference Syntax

### Thread References

In body text, mark threads with double brackets:

```markdown
The [[ecosystem-modality tension]] keeps appearing.
```

Parser extracts `[[thread-name]]` for highlighting.

### Arc References

In body text, mark arcs with double braces:

```markdown
Looking at the {{recognition-through-indirection}} arc today.
```

Parser extracts `{{arc-id}}` for arc hover cards.

---

## Word Count Guidelines

| Section | Target |
|---------|--------|
| Abstract | 30-60 words |
| Body | 600-900 words |
| The Student | 50-100 words |
| Threads | 30-50 words each |

Total transmission: ~800-1200 words

---

## Process Log (process.md)

Created at transmission start, appended throughout:

```markdown
# Process Log — Transmission NNN

## Metadata
- **Created:** 2025-12-29T10:30:00Z
- **Arcs considered:** recognition-through-indirection, qualities-of-attention

---

## Prep Layer

### Arc Selection
**Arcs selected:**
- Recognition Through Indirection — [essence]
- Qualities of Attention — [essence]

**Relationship:** Same question from different angles

### Grounding Layer
**Framing options presented:**
1. [summary]
2. [summary]
3. [summary]

**Chosen:** 2

---

## Editorial Review — Pass 1

**Decision:** NEEDS REVISION
**Issues found:** 3

Line 23: "I realized that..." → show through question
Line 45: explanation mode
Line 67: too certain

**Notes:** Voice generally strong but drifts in middle section.

---

## Editorial Review — Pass 2

**Decision:** APPROVED
**Issues found:** 0

**Notes:** Revisions addressed all issues.

---

## Post-Prose

**Student updates:**
- Reflections: added
- Vocabulary: 2 terms introduced
- Connections: 1 added
- Questions: 1 opened, 1 held
```

---

## Manifest Entry

When transmission is complete, add to `journal/manifest.json`:

```json
{
  "number": 1,
  "slug": "recognition-through-indirection",
  "title": "Recognition Through Indirection",
  "date": "2025-12-29",
  "arcs": ["recognition-through-indirection", "qualities-of-attention"],
  "threads": ["ecosystem-modality tension", "ecology language question"],
  "reflection": "The pattern came before the naming..."
}
```
