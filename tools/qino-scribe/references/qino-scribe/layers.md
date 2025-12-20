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
                    (includes opening)
         ↓
         [prep.md complete — hard cut]
         ↓
PROSE LAYER       → chapter.md       (separate agent)
                    → 3 verification passes
         ↓
WORLD UPDATE      → world.md changes (automatic)
         ↓
ARC UPDATE        → arcs.md changes  (automatic)
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
  last seen   [where wanderer was]

─────────────────────────────────────────────────────────────────
scene seeds

  1 → [who + relationship + where + tension]
  2 → [another relational situation]
  3 → [another relational situation]

─────────────────────────────────────────────────────────────────
```

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
  scene seed  [the one user picked]

─────────────────────────────────────────────────────────────────
the diff    [one line: what changed]
shape       [the quality — appearance, transformation, connection, etc.]

resonances

  1 → [where this shape could live in the story world]
  2 → [another resonance]
  3 → [another resonance]

─────────────────────────────────────────────────────────────────
```

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

**Checkpoint: Directions (includes opening)**
```
─────────────────────────────────────────────────────────────────
grounding

  theme       [sensory palette words]
  resonance   [the one user picked]

─────────────────────────────────────────────────────────────────
directions

  1 [Story Type] → [what happens]
                   opens: [where + how we enter]

  2 [Story Type] → [what happens]
                   opens: [where + how we enter]

  3 [Story Type] → [what happens]
                   opens: [where + how we enter]

─────────────────────────────────────────────────────────────────
```

Each direction includes its opening — story type and entry unified.

After user chooses: prep.md is complete.

---

### Prose Layer

**Reads:** ONLY prep.md (hard cut from previous context)

**Produces:** chapter.md

**Constraint:** The prose agent receives only prep.md. This forces fresh invention — can't recycle descriptions, must generate from sensory palette, stakes and voice notes are all that's visible. But the agent carries craft knowledge — the constraint is on content, not on how to write.

**Verification (3 passes after drafting, before presenting):**

1. **Strangeness Pass** — Look for organic moments where attention lands on the wanderer. Add external observation if natural, skip if forced. Maximum 1-2 moments.

2. **Editorial Pass** — Scan for LLM anti-patterns:
   - Thematic echo (declaring theme instead of showing)
   - Frictionless success (world too cooperative)
   - Paraphrase loops (restating what was just shown)
   - Diagnostic label-speak (naming emotions instead of embodying)
   - Abstraction drift (losing sensory grounding)

3. **Final Checklist** — Stakes, vividness, dialogue variety, reader gap, mutual seeing, response completion, immersion (no source material leaking)

---

### World Update Layer (Automatic)

**Reads:** chapter.md just written + current world.md

**Produces:** Updated world.md

**Apply automatically:**
- Pressure released/building based on what happened
- Wanderer's new position and what they carry
- New characters/locations from World Tokens
- Character perception updates (what they've now witnessed)

No confirmation required — this is bookkeeping, not steering.

---

### Arc Update Layer (Automatic)

**Reads:** chapter.md + current arcs.md

**Produces:** Updated arcs.md

**Apply automatically:**
- Arc advancement if the chapter moved something
- New arc if one began
- Arc completion if one resolved

No confirmation required.

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
| Directions | **Interactive** | Choose direction + opening |

**Interactive checkpoints:** System pauses, presents options, waits for choice.

Post-prose updates (world, arcs, snapshots) are automatic — no confirmation required.

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
| `>>` | System picks all remaining, start writing |

Three checkpoints total: Scene Seeds → Resonances → Directions (with opening).

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

After all updates applied, announce completion:

```
─────────────────────────────────────────────────────────────────
chapter NNN — [Title]

  [One or two lines: what happened in the chapter]

  The wanderer was last seen [where/doing what]

─────────────────────────────────────────────────────────────────
updated

  world    [what changed — pressures, locations, characters]
  arcs     [Arc Name] (begun/advanced/completed)

─────────────────────────────────────────────────────────────────
                                                      [word count]
```

The summary shows what was applied automatically. User can review world.md/arcs.md if they want to adjust.

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
