# Layer System

*The staged architecture for chapter creation — lens-first.*

---

## Overview

Story evolves in layers. The lens comes first — shaping how we perceive the source material. User steers via choices at two checkpoints.

```
LENS LAYER         → story direction    → user chooses
         ↓
WORLD BEHAVIOR     → through lens       (automatic)
         ↓
SCENE LAYER        → scene seeds        → user chooses
         ↓
BEAT               → derived            (automatic)
         ↓
         [prep.md complete — hard cut]
         ↓
PROSE LAYER        → chapter.md         (separate agent)
         ↓
WORLD UPDATE       → world.md changes   (automatic)
         ↓
ARC UPDATE         → arcs.md changes    (automatic)
         ↓
SNAPSHOT           → copies to chapter dir
```

---

## Checkpoint Design Principle

At each checkpoint, show:

1. **Certainty** — what the system has already derived
2. **Options** — 3 curated choices that serve the moment
3. **Space for intuition** — user can always provide their own direction

The system knows the intricate internal process. The user has intuition. The checkpoint is a surface where intuition can materialize, informed by what the system sees.

---

## The Layers

### Lens Layer

**Reads:** recent chapters, arcs.md, git diff (first-pass), world.md

**Produces:** Story Lens section of prep.md

**The key insight:** The lens determines how we perceive the source material. Choosing the lens first means world behavior is generated *through* that lens, not independently.

**Questions to ask:**
- What kind of chapter feels right next?
- What's the narrative momentum from recent chapters?
- What lenses rhyme with the diff shape?
- Where is the chronicle in its journey?

**Chronicle position matters:**
- **Early** — world still being established, arrivals and discoveries natural
- **Mid-journey** — relationships developed, complications and work natural
- **Approaching resolution** — returns, gatherings, confrontations natural

**Checkpoint: Story Direction**
```
─────────────────────────────────────────────────────────────────
where we are

  momentum    [narrative direction from recent chapters]
  pressure    [what's building in arcs]
  diff shape  [rough characterization: additions/removals/refactoring]
  position    [early chronicle / mid-journey / approaching resolution]

─────────────────────────────────────────────────────────────────
story direction

  1 [The Work] — making together, hands learning
                 rhymes with: [why this lens fits diff + flow]

  2 [The Discovery] — something hidden comes to light
                      rhymes with: [why this lens fits]

  3 [The Arrival] — being received, entering new territory
                    rhymes with: [why this lens fits]

─────────────────────────────────────────────────────────────────
[ 1-3 ] or describe your own    [ >> ] let system choose
```

After user chooses: write Story Lens section to prep.md with sensitivities.

---

### World Behavior Layer (Automatic)

**Reads:** git diff (through chosen lens), world-seed.md, qino-lens reference files

**Produces:** World Behavior section of prep.md

**No checkpoint.** The lens determines what we notice in the diff.

**The role of the diff:** The diff becomes **world behavior** — what the world does differently today. But the LENS shapes what we notice. Different lenses produce different world behaviors from the same diff.

**Lens-specific perception:**
- With "The Work" lens: notice what cooperates, what materials respond to craft
- With "The Loss" lens: notice what's absent, what spaces feel emptied
- With "The Arrival" lens: notice what offers itself, what opens to newcomers

**Two Passes (through the lens):**
1. **Stats** — structural shape: density, flow, location, rhythm
2. **Messages** — what would a chapter with THIS LENS notice?

**Domains:**
| Domain | What it includes |
|--------|------------------|
| Material | How substances respond — wood, metal, water, ink |
| Spatial | How distances feel — sounds, visibility, doors |
| Temporal | How time moves — mornings, nights, hours |
| Creature | What animals do — migration, stillness, presence |
| Object | What cooperates or resists — stuck/opening, fraying |
| Human background | What unnamed people do — industry, settlements |

**Output:**
```markdown
## World Behavior

**Through [Lens Name]:**
[What the world does today — seen through this lens's sensitivities]

**What becomes visible:**
[1-3 specific observations — what this lens foregrounds]

**What recedes:**
[What's present but not the focus]
```

---

### Scene Layer

**Reads:** world.md, arcs.md, lens + world behavior, world-seed.md

**Produces:** Grounding section of prep.md

**Questions to ask:**
- Given this lens and behavior, which relationships could become scenes?
- Who is positioned to encounter this world behavior?
- What textures, smells, sounds does this theme imply?
- **Newcomer's eyes:** What would someone notice on first day here?

