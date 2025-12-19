# qino-attune

*Training perception through difference.*

---

## What It Is

A tool for calibrating perception. Based on Bateson's principle: information is "a difference that makes a difference."

All attunement follows the same operation:
1. Present things side by side
2. Notice what lands differently
3. Articulate the difference that matters
4. Extract what was discovered

The subject varies. The operation is constant.

---

## Commands

### `attune:compare`

Place two artifacts side by side. Discover what makes the difference.

```
/attune:compare path/to/a.md path/to/b.md
```

Works with any creative artifacts — prose, code, designs, concepts. The session guides you through:
- Fresh reading (what stays with you)
- Felt sense (gut response before analysis)
- Specific moments (passages that illuminate)
- The parallel mirror (when insight emerges about A, find the parallel in B)
- Synthesis (articulate discoveries)

### `attune:calibrate`

Refine a vague aesthetic quality into concrete craft.

```
/attune:calibrate otherworldliness
```

Start with intuition ("tension," "aliveness," "reader entry"). End with:
- Clear distinctions (what qualifies vs. what doesn't)
- Successful techniques (what produces the quality)
- Anti-patterns (what undermines it)

The five phases:
1. Find candidates in existing work
2. Calibrate through feedback (yes/no/why for each)
3. Build inspiration index (language and references that capture it)
4. Transform iteratively (failed → working examples)
5. Extract principles

---

## Installation

Copy the tool to your project's `.claude/` directory:

```
.claude/
├── agents/
│   └── qino-attune-agent.md
├── commands/
│   └── attune/
│       ├── compare.md
│       └── calibrate.md
└── references/
    └── qino-attune/
        ├── compare-session.md
        ├── calibrate-process.md
        └── version.json
```

---

## The Foundation

> **Information is "a difference that makes a difference."**
> — Gregory Bateson

Describing one thing teaches less than contrasting two. The comparison does the teaching.

This applies whether you're:
- Comparing two chapters to discover what makes prose work
- Calibrating a quality like "otherworldliness" through examples
- Evaluating two approaches to find which serves better

The stance is always: curious collaborator, not judge. You don't know the answer. You're helping discover it through noticing.

---

## Version

0.1.0
