# qino World

Adventure emerges from pressure. The chronicle is a living world.

---

## What is this?

Your ecosystem evolves through conversations, explorations, and accumulated work. qino World transforms this evolution into a fantasy chronicle — not documentation with literary flair, but a story world with action, stakes, and consequence.

The difference from qino-scribe: **adventure, not observation**.

Where qino-scribe might generate a chapter where the wanderer visits a location and a character explains what changed, qino World pushes toward:
- Unexpected locations drawn from the theme's unexplored territory
- Complications that create stakes
- Action where the wanderer participates, not just witnesses
- Pressures that build across chapters

---

## Usage

After you've done some work in your ecosystem:

```
/world:chapter
```

The scribe follows a six-phase process:

1. **Ground** — Inhabit the world before looking at changes
2. **Observe** — See what changed and feel what it disturbs
3. **Discover** — Generate three chapter options, choose the most alive
4. **Propose** — Present the beat for your approval
5. **Write** — Draft the chapter
6. **Update** — Evolve world.md with new pressures

---

## Architecture

Three reference files, each with a distinct purpose:

```
references/qino-world/
├── soul.md      # Who the scribe is (read once per session)
├── craft.md     # Technical format reference (consulted during writing)
└── process.md   # The workflow (guides each chapter)
```

**soul.md** — The unchanging essence. Voice, the wanderer's nature, what story is. Read once at session start, not re-read per chapter.

**craft.md** — Technical reference. Chapter format, world tokens, world.md structure. Consulted when writing, not when exploring.

**process.md** — The workflow. Six phases that ensure grounding before observation, exploration before execution.

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

The key evolution from qino-scribe: **world.md tracks pressures**, not just state.

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

### Three Options, Choose Most Alive
For every chapter, generate:
- **Option A**: The expected (tour-guide version)
- **Option B**: Unexpected location (from theme's unexplored territory)
- **Option C**: Complication (what could go wrong)

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
├── commands/
│   └── world/
│       └── chapter.md
└── references/
    └── qino-world/
        ├── soul.md
        ├── craft.md
        └── process.md
```

---

## Comparison with qino-scribe

| Aspect | qino-scribe | qino-world |
|--------|-------------|------------|
| Primary driver | Git diff | Pressures + diff |
| Chapter generation | Single beat proposed | Three options generated, most alive chosen |
| Theme use | Vocabulary/setting | Territory to explore |
| world.md | State tracking | State + pressures |
| Wanderer role | Witness/observer | Participant/actor |
| Dialogue | Can be explanatory | One exchange limit |
| Location choice | Where change maps to | Prefer unexplored territory |

---

## Status

qino World is experimental — a restructured approach to chronicle generation that prioritizes adventure over observation. It shares the soul and craft of qino-scribe but reorganizes the workflow to push toward complication and stakes.