**Outputs:**
- Sensory palette (5-8 concrete nouns from the theme)
- Active pressures (2-3 from world.md)
- The world's strangeness (what a newcomer would notice)
- Scene seeds (3 relational situations that serve the lens + behavior)

**Checkpoint: Scene Seeds**
```
─────────────────────────────────────────────────────────────────
what we have

  lens        [chosen lens name]
  behavior    [one-line: what the world does today]
  available   [characters in position, locations accessible]
  threads     [arcs that could move]

─────────────────────────────────────────────────────────────────
scene seeds

  1 → [who + where + situation]
      opens: [what this could become]

  2 → [who + where + situation]
      opens: [what this could become]

  3 → [who + where + situation]
      opens: [what this could become]

─────────────────────────────────────────────────────────────────
[ 1-3 ] or describe your own    [ >> ] start writing
```

After user chooses: write Grounding section to prep.md.

---

### Beat Layer (Derived)

**Reads:** lens, world behavior, scene seed, world.md, story-lenses.md

**Produces:** Beat section of prep.md

**No checkpoint.** The beat is derived from the creative decisions already made.

**Territory discovery:**
The territory is the flavor of the lens that emerges from lens + scene + material. Read the territories in story-lenses.md. Which one does the material suggest?

**Derive:**
- **Territory:** Which flavor of this lens emerged
- **Opening situation:** Where + who + what's happening
- **Characters:** Wants, protections, and voice (see Voice Handling below)
- **Obstacle:** What resists (from territory + world behavior)
- **Stakes:** What could be lost (calibrate by lens type)
- **What's unsaid:** What's held back

**Voice Handling:**

Voice is living state, not fixed template. The prose agent has discretion to maintain or evolve voice as story demands.

| Character Status | What prep.md includes | What prose agent does |
|------------------|----------------------|----------------------|
| **Established voice** (has examples in world.md) | Voice examples as reference | Maintains or evolves with discretion |
| **New voice** (never spoken, or "Voice: Not yet heard") | Only wants/protects — no voice field | Invents from character context |

**Do NOT interpret voice.** No "sparse, practical, leaves space for others to fill." That's interpretation. Examples transmit voice; interpretation transmits understanding-of-voice, which bleeds into narrator commentary.

**Output:**
```markdown
## Beat

**Territory:** [discovered — which flavor of this lens emerged]

**Opening situation:** [where + who + what's happening]

**Who's involved:**

[Established Character]
- wants: [what they want]
- protecting: [what they won't say]
- voice: (Ch N — [brief scene context])
  - "[example line]"
  - "[example line]"

[New Character]
- wants: [what they want]
- protecting: [what they won't say]
- (voice: prose discovers)

**Obstacle:** [what resists]

**Stakes:** [what could be lost — calibrated to lens type]

**What's unsaid:** [what's being held back]
```

---

### Prose Layer

**Reads:** prep.md AND world-seed.md (hard cut from other context)

**Produces:** chapter.md

