# Layer System

*The staged architecture for chapter creation.*

---

## Overview

Story evolves in layers. Each layer produces an artifact. The next layer works from that artifact, not full context. User steers via choices at checkpoints.

```
WORLD LAYER       → scene seeds      → user chooses
         ↓
DISTURBANCE LAYER → resonances       → user chooses
         ↓
BEAT LAYER        → directions       → user chooses
                  → opening          → user chooses
         ↓
         [prep.md complete — hard cut]
         ↓
PROSE LAYER       → chapter.md       (separate agent)
         ↓
WORLD UPDATE      → world.md changes → user confirms
         ↓
ARC UPDATE        → arcs.md changes  → user confirms
         ↓
SNAPSHOT          → copies to chapter dir
```

---

## The Layers

### World Layer

**Reads:** theme.md, world.md, arcs.md, recent chapters

**Produces:** Grounding section of prep.md

**Questions to ask:**
- What textures, smells, sounds does this theme imply?
- What pressures are building in the world right now?
- Who has been watching? What have they accumulated?
- Which relationship could become a scene?

**Outputs:**
- Sensory palette (5-8 concrete nouns from the theme)
- Active pressures (2-3 from world.md)
- Scene seeds (3 relational situations)

**Checkpoint: Scene Seeds**
```
─────────────────────────────────────────────────────────────────
grounding

  theme       [sensory palette words]
  pressure    [what's building]
  arc         [what's in motion]
  last seen   [where wanderer was, what happened]

─────────────────────────────────────────────────────────────────
scene seeds

  1 → [who + relationship + where + what tension]
  2 → [another relational situation]
  3 → [another relational situation]

─────────────────────────────────────────────────────────────────
[ 1-3 ] or empty    [ > ] auto-pick this or 'resonances'    [ >> ] start writing
```

Scene seeds that name a relationship have more life than situations without people.

---

### Disturbance Layer

**Reads:** Git diff, World Snapshot (from World Layer)

**Produces:** Disturbance section of prep.md

**Consult:** `references/disturbance.md` — how to read for shape and find the rhyme

**The shift:** The diff is not source material to describe. It's a quality seeking its story-world form. Ask what it *wants to become*.

**Questions to hold:**
- What is the shape of the change? (appearance, transformation, connection, etc.)
- What in the story world carries this shape — and rhymes with what happened?
- Who would feel this — not as information, but as atmosphere?
- What pressure does this touch? What arc might it move?

**Outputs:**
- What happened (the literal — for your reference)
- Shape (the quality of change)
- Resonance (where it lives in the story world)
- Who feels it (who is sensitive to this quality)
- Angles (3 story directions)

**Checkpoint: Resonances**
```
─────────────────────────────────────────────────────────────────
grounding

  theme       [sensory palette words]
  pressure    [what's building]
  scene seed  [the one user picked — who + relationship + where]

─────────────────────────────────────────────────────────────────
the diff

  [one line: what literally changed in the ecosystem]

─────────────────────────────────────────────────────────────────
shape: [the quality — appearance, transformation, connection, etc.]

resonances

  1 → [where this shape could live in the story world]
  2 → [another resonance]
  3 → [another resonance]

─────────────────────────────────────────────────────────────────
[ 1-3 ] or empty    [ > ] auto-pick this or 'directions'    [ >> ] start writing
```

Resonances that carry who perceives — not just who's affected — have more weight.

---

### Beat Layer

**Reads:** Chosen angle, Disturbance section

**Produces:** Beat section of prep.md

**Questions to ask:**
- What story type serves this moment?
- What's the opening image — where/how we begin?
- Who's involved, what do they want, how do they speak?
- What's at stake between them, not just for them?
- How does each perceive the other — especially what isn't said?
- What's being held back that the reader will sense?

