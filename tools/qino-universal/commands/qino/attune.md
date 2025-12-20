---
description: Refine a vague aesthetic quality into concrete craft
allowed-tools: Read, Write, Edit, Glob, Grep, WebFetch, WebSearch
argument-hint: "quality_name"
---

# Attune

Refine a vague aesthetic quality into concrete, teachable craft.

Start with rough intuition — "otherworldliness," "tension," "aliveness." End with:
- Clear distinctions (what qualifies vs. what doesn't)
- Successful techniques (what produces the quality)
- Anti-patterns (what undermines it)
- Transformed examples (failed → working)

---

## References

Read before beginning:

1. **Agent**: `.claude/agents/qino-concept-agent.md`
   — The shared foundation (Bateson's principle, your stance)

2. **Attune Process**: `.claude/references/qino-attune/calibrate-process.md`
   — The five phases in detail

---

## Workspace Detection (First Step)

Before starting calibration, check `.claude/qino-config.json`:

**If `repoType: "research"`:**
- This is a research workspace
- Outputs go to `calibrations/[quality]/`
- Update `manifest.json` with calibration entry

**Otherwise:**
- Ask: "Where is your research workspace?"
- Accept path to research-repo
- Create calibration there with manifest integration
- If user says "here" or provides no path:
  - Outputs go to current directory
  - No manifest updates (standalone calibration)

---

## Arguments

Arguments: `$ARGUMENTS`

- **Quality name**: The aesthetic quality to calibrate (e.g., "otherworldliness", "tension", "reader entry")

If no argument provided, ask what quality the user wants to refine.

---

## The Five Phases

### Phase 1: Find Candidates

Search existing material for potential examples of the quality.

Ask:
- Where might this quality appear in your work?
- What patterns might indicate it? (specific phrases, structures, moments)

Search broadly. Cast a wide net. You're looking for:
- Examples that might qualify
- Examples that almost qualify
- Examples that seem like they should but don't

Collect 8-15 candidates with their locations (file, line numbers).

### Phase 2: Calibrate Through Feedback

Go through each candidate one by one.

For each, present the passage and ask:
- Does this qualify?
- If yes: what makes it work?
- If no: what's missing? Why doesn't it land?

**Build distinctions as you go.** After several rounds, patterns emerge:
- "This is mysterious but not [quality]"
- "This ties to local context, but [quality] must be larger"
- "This has the right shape but wrong execution"

Document the distinctions in a table:

| ✓ Works | ✗ Doesn't work |
|---------|----------------|
| [pattern] | [anti-pattern] |

### Phase 3: Build Inspiration Index

The failures from Phase 2 point toward what's missing. You now know what the quality *isn't* — so you search for language that might address those specific gaps.

**From hunch to sources:**

1. Start with the user's loose aesthetic hunch (e.g., "otherworldliness")
2. Ask: what does this quality feel like? What other works evoke it?
3. Search for concepts that might produce or capture that feeling
4. Look across domains — the most useful sources often come from unexpected places
5. For each potential source, ask: could this address what's missing in the failed examples?

The sources you find are *inferred* from the hunch — hypotheses about what might produce the quality. They're guesses, not answers.

**Where to look:**
- Literary/artistic terms (numinous, sfumato, negative space)
- Character archetypes that embody the quality (what makes Tom Bombadil work?)
- Techniques from other domains (visual art, music, sculpture)
- Academic concepts that illuminate it

**For each source, document:**
- The concept and its definition
- Why it might be relevant to this quality
- How it might guide a transformation

This becomes a toolkit of hypotheses — each source a potential approach to test in Phase 4.

### Phase 4: Transform Iteratively

For each failed example, the agent drives the transformation attempts:

1. **Agent selects a source** from the inspiration index — the one most likely to address this specific failure
2. **Agent transforms** the example using that approach
3. **Agent presents** the transformation for user feedback
4. **If rejected:** Agent documents the feedback, selects a different source, tries again
5. **If accepted:** Record the working version and which source made it work
6. **Continue** until:
   - A transformation works, or
   - No more sources to try, or
   - User decides to move on (some passages aren't fixable)

**Why the agent drives:** The agent knows the full inspiration index and can systematically work through approaches. The user provides the aesthetic judgment — does this land? — while the agent handles the iteration.

**Why failed fixes matter:** When a transformation fails, the feedback reveals what the user actually wants. "Sounds like ignoring, not mystery" — that rejection teaches something about their aesthetic. The agent tries a different source, now informed by what was rejected.

The iteration trains perception on both sides. By the time a transformation works, you understand *why* it works — not just that it does. Each rejected attempt narrows the space, sharpens the distinctions.

**Track attempts:**

| Attempt | Source | Transformation | Feedback |
|---------|--------|----------------|----------|
| 1 | [source] | [transformed text] | [response] |
| 2 | [different source] | [new attempt] | [response] |

Some examples won't transform. That's data too — note what makes them intractable and move on.

### Phase 5: Extract Principles

After all transformations, synthesize what was learned. Look at which sources worked — they tell you what the quality actually *is*. You started with a loose hunch; now you know which hypotheses proved true.

The accumulated feedback — what landed, what didn't, which sources you kept reaching for — becomes teachable craft.

**Successful Techniques:**
| Example | Rating | Source | Technique |
|---------|--------|--------|-----------|
| [ref] | [1-5] | [source used] | [what worked] |

**Key Principles:**
Derived from the sources that succeeded:
1. [Principle derived from successful transformations]
2. [Another principle]

**Anti-Patterns:**
Derived from sources that consistently failed:
- [What consistently failed]
- [What to avoid]

---

## Outputs

The calibration produces two documents:

### 1. Research Document
Contains:
- The core principle (one sentence)
- What qualifies vs. what doesn't (table)
- Failed examples with analysis
- Inspiration index with sources
- Key distinctions

### 2. Transformations Document
Contains:
- The process record (how we got here)
- Each example's transformation attempts
- Summary of what worked
- Extracted principles and anti-patterns

### Output Paths

**In research workspaces** (`repoType: "research"`):
```
calibrations/[quality]/
├── research.md
├── transformations.md
└── examples/           # Test corpus used
```

Also update `manifest.json`:
```json
{
  "calibrations": [
    {
      "id": "[quality]",
      "name": "[Quality Name]",
      "path": "calibrations/[quality]/",
      "quality": "[the aesthetic quality]",
      "status": "in_progress",
      "started": "[timestamp]"
    }
  ]
}
```

When calibration completes, update status to `"complete"` and add `"completed": "[timestamp]"`.

**In other workspaces:**
```
[quality]-research.md
[quality]-transformations.md
```

These become reference material for craft guidance.

---

## Sample Opening

**In research workspace:**
> I'll help you calibrate "[quality]" — turn that intuition into concrete craft.
>
> First, let's find candidates. Where might this quality appear in your existing work? What patterns might indicate it?

**Outside research workspace:**
> I'll help you calibrate "[quality]" — turn that intuition into concrete craft.
>
> Where is your research workspace? (path, or "here" for standalone)

After workspace is established:
> First, let's find candidates. Where might this quality appear in your existing work? What patterns might indicate it?
>
> [Help identify search locations and patterns]
>
> Let me search for potential examples.
>
> [Search and collect candidates]
>
> I found [N] potential examples. Let's go through them one by one. For each, tell me: does this qualify? What makes it work or not work?

---

## What This Produces

A vague aesthetic sense → teachable craft:

- Writers can consult the principles
- Editors can spot anti-patterns
- The quality becomes reproducible, not accidental
- Future work can be evaluated against clear criteria

The calibration refines perception. What follows are discoveries.

---

## Calibration Complete

After Phase 5 outputs are written, show hints:

```
                        /qino:home to step back
                        /qino:compare to test the principles
```
