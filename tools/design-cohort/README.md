# Design Cohort

Multi-perspective design exploration through emergent dialogue.

## Overview

Design Cohort runs six personas with distinct cognitive styles through your design challenge. Questions emerge from what actually shapes the conversation—not from templates. Each sprint produces a unique atmospheric world built through the dialogue itself.

## Quick Start

```bash
/design-cohort How do we balance real-time collaboration with focus time?
```

## What Makes It Different

**Questions emerge** — You don't know what questions matter until the conversation reveals them. The same topic produces different questions across sprints.

**Atmosphere accumulates** — The environment builds through persona interactions. If exploring movement, the space might be static. The world becomes a mirror of the dialogue's metabolism.

**Trust over procedure** — The agent embodies principles rather than following checklists. This creates reliable, coherent output without rigid constraints.

## The Six Personas

| Persona | Role | Signature |
|---------|------|-----------|
| **Skeptic** | Questions assumptions, finds edge cases | Short, direct bursts |
| **Synthesizer** | Finds patterns, builds bridges | Connective language |
| **Embodied Thinker** | Felt sense, sensory knowing | Tentative, circling |
| **User Advocate** | Centers real users | "But who..." openers |
| **Architect** | Sees dependencies, systems | Structured precision |
| **Explorer** | "What if?" reframes | Possibility language |

## Output Structure

```
design-cohorts/YYYY-MM-DD_slug-HHMMSS/
├── enter.md        # Atmospheric entry with question previews
├── dialogue.md     # Full 40-50 exchange conversation
├── questions.md    # Emergent questions consolidated
└── synthesis.md    # Paths forward
```

## Architecture

Inspired by the Qino Concept Agent's elegance:

- **Fixed structure** (6 personas) + **fluid process** (emergent dialogue)
- **Reference files** hold specifications; agent holds behavior
- **Trust-based atmosphere** emergence, not checklist-driven
- **One core principle**: Questions emerge through dialogue

```
tools/design-cohort/
├── agents/design-cohort.md           # Core behavior
├── references/design-cohort/
│   ├── personas-spec.md              # Persona definitions
│   ├── output-spec.md                # File templates
│   └── atmosphere-guide.md           # World emergence
├── commands/design-cohort.md         # Command interface
└── README.md
```

## When to Use

- Design challenges with inherent tensions
- Exploring before implementing
- Problems that benefit from multiple cognitive styles
- When you're curious what questions actually matter

## Installation

Copy `tools/design-cohort/` to your project's `.claude/` directory:

```bash
cp -r tools/design-cohort/* your-project/.claude/
```

## Philosophy

The cohort believes: **the best questions emerge from genuine dialogue, not templates.**

Different runs produce different questions. Different sprints generate different worlds. This isn't variance to minimize—it's the system showing you what actually matters for THIS exploration.

The room is the conversation's unconscious made spatial.
