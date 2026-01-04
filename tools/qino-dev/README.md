# qino-dev

Implementation companion for qino-concept. Translates conceptual essence into technical implementation context.

## Overview

qino-dev provides a lean surface for starting and managing implementation projects that are linked to concepts in your concepts-repo.

## Commands

| Command | Purpose |
|---------|---------|
| `/qino-dev:setup` | Set up implementation workspace (one-time) |
| `/qino-dev:init [concept-path]` | Create app from a concept or standalone |
| `/qino-dev:<app>` | Arrive at your app (generated per project) |

## How It Works

### Setting Up

```bash
/qino-dev:setup
```

Creates the `implementations/` structure and config. Run once per workspace.

### Creating an App

```bash
/qino-dev:init ~/concepts-repo/concepts/board-games/concept.md
```

This:
1. Detects qino-concept format
2. Runs a translation exploration (~15 min)
3. Creates:
   - `implementations/[app]/implementation.md` - technical context
   - `implementations/[app]/iterations/01-foundation.md` - first phase
   - `.claude/qino-config.json` - links to concepts-repo
   - `.claude/commands/qino-dev/[app].md` - generated arrival command

### Arriving at Your App

```bash
/qino-dev:bg  # (short id for board-games)
```

Follows the qino:home pattern but for development context:
- Shows: concept link, stack, current iteration
- Observations grounded in current work/git state
- Actions oriented toward development
- Offers path to `/qino:explore` for essence questions

### Iterations as Turn-Taking

Each iteration file defines:
- Scope and goals
- Test criteria before moving on
- Status (not started / in progress / complete)

The pattern: AI implements → user tests → feedback → next iteration.

## Output Structure

```
project-root/
  implementations/
    [app]/
      implementation.md       # technical context
      iterations/
        01-foundation.md      # phase 1
        02-core-features.md   # phase 2 (when planned)
  .claude/
    qino-config.json          # links to concepts-repo
    commands/qino-dev/
      [app].md                # generated arrival command
```

## Pattern Alignment

| Tool | Creates | Location |
|------|---------|----------|
| qino-concept | concepts/ | user land |
| qino-scribe | chronicle/ | user land |
| qino-dev | implementations/ | user land |

## Relationship with qino-concept

qino-dev and qino-concept are complementary:

- **qino-concept**: WHAT the thing IS (conceptual level)
- **qino-dev**: HOW to build it (implementation level)

When working in a project initialized by qino-dev:
- `/qino:capture` sends notes directly to concepts-repo, auto-tagged with implementation context
- `/qino:explore` works against the linked concept
- `/qino:home` shows the linked concept by default

## Version

1.0.0
