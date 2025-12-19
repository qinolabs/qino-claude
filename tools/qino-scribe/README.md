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

The scribe follows a **staged two-agent architecture**:

**Prep Agent** (3 interactive checkpoints):
1. **World Layer** — Inhabit theme and world state → present scene seeds
2. **Disturbance Layer** — Read git diff → present angles
3. **Beat Layer** — Define story type and characters → present directions

**Hard Cut** — prep.md complete

**Prose Agent** (receives only prep.md):
4. **Write** — Draft from constraint, verify against 6 checks

**Post-Prose** (2 summary checkpoints):
5. **World Update** — Evolve world.md, confirm changes
6. **Arc Update** — Advance arcs.md, confirm changes
7. **Snapshot** — Copy state to chapter directory

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
├── scribe-prep.md     # Prep agent — World, Disturbance, Beat layers
└── scribe-prose.md    # Prose agent — writes from prep.md constraint

commands/qino-scribe/
├── chapter.md         # Orchestrates the two-agent flow
└── rewind.md          # Restore to before last chapter

references/qino-scribe/
├── layers.md          # Layer flow, checkpoints, prep.md structure
├── craft.md           # Chapter format, world.md template, arc shapes
├── voice.md           # Sentence-level prose craft
└── principles.md      # Ten relational principles (reusable)
```

**The hard cut is the quality mechanism.** The prose agent receives only prep.md — it cannot recycle descriptions from earlier context, must generate fresh from the sensory palette, and invents from constraint.

---

## Chronicle Structure

```
chronicle/
├── manifest.json      # Chapter index and git refs
├── theme.md           # The world's seed (set once)
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
