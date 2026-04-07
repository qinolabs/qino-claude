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
│   │   ├── .mcp.json            # Bundled MCP server config
│   │   ├── agents/              # concept-agent, dev-agent, research-agent
│   │   ├── servers/dist/        # Bundled qino-os (MCP server + viewer)
│   │   │   ├── server/index.js  # Self-contained server (~1.5 MB, all deps inlined)
│   │   │   └── ui/              # Built SPA viewer (~2.4 MB)
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
- `concept` — Concept exploration, capture, home, attune, compare, arc
- `dev` — Implementation work, iterations
- `research` — Research inquiries, calibrations, experiments

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

## Plugin Versioning

**Single source of truth**: per-plugin versions live exclusively in `plugins/<plugin>/.claude-plugin/plugin.json`. Marketplace catalog files (`.claude-plugin/marketplace.json` and `plugins/.claude-plugin/marketplace.json`) describe *which plugins exist*, but do NOT list per-plugin versions.

**Why**: the Claude Code docs warn that *"the plugin manifest always wins silently, which can cause the marketplace version to be ignored"* ([plugins-reference#version-management](https://code.claude.com/docs/en/plugins-reference.md#version-management)). Setting versions in both places risks silent drift where the marketplace.json value is overridden by plugin.json without warning. Keeping a single source of truth eliminates the trap.

The top-level `metadata.version` in `.claude-plugin/marketplace.json` describes the marketplace catalog itself (not any individual plugin) and stays.

**When to bump**: any push to master that changes a plugin's contents — including the bundled qino-os server in `plugins/qino/servers/dist/` — should bump `plugins/<plugin>/.claude-plugin/plugin.json` `version` if any consumer has installed the plugin. Reason: Claude Code's plugin cache is keyed by version directory (`~/.claude/plugins/cache/qino-plugins/<plugin>/<version>/`). Without a bump, a fix can't reach an existing install — and worse, two consumers nominally on the same version can hold *different* bundles depending on when they installed (their local cache only refreshes when the version field changes).

**Pre-launch exception**: while there are no consumers yet, you can push without bumping versions for iteration speed. The discipline kicks in the moment the first real consumer installs.

## Key Patterns

### Skill → Workflow → Agent

- **Skill** (SKILL.md) — Routes intent to workflow, determines execution mode
- **Workflow** — Step-by-step procedure; `inject` for dialogue, `spawn` for synthesis
- **Agent** — Character and principles; persona injected or spawned based on workflow

**Execution modes:**
- **Inject** (home, explore, capture, test, attune, compare, arc, orientation) — Persona principles injected into main conversation for multi-turn dialogue
- **Spawn** (import, dev-*, research-*, concept-*) — Agent spawned via Task tool for isolated synthesis work

### Plugin Structure

Each plugin is self-contained:
- `.claude-plugin/plugin.json` — Metadata for marketplace
- `.mcp.json` — MCP server definitions (optional, auto-started when plugin is active)
- `agents/` — Agent definitions
- `skills/` — Skills with workflows
- `references/` — Specs and guides
- `README.md` — Documentation

### Bundled MCP Server (qino-os)

The qino plugin ships a self-contained MCP server + browser viewer built from `qinolabs-repo/packages/qino-os/`.

**What it provides**: 20 graph tools (read/write nodes, annotations, edges, search) + a browser UI at `localhost:4020` for visual graph exploration.

**How it works**: The server is built with tsup (`noExternal: [/.*/]`) to inline all npm dependencies into a single JS file. The SPA is built with Vite. Both are committed to `plugins/qino/servers/dist/`. The plugin's `.mcp.json` starts the server via `node ${CLAUDE_PLUGIN_ROOT}/servers/dist/server/index.js`. Workspace discovery uses `process.cwd()` (the project directory).

**To rebuild** (after changes to qino-os source):

```bash
# 1. Build in qinolabs-repo
cd ../qinolabs-repo && pnpm -F @qinolabs/qino-os build:plugin

# 2. Sync to plugin
rm -rf plugins/qino/servers/dist/
mkdir -p plugins/qino/servers/dist/server
cp ../qinolabs-repo/packages/qino-os/dist/plugin/server/index.js plugins/qino/servers/dist/server/
cp -r ../qinolabs-repo/packages/qino-os/dist/ui plugins/qino/servers/dist/
```

The `/release` command includes this as step 1b.
