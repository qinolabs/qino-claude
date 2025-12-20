# Reading the Disturbance

*How to find story in what changed.*

---

## The Shift

The diff is not source material to describe. It's a quality seeking its story-world form.

The instinct is to ask "what changed" and find relevance. This produces documentation with narrative flair — not story.

The shift: ask what the change *wants to become*. Not how to mention it. What story it's trying to tell.

---

## What to Filter

Not all changes carry story-energy. Some are maintenance, routine, infrastructure.

**Tendentially ignore:**

| Change type | Why |
|-------------|-----|
| Version bumps | Numbers changing — no shape |
| Lockfiles, generated files | Artifacts, not intentions |
| Formatting / linting | Surface rearrangement |
| Dependency updates | The world consuming updates — unless a new capability arrives |
| Build configuration tweaks | Plumbing adjustments |
| Comments describing what already exists | Annotation, not emergence |
| Changelog entries | Already a narrative about narrative |

**Tendentially notice:**

| Change type | Why |
|-------------|-----|
| New files / concepts appearing | Appearance — something exists that didn't |
| Files / concepts being removed | Disappearance — something closed or departed |
| Significant refactors | Transformation — becoming other than it was |
| New connections (imports, integrations) | Connection — separate things now touch |
| Patterns breaking or emerging | Pressure shifting |

"Tendentially" means: not absolute rules. A lockfile *could* carry meaning if the shape is right. A new feature *could* be noise if it's just scaffolding. Feel for what's alive.

### Project-Type Nuances

Different project types have different signals. Attune accordingly:

| Project type | Also filter out | Also notice |
|--------------|-----------------|-------------|
| **Tools** (commands, agents, references) | Command description tweaks, README polish, CLAUDE.md minor updates | New agent types appearing, instruction refinements that change behavior, template structure shifts, commands moving between namespaces |
| **Apps** (features, UX, architecture) | Config/env changes, deployment scripts, CSS tweaks (unless design system) | UX copy changes (reveal product direction), component composition patterns, data model shifts |
| **Concepts** (ideas crystallizing) | Section reordering (unless structural), formatting, manifest updates | New sections appearing (structure evolving), cross-concept references forming, held threads surfacing, concept graduating from notes/ |
| **Research** (explorations, calibrations) | Methodology notes, data file additions, iteration logs | Calibration completing (distinctions discovered), exploration shifting direction, synthesis moments, negative results (failure is data) |

### Recognizing Noise

Ask: "If I removed this from the diff, would the shape change?"

| Change | Test result |
|--------|-------------|
| Lockfile with 500 dependency updates | Shape unchanged — noise (unless one dep enables new capability) |
| Prettier reformatting 20 files | Shape unchanged — noise |
| Three typo fixes in user-facing copy | Shape *might* change — accumulation if it reveals care for craft |
| Config adjusting timeout 30s → 60s | Shape unchanged — noise (unless fixing known issue) |
| New command appearing | Shape changes — appearance |
| Agent instructions refined | Shape changes — transformation |

The test: does it complete something, or just maintain it?

**Restructurings** — files moving, folders renaming, packages splitting — need special attention. Ask: does this reflect a conceptual shift, or just tidying?

| Restructuring type | Shape | Signal |
|--------------------|-------|--------|
| Tidying / convention alignment | None | Ignore — surface rearrangement |
| Splitting one thing into many | Separation | Notice if boundaries are being *discovered* |
| Consolidating many into one | Connection | Notice if scattered things are *recognizing* each other |
| Renaming to reveal true nature | Transformation | Notice if the project is *understanding itself differently* |

**Tool-specific restructuring patterns:**

| Restructuring | Shape | Signal |
|---------------|-------|--------|
| Commands moving between namespaces | Conceptual boundary | Notice if commands are being reclassified (e.g., `qino` → `qino-concept` means scope clarified) |
| Extracting shared agents/references | Connection | Notice if scattered knowledge is consolidating into reusable form |
| Agent splitting into prep/prose | Separation | Notice if roles are being distinguished for quality |
| Template becoming reference | Transformation | Notice if examples are becoming principles |

The test: after the restructuring, does the project see itself the same way? If yes — housekeeping. If no — something happened.

---

## Diff Size

The question isn't how many lines — it's whether the diff contains *one movement*.

**Too small** (single commits, minor fixes):
- Risk overemphasizing — a typo fix becomes a chapter
- The chronicle bloats with non-events
- Better to wait for something to complete

**Too large** (weeks of work, major releases):
- Risk missing — significant changes buried in volume
- Forced to summarize rather than feel the shape
- The movement becomes multiple movements

