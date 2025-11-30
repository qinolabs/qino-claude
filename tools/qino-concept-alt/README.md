# Qino Concept

A Claude Code tool for developing app concepts through gentle, nonlinear exploration.

## What It Does

Qino Concept helps you evolve app ideas using a **dynamic scaffold** approach. Instead of forcing you to define everything upfront, it works with whatever part of your concept feels most alive right now.

The agent uses five core verbs:
- **review** — See your concepts at a glance
- **refine** — Deepen the core impulse of a concept
- **explore** — Discover where a concept could go
- **relate** — Reveal connections between concepts
- **organize** — Bring structure to messy ideas

## Installation

Copy the tool files to your project's `.claude/` directory:

```
your-project/
├── .claude/
│   ├── .qino-concept/
│   │   ├── concept-spec.md
│   │   ├── manifest-spec.md
│   │   └── design-philosophy.md
│   ├── agents/
│   │   └── qino-concept-agent.md
│   └── commands/
│       └── qino-concept/
│           ├── init.md
│           ├── add-note.md
│           ├── review.md
│           ├── refine.md
│           ├── explore.md
│           ├── organize.md
│           └── relate.md
├── manifest.json          (created by init)
└── concepts/              (created by init)
    └── <concept-id>/
        └── concept.md
```

## Getting Started

### 1. Initialize your workspace

```
/qino-concept:init path/to/your/notes
```

The agent will:
- Scan your notes lightly (no bulk ingestion)
- Ask which files feel most alive to you
- Help you seed your first concept from what resonates

If you don't have existing notes, just run `/qino-concept:init` and start from scratch.

### 2. Review your concepts

```
/qino-concept:review
```

Get a quick overview of all concepts with their "alive thread" — the essence of each idea in 1-2 sentences.

### 3. Work with a specific concept

```
/qino-concept:refine moment-lens
/qino-concept:explore story-graph
/qino-concept:organize my-app
```

Each command starts by asking what part of the concept feels alive right now, then works from there.

### 4. Add new material

```
/qino-concept:add-note path/to/note.md
```

Ingest a single note into an existing concept or seed a new one.

### 5. Connect concepts

```
/qino-concept:relate concept-a concept-b
```

Discover how two or more concepts relate to each other.

## Commands Reference

| Command | Purpose | Creates/Modifies |
|---------|---------|------------------|
| `init` | Initialize workspace from existing notes | `manifest.json`, `concepts/` |
| `add-note` | Ingest a single note | `concept.md`, `manifest.json` |
| `review` | Overview all concepts | Nothing (read-only) |
| `refine` | Deepen the Real-World Impulse | `concept.md`, `manifest.json` |
| `explore` | Discover new directions | `concept.md`, `manifest.json` |
| `organize` | Restructure a messy concept | `concept.md`, `manifest.json` |
| `relate` | Map connections between concepts | `concept.md` (Glowing Connections) |

## The Alive Thread Principle

This is the core interaction pattern. The agent always asks:

> "What part of this still feels alive to you?"

Not the whole idea. Not a complete definition. Just the spark that has energy today.

This keeps work:
- Focused on what matters now
- Free from overwhelm
- Connected to genuine interest
- Nonlinear and exploratory

## Concept Structure

Each concept lives in `concepts/<id>/concept.md` with these sections:

1. **Real-World Impulse** — The lived situation that sparked the idea
2. **Glowing Connections** — Thematic links to other concepts
3. **Primary Surfaces** — Where users encounter the concept
4. **Interfaces & Communication** — How it exchanges information
5. **Ecosystem Integration** — How it fits the larger system
6. **Scoped Features** — Smallest meaningful version
7. **Build Plan** — Rough implementation notes (optional)

Concepts start minimal and grow through use.

## Tips

**Start small.** Seed one concept at a time. Let it develop before adding more.

**Trust the questions.** When the agent asks "what feels alive?", take a moment to actually sense it. The answer guides everything.

**Don't force completeness.** Empty sections are fine. They'll fill in when the time is right.

**Use review often.** It helps you remember what you have and notice what's calling for attention.

**Relate concepts early.** Connections often reveal unexpected directions.

## File Reference

| File | Purpose |
|------|---------|
| `.qino-concept/concept-spec.md` | Structure of concept.md files |
| `.qino-concept/manifest-spec.md` | Schema for manifest.json |
| `.qino-concept/design-philosophy.md` | Interaction principles and tone |
| `manifest.json` | Index of all concepts |
| `concepts/<id>/concept.md` | Individual concept documents |

## Philosophy

Qino Concept is not a productivity tool. It's a **dynamic scaffold** — light structure that supports creative unfolding without constraining it.

The system believes:
- Only you can feel what's alive in your ideas
- Nonlinearity is a feature, not a bug
- Coherence emerges through dialogue, not templates
- Small steps beat comprehensive plans

For the full philosophy, see `.qino-concept/design-philosophy.md`.
