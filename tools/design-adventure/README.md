# Design Adventure

Multi-perspective design exploration through emergent dialogue.

## Overview

Design Adventure runs seven personas through your design challenge—six think through words, one thinks through environment. Questions emerge from what actually shapes the conversation. The World co-evolves with dialogue, shaping what can be said.

## Quick Start

```bash
/design-adventure How do we balance real-time collaboration with focus time?
```

## What Makes It Different

**Questions emerge** — You don't know what questions matter until the conversation reveals them. The same topic produces different questions across adventures.

**Atmosphere co-evolves** — The World is the seventh persona. It participates through environment—interrupting, offering friction, grounding abstraction. Dialogue shapes World; World shapes what dialogue is possible.

**Trust over procedure** — The agent embodies principles rather than following checklists. This creates reliable, coherent output without rigid constraints.

## The Seven Personas

| Persona | Role | Signature |
|---------|------|-----------|
| **Skeptic** | Questions assumptions, finds edge cases | Short, direct bursts |
| **Synthesizer** | Finds patterns, builds bridges | Connective language |
| **Embodied Thinker** | Felt sense, sensory knowing | Tentative, circling |
| **User Advocate** | Centers real users | "But who..." openers |
| **Architect** | Sees dependencies, systems | Structured precision |
| **Explorer** | "What if?" reframes | Possibility language |
| **The World** | Offers constraint through environment | Actions, not words |

## Output Structure

```
design-adventures/YYYY-MM-DD_slug-HHMMSS/
├── enter.md        # Atmospheric entry with question previews
├── dialogue.md     # Full 40-50 exchange conversation
├── questions.md    # Emergent questions consolidated
└── synthesis.md    # Paths forward
```

## Architecture

Inspired by the Qino Concept Agent's elegance:

- **Fixed structure** (7 personas) + **fluid process** (emergent dialogue)
- **Reference files** hold specifications; agent holds behavior
- **Co-evolutionary atmosphere** — The World participates, not decorates
- **One core principle**: Questions emerge through dialogue

```
tools/design-adventure/
├── agents/design-adventure.md           # Core behavior
├── references/design-adventure/
│   ├── personas-spec.md              # Persona definitions
│   ├── output-spec.md                # File templates
│   └── atmosphere-guide.md           # World emergence
├── commands/design-adventure.md         # Command interface
└── README.md
```

## When to Use

- Design challenges with inherent tensions
- Exploring before implementing
- Problems that benefit from multiple cognitive styles
- When you're curious what questions actually matter

## Installation

Copy `tools/design-adventure/` to your project's `.claude/` directory:

```bash
cp -r tools/design-adventure/* your-project/.claude/
```

## Philosophy

The adventure believes: **the best questions emerge from genuine dialogue, not templates.**

Different runs produce different questions. Different adventures generate different worlds. This isn't variance to minimize—it's the system showing you what actually matters for THIS exploration.

The room is the conversation's unconscious made spatial.
