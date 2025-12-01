# Qino Concept Tool

A gentle facilitator for app concept exploration through alive-thread dialogue.

## Overview

The Qino Concept tool helps you explore and develop app concepts by following what feels alive. Instead of forcing systematic documentation, it works with your natural creative flow through gentle questions and iterative refinement.

**Home is at the center.** You arrive, see what's here, receive grounded suggestions. Then you venture out to explore, bring in new material, and return.

## Quick Start

1. **Initialize workspace:**
   ```
   /qino:init
   ```

2. **Bring in existing notes:**
   ```
   /qino:add-notes ~/my-app-notes
   ```

3. **Come home to see what's here:**
   ```
   /qino:home
   ```

## Commands

Four commands. Home is the center.

| Command | Purpose |
|---------|---------|
| `/qino:home [concept?]` | Arrive and orient. See ecosystem or one concept. |
| `/qino:explore [concept(s)]` | Active work. Deepen one concept or explore connections. |
| `/qino:add-notes [source]` | Bring in external material. |
| `/qino:init` | Bootstrap a new workspace. |

### Home

```
/qino:home              # ecosystem scope — see all concepts
/qino:home moment-lens  # concept scope — see one concept
```

Home shows what's here and offers grounded suggestions based on actual content. It doesn't ask questions. It receives.

### Explore

```
/qino:explore moment-lens              # work with one concept
/qino:explore moment-lens story-graph  # explore connections
```

Explore is active work. The agent senses whether to expand, deepen, or restructure based on the concept's state and your responses.

### Add Notes

```
/qino:add-notes ~/notes/idea.md       # single file
/qino:add-notes ~/notes/app-concept   # directory
```

For each note: find the alive thread, propose where it belongs, wait for confirmation.

## Philosophy

**The Alive Thread Principle**: Always focus on what feels energized, not everything. Work with one small, alive piece at a time.

**Home at the center**: A place of arrival, not a dashboard demanding decisions.

## Structure

```
your-workspace/
  manifest.json         # Registry of all concepts
  concepts/             # Individual concept folders
    my-app/
      concept.md        # Structured concept document
      origins/          # Copied source material
        idea-sketch.md
  .claude/
    .qino-concept/      # Reference documents
```

## Concept Template

Each concept follows a gentle structure:
1. Real-World Impulse — What life situation spawns this?
2. Glowing Connections — What makes this alive?
3. Primary Surfaces — Where does it touch daily life?
4. Interfaces & Communication — What's the dialogue?
5. Ecosystem Integration — How does it fit?
6. Scoped Features — Smallest living version
7. Build Plan — Technical stepping stones

## Typical Flow

```
/qino:init my-ideas
/qino:add-notes ~/Documents/app-sketches

# come home, see what emerged
/qino:home

# work with what draws you
/qino:explore task-forest

# return home when ready
/qino:home
```

The tool adapts to your rhythm. Never forcing decisions. Never overwhelming.
