# qino-claude

[![Latest Release](https://img.shields.io/github/v/release/qinolabs/qino-claude?label=download)](https://github.com/qinolabs/qino-claude/releases/latest)

A collection of [Claude Code](https://docs.anthropic.com/en/docs/claude-code) tools for thoughtful software development.

These tools add custom commands to Claude Code. They help you develop ideas, explore design challenges, and set up projects — through conversation rather than templates.

## Available Tools

### [Qino Concept](tools/qino-concept/)

A gentle space for developing ideas — especially software, but the approach is wider than that.

You have notes scattered across files, late-night scribbles, ideas that never found a home. Some feel alive. Most sit dormant. This tool helps you gather those fragments and work with what has energy — through conversation, not templates. It asks *what part feels alive?* and develops from there. You return home often.

```bash
# Use
/qino:init
/qino:home
/qino:explore concept-name
```

[Installation guide →](tools/qino-concept/README.md#installation)

### [Design Adventure](tools/design-adventure/)

A simulated conversation between seven perspectives — run like an adventure you get to witness.

Bring a design tension you can't resolve. The tool simulates 40-50 exchanges between six voices thinking through words — questioning, synthesizing, feeling, advocating, mapping, leaping — and a seventh that thinks through environment. If they're exploring flow, the room might freeze. If transparency, the space goes opaque. A draft scatters someone's diagrams and suddenly the conversation breaks open.

When the adventure finishes, you enter the room after. Chairs still warm. Ideas still in the air. You discover what they found — and what the room wouldn't let them ignore.

```bash
# Use
/design-adventure How do we balance real-time collaboration with focus time?
```

[Installation guide →](tools/design-adventure/README.md#installation)

### [Dev Assistant](tools/dev-assistant/)

Turn an app concept into a living development environment.

A 20-30 minute conversation where bold synthesis meets your vision. It connects patterns across technical and emotional domains, generates architectural possibilities you can't see alone, and builds momentum toward something real. What emerges: five commands tuned to your project, a guide that captures what matters, and a roadmap that stays connected as things evolve.

```bash
# Use
/core:project-init your-concept.md
```

[Installation guide →](tools/dev-assistant/README.md)

## Installation

**Quick:** Download `all-tools.zip` from the [latest release](https://github.com/qinolabs/qino-claude/releases/latest), unzip, and copy the `.claude/` folder into your project. All three tools, ready to go.

**Individual tools:** Each release also has separate zips if you only want one.

**Manual:** Each tool has its own [installation guide](#available-tools) with detailed steps.

All tools add files to your project's `.claude/` directory. The files are namespaced to avoid conflicts.

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed and working

## Deprecated

- **design-sprint** — replaced by Design Adventure

## License

MIT
