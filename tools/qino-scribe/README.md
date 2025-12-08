# qino Scribe

The ecosystem tells its own story. You participate, but you don't narrate.

---

## What is this?

Your ecosystem evolves through conversations, explorations, and accumulated notes. Changes happen across sessions. Threads emerge and weave together. Concepts deepen.

qino Scribe chronicles this evolution — not as a changelog, but as a fantasy world. Characters appear when concepts arrive. Locations reveal hidden rooms when ideas deepen. Seasons shift when larger patterns surface.

The chronicle is something you could give to a collaborator, revisit in a year, or read like a children's book by nightlamp.

---

## Usage

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
├── world.md                # Characters, locations, arcs — the living world
└── chapters/
    ├── 001-first-light.md
    └── 002-threads-converge.md
```

Chapters accumulate. The world grows.

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
        ├── version.json
        ├── chronicle-spec.md
        ├── chapter-format.md
        └── voice-guide.md
```

Or use `/update-qino-tools` if you have the updater installed.

---

## Status

qino Scribe is in early development. The world-building voice is being explored through the qino-concept workflow.
