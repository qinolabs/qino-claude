# Design Sprint

A multi-perspective design exploration tool that generates deep dialogue between six personas and organizes discoveries around emergent, domain-specific questions.

## What It Does

Runs a design sprint with six distinct personas exploring your challenge through authentic dialogue. Unlike traditional frameworks with imposed templates, this system identifies 5-7 questions that emerge FROM the conversation itself - the actual tensions, insights, and inflection points that shaped the thinking.

## Output

7-9 files organized by emergent questions:

- `__enter-here.md` - Atmospheric navigation map showing what emerged
- `dialogue.md` - Full 40-50 exchange conversation
- `q-[domain-question-1].md` through `q-[domain-question-5-7].md` - Each question file gathers ALL relevant content
- `synthesis.md` - Paths forward and open questions

**Example**: A sprint about "flowing blocks visualization" might generate:
- `q-can-users-read-while-blocks-flow.md`
- `q-is-movement-default-or-exception.md`
- `q-what-does-selection-mean-for-moving-objects.md`
- `q-should-we-build-canvas-or-dom.md`

These questions are specific to THIS challenge, not generic templates.

## The Six Personas

Each persona brings a distinct cognitive style:

- **The Skeptic** - Questions assumptions, finds edge cases, pressure-tests ideas
- **The Synthesizer** - Finds patterns across disparate ideas, builds bridges
- **The Embodied Thinker** - Uses felt sense, sensory language, experiential knowing
- **The User Advocate** - Centers user needs, accessibility, real-world context
- **The Architect** - Sees dependencies, technical constraints, system implications
- **The Explorer** - "What if?" thinking, creative leaps, reframes

## Usage

### Command Interface

```bash
/design-sprint Visualizing cognitive metabolism with flowing blocks
/design-sprint Real-time collaboration UX - presence without overwhelm
/design-sprint How should selection work when everything is moving?
```

All arguments become the design challenge - no format keywords to parse.

### Installation

Copy to your project's `.claude/` directory:

```bash
# Copy command interface
cp commands/design-sprint.md /path/to/project/.claude/commands/

# Copy agent definition
cp agents/design-sprint.md /path/to/project/.claude/agents/
```

## How It Works

1. **Generates authentic dialogue** between six personas (40-50 exchanges)
2. **Reflects on emergent questions** that actually shaped the conversation
3. **Identifies 5-7 domain-specific questions** unique to this challenge
4. **Creates question-oriented files** gathering all relevant discoveries
5. **Provides atmospheric onboarding** showing what emerged and how to navigate

## Output Location

Files are created in `design-sprints/YYYY-MM-DD_descriptive-slug/`:

```
design-sprints/2025-10-05_flowing-blocks-legibility/
├── __enter-here.md
├── dialogue.md
├── q-can-users-read-while-blocks-flow.md
├── q-is-movement-default-or-exception.md
├── q-what-does-selection-mean-for-moving-objects.md
├── q-how-does-time-create-complexity.md
├── q-should-we-build-canvas-or-dom.md
└── synthesis.md
```

## Key Innovation

**Questions emerge FROM dialogue, not from templates.** Each sprint produces domain-specific questions tailored to what the conversation revealed. The question sequence itself teaches - showing epistemological dependencies and revealing what mattered in this exploration.

## When to Use

- Complex design challenges with inherent tensions
- Need to explore before implementing
- Want multiple perspectives on a problem
- Seeking domain-specific questions (not generic frameworks)
- Looking for productive contradictions to inhabit

## Philosophy

This tool believes that the questions we ask shape the solutions we find. By letting questions emerge from genuine dialogue rather than imposing predetermined frameworks, we discover the unique structure of each design challenge.
