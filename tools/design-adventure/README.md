# Design Adventure

A simulated conversation between seven perspectives — run like an adventure you get to witness.

---

## What is this?

You have a design problem. Maybe it's a tension you can't resolve. Maybe you're exploring before committing. Maybe you just want to think differently about something before building it.

This tool simulates 40-50 exchanges between seven perspectives engaging with your challenge. Six think through words — questioning, synthesizing, embodying, advocating, architecting, exploring. The seventh thinks through environment — offering friction, grounding abstraction, making metaphors physical.

You don't participate in the conversation. You launch it, then witness what unfolds. Questions emerge from what actually shapes the dialogue — not templates, not checklists, but what the conversation kept circling back to.

It runs inside [Claude Code](https://docs.anthropic.com/en/docs/claude-code), Anthropic's CLI for working with Claude.

---

## Before you start

You'll need **Claude Code** installed and working.

If you haven't used Claude Code before:
1. Install it: `npm install -g @anthropic-ai/claude-code`
2. Run `claude` in your terminal to start a session
3. You interact by typing messages — and Claude can run commands, read files, and help you build things

This tool adds one command that runs complete design explorations.

---

## Installation

**Quick:** Download `design-adventure.zip` from the [latest release](https://github.com/qinolabs/qino-claude/releases/latest), unzip, and copy the contents of `qino-claude/` into your project's `.claude/` directory.

**Manual:** Copy these into your project's `.claude/`:

```
commands/design-adventure.md     →  your-project/.claude/commands/
agents/design-adventure.md       →  your-project/.claude/agents/
references/design-adventure/     →  your-project/.claude/references/design-adventure/
```

You should end up with:
```
your-project/
  .claude/
    commands/
      design-adventure.md
    agents/
      design-adventure.md
    references/
      design-adventure/
        personas-spec.md
        output-spec.md
        atmosphere-guide.md
```

Start Claude Code in that project folder. The `/design-adventure` command is now available.

---

## Your first adventure

Bring a design challenge — something with inherent tension, something you want to think through before building.

```
/design-adventure How do we balance real-time collaboration with focus time?
```

The adventure runs. Seven perspectives engage with your challenge. About 40-50 exchanges unfold. Questions emerge from the conversation.

When it finishes, you'll see an atmospheric entry point — the moment you walked into the room after the conversation happened. Chairs still warm. Ideas still in the air.

---

## What you get

Each adventure produces four files:

```
design-adventures/YYYY-MM-DD_topic-HHMMSS/
├── enter.md        # The entry point — atmospheric, with question previews
├── dialogue.md     # The full 40-50 exchange conversation
├── questions.md    # Emergent questions, fully explored
└── synthesis.md    # Viable paths forward with tradeoffs
```

**Start with enter.md.** It shows you what emerged — the questions, key moments, what the adventure didn't explore. From there, you can go deeper into any thread.

---

## The seven perspectives

| Perspective | What they bring |
|-------------|-----------------|
| **Skeptic** | Questions assumptions. Finds edge cases. Keeps things honest. |
| **Synthesizer** | Finds patterns. Builds bridges between ideas. |
| **Embodied Thinker** | Felt sense. Sensory knowing. What the body understands first. |
| **User Advocate** | Real users in real contexts. Grounds abstraction. |
| **Architect** | Dependencies. Systems. What must be true for ideas to work. |
| **Explorer** | "What if?" Creative leaps. Reframes when things get stuck. |
| **The World** | Environment. Friction. The conversation's unconscious made spatial. |

They don't take turns. They speak when they have something to say. Some adventures have more Skeptic energy. Others more Explorer. This is signal, not failure.

---

## How it works

### Questions emerge from dialogue

The value isn't the answers — it's discovering what questions actually matter for *this* challenge.

Different runs produce different questions. The same topic explored twice will surface different tensions, different priorities. This isn't variance to minimize. It's the system showing you what matters in this moment.

### The World participates

The seventh perspective doesn't speak — it acts. Through environment.

When dialogue needs breaking, a draft scatters papers. When abstraction runs too long, heat presses in. When a metaphor wants to become physical, the room makes it so.

The World exists in productive tension with the topic. If you're exploring flow, the space might be frozen. If transparency, the space might be opaque. The unconscious finds form through what resists.

### The room after

The entry point puts you in the room after the conversation — when insights are fresh but the voices have quieted. You discover what emerged. You follow threads that interest you.

---

## When to use this

Design Adventure works well when you have:

- A design challenge with **inherent tensions** (not just missing information)
- Something you want to **explore before implementing**
- A problem that could benefit from **multiple cognitive styles**
- Curiosity about **what questions actually matter**

---

## Example adventures

```
/design-adventure How do we visualize cognitive metabolism with flowing blocks—users need to read them but movement is the whole point?
```

The adventure might surface:
- Can users actually read while blocks flow?
- Is movement the default or the exception?
- What role does peripheral vision play?

```
/design-adventure We want to add real-time collaboration but our users come for focused, solo work
```

The adventure might surface:
- What makes presence feel like support versus surveillance?
- When does "collaborative" become "interruptive"?
- How do we protect solitude while enabling connection?

Different adventures, different questions. That's the point.

---

## Tips

- **Bring a real tension.** "How should we design X?" is weaker than "We want X but also Y, and they seem to conflict."
- **Read the entry first.** It's designed as your starting point. Go deeper from there.
- **Trust the absences.** What didn't emerge reveals what did.
- **Run it again.** Different moments, different questions. Both are true.

---

## Questions?

This tool is part of [qino-claude](https://github.com/qinolabs/qino-claude), a collection of thoughtful development tools.
