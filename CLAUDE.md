# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository is a **Claude Plugin Hub** containing tools for thoughtful software development, distributed through the Claude plugin marketplace.

**Active Plugins** (in `plugins/`):
- **qino** — Core ecology for developing ideas (concepts, research, implementation)
- **qino-prose** — Chronicle writing, research transmissions, prose lenses
- **qino-art** — Visual content system with warm abstraction aesthetic
- **design-adventure** — Seven-perspective design exploration

**Archived Tools** (in `tools/archived/`):
- dev-assistant, design-sprint, updater, qino-util — Deprecated, kept for reference

## Repository Structure

```
qino-claude/
├── plugins/
│   ├── qino/                    # Core ecology
│   │   ├── .claude-plugin/      # Plugin metadata
│   │   ├── agents/              # concept-agent, dev-agent, research-agent
│   │   ├── skills/qino/         # SKILL.md + workflows/
│   │   └── references/          # Specs for concept, dev, research, attune
│   │
│   ├── qino-prose/              # Story tools
│   │   ├── agents/              # scribe-*, relay-*
│   │   ├── skills/              # chapter, transmit, etc.
│   │   └── references/          # qino-lens, qino-scribe, qino-relay
│   │
│   ├── qino-art/                # Visual content
│   │   ├── skills/              # Workflows for different visual types
│   │   └── references/          # Aesthetic guide
│   │
│   └── design-adventure/        # Design exploration
│       ├── agents/
│       ├── commands/
│       └── references/
│
├── tools/
│   └── archived/                # Deprecated tools (reference only)
│
├── .claude/
│   └── commands/                # Project-level commands (release, verify, add-command)
│
├── docs/                        # Documentation images
├── chronicle/                   # This repo's chronicle
└── README.md                    # Main documentation
```

## Working with Plugins

### qino (Core Ecology)

**Location**: `plugins/qino/`

**Skill**: Routes natural language to appropriate workflow based on intent and workspace context.

**Agents**:
- `concept-agent` — Concept exploration, capture, home, attune, compare, arc
- `dev-agent` — Implementation work, iterations
- `research-agent` — Research inquiries, calibrations, experiments

**Key workflows**: `home`, `explore`, `capture`, `test`, `attune`, `compare`, `arc`, `dev-init`, `research-init`

### qino-prose (Story Tools)

**Location**: `plugins/qino-prose/`

**Agents**:
- `scribe-prep`, `scribe-prose`, `scribe-editorial` — Three-agent chapter writing
- `relay-prose`, `relay-editorial` — Research transmission

**Key workflows**: `chapter`, `transmit`, `survey`, `rewind`

### design-adventure

**Location**: `plugins/design-adventure/`

Seven perspectives explore a design challenge. Questions emerge from dialogue.

## Development Commands

Project-level commands live in `.claude/commands/`:

- `/release <version>` — Generate changelog, bump versions, create GitHub release
- `/verify [plugin]` — Check plugin consistency
- `/add-command <plugin> <name>` — Scaffold new command with optional agent

## Adding New Plugins

1. Create `plugins/[plugin-name]/` directory
2. Add `.claude-plugin/plugin.json` with metadata
3. Add `agents/`, `skills/`, `references/` as needed
4. Add README.md with overview
5. Update main README.md

## Key Patterns

### Skill → Workflow → Agent

- **Skill** (SKILL.md) — Routes intent to workflow
- **Workflow** — Step-by-step procedure with WAIT points for dialogue
- **Agent** — Character and principles; executes workflows via Task tool

### Plugin Structure

Each plugin is self-contained:
- `.claude-plugin/plugin.json` — Metadata for marketplace
- `agents/` — Agent definitions
- `skills/` — Skills with workflows
- `references/` — Specs and guides
- `README.md` — Documentation
