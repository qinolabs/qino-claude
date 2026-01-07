# qino Scribe

Story emerges through relationship. The chronicle is a living world.

---

## What is this?

Your ecosystem evolves through conversations, explorations, and accumulated work. qino Scribe transforms this evolution into a fantasy chronicle — not documentation with literary flair, but a story world with action, stakes, and relationship.

The key insight: **relationship permeates every dimension of story**.

qino Scribe pushes toward:
- Characters who perceive each other, not just exist
- Stakes between people, not just for them
- A world that sees back when the wanderer sees it
- What remains unspoken accumulating across chapters

---

## Usage

After you've done some work in your ecosystem:

```
/qino-scribe:chapter
```

The scribe follows a **lens-first staged architecture**:

**Prep Agent** (2 interactive checkpoints):
1. **Lens Layer** — Choose story direction → user selects from 3 lenses
2. **World Behavior** — Generated through chosen lens (automatic)
3. **Scene Layer** — Present scene seeds → user chooses
4. **Beat** — Derived from lens + scene + material (automatic)

**Hard Cut** — prep.md complete

**Prose Agent** (receives only prep.md):
5. **Write** — Draft from constraint, verify against 6 checks

**Post-Prose** (automatic):
6. **World Update** — Evolve world.md
7. **Arc Update** — Advance arcs.md
8. **Snapshot** — Copy state to chapter directory

Each checkpoint shows **certainty** — what the system has derived — to inspire user intuition.

### Rewind

Made a chapter you want to regenerate?

```
/qino-scribe:rewind
```

Restores world state to before the last chapter.

---

## Architecture

Two agents with a hard cut between them:

```
agents/
├── scribe-prep.md     # Prep agent — Lens, World Behavior, Scene, Beat layers
└── scribe-prose.md    # Prose agent — writes from prep.md constraint

commands/qino-scribe/
├── chapter.md         # Orchestrates the two-agent flow
└── rewind.md          # Restore to before last chapter

references/qino-scribe/
├── layers.md          # Lens-first architecture, checkpoints, prep.md structure
├── story-lenses.md    # The twelve lenses, sensitivities, diff resonance
├── craft.md           # Chapter format, world.md template, arc shapes
├── voice.md           # Sentence-level prose craft
├── principles.md      # Ten relational principles (reusable)
└── foundation.md      # Setting Foundation for image generation
```

**The hard cut is the quality mechanism.** The prose agent receives only prep.md — it cannot recycle descriptions from earlier context, must generate fresh from the sensory palette, and invents from constraint.

---

## Chronicle Structure

```
chronicle/
├── manifest.json      # Chapter index and git refs
├── world-seed.md      # The world's seed (set once)
├── world.md           # Living state with Pressures
├── arcs.md            # Narrative threads in motion
└── chapters/
    └── NNN-slug/
        ├── prep.md        # The constraint artifact
        ├── chapter.md     # The narrative
        ├── world.md       # Snapshot at write time
        └── arcs.md        # Snapshot at write time
```

### Relational Tracking in world.md

Characters track what they've noticed:

```markdown
### Selin
First appeared: Chapter 1
[Who they are, what stays with you about them]

*Voice:* Direct. Short sentences. Finishes others' thoughts.

**Has been watching:**
What they've noticed about the wanderer — unspoken
```

The wanderer tracks what others sense:

```markdown
## The Wanderer

**What remains unspoken:**
What others have sensed but not named — accumulating across chapters
```

---

## Key Principles

### Twelve Story Lenses

The lens determines HOW you perceive for a chapter. Each lens foregrounds specific sensitivities:

1. **The Arrival** — being received, entering new territory
2. **The Journey** — leaving known ground, companions discovering each other
3. **The Return** — coming back changed, familiar made strange
4. **The Discovery** — something hidden comes to light
5. **The Confrontation** — something must be faced
6. **The Crisis** — pressure breaks, action before understanding
7. **The Loss** — someone or something departs
8. **The Vigil** — action impossible, presence is all
9. **The Ritual** — cultural form holds the chapter
10. **The Complication** — change creates a problem
11. **The Work** — making together, hands learning
12. **The Gathering** — multiple threads convene

Each lens has natural **diff resonance** with types of source material changes. See `references/qino-scribe/story-lenses.md` for details.

### Ten Relational Principles

Embedded as active constraints in each layer:

1. **Mutual Seeing** — The world must see back
2. **The Relational Mirror** — Characters gain texture through perceiving each other
3. **Relationship as Lens** — The world filters through relationship
4. **What Remains Unspoken** — Relationships accumulate in silence
5. **The World Has Been Watching** — Someone has been paying attention
6. **Depth Through Others** — Characters defined by how others perceive them
7. **Reader as Bond** — Never withhold from the reader
8. **Responses That Complete** — Meaning completed in unexpected directions
9. **Mundane Grounding** — The profound interrupts the ordinary
10. **Relationship, Not Explanation** — What it means to someone, not what it is

### Six Verification Checks

Before presenting a chapter:

1. **Stakes** — Does someone want something they can't easily have?
2. **Vividness** — Does the environment intrude at least once?
3. **Dialogue** — Is there one mundane exchange? Can you tell who's speaking?
4. **Reader** — Is there one gap the reader fills?
5. **Mutual Seeing** — Does someone perceive something in the wanderer?
6. **Response Completes** — Does at least one response reach beyond what was said?

---

## Installation

Copy to your `.claude/` directory:

```
.claude/
├── agents/
│   ├── scribe-prep.md
│   └── scribe-prose.md
├── commands/
│   └── qino-scribe/
│       ├── chapter.md
│       └── rewind.md
└── references/
    └── qino-scribe/
        ├── layers.md
        ├── craft.md
        ├── voice.md
        └── principles.md
```
