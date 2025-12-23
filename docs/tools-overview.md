# Tools Overview

This guide helps you choose the right tool for your needs. The qino-claude toolkit provides specialized tools for different phases of creative development.

## Tool Categories

### Active Tools

| Tool | Purpose | Key Commands |
|------|---------|--------------|
| **qino Concept** | Develop app concepts through dialogue | `/qino-concept:explore`, `/qino-concept:init` |
| **qino Dev** | Implement concepts into technical reality | `/qino-dev:init` |
| **qino Research** | Pre-concept exploration and experiments | `/qino-research:begin`, `/qino-research:experiment` |
| **qino Scribe** | Chronicle ecosystem evolution as story | `/qino-scribe:chapter`, `/qino-scribe:survey` |
| **qino Universal** | Cross-space ecology commands | `/qino:home`, `/qino:capture`, `/qino:test` |
| **Design Adventure** | Multi-perspective design exploration | `/design-adventure` |
| **Updater** | Keep tools updated from GitHub | `/update-qino-tools` |

### Archived Tools

- **Design Sprint** — Replaced by Design Adventure
- **Dev Assistant** — Replaced by qino Dev
- **qino Attune** — Merged into qino Universal
- **qino Eval** — Replaced by qino Attune's compare functionality

---

## qino Concept

A gentle facilitator for developing app concepts through alive-thread dialogue.

### When to Use
- Starting to develop a new app idea
- Exploring what an idea wants to become
- Refining and deepening existing concepts

### Key Features
- **Alive-thread principle** — work with what feels alive
- **Import from origins** — bring in external material, find what still resonates
- **Explore modes** — expand, deepen, restructure, inhabit

### Commands
- `/qino-concept:explore [concept-name]` — actively work with a concept
- `/qino-concept:init` — initialize a new concept workspace
- `/qino-concept:import [path]` — import external material

---

## qino Dev

Implementation companion for translating concept essence into technical reality.

### When to Use
- Ready to implement a concept
- Need structured iteration planning
- Want vision-aligned development

### Key Features
- **15-minute translation exploration** at init
- **Turn-taking iterations** — AI implements, user tests
- **Per-app arrival commands** — `/app-name:home`

### Commands
- `/qino-dev:init [concept-path]` — initialize implementation from concept

---

## qino Research

Pre-concept research workspace for explorations, calibrations, and experiments.

### When to Use
- Exploring before knowing what the concept is
- Running experiments with crafted test data
- Calibrating through comparison and feedback

### Key Features
- **Explorations** — open-ended research threads
- **Calibrations** — refine aesthetic qualities through iteration
- **Experiments** — controlled tests with specific conditions

### Commands
- `/qino-research:begin [title]` — start or continue exploration
- `/qino-research:experiment` — run controlled experiment
- `/qino-research:graduate` — promote insights to concepts-repo

---

## qino Scribe

Chronicle ecosystem evolution through staged two-agent narrative.

### When to Use
- Documenting your project's evolution as story
- Creating narrative artifacts from development history
- Building world memory across chapters

### Key Features
- **Two-agent architecture** — prep agent (constraints) → prose agent (story)
- **Interactive checkpoints** — scene seeds, angles, directions
- **Setting Foundation** — YAML frontmatter in world-seed.md defines visual vocabulary
- **World tokens** — crystallized presences: characters, locations, phenomena

### Commands
- `/qino-scribe:chapter` — write the next chapter
- `/qino-scribe:survey` — assess git history for chapter planning
- `/qino-scribe:rewind` — restore to before last chapter

### Chronicle Structure
```
chronicle/
├── world-seed.md    # Setting Foundation (frontmatter) + theme prose
├── world.md         # Living world state
├── arcs.md          # Narrative arcs in motion
├── manifest.json    # Chapter index
└── chapters/
    └── 001-slug/
        ├── chapter.md
        ├── world.md   # Snapshot
        └── arcs.md    # Snapshot
```

---

## qino Universal

Universal commands that work across concept, research, and implementation spaces.

### Commands
- `/qino:home` — arrive, see what's here, receive grounded suggestions
- `/qino:capture` — hold a thought before it fades
- `/qino:test` — ecology tests that guard without judging
- `/qino:attune` — refine vague aesthetic qualities into concrete craft
- `/qino:compare` — discover what makes the difference between two artifacts

---

## Design Adventure

Multi-perspective design exploration through emergent dialogue.

### When to Use
- Facing complex design decisions
- Need multiple perspectives on a problem
- Want domain-specific questions to emerge from exploration

### Key Features
- **Seven personas** — Skeptic, Synthesizer, Embodied Thinker, User Advocate, Architect, Explorer, The World
- **Emergent questions** — arise from dialogue, not templates
- **Procedural atmosphere** — environmental storytelling artifacts

### Commands
- `/design-adventure [challenge]` — explore a design challenge

---

## Updater

Keep qino tools updated from the GitHub repository.

### Commands
- `/update-qino-tools` — fetch latest tool files

### Features
- **Version tracking** — only downloads tools with new versions
- **Migration support** — handles renames, deletions, breaking changes
- **Dev mode** — test with local tool checkouts via `toolsLink` in qino-config.json

---

## Tool Relationships

```
    qino Research           (pre-concept)
         ↓ /graduate
    qino Concept            (what it IS)
         ↓ /qino-dev:init
    qino Dev                (how to BUILD it)
         ↓ (evolution)
    qino Scribe             (chronicle the JOURNEY)

    qino Universal          (the connective tissue)
    Design Adventure        (explore complex decisions)
```

---

## Installation

All tools install via the updater command:

```bash
# In any repository with .claude/ directory
/update-qino-tools
```

Tools are configured in `.claude/qino-config.json`:

```json
{
  "repoType": "concept-repo",
  "conceptsRepoPath": "/path/to/concepts-repo"
}
```

---

## Philosophy

All tools share core principles:

- **Structure lives in files, process lives in commands, aliveness emerges in dialogue**
- **Human-led, AI-supported creativity**
- **Work with what feels alive, not "the whole thing"**
- **The best facilitation disappears**
