# qino-claude

A collection of [Claude Code](https://docs.anthropic.com/en/docs/claude-code) tools for thoughtful software development.

These tools add custom commands to Claude Code. They help you develop ideas, explore design challenges, and set up projects — through conversation rather than templates.

## Available Tools

### [Qino Concept](tools/qino-concept/)

A gentle space for developing ideas — especially software, but the approach is wider than that.

You have notes scattered across files, late-night scribbles, ideas that never found a home. Some feel alive. Most sit dormant. This tool helps you gather those fragments and work with what has energy — through conversation, not templates. It asks *what part feels alive?* and develops from there. You return home often.

```bash
# Install
cp -r tools/qino-concept/commands/qino/ your-project/.claude/commands/qino/
cp -r tools/qino-concept/agents/ your-project/.claude/agents/
cp -r tools/qino-concept/references/ your-project/.claude/references/

# Use
/qino:init
/qino:add-notes ~/path/to/your/notes.md
/qino:home
/qino:explore concept-name
```

### [Design Adventure](tools/design-adventure/)

Seven perspectives. One design challenge. A room that won't stay still.

Bring a tension you can't resolve. Six voices think through words — questioning, synthesizing, feeling, advocating, mapping, leaping. The seventh thinks through environment. If you're exploring flow, the room might freeze. If transparency, the space goes opaque. A draft scatters someone's diagrams and suddenly the conversation breaks open.

When it finishes, you enter the room after. Chairs still warm. Ideas still in the air. You discover what they found — and what the room wouldn't let them ignore.

```bash
# Install
cp tools/design-adventure/commands/design-adventure.md your-project/.claude/commands/
cp tools/design-adventure/agents/design-adventure.md your-project/.claude/agents/
cp -r tools/design-adventure/references/design-adventure/ your-project/.claude/references/design-adventure/

# Use
/design-adventure How do we balance real-time collaboration with focus time?
```

### [Dev Assistant](tools/dev-assistant/)

Turn an app concept into a living development environment.

A 20-30 minute conversation where bold synthesis meets your vision. It connects patterns across technical and emotional domains, generates architectural possibilities you can't see alone, and builds momentum toward something real. What emerges: five commands tuned to your project, a guide that captures what matters, and a roadmap that stays connected as things evolve.

```bash
# Install
cp -r tools/dev-assistant/ your-project/.claude/

# Use
/core:project-init your-concept.md
```

## Installation

Each tool installs independently. Copy the files as shown above into your project's `.claude/` directory, then start Claude Code.

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed and working

## Deprecated

- **design-sprint** — replaced by Design Adventure

## License

MIT
