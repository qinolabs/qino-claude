# Dev Assistant

Turn an app concept into a development environment with custom commands.

---

## What is this?

You have an idea for an app. Maybe a few paragraphs, maybe just bullet points. This tool runs a 20-30 minute structured conversation that explores your concept through five chapters:

1. **First Contact** — the entry experience and identity moment
2. **Core Experience Loop** — what users do repeatedly, and why it matters
3. **Social Fabric** — how people connect and community emerges
4. **Evolution & Growth** — how the app scales and progresses
5. **Technical Philosophy** — architecture, stack, complexity budget

What emerges:

- **5 namespaced commands** for your project (`/yourapp:start`, `/yourapp:build`, etc.)
- **A project guide** capturing vision, principles, and technical decisions from the conversation

The commands read from the guide at runtime — the guide is where your project's specifics live. The conversation uses bold synthesis, connecting patterns across domains and generating architectural possibilities you wouldn't see alone.

It runs inside [Claude Code](https://docs.anthropic.com/en/docs/claude-code), Anthropic's CLI for working with Claude.

---

## Before you start

You'll need **Claude Code** installed and working.

If you haven't used Claude Code before:
1. Install it: `npm install -g @anthropic-ai/claude-code`
2. Run `claude` in your terminal to start a session
3. You interact by typing messages — and Claude can run commands, read files, and help you build things

---

## Installation

**Quick:** Download `dev-assistant.zip` from the [latest release](https://github.com/qinolabs/qino-claude/releases/latest), unzip, and copy the contents of `qino-claude/` into your project's `.claude/` directory.

**Manual:** Copy these directories into your project's `.claude/`:

```
commands/core/     →  your-project/.claude/commands/core/
instructions/      →  your-project/.claude/references/dev-assistant/instructions/
templates/         →  your-project/.claude/references/dev-assistant/templates/
examples/          →  your-project/.claude/references/dev-assistant/examples/
```

You should end up with:
```
your-project/
  .claude/
    commands/
      core/
        project-init.md
        iteration-plan.md
        update-commands.md
    references/
      dev-assistant/
        instructions/
          exploration-behavior.md
        templates/
          exploration-process.md
          commands-template.md
          guide-template.md
          intelligence-library.md
          iteration-framework-template.md
        examples/
          exploration-example.md
```

Start Claude Code in that project folder. The `/core:...` commands are now available.

---

## Your first session

### 1. Write your concept

Create a simple markdown file describing your project:

```markdown
# Task Management for Busy Parents

A simple task app that understands parents don't have time
for complex productivity systems.

Features:
- Quick voice notes while doing dishes
- Tasks that adapt to school pickup times
- Shared family lists that actually work

The goal: Make task management feel supportive, not overwhelming.
```

### 2. Run init

```
/core:project-init my-idea.md
```

### 3. Experience the conversation

A 20-30 minute guided exploration begins. Just respond naturally. The conversation synthesizes your concept into actionable development guidance.

### 4. Use your commands

When it finishes, you'll have custom commands:

```
/myidea:start          # Where you are and what's next
/myidea:build "auth"   # Build features with vision alignment
/myidea:review         # Check alignment after changes
/myidea:evolve         # Update vision as you learn
/myidea:help           # Natural language support
```

---

## The three commands

| Command | What it does |
|---------|--------------|
| `/core:project-init concept.md` | Run the exploration, generate commands and guide |
| `/core:iteration-plan project-name` | Create development roadmap when ready |
| `/core:update-commands project-name` | Refresh commands with latest templates |

---

## What makes this different

**Living guide** — The conversation produces a guide that captures your vision, technical decisions, and principles. Commands read from it at runtime.

**Bold synthesis** — The exploration connects patterns across technical, emotional, and experiential domains.

**Updatable commands** — When templates improve, `/core:update-commands` regenerates your commands while preserving your guide.

---

## Questions?

This tool is part of [qino-claude](https://github.com/qinolabs/qino-claude).
