---
description: Refine a vague aesthetic quality into concrete craft
allowed-tools: Read, Write, Edit, Glob, Grep, WebFetch, WebSearch
argument-hint: "quality_name"
---

# Calibrate

Refine a vague aesthetic quality into concrete, teachable craft.

Start with rough intuition — "otherworldliness," "tension," "aliveness." End with:
- Clear distinctions (what qualifies vs. what doesn't)
- Successful techniques (what produces the quality)
- Anti-patterns (what undermines it)
- Transformed examples (failed → working)

---

## References

Read before beginning:

1. **Agent**: `.claude/agents/qino-attune-agent.md`
   — The shared foundation (Bateson's principle, your stance)

2. **Calibration Process**: `.claude/references/qino-attune/calibrate-process.md`
   — The five phases in detail

---

## Workspace Detection (First Step)

Before starting calibration, check `.claude/qino-config.json`:

**If `repoType: "research"`:**
- This is a research workspace
- Outputs go to `calibrations/[quality]/`
- Update `manifest.json` with calibration entry

**Otherwise:**
- Outputs go to current directory
- No manifest updates

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

Now that you know what the quality *isn't*, search for language that captures what it *is*.

Sources to explore:
- Literary/artistic terms (numinous, sfumato, negative space)
- Character archetypes that embody the quality
- Techniques from other domains (visual art, music, sculpture)
- Academic concepts that illuminate it

For each source, note:
- The concept and its definition
- Why it's relevant to this quality
- How it might guide execution

This becomes a reference index for transformation work.

### Phase 4: Transform Iteratively

For each failed example:

1. **Select a source** from the inspiration index most likely to address the specific failure
2. **Transform** the example using that approach
3. **Present** for feedback
4. **If failed:** Document feedback, try different source
5. **If succeeded:** Record the working version and what made it work
6. **Iterate** until satisfied or mark as intractable

Track attempts:

| Attempt | Source | Result | Feedback |
|---------|--------|--------|----------|
| 1 | [technique] | [transformed text] | [response] |

Some examples won't transform. That's data too — note why.

### Phase 5: Extract Principles

After all transformations, synthesize:

**Successful Techniques:**
| Example | Rating | Technique |
|---------|--------|-----------|
| [ref] | [1-5] | [what worked] |

**Key Principles:**
1. [Principle derived from successful transformations]
2. [Another principle]

**Anti-Patterns:**
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

> I'll help you calibrate "[quality]" — turn that intuition into concrete craft.
>
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
