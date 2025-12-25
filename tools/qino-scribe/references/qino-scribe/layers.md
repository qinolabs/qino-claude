# Layer System

*The staged architecture for chapter creation.*

---

## Overview

Story evolves in layers. Each layer produces an artifact. The next layer works from that artifact, not full context. User steers via choices at checkpoints.

```
WORLD LAYER       → scene seeds        → user chooses
         ↓
DISTURBANCE LAYER → world behavior     → user chooses
         ↓
BEAT LAYER        → directions         → user chooses
                    (includes opening)
         ↓
         [prep.md complete — hard cut]
         ↓
PROSE LAYER       → chapter.md         (separate agent)
                    → 3 verification passes
         ↓
WORLD UPDATE      → world.md changes   (automatic)
         ↓
ARC UPDATE        → arcs.md changes    (automatic)
         ↓
SNAPSHOT          → copies to chapter dir
```

---

## The Layers

### World Layer

**Reads:** world-seed.md, world.md, arcs.md, recent chapters

**Produces:** Grounding section of prep.md

**Questions to ask:**
- What textures, smells, sounds does this theme imply?
- What pressures are building in the world right now?
- Who has been watching? What have they accumulated?
- Which relationship could become a scene?
- **Newcomer's eyes:** What would someone notice on their first day here that locals walk past without a glance?

**Outputs:**
- Sensory palette (5-8 concrete nouns from the theme)
- Active pressures (2-3 from world.md)
- The world's strangeness (what a newcomer would notice)
- Scene seeds (3 relational situations)

**Checkpoint: Scene Seeds**
```
─────────────────────────────────────────────────────────────────
grounding

  theme       [sensory palette words]
  pressure    [what's building]
  strangeness [what a newcomer would notice that locals walk past]
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

**Reads:** Git diff, world-seed.md for project understanding

**Produces:** World Behavior section of prep.md

**Consult:** `references/disturbance.md` — how git diffs become world behavior

**The role of the diff:** The diff doesn't become story content. It becomes **world behavior** — what the world does differently today. Characters experience this as ordinary. The reader who knows the source perceives the rhyme.

**Two Passes:**
1. **Stats** — structural shape: density, flow direction, location, rhythm
2. **Messages** — texture + keywords (functional and resonant)

**Process:**
1. Observe stats for structural shape
2. Read messages for texture, extract keywords
3. Synthesize: Shape + Texture (e.g., "Transformation — clarifying")
4. Ask: What would the world DO if it felt this way?
5. Draw from domains: material, spatial, temporal, creature, object, human background
6. Be specific to this world's vocabulary from the theme

**Checkpoint: World Behavior**
```
─────────────────────────────────────────────────────────────────
grounding

  scene seed  [the one user picked]
  shape       [Transformation — clarifying]

─────────────────────────────────────────────────────────────────
world behavior

  1 → [what the world does — from one domain]
      points toward: [who/what might be sensitive]

  2 → [what the world does — from another domain]
      points toward: [who/what might be sensitive]

  3 → [what the world does — from another domain]
      points toward: [who/what might be sensitive]