**What travels to the prose agent:**
- **prep.md** — the constraint (what to write, how to perceive)
- **world-seed.md** — the seed (the world's origin and generative grammar)

**The Story Lens:** prep.md carries the lens with foregrounded sensitivities. The territory (discovered from the material) guides attentional posture. The prose agent reads the lens, consults linked qino-lens reference files, writes through that perceptual mode.

**Theme as seed:** world-seed.md establishes the key signature — atmosphere's origin — but the chronicle grows beyond it. Continuity lives in world.md and arcs.md.

**Constraint:** The prose agent receives only prep.md and world-seed.md. Can't recycle descriptions, must generate from sensory palette. But carries craft knowledge — constraint is on content, not on how to write.

---

### World Update Layer (Automatic)

**Reads:** chapter.md + current world.md

**Produces:** Updated world.md

**Apply automatically:**
- Pressure released/building based on what happened
- Wanderer's new position and what they carry
- New characters/locations from World Tokens
- Character perception updates
- **Voice capture** (see below)

**Voice Capture:**

After each chapter, update Voice fields in world.md for characters who spoke:

| Situation | Action |
|-----------|--------|
| Character spoke for first time | Extract 2-3 example lines, add Voice field |
| Character has existing Voice | Add new examples if voice evolved, or note consistency |
| Character's voice shifted | Update examples, note the shift context |

**Voice format in world.md:**
```markdown
*Voice:* (Ch N — [brief scene context])
- "[example line]"
- "[example line]"
- "[example line]"
```

The scene context helps future prose agents understand WHEN these examples occurred, without interpreting WHAT they mean.

No confirmation required — bookkeeping, not steering.

---

### Arc Update Layer (Automatic)

**Reads:** chapter.md + current arcs.md

**Produces:** Updated arcs.md

**Apply automatically:**
- Arc advancement if chapter moved something
- New arc if one began
- Arc completion if one resolved

No confirmation required.

---

### Snapshot Layer

**Reads:** Updated world.md and arcs.md

**Produces:** Copies in chapter directory

No checkpoint. Pure mechanical copy. Ensures retroactive accuracy.

---

## prep.md Structure

The artifact that travels from prep agent to prose agent:

```markdown
# Chapter NNN Prep

## Story Lens

**Lens:** [chosen lens name]

**Foreground these sensitivities:**
- [Sensitivity 1] — [brief description]
- [Sensitivity 2] — [brief description]
- [Sensitivity 3] — [brief description]

**Craft note:** [from story-lenses.md]

## World Behavior

**Through [Lens Name]:**
[What the world does today — seen through this lens's sensitivities]

**What becomes visible:**
[What this lens foregrounds in the material]

**What recedes:**
[What's present but not the focus]

## Grounding

**Sensory palette:** [concrete nouns — materials, textures, weathers]
**Pressures:** [what's building in the world]
**The world's strangeness:** [what a newcomer would notice]
**Scene seed:** [the one user picked]

## Beat

**Territory:** [discovered — which flavor of this lens emerged]

**Opening situation:** [where + who + what's happening]

**Who's involved:**

[Established Character]
- wants: [what they want]
- protecting: [what they won't say]
- voice: (Ch N — [brief scene context])
  - "[example line]"
  - "[example line]"

[New Character]
- wants: [what they want]
- protecting: [what they won't say]
- (voice: prose discovers)

**Obstacle:** [what resists]

**Stakes:** [what could be lost — calibrated to lens type]

**What's unsaid:** [what's being held back]
```

**What is NOT in prep.md:**
- Full world.md content
- Full arcs.md content
- The literal git diff content (only world behavior travels)
- Recent chapter content
- Reasoning or process notes
- Prose fragments (give situations, not drafts)
- Diff vocabulary (interpret to behavior, not words)
- **Interpretive voice descriptions** (no "sparse, practical, leaves space" — examples only)

---

## Checkpoint Types

| Layer | Type | User Action |
|-------|------|-------------|
| Lens | **Interactive** | Choose story direction (1-3) or describe own |
| World Behavior | Automatic | None — generated through lens |
| Scene | **Interactive** | Choose scene seed (1-3) or describe own |
| Beat | Automatic | None — derived from above |

Two interactive checkpoints. Each shows "certainty" to inspire custom input.

---

## Direction Threading

When the user provides upfront direction, it becomes a through-line visible at each checkpoint as **option 4 [direction]**.

### Adaptive Direction

If user diverges at Lens layer, Scene option 4 adapts:
- Integrate what was honored
- Account for the divergent choice
- Synthesize remaining direction with new path

### Direction Status Tracking

Each layer logs:
- **Direction status:** honored | diverged | n/a
- **Final path:** recorded at Scene layer completion

---

## User Interaction at Checkpoints

At each interactive checkpoint:

1. **System shows certainty** — what's already derived
2. **System shows 3-4 options** — options 1-3 system-generated, option 4 direction-aligned
3. **User can:**
   - Pick: `2` or `4`
   - Combine: "like 1 but more intimate"
   - Adjust: "more contemplative, less dramatic"
   - Ask: "tell me more about 2"
   - Reject: "none of these — I'm sensing something quieter"
   - Custom: Describe their own direction

**The principle:** The certainty section empowers custom input — users see what the system knows, then express intuition the system couldn't derive.

---

## Auto-Pick Syntax

| Input | Meaning |
|-------|---------|
| `2` | Pick option 2, ask me at next checkpoint |
| `>>` | System picks all remaining, start writing |

Two interactive checkpoints: Lens → Scene.

---

## The Twelve Story Lenses

Used in Lens Layer to generate story direction options. Each lens foregrounds specific sensitivities from qino-lens.

See `references/qino-scribe/story-lenses.md` for full details including sensitivities, territories, diff resonance, and craft notes.

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

Don't traverse all lenses. Consider both chronicle flow (what the story needs) and diff resonance (what the material suggests).

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

---

## File Locations

**Chapter directory structure:**
```
chronicle/chapters/NNN-slug/
├── prep.md          ← Built through layers
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
