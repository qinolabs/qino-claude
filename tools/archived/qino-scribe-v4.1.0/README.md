# qino Scribe

Adventure emerges from pressure. The chronicle is a living world.

---

## What is this?

Your ecosystem evolves through conversations, explorations, and accumulated work. qino Scribe transforms this evolution into a fantasy chronicle — not documentation with literary flair, but a story world with action, stakes, and consequence.

The key insight: **adventure, not observation**.

qino Scribe pushes toward:
- Unexpected locations drawn from the theme's unexplored territory
- Complications that create stakes
- Action where the wanderer participates, not just witnesses
- Pressures that build across chapters

---

## Usage

After you've done some work in your ecosystem:

```
/scribe:chapter
```

The scribe follows a six-phase process:

1. **Ground** — Inhabit the world before looking at changes
2. **Observe** — See what changed and feel what it disturbs
3. **Discover** — Generate four chapter options, choose the most alive
4. **Propose** — Present the beat for your approval
5. **Write** — Draft the chapter
6. **Update** — Evolve world.md with new pressures

---

## Architecture

The scribe is an agent with embodied identity:

```
agents/
└── qino-scribe-agent.md   # The scribe's soul — who it is

commands/scribe/
└── chapter.md             # Task entry point

references/qino-scribe/
├── craft.md               # Technical format reference
├── process.md             # The six-phase workflow
└── voice-guide.md         # Sentence-level prose craft
```

**qino-scribe-agent.md** — The scribe's embodied identity. What story is, the author's mind, the wanderer, characters in relationship, the reader's entry, complete transformation. Includes `permissionMode: acceptEdits` for uninterrupted chapter writing.

**craft.md** — Technical reference. Chapter format, world tokens, world.md structure.

**process.md** — The workflow. Six phases that ensure grounding before observation, exploration before execution.

**voice-guide.md** — The craft of prose. How to execute the scribe's principles at the sentence level.

---

## Chronicle Structure

```
chronicle/
├── manifest.json      # Chapter index and git refs
├── theme.md           # The world's seed
├── world.md           # Living state with Pressures
└── chapters/
    └── NNN-slug.md
```

### world.md Pressures

The key feature: **world.md tracks pressures**, not just state.

```markdown
## Pressures

*What's building. What's about to break.*

### The Valley Traders Are Late
They should have arrived two days ago. No word.

### The Third Stack
Selin still hasn't discussed it. Whatever it contains is changing her.
```

Pressures are fuel for future chapters. Without them, the story stalls.

---

## Key Principles

### Ground Before Observe
Read theme and world.md *before* looking at the diff. Know what's alive in the world independent of changes.

### Four Options, Choose Most Alive
For every chapter, generate:
- **Expected**: The tour-guide version
- **Unexpected**: Location from theme's unexplored territory
- **Complication**: What could go wrong
- **Wild Card**: Something the scribe wouldn't normally try

Choose the option with the most action, stakes, and wanderer participation.

### Action Over Explanation
- One explanatory dialogue exchange maximum per chapter
- Show through behavior, environment, consequence
- The wanderer *does* something, doesn't just witness

### Pressures Must Evolve
Every chapter should leave at least one pressure building. If the Pressures section is empty after a chapter, you haven't finished.

---

## Installation

Copy to your `.claude/` directory:

```
.claude/
├── agents/
│   └── qino-scribe-agent.md
├── commands/
│   └── scribe/
│       └── chapter.md
└── references/
    └── qino-scribe/
        ├── craft.md
        ├── process.md
        └── voice-guide.md
```
