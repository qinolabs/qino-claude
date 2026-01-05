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

Frontmatter contains **prose only** — content with context for hover cards and highlighting. All metadata (number, slug, title, date, version) lives in `journal/manifest.json`.

```markdown
---
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
concepts:
  - id: qino-world
    context: "The app that revealed recognition-through-indirection"
---

# Recognition Through Indirection

*Dec 29. Walking through two arcs today—both emerged from building qino-world,
but I'm starting to see they're asking the same question from different angles.*

[Body continues — 600-900 words]

The arc uses the phrase [meaning-searching versus meaning-finding](qino:phrase/meaning-searching%20versus%20meaning-finding). There's
something in that hyphen — the dash before "searching" and "finding" — that
makes meaning the object rather than the subject.

[The Student's field notes. First person, present tense.
Questions and discoveries woven into the prose.
Ends with weight, not summary.]

---

## Where I Am Now

The pattern came before the naming. I keep forgetting this.
When I try to name too early, the pattern goes rigid.

Something about [the between-level space](qino:phrase/the%20between-level%20space) — where the meaning actually lives.
I can feel its shape but not its edges yet.
```

---

## Frontmatter Fields

Frontmatter is **prose only**. Metadata lives in manifest.

| Field | Type | Description |
|-------|------|-------------|
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
| `concepts` | array | Ecosystem concepts referenced in this transmission |
| `concepts[].id` | string | Concept identifier (from ecosystem manifest) |
| `concepts[].context` | string | Transmission-specific framing (1-2 sentences) |

---

## The Arrival Section

The transmission includes a prose section called "The Arrival" — the emergence story of how inquiry reached this point. This section appears between the H1 title and the Student's body, separated by a horizontal rule.

The journal app extracts this section and renders it in a device frame. The Student reads the arrival alongside the reader — both witness how inquiry traveled.

### Structure

```markdown
# [Title]

## The Arrival

[2-4 paragraphs of prose showing how inquiry moved — uses existing
markup syntax for concepts, tools, arcs]

---

*[Opening lines — Student's voice begins]*

[Body continues]
```

### Parsing Rules

- **H1** = Transmission title
- **`## The Arrival`** = Emergence section (parser extracts content under this heading)
- **`---`** = Separator marking end of arrival, beginning of Student's body
- **Italic opening** = Student's voice begins

### Example

```markdown
# What You Notice

## The Arrival

[Scribe](qino:concept/cli-qino-scribe) needed to see differently. The
chronicle prose kept coming out flat — describing events rather than
inhabiting them. The wanderer was being reported on, not *being* somewhere.

The obvious fix would be technique. Better sentences. Stronger verbs. But
the question that surfaced was different: how do you shift what you notice?
Not paint applied afterward — perception itself changing.

Then something strange happened. A question used to generate world behavior
— "What would the world DO?" — turned out to be the answer. That question
shifts attention from description to agency. The forest isn't just trees
and shadow; it's patient, waiting, indifferent to your passing.

And [qino-lens](qino:concept/tech-qino-lens) — dormant for weeks,
undefined — suddenly woke up. Not through more definition. Through being
needed. Through /qino:attune refining what "wanderer's presence" meant.
Through use.

---

*Dec 18. There's an arc I've been walking through called Qualities of
Attention. It started with a problem: the prose kept coming out flat.*

[Student's body continues — 600-900 words]
```

### App Rendering

The journal app renders The Arrival in a device frame:

```
╭────────────────────────────────────────────────────────────╮
│  ◈  INCOMING                                               │
│                                                            │
│  What You Notice                                           │
│                                                            │
│  [The Arrival content rendered here]                       │
│                                                            │
│  Concepts and tools get hover behavior from existing       │
│  markup: [text](qino:concept/id), /tool:command            │
│                                                            │
╰────────────────────────────────────────────────────────────╯
```

The Student reads this alongside the reader — both may find it cryptic (tool names are real ecosystem elements), and both learn from repeated exposure across transmissions.

### Writing Guidelines

The Arrival narrative (2-4 paragraphs) should show:

1. **What started it** — the initial impulse or charge
2. **Sideways turns** — unexpected connections, byproducts becoming inquiries
3. **Questions that drove forward** — the epistemic bias made visible
4. **Pattern recognition** — when scattered things revealed themselves as one thing

