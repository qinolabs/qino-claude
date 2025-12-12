# qino Eval

Discover what makes chronicle chapters work — and how chronicles move.

---

## What is this?

qino Eval provides tools for evaluating chronicle quality. Two commands, two purposes:

- **`/eval:compare`** — Compare two chapters side-by-side to discover which works better and why
- **`/eval:progression`** — Explore how a chronicle moves between two chapters

Both are structured practices of attention, not automated quality checks. Human felt sense is the data.

---

## Commands

### `/eval:compare [chapter_a] [chapter_b]`

Guided comparison of two chapters (can be from different scribes, different chronicles).

**Mode:** Facilitated session through seven phases (reading, felt sense, passages, comparison, stakes, synthesis, residue)

**Framework:** 7 dimensions for perceiving chapter quality:
| Dimension | Question |
|-----------|----------|
| Action | Does the wanderer do or only witness? |
| Stakes | What could go wrong? |
| Discovery | Told or shown? |
| World | Does environment act or only contain? |
| Theme | Territory explored or vocabulary applied? |
| Character | People or functions? |
| Thread | What question remains? |

**Output:** Which is better at what, why, insights for improvement

---

### `/eval:progression [chapter_1] [chapter_2]`

Evaluate movement between two chapters of the same chronicle.

**Mode:** Agent reads and interprets, presents observations, dialogue discovers what matters

**Lens:** 6 felt dimensions for perceiving progression:
| Dimension | What it feels like |
|-----------|-------------------|
| Pull | Incompleteness at chapter end — wanting the next |
| Meet | Continuation at chapter start — being acknowledged |
| Weight | Accumulation — later chapters carry earlier ones |
| Shape | Trajectory — going somewhere, not just continuing |
| Cost | Rising stakes — more could be lost |
| Echo | Resonance — callbacks that land, not just occur |

**Output:** What's working in the progression, what isn't, where momentum lives or breaks

---

## Shared Principles

Both commands share a stance:

- **Curious collaborator** — You don't know the answer; you're helping discover it
- **Felt sense over analysis** — Frameworks help articulate, not override
- **Specificity** — Quote passages, point to moments
- **Dialogue over coverage** — Follow what's alive, not what's comprehensive

See `references/qino-eval/stance.md` for the full stance.

---

## The Learning Loop

```
evaluation → insight → architectural change → test
```

Insights flow back to the scribe tool:
- Problems that recur become fixes in `process.md`
- Patterns that work become reinforcement in `soul.md`
- Structural issues become changes in `craft.md` or `world.md`

The log lives with the scribe tool being evaluated:
- `tools/qino-world/evaluation-log.md`
- `tools/qino-scribe/evaluation-log.md`

---

## Files

```
tools/qino-eval/
├── README.md
├── GAPS.md                                  # What's missing, what to build next
├── commands/eval/
│   ├── compare.md                           # Side-by-side chapter comparison
│   └── progression.md                       # Movement between chapters
└── references/qino-eval/
    ├── stance.md                            # Shared: who you are as evaluator
    ├── learning-log.md                      # Shared: how to capture insights
    ├── compare-framework.md                 # Compare: 7 quality dimensions
    ├── compare-session.md                   # Compare: facilitation guide
    └── progression-lens.md                  # Progression: 6 felt dimensions
```

---

## Installation

Copy to your `.claude/` directory:

```
.claude/
├── commands/
│   └── eval/
│       ├── compare.md
│       └── progression.md
└── references/
    └── qino-eval/
        ├── stance.md
        ├── learning-log.md
        ├── compare-framework.md
        ├── compare-session.md
        └── progression-lens.md
```

The evaluation log stays with the scribe tool being evaluated, not with qino-eval.
