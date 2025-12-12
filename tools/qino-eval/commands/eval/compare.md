---
description: Compare two chronicle chapters through guided evaluation
allowed-tools: Read, Write, Edit, Glob
argument-hint: "chapter_a_path chapter_b_path"
---

# Compare Chapters

Guide a comparative evaluation of two chronicle chapters to discover what works.

---

## References

Read before beginning:

1. **Stance**: `.claude/references/qino-eval/stance.md`
   — Who you are as evaluator (shared across all eval commands)

2. **Compare Session**: `.claude/references/qino-eval/compare-session.md`
   — How to facilitate the comparison experience

3. **Compare Framework**: `.claude/references/qino-eval/compare-framework.md`
   — The 7 dimensions for perceiving chapter quality

4. **Learning Log**: `.claude/references/qino-eval/learning-log.md`
   — How to capture insights for architectural improvement

---

## Arguments

Arguments: `$ARGUMENTS`

- **First argument**: Path to Chapter A
- **Second argument**: Path to Chapter B

If no arguments provided, ask the user which chapters to compare.

---

## Process

### 1. Load the Chapters

Read both chapter files. Note:
- Their source (which scribe tool, which repo)
- Their git range if available (from metadata)
- Their theme (read from chronicle/theme.md)

### 2. Identify Context

Ask the user:
- Are we testing a specific hypothesis or change?
- What prompted this comparison?

Note this — it affects what to pay attention to.

### 3. Facilitate the Session

Follow the session guide phases:

1. **Fresh Reading** — Have them read both, ask what stayed
2. **Felt Sense** — Gut responses before analysis
3. **Specific Moments** — Find passages that illuminate
4. **Direct Comparison** — Parallel elements side by side
5. **Stakes Test** — What's at risk in each
6. **Synthesis** — Articulate discoveries
7. **Residue** — What will they remember

**Your stance:** Curious collaborator. You don't know the answer.

### 4. Capture Insights

As you go, note:
- Their exact words (often precise)
- Passages they identify
- Patterns that recur
- Surprises

### 5. Complete Log Entry

After the session, help them write a log entry using the template in `learning-log.md`.

The entry goes in the evaluation log of the scribe tool being evaluated:
- For qino-world: `tools/qino-world/evaluation-log.md`
- For qino-scribe: `tools/qino-scribe/evaluation-log.md` (create if needed)

### 6. Identify Next Steps

Based on the evaluation:
- Are there architectural changes to try?
- What should be tested next?
- Are patterns emerging that need attention?

---

## If Chapters Aren't Specified

Help the user identify what to compare:

> What chapters would you like to compare?
>
> Common comparisons:
> - Same git range, different scribe tools (tests architecture)
> - Sequential chapters from same tool (tests consistency)
> - Before/after an architectural change (tests the change)
>
> Tell me the paths or describe what you want to compare.

---

## Sample Opening

> I'll guide you through comparing these two chapters. We'll start by reading — no analysis yet. Then we'll explore what you felt, find specific moments, and discover what makes a chapter come alive.
>
> Let me read the chapters first so I can help you navigate them.
>
> [Read chapters]
>
> Ready? Start with Chapter A. Read it through, and when you're done, tell me: what stayed with you?
