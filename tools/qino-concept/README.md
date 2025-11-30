# Qino Concept Tool

A gentle facilitator for app concept exploration through alive-thread dialogue.

## Overview

The Qino Concept tool helps you explore and develop app concepts by following what feels alive. Instead of forcing systematic documentation, it works with your natural creative flow through gentle questions and iterative refinement.

## Quick Start

1. **Initialize workspace:**
   ```bash
   /eco:init
   ```

2. **Import existing notes (optional):**
   ```bash
   /eco:ingest ~/my-app-notes
   ```

3. **Explore a new concept:**
   ```bash
   /eco:explore my-app-idea
   ```

## Core Commands

- `/eco:review` - See what's alive across your ecosystem
- `/eco:refine [concept] --section [name]` - Deepen a specific section
- `/eco:explore [concept]` - Open possibility space for new ideas
- `/eco:relate [conceptA] [conceptB]` - Discover connections
- `/eco:organize [concept]` - Reshape around the alive core

## Philosophy

**The Alive Thread Principle**: Always focus on what feels energized, not everything. The system gives permission to work with one small, alive piece at a time.

## Structure

```
your-workspace/
  manifest.json         # Registry of all concepts
  concepts/            # Individual concept folders
    my-app/
      concept.md      # Structured concept document
  maps/               # Relationship visualizations
  .claude/
    .qino-concept/    # Reference documents
```

## Concept Template

Each concept follows a gentle structure:
1. Real-World Impulse - What life situation spawns this?
2. Glowing Connections - Links to other concepts
3. Primary Surfaces - Key interfaces/interactions
4. Interfaces & Communication - How parts talk
5. Ecosystem Integration - How it fits with others
6. Scoped Features - Smallest living version
7. Build Plan - Technical stepping stones

## Examples

**Starting fresh:**
```bash
/eco:init my-ideas
/eco:explore task-forest
```

**Importing existing work:**
```bash
/eco:init
/eco:ingest ~/Documents/app-sketches
# Select which concepts still feel alive
/eco:review
```

**Iterative refinement:**
```bash
/eco:refine task-forest --section "Real-World Impulse"
/eco:relate task-forest time-river
/eco:organize task-forest
```

The tool adapts to your rhythm, never forcing decisions or overwhelming with options.