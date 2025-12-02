# qino-claude

[![Latest Release](https://img.shields.io/github/v/release/qinolabs/qino-claude?label=download)](https://github.com/qinolabs/qino-claude/releases/latest)

Tools for working with ideas — developing them, exploring them from multiple angles, turning them into something you can build.

These are custom commands for [Claude Code](https://docs.anthropic.com/en/docs/claude-code). They extend what Claude can do through conversation rather than templates.

## Available Tools

### [Qino Concept](tools/qino-concept/)

A gentle space for developing ideas.

You have notes scattered across files, late-night scribbles, fragments that never found a home. Some feel alive. Most sit dormant. This tool helps you gather them and work with what has energy — through conversation, not templates. It asks *what part feels alive?* and develops from there. You return home often.

```bash
/qino:init
/qino:home
/qino:explore concept-name
```

[Installation guide →](tools/qino-concept/README.md#installation)

### [Design Adventure](tools/design-adventure/)

A simulated conversation between seven perspectives — an adventure you witness.

Bring a design tension you can't resolve. The tool simulates 40-50 exchanges between six voices thinking through words — questioning, synthesizing, feeling, advocating, mapping, leaping — and a seventh that thinks through environment. If they're exploring flow, the room might freeze. If transparency, the space goes opaque. A draft scatters someone's diagrams and the conversation breaks open.

When the adventure finishes, you enter the room after. Chairs still warm. Ideas still in the air.

```bash
/design-adventure How do we balance real-time collaboration with focus time?
```

[Installation guide →](tools/design-adventure/README.md#installation)

### [Dev Assistant](tools/dev-assistant/)

Turn an app concept into a development environment.

A 20-30 minute conversation where synthesis meets your vision. It connects patterns across technical and emotional domains, generates architectural possibilities you wouldn't see alone, and builds momentum toward something real. What emerges: five commands tuned to your project, a guide that captures what matters, and a roadmap that stays connected as things evolve.

```bash
/core:project-init your-concept.md
```

[Installation guide →](tools/dev-assistant/README.md)

## Installation

**Quick:** Download `all-tools.zip` from the [latest release](https://github.com/qinolabs/qino-claude/releases/latest), unzip, and copy the contents of `qino-claude/` into your project's `.claude/` directory.

**Individual tools:** Each release includes separate zips if you only want one.

**Manual:** Each tool has its own [installation guide](#available-tools).

All tools add files to your project's `.claude/` directory. They're namespaced to avoid conflicts.

## Requirements

[Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed and working.

## Deprecated

- **design-sprint** — replaced by Design Adventure

## License

MIT
