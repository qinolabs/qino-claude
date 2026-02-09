# Lab Note Workflow

Write a Character Coherence Lab Note — a dated dispatch from the validation work.

---

## When to Use

- Documenting an experiment as it happens or immediately after
- Writing a Reckoning document (Part 1 or Part 2)
- Creating a Synthesis document after experiments complete

---

## Arguments

Arguments: `$ARGUMENTS`

**Valid invocations:**
- `"write lab note for 100 messy encounters"`
- `"document the blind lens test"`
- `"write reckoning part 1"`
- `"write the synthesis"`

If unclear, ask what moment in the work this note documents.

---

## Setup

### Paths

```
Base: qinolabs-repo/implementations/character-coherence/

Inputs:
  lab-notes-series.md         # Series structure and voice
  character-coherence-analysis.md  # Source material
  iterations/                 # Experiment designs (for experiment notes)

References:
  qino-claude/plugins/qino-prose/references/blog/craft.md
  qino-claude/plugins/qino-prose/references/blog/cc-sensitivities.md
  qino-claude/plugins/qino-prose/references/qino-voice.md

Output:
  notes/                      # All lab notes go here
```

### Create Output Directory

```bash
mkdir -p qinolabs-repo/implementations/character-coherence/notes
```

---

## Voice Injection

Read the voice references before writing:

1. `references/blog/craft.md` — Lab Notes craft
2. `references/blog/cc-sensitivities.md` — CC-specific sensitivities
3. `references/qino-voice.md` — Qino's actual voice (if exists)

**Core principles:**
- Direct, not positioned
- Questions stay open
- Experiments as honest inquiry, not drama
- Learning in action — gaps are content
- Qino voice: "held.", density, breathing room

---

## Determine Note Type

### Reckoning Document

If writing Part 1 ("What We Say vs. What Actually Happens") or Part 2 ("What That Enables"):

**Source:** `character-coherence-analysis.md`
**No experiments yet** — this is the frame
**Opens with:** Direct observation (e.g., "An LLM is a stateless text predictor.")

### Experiment Note

If documenting an experiment:

**Source:** Corresponding iteration file + actual experiment results
**Dated entry format:**

```markdown
## Note: [Topic] — [Date]

What we tried
What happened
What we didn't expect
What questions remain

[lens-lab screenshots if applicable]
[actual numbers]
```

**Check lens-lab state:** What could it do? What couldn't it?

### Synthesis

If writing the final synthesis:

**Source:** All previous notes + experiment findings
**Structure:**
- What confirmed
- What surprised
- What remains open

---

## Writing Process

### 1. Understand the Moment

Ask yourself:
- What moment in the work is this?
- What's the lens-lab state right now?
- What questions are genuinely open?

### 2. Check Readiness

For Reckoning: Can we access character-coherence-analysis.md?
For Experiments: Is the iteration file written? Are results available?
For Synthesis: Are enough experiments complete to synthesize?

If not ready, note what's missing and ask how to proceed.

### 3. Write Direct

**Open where the work opens.** No hooks.

**Examples:**
- "The batch runner completed 100 voicings in 47 minutes."
- "An LLM is a stateless text predictor."
- "We set up the blind test. Here's what happened."

### 4. Preserve Uncertainty

Don't resolve into neat conclusions. Document what we don't know.

**Not:** "The key insight is..."
**But:** "This suggests... but we don't yet know whether..."

### 5. Note Lens-Lab State

If using lens-lab, always document:
- What we tried to do
- What worked
- What didn't work
- What we built or worked around

This feeds forward to the lens-lab celebration post.

---

## Output

Write the note to:

```
qinolabs-repo/implementations/character-coherence/notes/[slug].md
```

Naming convention:
- Reckoning: `reckoning-part-1.md`, `reckoning-part-2.md`
- Experiments: `[topic]-[date].md` (e.g., `100-messy-encounters-2026-01-20.md`)
- Synthesis: `synthesis.md`

---

## Quality Check

Before finalizing, verify:

- [ ] Opens where the work opens, not with a hook
- [ ] Voice matches qino DNA (direct, compressed, breathing)
- [ ] Questions stay open
- [ ] If experiment: includes actual data/numbers
- [ ] If lens-lab: documents what worked and what didn't
- [ ] No marketing tone or competitive positioning
- [ ] No theatrical framing ("dramatic reveal")

---

## After Writing

Announce completion with:
- Note title and location
- What questions remain open
- What this note sets up (if anything)

No need for editorial pass unless specifically requested — Lab Notes are working documents, not polished posts.
