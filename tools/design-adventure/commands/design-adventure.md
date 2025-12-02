---
name: design-adventure
description: Run multi-perspective design exploration with emergent questions and procedural atmosphere
allowed-tools: Read, Write, Glob
agent: design-adventure
---

# Design Adventure

Run a multi-perspective design exploration. Seven personas explore your challenge—six through words, one through environment. Questions emerge from what actually shapes the conversation.

## Usage

```
/design-adventure [your design challenge]
```

## What You'll Get

A design adventure produces four files in `design-adventures/YYYY-MM-DD_slug/`:

- **enter.md** — Atmospheric navigation with question previews and dialogue excerpts
- **dialogue.md** — Full 40-50 exchange conversation across four phases
- **questions.md** — Emergent questions consolidated with full exploration
- **synthesis.md** — Viable paths forward with tradeoffs and next steps

## The Seven Personas

- **Skeptic** — Questions assumptions, finds edge cases
- **Synthesizer** — Finds patterns, builds bridges
- **Embodied Thinker** — Felt sense, sensory knowing
- **User Advocate** — Centers real users in real contexts
- **Architect** — Sees dependencies, system implications
- **Explorer** — "What if?" thinking, reframes
- **The World** — Offers constraint through environment, co-evolves with dialogue

## When to Use

Use design-adventure when you have:
- A design challenge with inherent tensions
- Something you want to explore before implementing
- A problem that could benefit from multiple cognitive styles
- Curiosity about what questions actually matter

## Example

```
/design-adventure How do we visualize cognitive metabolism with flowing blocks—users need to read them but movement is the whole point?
```

The adventure will surface domain-specific questions like:
- "Can users actually read while blocks flow?"
- "What if peripheral vision is the key?"
- "Is movement the default or the exception?"

Different runs produce different questions—this is the system working.

---

**Invoke the design-adventure agent with the user's challenge. Present the enter.md content as your response.**
