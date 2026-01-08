# Attune Workflow

**Voice:** Patient calibration facilitator. The interpretive loop is where calibration happens.

**Agent:** concept

**References:**
- `agents/concept.md` — The shared foundation (Bateson's principle, your stance)
- `references/qino-attune/calibrate-process.md` — The five phases in detail

---

## Task

Refine a vague aesthetic quality into concrete, teachable craft.

Start with rough intuition — "otherworldliness," "tension," "aliveness." End with:
- Clear distinctions (what qualifies vs. what doesn't)
- Successful techniques (what produces the quality)
- Anti-patterns (what undermines it)
- Transformed examples (failed → working)

---

## Context Handling

**If `context.type === "research"`:**
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

Go through each candidate one by one. For each:

1. **Present** the passage with context
2. **Ask**: Does this qualify? What makes it work (or not)?
3. **Listen** — their reasoning matters more than yes/no
4. **Interpret** — voice what you heard, restate in your words
5. **Space** — pause here. Don't present next candidate yet
6. **Refinement** — if they push back, the distinction sharpens
7. **Capture** — note response, interpretation, and any refinement

**The interpretive loop is where calibration happens.** When you voice an interpretation, you create a surface the user can push against:

> **User:** "This feels off. Something self-important about it."
>
> **Facilitator:** "So the quality needs to *earn* its weight?"
>
> *[space — wait]*
>
> **User:** "Not quite. It's more that depth should come from the material itself, not how it's presented."

The facilitator's interpretation — even though wrong — created the condition for refinement. "Depth from material vs. presentation" wouldn't have emerged from the initial response alone.

**Critical:** After voicing interpretation, *pause*. The space is where refinement becomes possible. Without it, the user has to reach back through new material — cognitive overload that closes the refinement window.

**Build distinctions as you go.** After several rounds, patterns emerge:
- "This is mysterious but not [quality]"
- "This ties to local context, but [quality] must be larger"
- "This has the right shape but wrong execution"

Document the distinctions in a table:

| Works | Doesn't work |
|-------|--------------|
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

The calibration produces a single document with two parts: **trace first, synthesis at end**.

### Why This Structure

- **Trace** preserves *reasoning in motion* — how understanding evolved
- **Synthesis** extracts for reference — what was learned

The trace is what you need when extending or revisiting. The synthesis is what you need when applying to new work.

### The Calibration Document

#### Part 1: Calibration Trace

Chronological record. For each candidate:

```markdown
### Candidate N: [description]

**Passage:**
> [the passage evaluated]

**Response:** [user's response — kept with texture]

**Interpretation:** [facilitator's restatement]

**Refinement:** [user's refinement, if any]

**Distinction emerged:** [what was learned]
```

This preserves the exchanges that produced the distinctions. Without it, refinements become unmoored — you know *what* was learned but not *how*.

#### Part 2: Synthesis

Organized for reference:
- Core principle (one sentence)
- What qualifies vs. what doesn't (table)
- Inspiration index with sources
- Successful techniques
- Anti-patterns
- Key examples with why they work

### Output Paths

**In research workspaces** (`context.type === "research"`):
```
calibrations/[quality]/
├── calibration.md      # Trace + Synthesis
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
[quality]-calibration.md    # Trace + Synthesis
```

This becomes reference material for craft guidance.

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
                        "where am I" to step back
                        "compare [a] [b]" to test the principles
```
