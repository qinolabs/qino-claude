# qino-claude

A collection of Claude Code tools for thoughtful software development.

## Available Tools

### 🎭 [Dev Assistant](tools/dev-assistant/)
Transform app concepts into living development environments through guided exploration.

**Best for:**
- New projects needing vision-aligned commands
- 20-30 minute guided exploration sessions
- Generating personalized development workflows

**Quick Start:**
```bash
cp -r tools/dev-assistant/ /path/to/project/.claude/
/core:project-init my-app.md
```

[→ Full Documentation](tools/dev-assistant/README.md)

---

### 🧠 [Design Sprint](tools/design-sprint/)
Multi-perspective design exploration with six personas that generates domain-specific questions.

**Best for:**
- Complex design challenges with tensions
- Exploring before implementing
- Discovering emergent questions (not imposed templates)

**Quick Start:**
```bash
cp tools/design-sprint/commands/design-sprint.md /path/to/project/.claude/commands/
cp tools/design-sprint/agents/design-sprint.md /path/to/project/.claude/agents/
/design-sprint Your design challenge here
```

[→ Full Documentation](tools/design-sprint/README.md)

---

## Comparison Guide

**Choose Dev Assistant when:**
- Starting a new project
- Need ongoing vision-aligned development
- Want personalized project commands

**Choose Design Sprint when:**
- Facing a complex design decision
- Need multiple perspectives
- Want to explore before building

[→ Detailed Comparison](docs/tools-overview.md)

## Installation

Each tool can be installed independently. See individual tool documentation for specific setup instructions.

## Philosophy

These tools share a belief: we build better when we stay connected to what matters. Whether through vision-aware commands or multi-perspective exploration, they help maintain that connection throughout development.
