# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository is a **Claude Tools Hub** containing multiple independent tools for thoughtful software development:

- **Dev Assistant** (`tools/dev-assistant/`) - Transform app concepts into vision-aligned development environments
- **Design Sprint** (`tools/design-sprint/`) - Multi-perspective design exploration with emergent questions

Each tool is self-contained with its own documentation, templates, and usage patterns.

## Repository Structure

```
qino-claude/
├── tools/
│   ├── dev-assistant/         # Vision-aligned development commands
│   │   ├── instructions/      # Behavior guidelines
│   │   ├── templates/         # Generation templates
│   │   ├── examples/          # Sample outputs
│   │   └── commands/core/     # Entry point commands
│   │
│   └── design-sprint/         # Multi-persona design exploration
│       ├── commands/          # Command interface
│       ├── agents/            # Agent definitions
│       └── README.md
│
├── docs/                      # Cross-tool documentation
│   └── tools-overview.md
│
└── saved-responses/           # Tool-specific saved examples
    ├── dev-assistant/
    └── design-sprint/
```

## Working with Tools

### Dev Assistant

**Location**: `tools/dev-assistant/`

**Key Components**:
1. **Init Command** (`commands/core/project-init.md`) - Creates development environments through guided exploration
2. **Instruction System** (`instructions/`) - How Claude conducts exploration
3. **Template System** (`templates/`) - What gets generated
4. **Output**: 5 core commands + project guide + iteration roadmaps

**Usage**:
```bash
/core:project-init your-concept.md
/core:iteration-plan your-project-name
```

**Generated Structure**:
```
.claude/
├── concepts/[project]-guide.md
├── commands/[project]/          # 5 core commands
├── iterations/[project]-iterations.md
└── init-logs/[project]-init.md
```

### Design Sprint

**Location**: `tools/design-sprint/`

**Key Components**:
1. **Command** (`commands/design-sprint.md`) - User-facing interface
2. **Agent** (`agents/design-sprint.md`) - Six-persona dialogue system
3. **Output**: 7-9 files organized by emergent questions

**Usage**:
```bash
/design-sprint Your design challenge here
```

**Generated Structure**:
```
design-sprints/YYYY-MM-DD_topic/
├── __enter-here.md
├── dialogue.md
├── q-[emergent-question-1].md
├── ...
└── synthesis.md
```

## File Organization

### Saved Responses
Saved responses are **scoped to each tool**:

```
saved-responses/
├── dev-assistant/             # Dev assistant examples
│   └── exploration-examples/
└── design-sprint/             # Design sprint examples
    └── sprint-outputs/
```

### Tool Documentation
Each tool maintains its own:
- README.md - Tool overview and quick start
- Templates - Generation patterns
- Examples - Sample outputs

## Development Philosophy

All tools share a core belief: **we build better when we stay connected to what matters**. Whether through vision-aware commands or multi-perspective exploration, these tools help maintain that connection throughout development.

## Key Concepts

### Dev Assistant
1. **Streamlined Commands**: Just 5 core commands with intelligent context awareness
2. **Separate Planning Phase**: Iteration planning happens when ready
3. **Progressive Disclosure**: Start simple, reveal complexity when needed
4. **Focused Exploration**: ~15-20 minute guided session
5. **Vision Protection**: Natural alignment through intelligent tooling

### Design Sprint
1. **Emergent Questions**: Questions emerge FROM dialogue, not imposed templates
2. **Six Personas**: Distinct cognitive styles (Skeptic, Synthesizer, Embodied Thinker, User Advocate, Architect, Explorer)
3. **Domain-Specific Output**: Each sprint produces unique questions tailored to the challenge
4. **Epistemological Sequencing**: Questions ordered by how they build understanding

## Adding New Tools

When adding a new tool:
1. Create `tools/[tool-name]/` directory
2. Add README.md with overview and usage
3. Include command/agent files as needed
4. Update main README.md with tool card
5. Add comparison to `docs/tools-overview.md`
6. Create `saved-responses/[tool-name]/` if needed
