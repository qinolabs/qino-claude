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
    name: Recognition Through Indirection
    essence: How metaphorical distance can preserve meaning
  - id: qualities-of-attention
    name: Qualities of Attention
    essence: Style as a quality of seeing
threads:
  - name: ecosystem-modality tension
    context: Holding both levels without collapsing either. The ecosystem has its logic; individual tools have theirs.
  - name: crystallization
    context: When vague quality becomes speakable. Not definition — recognition.
phrases:
  - text: meaning-searching versus meaning-finding
    source: Recognition Through Indirection
  - text: the between-level space
    source: Recognition Through Indirection
---

# Recognition Through Indirection

*Dec 29. Walking through two arcs today—both emerged from building qino-world,
but I'm starting to see they're asking the same question from different angles.*

[Body continues — 600-900 words]

The arc uses the phrase >>meaning-searching versus meaning-finding<<. There's
something in that hyphen — the dash before "searching" and "finding" — that
makes meaning the object rather than the subject.

[The Student's field notes. First person, present tense.
Questions and discoveries woven into the prose.
Ends with weight, not summary.]

---

## Where I Am Now

The pattern came before the naming. I keep forgetting this.
When I try to name too early, the pattern goes rigid.

Something about >>the between-level space<< — where the meaning actually lives.
I can feel its shape but not its edges yet.
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
| `arcs[].name` | string | Arc name |
| `arcs[].essence` | string | One-line description of what the arc is about |
| `threads` | array | Threads referenced in body (with context for hover) |
| `threads[].name` | string | Thread name (used for highlighting) |
| `threads[].context` | string | 1-2 sentence context (shown on hover) |
| `phrases` | array | Phrases from arc material that landed (colored inline) |
| `phrases[].text` | string | The exact phrase text (for matching) |
| `phrases[].source` | string | Where it came from (arc name, optional) |

---

## Sections

### Opening (No Separate Abstract)

The transmission begins directly with the Student's voice. The opening lines ARE the entry—not a separate abstract to get through.

**Good opening:**
> *Dec 29. Walking through two arcs today—both emerged from building qino-world,
> but I'm starting to see they're asking the same question from different angles.*

**Avoid:**
> ## Abstract
> *This transmission explores the relationship between...*

The reader joins the Student mid-thought. No barrier.

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

**Questions and connections woven in:**
Questions emerge naturally in the prose, not listed afterward. Connections are discovered in the writing.

### Where I Am Now (Coda)

The coda continues the Student's voice — it **inhabits** rather than announces. No labels like "Still holding:" or "Starting to see:". The Student is still *in* the material, not stepping back to summarize it.

```markdown
---

## Where I Am Now

The question about perception as something systems do — I can feel its shape but not its edges. When I try to follow where it leads, the ground isn't solid yet.

Something about how the arc stayed indirect even when explaining indirection. That feels intentional. Like the teaching and the content are the same thing.

I don't know what to do with this yet.
```

**What makes this work:**
- No bullet lists announcing what's held or seen
- Continues the texture of the prose — same voice, same uncertainty
- Can end at an edge without marking it
- Meta-learning happens *in* the writing, not labeled afterward

**The principle:** If the body ends with weight, the coda should hold that weight. If the body ends at an edge, the coda should inhabit that edge. The coda doesn't step outside to describe — it stays inside.

**When the Student is genuinely uncertain, let the coda be uncertain:**
```markdown
---

## Where I Am Now

Maybe that's the point.
```

A single sentence can be a coda if it holds the weight.

**Optional:** When the body closes itself naturally, the coda can be omitted entirely.

### Threads (No Separate Section)

Thread definitions live in frontmatter, not a body section. The surface renders them as inline hover cards.

In body text, mark threads with double brackets:
```markdown
The [[ecosystem-modality tension]] keeps appearing.
```

Reader hovers → sees context from frontmatter. No scrolling to find definitions.

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

### Phrase References (Phrases That Land)

When the Student encounters a phrase from the arc material that has weight, mark it with double angle brackets:

```markdown
The arc uses the phrase >>meaning-searching versus meaning-finding<<. There's something in that hyphen...
```

Parser extracts `>>phrase<<` and renders in color (cycling through phrase colors like arc colors in chronicles). The phrase must match an entry in the `phrases` frontmatter array.

**When to use:**
- Phrases the Student pauses with, responds to
- Turns of words from the arc that have weight
- Material that has its own voice

**Not for:**
- All quotes — only phrases that *land*
- The Student's own phrasing
- Generic descriptions

---

## Word Count Guidelines

| Section | Target |
|---------|--------|
| Opening lines | 20-40 words |
| Body | 600-900 words |
| Where I Am Now | 50-100 words |

Total transmission: ~700-1000 words

Thread context in frontmatter: 1-2 sentences each (not counted toward body)

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
  "arcs": [
    { "id": "recognition-through-indirection", "name": "Recognition Through Indirection", "essence": "How metaphorical distance can preserve meaning" },
    { "id": "qualities-of-attention", "name": "Qualities of Attention", "essence": "Style as a quality of seeing" }
  ],
  "threads": [
    { "name": "ecosystem-modality tension", "context": "Holding both levels without collapsing either." },
    { "name": "crystallization", "context": "When vague quality becomes speakable." }
  ],
  "phrases": [
    { "text": "meaning-searching versus meaning-finding", "source": "Recognition Through Indirection" },
    { "text": "the between-level space", "source": "Recognition Through Indirection" }
  ]
}
```