─────────────────────────────────────────────────────────────────
```

The diff becomes behavior. Characters live in it as ordinary.

---

### Beat Layer

**Reads:** The pressure that's moving, accumulated prep.md

**Produces:** Story Lens and Beat sections of prep.md

**Consult:** `references/qino-scribe/story-lenses.md` — the twelve lenses and their sensitivities

**Questions to ask:**
- What story lens serves this moment? (Select 3 from the twelve lenses)
- What's the opening situation — where/who/what's happening?
- Who's involved, what do they want, what are they protecting?
- What's being held back that the reader will sense?

**Outputs:**
- Story lens with foregrounded sensitivities and territory
- Opening situation
- Characters with wants and what they're protecting
- What's unsaid
- Stakes

**Checkpoint: Directions (includes opening)**
```
─────────────────────────────────────────────────────────────────
grounding

  theme       [sensory palette words]
  behavior    [what the world is doing today]
  pressure    [from world.md — what's ready to move]

─────────────────────────────────────────────────────────────────
directions

  1 [Story Lens] → [what happens]
                   opens: [situation — where + who + what's happening]

  2 [Story Lens] → [what happens]
                   opens: [situation — where + who + what's happening]

  3 [Story Lens] → [what happens]
                   opens: [situation — where + who + what's happening]

─────────────────────────────────────────────────────────────────
```

Each direction includes its opening situation — story lens and entry unified.

After user chooses: append Story Lens and Beat sections to prep.md.

---

### Prose Layer

**Reads:** prep.md AND world-seed.md (hard cut from other context)

**Produces:** chapter.md

**What travels to the prose agent:**
- **prep.md** — the constraint (what to write, how to perceive)
- **world-seed.md** — the seed (the world's origin and generative grammar)

**The Story Lens:** prep.md carries a Story Lens section that tells the prose agent HOW to perceive the world for this chapter. The lens declares which sensitivities to foreground and includes a territory (the creative direction within the lens). The prose agent reads the lens, consults the linked qino-lens reference files, and writes through that perceptual mode.

**Theme as seed:** world-seed.md is a seed, not a container. It establishes the key signature — the atmosphere's origin — but the chronicle grows beyond it. New locations emerge, characters surface, mysteries compound. The prose agent reads the theme to feel what kind of world this began as, then invents freely within that generative grammar. Continuity lives in world.md and arcs.md.

**Constraint:** The prose agent receives only prep.md and world-seed.md. This forces fresh invention — can't recycle descriptions, must generate from sensory palette, character wants and protections are all that's visible. But the agent carries craft knowledge — the constraint is on content, not on how to write.

**Output:** The prose agent writes the chapter and presents it to the orchestrator. It does NOT self-edit or verify — that's the editorial agent's job.

**Editorial Review:** After the prose agent presents its draft, the orchestrator spawns a separate editorial agent (scribe-editorial) to review. The editorial agent sees only the draft chapter file — not prep.md, not world.md. This separation is intentional: it evaluates execution on its own terms. See chapter.md Phase 2.5 for the full editorial flow.

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

## Grounding
**Sensory palette:** [concrete nouns — materials, textures, weathers]
**Pressures:** [what's building in the world]
**The world's strangeness:** [what a newcomer would notice that locals walk past]
**Scene seed:** [the one user picked]

## World Behavior
**Shape:** [Transformation — clarifying]
**The world does:** [The stuck drawer opens. Quiet industry. Debts being settled.]
**Points toward:** [understanding, interpretation — who might be sensitive]

## Story Lens

**Lens:** [chosen lens name]

**Foreground these sensitivities:**
- [Sensitivity 1] — [brief description]
- [Sensitivity 2] — [brief description]
- [Sensitivity 3] — [brief description]

**Territory:** [chosen territory, or "agent's choice" if user didn't specify]

**Craft note:** [from story-lenses.md]

## Beat
**Opening situation:** [where + who + what's happening — no prose fragments]

**Who's involved:**
- [Character]: wants [what they want] / protecting [what they won't say]
- [Character]: wants [what they want] / protecting [what they won't say]

**What's unsaid:** [what's being held back that the reader will sense]

**Stakes:** [what could be lost/gained]
```

**What is NOT in prep.md:**
- Full world.md content
- Full arcs.md content
- The literal git diff content (only world behavior travels)
- Recent chapter content
- Reasoning or process notes
- Prose fragments or sentences (give situations, not drafts)
- Diff vocabulary (interpret to behavior, not words)

---

## Checkpoint Types

| Layer | Type | User Action |
|-------|------|-------------|
| Scene Seeds | **Interactive** | Choose scene seed |
| World Behavior | **Interactive** | Choose how the world behaves today |
| Directions | **Interactive** | Choose direction + opening |

**Interactive checkpoints:** System pauses, presents 3 options from different domains, waits for choice.

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

Three interactive checkpoints: Scene Seeds → World Behavior → Directions.

---

## The Twelve Story Lenses

Used in Beat Layer to generate direction options. Each lens foregrounds specific sensitivities from qino-lens.

See `references/qino-scribe/story-lenses.md` for full details including sensitivities, territories, and craft notes.

1. **The Arrival** — What if this chapter is about being received?
2. **The Journey** — What if this chapter leaves known ground?
3. **The Return** — What if we come back to where we've been?
4. **The Discovery** — What if something hidden comes to light?
5. **The Confrontation** — What if something must be faced?
6. **The Crisis** — What if the pressure breaks now?
7. **The Loss** — What if something or someone departs?
8. **The Vigil** — What if action is impossible and presence is all?
9. **The Ritual** — What if a cultural form holds the chapter?
10. **The Complication** — What if the change creates a problem?
11. **The Work** — What if this chapter is about making together?
12. **The Gathering** — What if multiple threads convene?

Don't traverse all lenses. Let the situation guide selection of 3 that fit.

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
├── world-seed.md    ← Set once, never changes
├── world.md         ← Canonical, updated after each chapter
├── arcs.md          ← Canonical, updated after each chapter
└── manifest.json    ← Chapter index and state
```
