# Qino Concept

A gentle space for developing ideas — through conversation, not documentation.

---

## What is this?

You have ideas scattered across notes, late-night scribbles, fragments that never found a home. Some feel alive. Most sit dormant.

This tool helps you gather those fragments and develop them through dialogue. Instead of forcing you into templates, it asks: *what part of this still feels alive?* — and works from there.

It runs inside [Claude Code](https://docs.anthropic.com/en/docs/claude-code), Anthropic's CLI for working with Claude.

---

## Before you start

You'll need **Claude Code** installed and working.

If you haven't used Claude Code before:
1. Install it: `npm install -g @anthropic-ai/claude-code`
2. Run `claude` in your terminal to start a session
3. You interact by typing messages — and Claude can run commands, read files, and help you build things

This tool adds six commands to Claude Code that help with concept development.

---

## Installation

**Quick:** Download `qino-concept.zip` from the [latest release](https://github.com/qinolabs/qino-claude/releases/latest), unzip, and copy the contents of `qino-claude/` into your project's `.claude/` directory.

**Manual:** Copy these directories into your project's `.claude/`:

```
commands/qino/          →  your-project/.claude/commands/qino/
agents/                 →  your-project/.claude/agents/
references/qino-concept/→  your-project/.claude/references/qino-concept/
```

You should end up with:
```
your-project/
  .claude/
    commands/
      qino/
        home.md
        explore.md
        import.md
        note.md
        init.md
        ecosystem.md
    agents/
      qino-concept-agent.md
    references/
      qino-concept/
        concept-spec.md
        manifest-project-spec.md
        ecosystem-spec.md
        design-philosophy.md
```

Start Claude Code in that project folder. The `/qino:...` commands are now available.

---

## Your first session

### 1. Create a workspace

Pick a folder where you want to develop concepts, then:

```
/qino:init
```

This creates a simple structure — a place for concepts to live.

### 2. Bring in your notes

If you have existing notes about an app idea:

```
/qino:import ~/path/to/your/notes.md
```

The agent will read your notes, ask what part feels alive, and help you place it.

Don't have notes yet? Skip this step — you can start from scratch.

### 3. Come home

```
/qino:home
```

Home shows you what's here. If you've added notes, you'll see your concepts listed with grounded suggestions for where to go next.

Home is the center. You'll return here often.

### 4. Explore

When something draws your attention:

```
/qino:explore concept-name
```

The agent asks what feels alive and helps you develop that thread — expanding, deepening, reorganizing, or stepping into moments to discover the concept's voice.

---

## The six commands

| Command | What it does |
|---------|--------------|
| `/qino:home` | See all your concepts and get grounded suggestions |
| `/qino:home concept-name` | Arrive at one concept, see its state, open to dialogue |
| `/qino:explore concept-name` | Actively work with a concept — deepen, expand, or step into moments to find the voice |
| `/qino:explore concept-a concept-b` | Explore connections between concepts |
| `/qino:ecosystem` | See the whole ecology — patterns and notes that reach beyond individual concepts |
| `/qino:import path` | Bring in external material — a file or folder |
| `/qino:note` | Capture a quick observation anchored to a concept or ecosystem |
| `/qino:init` | Set up a new workspace (one-time) |

---

## How it works

### Home is the center

Home isn't a dashboard demanding decisions. It's a place of arrival. You see what's here, receive suggestions, then venture out when ready.

### The alive thread

The agent always asks: *what part feels alive?* Not the whole thing — just the piece that draws you right now.

This keeps the work focused and prevents overwhelm. You can always come back to other parts later.

### Concepts grow through sections

Each concept develops through seven sections:

1. **Real-World Impulse** — What life situation calls for this?
2. **Glowing Connections** — What makes this feel alive?
3. **Primary Surfaces** — Where does this touch daily life?
4. **Tone & Communication** — What's the voice?
5. **Ecosystem Integration** — How does this fit with other things?
6. **Scoped Features** — What's the smallest living version?
7. **Build Plan** — What steps lead toward code?

You don't fill these out in order. The agent helps you develop whichever section feels alive.

**Tone & Communication** develops differently — through *inhabit mode*. When you want to discover the concept's voice, you step into specific moments as a user. The agent drafts what the concept might say, you react and refine, and together you discover the tone through scenarios rather than description.

---

## A typical flow

```
/qino:init

/qino:import ~/Documents/app-idea.md

/qino:home
# see what emerged, follow a suggestion

/qino:explore my-concept
# work with what's alive

/qino:home
# return, see where things stand

/qino:explore my-concept other-concept
# notice connections between ideas

/qino:ecosystem
# see patterns that reach beyond individual concepts

/qino:home
# always back to center
```

---

## Workspace structure

After working for a while, your workspace looks like:

```
your-workspace/
  manifest.json              # keeps track of concepts and notes
  concepts/
    my-app-idea/
      concept.md             # the developing concept
      origins/               # source material you brought in
        original-notes.md
    another-idea/
      concept.md
      origins/
  notes/                     # observations anchored to concepts or ecosystem
  ecosystem.md               # woven patterns (created when needed)
  .claude/references/qino-concept/   # reference files (you can ignore these)
```

---

## Tips

- **Start small.** One note, one concept. See how it feels.
- **Follow what's alive.** If something doesn't draw you, leave it. Come back later or let it go.
- **Return home often.** Home re-orients you when things feel scattered.
- **Trust the process.** The agent waits for confirmation before changing anything.

---

## Questions?

This tool is part of [qino-claude](https://github.com/qinolabs/qino-claude), a collection of thoughtful development tools.
