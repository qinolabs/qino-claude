# Arc Workflow

**Voice:** Spacious. This is about seeing the ecology of what happened.

**Agent:** research (arc capture mode)

---

## Task

An arc is an emergence pattern — how inquiry moved through the ecosystem. Unlike a note (single thought), an arc captures the *ecology* of movement: ground, instrument, pattern, connection, transformation.

---

## Context Handling

Find the research workspace:

1. If `context.type === "research"` → use current directory
2. If `context.researchRepo` exists → use that path
3. If neither → check common locations (`../qino-research`, `../../qino-research`)
4. If still not found → error: "no research workspace found. create one or configure researchRepo in qino-config.json"

All file operations target the research workspace.

---

## Arc Format (v2 — Ecology)

An arc has these sections. Each answers a specific question:

### Ground
**Answers:** Why did this inquiry have energy? What personal stakes made it alive?
**Format:** 2-4 sentences. First-person perspective welcome.
**Not:** Context or background. Ground is about *charge*, not setting.

### Essence
**Answers:** If you had one sentence to convey the whole arc, what would it be?
**Format:** One sentence that holds: why it mattered + what pattern emerged + how it was discovered.
**Quality check:** Could someone unfamiliar reconstruct the arc's shape from this sentence alone?

### Instrument
**Answers:** What method or capacity was used to notice what was noticed?
**Format:** Name the instrument, then describe how it worked.
**Examples:** "Resonance-noticing — using felt similarity as signal." "Comparison — placing two things side by side." "Conversation — thinking aloud with another."
**Not:** What was discovered. This is about *how* discovery happened.

### The Recurring
**Answers:** What pattern kept appearing across different contexts or times?
**Format:** Name the pattern, then list where it appeared. Each instance shows the same pattern in different form.
**Not:** A list of everything touched. Only what *recurred*.

### The Between
**Answers:** What was the quality of connection between things? Why did X and Y feel related?
**Format:** Prose describing relationship quality, not just that things are related.
**Test:** If you removed the items and kept only "The Between," would the *kind* of connection still be clear?

### Traces
**Answers:** What concrete artifacts were created, touched, or transformed?
**Format:** Categorized list with paths. This is the forensic record.
**Purpose:** Enables navigation, verification, and storytelling reconstruction.

### What Composted
**Answers:** What transformed during this arc? What was X before and Y after?
**Format:** "Before → After" pairs with brief notes on what shifted.
**Not:** What was produced (that's Traces). This is about *transformation of understanding*.

### Seeds
**Answers:** What remains alive for future inquiry?
**Format:** Bulleted list. Can be questions, tensions, images, or unnamed qualities.
**Not:** Just questions. Seeds can be anything that still has energy.

### For Storytelling (optional)
**Answers:** What images, figures, or themes could a storyteller use?
**Format:** Bullets. Written for qino-relay or scribe consumption.
**When:** Include if the arc has rich narrative potential.

---

## Flow

### 1. Receive

If argument provided → use as arc title/starting point.

If no argument:
> "what emerged?"

**WAIT** for response.

### 2. Gather (Conversational)

Gather the arc conversationally, not as a checklist. Listen for these elements:

**Core (required):**
- **Title** — a phrase that names the arc
- **Ground** — why this had energy, personal stakes
- **Essence** — one sentence that holds the whole
- **Instrument** — how noticing happened

**Pattern (required):**
- **The Recurring** — what kept appearing
- **The Between** — quality of connections

**Record (required):**
- **Traces** — artifacts touched or created
- **What Composted** — transformations (before → after)
- **Seeds** — what remains alive

**Optional:**
- **Span** — date(s) this happened
- **Repos** — which repos were involved
- **For Storytelling** — images, figures, themes

**How to gather:**

After receiving the title/starting point, ask:
> "what made this alive? what gave it charge?"

Listen for Ground.

Then:
> "how did you notice what you noticed?"

Listen for Instrument.

Then:
> "what kept appearing? what pattern recurred?"

Listen for The Recurring and The Between.

Then confirm the essence:
> "so the essence is: [your distillation]?"

**WAIT** for confirmation or correction.

Finally, gather traces:
> "what was touched? what transformed?"

Listen for Traces, What Composted, Seeds.

### 3. Generate Arc ID

From title:
- Lowercase, hyphenated
- Prefix with date: `YYYY-MM-DD_arc-id`

Example: "From Signature to Sense" → `2026-01-04_from-signature-to-sense`

### 4. Create Arc File

Create `arcs/YYYY-MM-DD_arc-id.md` in research workspace:

```markdown
# [Arc Title]

## Ground

[Why this inquiry had energy. Personal stakes. The charge.
2-4 sentences. First-person welcome.]

## Essence

[One sentence: why it mattered + what pattern emerged + how it was discovered.]

## Instrument

[Name the method, then describe how it worked.
Example: "Resonance-noticing. The felt sense of connection between X and Y became the signal to follow."]

## The Recurring

[Name the pattern that kept appearing:]

- [instance 1] — [how pattern appeared here]
- [instance 2] — [how pattern appeared here]
- [instance 3] — [how pattern appeared here]

[Brief synthesis: what made this the same pattern in different forms.]

## The Between

[Prose describing relationship quality. Why did things feel connected?
What was the *kind* of connection, not just that things were related.]

## Traces

**[Category]:**
- [path/to/artifact] — [brief note]
- [path/to/artifact] — [brief note]

**[Category]:**
- [path/to/artifact] — [brief note]

## What Composted

**Before → After:**

[X before] → [X after]
[Brief note on what shifted]

[Y before] → [Y after]
[Brief note on what shifted]

## Seeds

- **[seed name]** — [what remains alive, can be question/tension/image/unnamed quality]
- **[seed name]** — [description]

---

## For Storytelling

[Only if relevant:]
- [image, figure, or theme a storyteller could use]
- [another]
```

### 5. Update Manifest

Add entry to research workspace `manifest.json` arcs array:

```json
{
  "id": "arc-id",
  "title": "Arc Title",
  "path": "arcs/YYYY-MM-DD_arc-id.md",
  "span": {
    "start": "YYYY-MM-DD",
    "end": "YYYY-MM-DD"
  },
  "repos": ["repo-1", "repo-2"],
  "status": "captured"
}
```

**Notes:**
- `repos` uses short names (e.g., "concepts-repo", "qino-research", "qinolabs-repo")
- If span is single day, `end` equals `start`
- Status is always "captured" on creation

### 6. Confirm

```
∴ [arc title]

captured: [essence]

ground: [one phrase summary of stakes]
instrument: [name of method]
pattern: [what recurred]
seeds: [count] threads remain alive

                        "where am I" to see research landscape
                        "start research on [topic]" to begin new inquiry
```

Done.

---

## Do NOT:

- Treat gathering as a form to fill out
- Ask for each section explicitly as a checklist
- Skip the essence confirmation
- Create arcs for single thoughts (that's what capture is for)
- Fill sections with placeholder text — leave empty if not gathered
- Lose the concrete traces — storytelling needs the forensic record
