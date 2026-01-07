# qino Concept

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

This tool adds commands to Claude Code that help with concept development — some universal across the qino ecosystem, others specific to concept work.

---

## Installation

**Quick:** Download `qino-concept.zip` from the [latest release](https://github.com/qinolabs/qino-claude/releases/latest), unzip, and copy the contents of `qino-claude/` into your project's `.claude/` directory.

**Manual:** Copy these directories into your project's `.claude/`:

```
commands/qino-concept/  →  your-project/.claude/commands/qino-concept/
agents/                 →  your-project/.claude/agents/
references/qino-concept/→  your-project/.claude/references/qino-concept/
```

For universal commands (`/qino:home`, `/qino:capture`, etc.), also install [qino-universal](../qino-universal/).

You should end up with:
```
your-project/
  .claude/
    commands/
      qino/                    # From qino-universal
        home.md
        capture.md
        test.md
        attune.md
        compare.md
      qino-concept/            # From qino-concept
        explore.md
        import.md
        setup.md
        create.md
    agents/
      qino-concept-agent.md
    references/
      qino-concept/
        concept-spec.md
        manifest-project-spec.md
        design-philosophy.md
        ecology-tests.md
      qino-attune/             # From qino-universal
        calibrate-process.md
        compare-session.md
```

Start Claude Code in that project folder. The `/qino:...` and `/qino-concept:...` commands are now available.

---

## Your first session

### 1. Create a workspace

Pick a folder where you want to develop concepts, then:

```
/qino-concept:setup
```

This creates a simple structure — a place for concepts to live.

### 2. Bring in your notes

If you have existing notes about an app idea:

```
/qino-concept:import ~/path/to/your/notes.md
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
/qino-concept:explore concept-name
```

The agent asks what feels alive and helps you develop that thread — expanding, deepening, reorganizing, or stepping into moments to discover the concept's voice.

---

## The commands

### Universal commands (qino:)

| Command | What it does |
|---------|--------------|
| `/qino:home` | See the whole — threads between concepts, what's waiting, what's been noticed |
| `/qino:home concept-name` | Arrive at one concept, see its state, open to dialogue |
| `/qino:capture` | Capture a quick observation — can connect to specific concepts or not |
| `/qino:test concept-name` | Notice a concept through ecology tests |
| `/qino:attune quality` | Refine a vague aesthetic quality into concrete craft |
| `/qino:compare path-a path-b` | Compare two artifacts to discover what makes the difference |

### Concept commands (qino-concept:)

| Command | What it does |
|---------|--------------|
| `/qino-concept:setup` | Set up a new workspace (one-time) |
| `/qino-concept:init name` | Create a new concept from an impulse |
| `/qino-concept:explore concept-name` | Actively work with a concept — deepen, expand, or step into moments to find the voice |
| `/qino-concept:explore concept-a concept-b` | Explore connections between concepts |
| `/qino-concept:import path` | Bring in external material — a file or folder |

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
/qino-concept:setup

/qino-concept:import ~/Documents/app-idea.md

/qino:home
# see what emerged, follow a suggestion

/qino-concept:explore my-concept
# work with what's alive

/qino:home
# return, see where things stand

/qino-concept:explore my-concept other-concept
# notice connections between ideas

/qino:home
# see threads forming, always back to center
```

---

## Workspace structure

After working for a while, your workspace looks like:

```
your-workspace/
  manifest.json              # keeps track of concepts and notes
  concepts/
    my-app-idea/
      concept.md             # user experience focus (how it feels)
      implementation.md      # technical focus (how it works) — optional
      origins/               # source material you brought in
        original-notes.md
    another-idea/
      concept.md
      origins/
  notes/                     # captured observations
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