**Outputs:**
- Story type and opening image
- Characters with wants and voice patterns
- The relationship (what's at stake between them)
- Mutual seeing (how each perceives the other)
- What's unsaid
- Stakes

**Checkpoint: Directions**
```
─────────────────────────────────────────────────────────────────
grounding

  theme       [sensory palette words]
  pressure    [what's building]
  resonance   [the one user picked — where the change lives]

─────────────────────────────────────────────────────────────────
directions

  1 (Confrontation) → [one phrase — what must be faced]
  2 (Discovery)     → [one phrase — what comes to light]
  3 (Vigil)         → [one phrase — presence when action is impossible]

─────────────────────────────────────────────────────────────────
[ 1-3 ] or empty    [ > ] auto-pick this or 'opening'    [ >> ] start writing
```

**Checkpoint: Opening**

After user chooses direction, present opening options:
```
─────────────────────────────────────────────────────────────────
opening

  1 → [place + time + how we enter]
  2 → [another opening]
  3 → [another opening]

─────────────────────────────────────────────────────────────────
[ 1-3 ] or empty    [ > ] start writing
```

After user chooses opening: prep.md is complete.

---

### Prose Layer

**Reads:** ONLY prep.md (hard cut from previous context)

**Produces:** chapter.md

**Constraint:** The prose agent receives only prep.md. This forces fresh invention — can't recycle descriptions, must generate from sensory palette, stakes and voice notes are all that's visible.

**Verification (6 checks):**
1. **Stakes**: Does someone want something they can't easily have?
2. **Vividness**: Does the environment intrude at least once?
3. **Dialogue**: Is there one mundane exchange, and can you tell who's speaking?
4. **Reader**: Is there one gap the reader fills?
5. **Mutual seeing**: Does someone perceive something in the wanderer (or vice versa)?
6. **Response completes**: Does at least one response reach beyond what was said?

---

### World Update Layer

**Reads:** chapter.md just written + current world.md

**Produces:** Updated world.md

**Questions to ask:**
- What pressure released? What's now building?
- What does the wanderer carry now? Where were they last seen?
- Any new characters or locations? (Check world tokens)
- What have characters been watching? (Track accumulated perception)
- What remains unspoken about the wanderer?

**Checkpoint: World Evolved (Summary)**
```
─────────────────────────────────────────────────────────────────
world evolved

  pressures
    released   → [what resolved]
    building   → [what's new]

  the wanderer
    now carries → [new weight]
    last seen   → [where/how chapter ended]

  new in world
    + [Character] — [brief texture]
    + [Location] — [brief atmosphere]

─────────────────────────────────────────────────────────────────
                                           looks right? (or adjust)
```

---

### Arc Update Layer

**Reads:** chapter.md + current arcs.md

**Produces:** Updated arcs.md

**Questions to ask:**
- Did any arc advance? How?
- Did any arc begin? What's its shape?
- Did any arc complete? What did it yield?

**Checkpoint: Arcs (Summary)**
```
─────────────────────────────────────────────────────────────────
arcs

  advanced
    [Arc Name] → [how it moved]

  begun
    [New Arc] → [what question it holds]

  completed
    [Arc Name] → [what it yielded]

─────────────────────────────────────────────────────────────────
                                           looks right? (or adjust)
```

If no arcs moved:
```
─────────────────────────────────────────────────────────────────
arcs

  (no arcs moved this chapter)

─────────────────────────────────────────────────────────────────
                                                 agree? (or note one)
```

---

### Snapshot Layer

**Reads:** Updated world.md and arcs.md

**Produces:** Copies in chapter directory

No checkpoint. Pure mechanical copy. Ensures retroactive accuracy for image generation.

---

## prep.md Structure

The artifact that travels from prep agent to prose agent:

```markdown
# Chapter NNN Prep

## World Snapshot
**Sensory palette:** [5-8 words]
**Active pressures:** [2-3 bullets]
**Scene seed chosen:** [the one user picked]

## Disturbance
**Resonance:** [where the change lives in the story world]
**Who feels it:** [who is sensitive to this quality]
**Angle chosen:** [the direction user picked]

## Beat
**Story type:** [chosen type]
**Opening image:** [where/how we begin]

**Who's involved:**
- [Character]: [what they want] / *Voice: [speech pattern]*
- [Character]: [what they want] / *Voice: [speech pattern]*

**The relationship:** [what's at stake between them, not just for them]

**Mutual seeing:** [how each perceives the other — especially what isn't said]

**What's unsaid:** [what's being held back that the reader will sense]

**Stakes:** [what could be lost/gained]
```

**What is NOT in prep.md:**
- Full world.md content
- Full arcs.md content
- The literal git diff or shape (these helped find the resonance, but don't travel)
- Recent chapter content
- Reasoning or process notes

The prep serves the prose better when it holds what's between people — the relationship, what each perceives in the other, what's being held back. These dimensions give the prose its relational life.

---

## Checkpoint Types

| Checkpoint | Type | User Action |
|------------|------|-------------|
| Scene Seeds | **Interactive** | Choose scene seed |
| Resonances | **Interactive** | Choose resonance |
| Directions | **Interactive** | Choose story type |
| Opening | **Interactive** | Choose where we begin |
| World Evolved | **Summary** | Confirm or adjust |
| Arcs | **Summary** | Confirm or adjust |

**Interactive checkpoints:** System pauses, presents options, waits for choice.

**Summary checkpoints:** System applies judgment, shows summary. User confirms or adjusts.

---

## User Interaction at Checkpoints

At each interactive checkpoint:

1. **System shows 3 options** — concrete, one line each
2. **User can:**
   - Pick: `2`
   - Combine: "like 1 but with the tension from 3"
   - Adjust: "more intimate, less dramatic"
   - Ask: "tell me more about 2"
   - Reject: "none of these — I'm sensing something quieter"

3. **If user adjusts or rejects:**
   - System generates new options informed by feedback
   - Options give vocabulary even when they don't fit

**The principle:** Options are not just choices — they're vocabulary. Even rejected options help the user articulate what they're sensing.

---

## Auto-Pick Syntax

At interactive checkpoints, users can delegate decisions:

| Input | Meaning |
|-------|---------|
| `2` | Pick option 2, ask me at next checkpoint |
| `>` | System picks this one, ask me at next |
| `2 >` | Pick 2, system picks next one |
| `>>` | System picks all remaining, start writing |
| `2 >>` | Pick 2, system finishes the rest |

The checkpoint footer shows what each arrow would skip:
```
[ 1-3 ] or empty    [ > ] auto-pick this or 'opening'    [ >> ] start writing
```

---

## The Ten Story Types

Used in Beat Layer to generate direction options:

1. **The Complication** — What if the change creates a problem?
2. **The Journey** — What if this chapter leaves known ground?
3. **The Confrontation** — What if something must be faced?
4. **The Discovery** — What if something hidden comes to light?
5. **The Crisis** — What if the pressure breaks now?
6. **The Arrival** — What if this chapter is about being received?
7. **The Loss** — What if something or someone departs?
8. **The Vigil** — What if action is impossible and presence is all?
9. **The Return** — What if we come back to where we've been?
10. **The Ritual** — What if a cultural form holds the chapter?

Don't traverse all types. Let the situation guide selection of 3-5 that fit.

---

## Completion

After snapshots are taken, announce completion:

```
─────────────────────────────────────────────────────────────────
chapter NNN — [Title]

  [One or two lines: what happened in the chapter]

  The wanderer was last seen [where/doing what]
  [optional: carrying what, in what state]

─────────────────────────────────────────────────────────────────
  what's building

    [Pressure 1 — narrative tension for next time]
    [Pressure 2 — atmospheric or relational tension]

─────────────────────────────────────────────────────────────────
  [word count]                              [Arc Name] (begun/advanced)
```

The top half is story — what happened, where the wanderer rests.
The middle is pressure — what's building, the world's breath.
The bottom is structure — word count, arc movement (quiet, present but not featured).

---

## File Locations

**Chapter directory structure:**
```
chronicle/chapters/NNN-slug/
├── prep.md          ← Built through checkpoints
├── chapter.md       ← From prose layer
├── world.md         ← Snapshot after updates
└── arcs.md          ← Snapshot after updates
```

**Chronicle root:**
```
chronicle/
├── theme.md         ← Set once, never changes
├── world.md         ← Canonical, updated after each chapter
├── arcs.md          ← Canonical, updated after each chapter
└── manifest.json    ← Chapter index and state
```
