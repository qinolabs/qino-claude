# qino-agent plugin

Delegates to the SDK-based qino-agent for compositional work that benefits from owning its system prompt — ecosystem awareness, session deck composition, and (planned) narrative writing.

## Why a separate agent?

Claude Code is optimized for coding tasks. Compositional work (reading an ecosystem for what wants to evolve, writing narrative chapters, composing multi-thread session proposals) suffers from this bias. The SDK agent starts from the right register.

See `.claude/agents/logs/ecosystem-awareness-iterations.md` in the qinolabs workspace for the documented bias profile that motivated this split.

## Capabilities

| Subcommand | Status | What it does |
|------------|--------|-------------|
| `scan` | Implemented | Ecosystem awareness — heat map + session deck proposals |
| `query` | Via scan | Cross-thread relationship questions |
| `scribe` | Planned | Chronicle chapter writing |
| `relay` | Planned | Research arc transmission |

## Prerequisites

- qinolabs-mcp server at `:4020` (`pnpm dev:community`)
- qino-agent package at `qinolabs-repo/packages/qino-agent/`
- `ANTHROPIC_API_KEY` in `packages/qino-agent/.env.local`

## How it works

The skill runs the SDK binary via Bash from within Claude Code. The output enters the conversation directly. Claude Code handles follow-up work (coding, file editing, git) in its native register.

The agent composes. Claude Code acts.