**Healthy size:**
- One coherent phase of work — something that *completes*
- You can hold the whole diff in mind and feel its shape
- Typically: 3-15 commits, a few days to a week of activity
- But a single commit can be a chapter if it's a true arrival
- And 30 commits can be one chapter if they're all one gesture

**Qualitative adjustments:**

| Diff content | Effective weight |
|--------------|------------------|
| 500 lines of generated/config | Light — little shape |
| 50 lines of new concept | Heavy — dense with meaning |
| Large refactor | Medium — transformation, but often one shape |
| Many small fixes | Light unless they accumulate into pressure |
| New feature landing | Heavy — appearance, even if small |

**The feel:** Can you sense what happened? If yes — right size. If you're drowning or grasping — adjust.

### Example: One Movement Across Multiple Files

```
tools/qino-scribe/commands/qino-scribe/survey.md        (new, 290 lines)
tools/qino-scribe/references/qino-scribe/disturbance.md (+60 lines)
tools/qino-scribe/agents/scribe-prep.md                 (+15 lines)
```

**Assessment:** Three files changed, but one coherent movement.

- Survey command appeared → **Appearance**
- Disturbance guidance evolved to support it → **Transformation**
- Prep agent learned to warn about range size → **Connection** (survey's knowledge flows to prep)

These are not three separate events. They're one gesture: "The scribe learns to look before writing."

**Chapter title possibility:** *The Survey* or *Before the First Word*

This is what "one movement" looks like when it touches multiple files. The files serve the movement; the movement doesn't serve the files.

When the diff is mostly maintenance, the shape might be "Accumulation" — small pressures building. Or the chapter might need to find its disturbance elsewhere: in the world's own motion, in what characters were already carrying.

---

## How to Read

Run the diff commands. See what literally changed.

Then step back.

**First, the shape.** What quality of change happened?

| Shape | The feel |
|-------|----------|
| **Appearance** | Something exists that didn't — arrival, emergence, birth |
| **Disappearance** | Something no longer exists — loss, departure, closing |
| **Transformation** | Something became other than it was — growth, revelation |
| **Connection** | Separate things now touch — meeting, recognition, bridge |
| **Separation** | Joined things now apart — rupture, boundary, independence |
| **Accumulation** | More of what was building — pressure, weight, gathering |
| **Release** | What was held is now free — resolution, gift, collapse |

A diff may carry more than one shape. Sense the dominant quality.

**Second, the resonance.** Where in the story world does this shape want to live?

Not: what corresponds to the files.
But: what already carries this quality — and rhymes with what happened?

---

## The Rhyme

The magic: with a bit of imagination, the change in the story can be traced back to what happened in the code.

```
chronicling tool appears
        ↓
    (imagination)
        ↓
characters sense being watched
```

The shape matches (appearance, observation begins). The lineage is traceable (chronicling → being chronicled → being watched). No literal correspondence. Total poetic resonance.

This is translation, not transcription. A good translation preserves meaning while completely changing the words. Someone who reads both languages can trace the etymology. Someone who reads only one experiences a complete work.

---

## Finding the Resonance

Hold the literal content and the shape together. Ask:

- What in the story world carries this shape?
- What rhymes with what actually changed?
- Who would feel this — not as information, but as atmosphere?
- What pressure does this touch? What arc might it move?

The resonance must honor both the shape *and* the lineage. Not just "any appearance" — an appearance that rhymes with what appeared.

---

## What Travels Forward

The prep.md Disturbance section holds:

```markdown
## Disturbance
**What happened:** [the literal change — for your reference, not the prose agent's]
**Shape:** [appearance, transformation, connection, etc.]
**Resonance:** [where this lives in the story world]
**Who feels it:** [who is sensitive to this quality]
```

The prose agent receives only the resonance and who feels it. The literal content and shape are working notes — they helped you find the rhyme.

---

## The Test

Two tests, both must pass:

**Standalone:** Could someone who's never seen the source experience this as complete story?

**Traceable:** Could someone who knows the source follow the thread with imagination?

If only the first passes — the transformation drifted too free.
If only the second passes — the transformation stayed too literal.
If both pass — the rhyme exists.

---

## Instead Of

**Instead of** describing what changed in story-world terms:
→ Find what quality of change happened, then where that quality wants to live.

**Instead of** forcing correspondence between files and story elements:
→ Let the shape guide you. The resonance may land somewhere the diff never mentioned.

**Instead of** abstracting so far the lineage disappears:
→ Honor the literal. The rhyme must be traceable with imagination.

---

## The Deeper Principle

The diff provides energy — something happened, the system must respond.

The story provides form — where that energy can live and become meaning.

The craft is finding where they meet.
