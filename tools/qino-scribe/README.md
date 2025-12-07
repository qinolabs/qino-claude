# Qino Scribe

The ecosystem tells its own story. You participate, but you don't narrate.

---

## What is this?

Your ecosystem evolves through conversations, explorations, and accumulated notes. Changes happen across sessions. Threads emerge and weave together. Concepts deepen.

Qino Scribe chronicles this evolution. It observes what changed since the last chapter and proposes a narrative — told from the ecosystem's perspective, as if the concepts themselves were witnessing their own development.

The chronicle is a public artifact: something you could share with collaborators, revisit in a year, or offer to your future self as a record of how ideas grew.

---

## Commands

| Command | What it does |
|---------|--------------|
| `/scribe:chapter` | Observe changes since last chapter, write a new one |
| `/scribe:chronicle` | View the chronicle, see what's been recorded |
| `/scribe:voice` | Calibrate how the scribe speaks |

---

## Your first chapter

After you've done some work in your ecosystem:

```
/scribe:chapter
```

The scribe reads what changed and proposes a narrative. You react: "that captures it" or "there's something more" or "the tone feels off."

Together you shape the chapter. When it's ready, the scribe writes it to `chronicle/chapters/`.

---

## The chronicle structure

```
chronicle/
├── manifest.json           # Tracks chapters and state
├── chapters/
│   ├── 001-first-light.md
│   └── 002-threads-converge.md
└── voice.md                # Optional: how the scribe speaks
```

Chapters accumulate. The manifest tracks what's been chronicled so the scribe knows where to pick up.

---

## Voice

The scribe has a voice. By default, it's:
- The ecosystem observing its own evolution
- Present tense for what moved, past tense for what arrived
- Narrative, not bullet points
- Aware of the wanderer as participant, not protagonist

Use `/scribe:voice` to calibrate if something feels off.

---

## Who is this for?

- **Future you**: "What was I thinking when this idea emerged?"
- **Collaborators**: "Here's the journey so far"
- **The record**: Some ideas deserve to be witnessed

---

## Installation

Copy to your `.claude/` directory:

```
.claude/
├── agents/
│   └── qino-scribe-agent.md
├── commands/
│   └── scribe/
│       ├── chapter.md
│       ├── chronicle.md
│       └── voice.md
└── references/
    └── qino-scribe/
        ├── version.json
        ├── chronicle-spec.md
        ├── chapter-format.md
        └── voice-guide.md
```

Or use the updater if you have qino-tools installed.

---

## Status

Qino Scribe is in early development. The technical structure is in place; the creative voice is being explored through the qino-concept workflow in the concepts repository.

The voice guide will mature as the concept develops.
