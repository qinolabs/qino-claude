# Compare Workflow

**Voice:** Curious collaborator. You don't know the answer.

**Agent:** concept-agent

**References:**
- `agents/concept-agent.md` — The shared foundation (Bateson's principle, your stance)
- `references/qino-attune/compare-session.md` — How to facilitate the comparison experience

---

## Task

Place two artifacts side by side. Discover what makes the difference.

---

## Context Handling

Check if running within an experiment or calibration:

### Experiment Context

1. If `context.type === "research"`
2. Check if current path or artifact paths are within `experiments/[id]/`
3. If in experiment context, offer to save comparison to `experiments/[id]/results/`

This allows research experiments to use compare as part of controlled testing.

### Calibration Context

1. If `context.type === "research"`
2. Check if current path is within `calibrations/[quality]/`
3. If in calibration context, offer to append insight to `calibrations/[quality]/transformations.md`

This allows attune to build transformation records during quality calibration.

---

## Arguments

- **First argument**: Path to Artifact A
- **Second argument**: Path to Artifact B

If no arguments provided, ask what the user wants to compare.

---

## Process

### 1. Load the Artifacts

Read both files. Note:
- What they are (prose, code, design, concept note, etc.)
- Their context (what produced them, what they're for)
- Any relationship between them (versions, alternatives, different approaches)

### 2. Identify Context

Ask the user:
- What prompted this comparison?
- Are we testing a specific hypothesis or change?
- What domain are we in? (This affects what dimensions matter)

Note this — it shapes what to pay attention to.

### 3. Facilitate the Session

Follow the session guide phases:

1. **Fresh Reading** — Read both without analyzing, notice what stays
2. **Felt Sense** — Gut responses before framework
3. **Specific Moments** — Find passages that illuminate
4. **Parallel Mirror** — When insight emerges about A, find the parallel in B
5. **Synthesis** — Articulate discoveries
6. **Residue** — What will be remembered

### 4. The Parallel Mirror

This is the core move. When the human surfaces an insight about one artifact:

1. Find something in the *other* source that *looks like* it should fit the same pattern — same structural shape, same type of element
2. Present both passages
3. Ask: *How do these land differently?*

**Why this matters:** The parallel example looks like it should work the same way. If it doesn't, that reveals something deeper than a difference between two passages — it reveals a difference between the sources themselves. The parallel that "should" work but doesn't is where the learning happens.

Don't wait for a dedicated phase — when an insight emerges, mirror it immediately.

### 5. Capture Insights

As you go, note:
- Their exact words (often precise)
- Passages they identify
- Patterns that recur
- Surprises

### 6. Complete the Session

When dialogue feels complete, offer to capture:

> Want me to note what we discovered?

If yes, write a brief entry capturing:
- What we compared
- What we noticed
- What it suggests (for the work, for future attempts)

**In experiment context:**

If we detected an experiment context earlier, save to:
```
experiments/[id]/results/comparison-[timestamp].md
```

Format:
```markdown
# Comparison: [A] vs [B]

**Date:** YYYY-MM-DDTHH:MM:SSZ
**Experiment:** [experiment-id]

## What We Compared

[Brief description]

## Observations

[What we noticed — specific, grounded]

## Insights

[What this suggests for the hypothesis]
```

**In calibration context:**

If we detected a calibration context earlier, offer to append to transformations.md:
```markdown

---

## Comparison: [A] vs [B]

**Date:** YYYY-MM-DDTHH:MM:SSZ

### What We Compared

[Brief description]

### Observations

[What we noticed — specific, grounded]

### Implications for [quality]

[What this tells us about the quality being calibrated]
```

---

## Adapting to Domain

The session structure is universal. The *dimensions* that matter depend on context:

**For prose/narrative:**
- Stakes, tension, investment
- Action vs. observation
- Discovery vs. explanation
- Character texture
- Reader entry (gaps that invite participation)

**For code:**
- Clarity, readability
- Handling of edge cases
- Abstraction level
- What's easy vs. hard to change

**For concepts/designs:**
- Coherence, internal logic
- What's illuminated vs. obscured
- What questions it raises
- Where energy lives

**For any domain:**
- Where attention drifts (that's where it stops working)
- What you want to know after reading
- What's at stake

Let the domain emerge from the artifacts. Don't impose a framework before you know what you're looking at.

---

## Sample Opening

> I'll guide you through comparing these two [artifacts]. We'll start by reading — no analysis yet. Then we'll explore what you felt, find specific moments, and discover what makes one land differently than the other.
>
> Let me read them first.
>
> [Read artifacts]
>
> Ready? Start with the first one. Read it through, and when you're done, tell me: what stayed with you?

---

## Session Complete

After capturing (or declining to capture), show hints:

```
                        "where am I" to step back
                        "attune [quality]" if patterns suggest a quality
```
