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

*"Recognition through indirection." I kept turning that phrase over. There's
something in it I almost have.*

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

The transmission includes "The Arrival" — two distinct parts that together create immersion:

1. **The Interruption Frame** — where the Student is, what they're doing, the device announcing
2. **The Emergence Story** — how inquiry reached this point (rendered on the device)

The Student has a device — a tablet with retro sci-fi aesthetic. Transmissions arrive on this device. The Student has a life, a place; they're not just a voice narrating. This creates world-building without exposition.

### Structure

```markdown
# [Title]

## The Arrival

*[1-3 sentences: place, moment, activity — the Student grounded in their world]*

*[Device notification — brief, the interruption]*

---

[Emergence content — 2-4 paragraphs showing how inquiry moved.
Uses existing markup syntax for concepts, tools, arcs.
This is what appears on the device screen.]

---

*[Opening lines — Student's voice begins]*

[Body continues]
```

### Parsing Rules

- **H1** = Transmission title
- **`## The Arrival`** = Arrival section begins
- **Italic text before first `---`** = Interruption Frame (rendered outside device)
- **Content between `---` markers** = Emergence Story (rendered inside device frame)
- **Second `---`** = End of arrival, beginning of Student's body
- **Italic opening after second `---`** = Student's voice begins

### Backend Parsing

The qino-journal backend parses The Arrival into a structured type:

```typescript
interface Arrival {
  interruption: string;  // Interruption Frame prose
  emergence: string;     // Emergence Story content
}
```

The parser:
1. Extracts content before first `---` as `interruption`
2. Extracts content between first and second `---` as `emergence`
3. Strips the entire Arrival section from body content
4. Falls back to legacy format (single `---`) for older transmissions

**Image generation** uses the Interruption Frame to ground hero images in the Student's world. Environmental details (place, time of day, atmosphere) are extracted and used to inflect the image's light quality and feeling.

### Example

```markdown
# What You Notice

## The Arrival

*The library's west wing — tall windows running floor to ceiling, late
morning light stretching across the reading tables. The particular quiet
of old wood and dust and concentration. At a desk near the stacks, someone
bent over a notebook, pen paused mid-word. A mate cooling beside them,
untouched.*

*A gentle hum from somewhere under the papers.*

---

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

*There's a writing problem in this arc that I recognize. The prose kept
falling flat. Accurate but lifeless.*

[Student's body continues — 600-900 words]
```

### App Rendering

The journal app renders The Arrival with two layers:

```
*The library's west wing — tall windows running floor to ceiling,
late morning light stretching across the reading tables. The
particular quiet of old wood and dust and concentration. At a
desk near the stacks, someone bent over a notebook, pen paused
mid-word. A mate cooling beside them, untouched.*

*A gentle hum from somewhere under the papers.*

╭────────────────────────────────────────────────────────────╮
│  ◈  INCOMING                                               │
│                                                            │
│  What You Notice                                           │
│                                                            │
│  Scribe needed to see differently. The chronicle prose    │
│  kept coming out flat — describing events rather than     │
│  inhabiting them...                                       │
│                                                            │
│  [emergence story continues]                               │
│                                                            │
│  Concepts and tools get hover behavior from existing       │
│  markup: [text](qino:concept/id), /tool:command            │
│                                                            │
╰────────────────────────────────────────────────────────────╯
```

The Interruption Frame lives outside the device frame as narrative. The Emergence Story is what appears on the device screen. The Student reads this alongside the reader — both witness how inquiry traveled.

### The Interruption Frame

The Interruption Frame grounds the Student in their world. 1-3 sentences showing:

- **Place** — where the Student is
- **Activity** — what they were doing
- **The interruption** — device notification, shift of attention

**Variation across transmissions** (avoid formula):

| Element | Options |
|---------|---------|
| Place | library, apartment balcony, café, park bench, kitchen, quiet street, study |
| Activity | transcribing notes, reading, staring at a question, mid-conversation, walking, watching light move |
| Time/Light | morning light, afternoon, evening, 5am darkness, sunset |
| Notification | soft chime, familiar pulse, light at edge of vision, gentle hum, screen waking |

**Brevity spectrum:**

Sometimes elaborate:
> *The apartment was still dark. 5am, couldn't sleep. Making coffee when the counter lit up — the device, face-down, glowing through.*

Sometimes minimal:
> *Afternoon light. The device pulsed.*

**Ambient holding (not symbolic matching):**

The environment holds space for thinking. It should NOT symbolically echo content:
- ❌ Transmission about clarity → sky clears
- ❌ Transmission about attention → interrupted during focused work

Instead, environment creates conditions for concentration. The place the Student chooses reveals character — which spaces they seek out for thinking.

**Where variations come from:**

The Interruption Frame is grounded in deliberate Environment prep during Phase 2.5 of `/qino-relay:transmit`. The orchestrator captures place, activity, time/light, detail, and potential moments in `reader-journey.md`. The prose agent uses these notes to write the frame.

See `references/transmission/reader-journey-guide.md` for how to prepare Environment notes.

Across transmissions, this variety builds the Student's lived-in world. By transmission 10, readers know the library's tall windows, the friend who sits down without asking, the mate that's always cooling.

### The Emergence Story

The Emergence Story (2-4 paragraphs) shows how inquiry traveled:

1. **What started it** — the initial impulse or charge
2. **Sideways turns** — unexpected connections, byproducts becoming inquiries
3. **Questions that drove forward** — the epistemic bias made visible
4. **Pattern recognition** — when scattered things revealed themselves as one thing

**Use existing markup syntax:**
- `[text](qino:concept/id)` — ecosystem concepts (hover shows shape + context)
- `/qino:command` — tool commands (app can add hover behavior)
- `[text](qino:arc/id)` — arc references
- `[text](qino:thread/name)` — thread references

**Voice:** Present tense. Show the shape of how inquiry travels, not just what was found.

### Parallel Learning

| Layer | Learns about | Through |
|-------|--------------|---------|
| Student (in-world) | the material — the arc content | encountering transmissions on their device |
| Reader (real-world) | the qino ecosystem — tools, arcs, how emergence happens | encountering the same arrival |

Over transmissions, the reader accumulates a sense of the Student's world — their rhythm, their places, the device as companion.

---

## Sections

### Opening (No Separate Abstract, No Dated Re-Intro)

The transmission begins directly with the Student's voice. The opening lines ARE the entry—not a separate abstract to get through.

**Important:** The Arrival handles context (which arcs, when, where). The body doesn't re-establish — it dives into the material.

**Good openings:**
> *"Recognition through indirection." I kept turning that phrase over. There's something in it I almost have.*

> *What makes this hard is — the obvious reading is about metaphor. But that's not quite it.*

> *The café was crowded. Voices overlapping, half-conversations. I stopped trying to follow any single thread.*

**Avoid:**
> *Dec 29. Walking through two arcs today...*

> ## Abstract
> *This transmission explores the relationship between...*

The dated re-intro ("Dec 29. Walking through the X arc today...") was necessary before The Arrival existed. Now that The Arrival establishes context, the body starts *in* the thinking.

The reader joins the Student mid-thought. No barrier, no re-establishing.

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