**Use existing markup syntax:**
- `[text](qino:concept/id)` — ecosystem concepts (hover shows shape + context)
- `/qino:command` — tool commands (app can add hover behavior)
- `[text](qino:arc/id)` — arc references
- `[text](qino:thread/name)` — thread references

**Voice:** Present tense. Show the shape of how inquiry travels, not just what was found. The arrival is prose, not structured data — it tells the emergence story.

### Parallel Learning

| Layer | Learns about | Through |
|-------|--------------|---------|
| Student (in-world) | the material — the arc content | encountering transmissions on their device |
| Reader (real-world) | the qino ecosystem — tools, arcs, how emergence happens | encountering the same arrival |

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

All references use Markdown links with `qino:` schemes. Display text appears in the link text and can be customized.

### Thread References

Mark threads with `[text](qino:thread/name)` links:

```markdown
The [ecosystem-modality tension](qino:thread/ecosystem-modality-tension) keeps appearing.
```

Parser extracts `[text](qino:thread/id)` for highlighting. Display text is what readers see; the id matches the thread definition in frontmatter.

**When to use:**
- Important threads that recur in the transmission
- Terms that need contextual explanation

### Arc References

Mark arcs with `[text](qino:arc/id)` links:

```markdown
Looking at the [recognition through indirection](qino:arc/recognition-through-indirection) arc today.
```

Parser extracts `[text](qino:arc/id)` for arc hover cards. Display text is shown to readers.

**When to use:**
- References to specific arcs being walked through
- First or most meaningful mention of an arc

### Phrase References (Phrases That Land)

When the Student encounters a phrase from the arc material that has weight, mark it with `[text](qino:phrase/...)` links:

```markdown
The arc uses the phrase [meaning-searching versus meaning-finding](qino:phrase/meaning-searching%20versus%20meaning-finding). There's something in that hyphen...
```

Parser extracts `[text](qino:phrase/...)` and renders as bold. The phrase text (in the URL) must match an entry in the `phrases` frontmatter array.

**When to use:**
- Phrases the Student pauses with, responds to
- Turns of words from the arc that have weight
- Material that has its own voice

**Not for:**
- All quotes — only phrases that *land*
- The Student's own phrasing
- Generic descriptions

### Concept References

Mark ecosystem concepts with `[text](qino:concept/id)` links:

```markdown
The [World](qino:concept/qino-world) revealed something unexpected about indirection.
```

- `id` comes from the ecosystem manifest (concepts registry)
- Display text is what readers see (can differ from the concept name)
- The concept must have an entry in the `concepts` frontmatter array

**Frontmatter entry:**

```yaml
concepts:
  - id: qino-world
    context: "The app that revealed recognition-through-indirection"
```

The `context` field provides transmission-specific framing — how this concept matters to *this* transmission. This context appears on hover, helping readers understand the concept's role here.

**When to use:**
- Ecosystem terms readers might not know
- Key concepts that carry specific meaning in this work
- First significant mention of a concept in a transmission

**Not for:**
- Every mention — mark the first or most meaningful appearance
- Generic terms that happen to match concept names
- Terms already obvious from context

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

When transmission is complete, add to `journal/manifest.json`.

The manifest is a **lean index** — it stores IDs only, not content. All prose (context, essence, etc.) lives in the transmission frontmatter.

```json
{
  "number": 1,
  "slug": "recognition-through-indirection",
  "title": "Recognition Through Indirection",
  "date": "2025-12-29",
  "relay_version": "0.22.4",
  "arcs": ["recognition-through-indirection", "qualities-of-attention"],
  "threads": ["ecosystem-modality tension", "crystallization"],
  "concepts": ["qino-world", "tech-qino-lens"]
}
```

**What each field provides:**

| Field | Purpose |
|-------|---------|
| `relay_version` | Version of qino-relay that wrote this transmission |
| `arcs` | Which arcs this transmission walks through |
| `threads` | Which threads are introduced/referenced |
| `concepts` | Which ecosystem concepts appear |

**Where prose lives:**

| Content | Location |
|---------|----------|
| Arc essence | transmission.md frontmatter |
| Thread context | transmission.md frontmatter |
| Concept context | transmission.md frontmatter |
| Concept shape | concepts.md |

The manifest answers "where does X appear?" — the transmission answers "what does X mean here?"
