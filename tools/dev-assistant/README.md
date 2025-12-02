# Dev Assistant

Turn an app concept into a living development environment.

---

## What is this?

You have an idea for an app. Maybe a few paragraphs, maybe just bullet points. This tool runs a 20-30 minute conversation that transforms that concept into:

- **5 custom commands** tuned to your project (`/yourapp:start`, `/yourapp:build`, etc.)
- **A project guide** capturing vision, principles, and technical philosophy
- **An iteration roadmap** that stays connected as the project evolves

The conversation connects patterns across technical and emotional domains, generates architectural possibilities you can't see alone, and builds momentum toward something real.

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

**Quick:** Download `dev-assistant.zip` from the [latest release](https://github.com/qinolabs/qino-claude/releases/latest), unzip, and copy the `.claude/` folder into your project.

**Manual:** Copy these directories into your project's `.claude/`:

```
commands/core/     →  your-project/.claude/commands/core/
instructions/      →  your-project/.claude/instructions/
templates/         →  your-project/.claude/templates/
examples/          →  your-project/.claude/examples/
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

**Vision-aware commands** — Your commands understand and protect your original project vision.

**Bold synthesis** — The exploration connects patterns across technical, emotional, and experiential domains.

**Living documents** — Commands read from guides and roadmaps that evolve with your project, not static embedded content.

---

## Questions?

This tool is part of [qino-claude](https://github.com/qinolabs/qino-claude), a collection of thoughtful development tools.
