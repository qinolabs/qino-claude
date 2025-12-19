# Layer System

*The staged architecture for chapter creation.*

---

## Overview

Story evolves in layers. Each layer produces an artifact. The next layer works from that artifact, not full context. User steers via choices at checkpoints.

```
WORLD LAYER       → scene seeds      → user chooses
         ↓
DISTURBANCE LAYER → angles           → user chooses
         ↓
BEAT LAYER        → directions       → user chooses
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
scene seeds

  1 → [who + relationship + where + what tension]
  2 → [another relational situation]
  3 → [another relational situation]

                                                    which calls?
```

Active constraint: Each scene seed names a relationship, not just a situation.

---

### Disturbance Layer

**Reads:** Git diff, World Snapshot (from World Layer)

**Produces:** Disturbance section of prep.md

**Questions to ask:**
- What changed in the ecosystem?
- Who would perceive this change? What would perceiving it cost them?
- What pressure does this touch?
- How does the world see back when this change happens?

**Outputs:**
- What changed (one line)
- Who perceives it (character + cost of noticing)
- Angles (3 story directions)

**Checkpoint: Angles**
```
─────────────────────────────────────────────────────────────────
angles

  1 → [story angle — what's at stake, who perceives]
  2 → [another angle]
  3 → [another angle]

                                                   which angle?
```

Active constraint: Angles include who perceives, not just who's affected.

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
directions

  [Type 1] → [one phrase]
  [Type 2] → [one phrase]
  [Type 3] → [one phrase]

                                               which direction?
```

After user chooses: prep.md is complete.

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

  pressures:
    released → [what resolved]
    building → [what's new]

  the wanderer:
    now carries → [new weight]
    last seen → [where/how]

  new in world:
    + [Character] — [brief texture]
    + [Location] — [brief atmosphere]

                                           looks right? (adjust)
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

  advanced:
    [Arc Name] → [how it moved]

  begun:
    [New Arc] → [what question it holds]

  completed:
    [Arc Name] → [what it yielded]

                                           looks right? (adjust)
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
**What changed:** [one line]
**Who perceives it:** [who notices, what it costs them to notice]
**Angle chosen:** [what user picked]

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
- Git diff details (only one-line summary)
- Recent chapter content
- Reasoning or process notes

The relational fields (`The relationship`, `Mutual seeing`, `What's unsaid`) are not optional. They're what make the prose relationally alive.

---

## Checkpoint Types

| Checkpoint | Type | User Action |
|------------|------|-------------|
| Scene Seeds | **Interactive** | Must choose (key creative decision) |
| Angles | **Interactive** | Must choose (story direction) |
| Directions | **Interactive** | Must choose (story type) |
| World Evolved | **Summary** | Confirm or adjust |
| Arcs | **Summary** | Confirm or adjust |

**Interactive checkpoints:** System pauses, presents options, waits for choice.

**Summary checkpoints:** System applies judgment, shows summary. User can confirm or intervene.

---

## User Interaction at Checkpoints

At each interactive checkpoint:

1. **System shows 3 options** — concrete, one line each
2. **User can:**
   - Pick: "2"
   - Combine: "like 1 but with the tension from 3"
   - Adjust: "more intimate, less dramatic"
   - Ask: "tell me more about 2"
   - Reject: "none of these — I'm sensing something quieter"

3. **If user adjusts or rejects:**
   - System generates new options informed by feedback
   - Options give vocabulary even when they don't fit

**The principle:** Options are not just choices — they're vocabulary. Even rejected options help the user articulate what they're sensing.

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
