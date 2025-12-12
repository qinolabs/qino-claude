# Learning Log Process

*How evaluations accumulate into architectural improvement.*

---

## The Feedback Loop

```
evaluation session
       ↓
   log entry
       ↓
patterns emerge (after 3-5 entries)
       ↓
architectural hypothesis
       ↓
change to scribe tool
       ↓
next evaluation tests the change
       ↓
   log entry (noting what changed)
       ↓
    repeat
```

The log isn't documentation — it's the engine of improvement. Without it, insights evaporate and the same problems recur.

---

## Log Location

The evaluation log lives alongside the scribe tool being evaluated:

```
tools/qino-world/
├── evaluation-log.md      # The log
├── evaluation-framework.md # Reference (deprecated, use qino-eval)
├── evaluation-session.md   # Reference (deprecated, use qino-eval)
└── ...
```

Each scribe tool has its own log. Insights specific to that architecture stay with it.

---

## Entry Structure

Each evaluation session produces one entry:

```markdown
## Evaluation [N]: [Date]

### Context
- **Chapters compared**: [what was compared]
- **Git range**: [if applicable]
- **Theme**: [the world's seed]
- **Testing**: [what hypothesis or change is being tested, if any]

### First Impressions
**What stayed (A):**
**What stayed (B):**

### Felt Sense
- **Read next?** A / B / Neither
- **More dangerous?** A / B / Neither
- **Wanderer more real?** A / B / Neither
- **World sees wanderer back?** A / B / Neither
- **Reader contributed where?** A / B / Neither

### Key Passages

#### Worked (A)
> [passage]
*Why:*

#### Worked (B)
> [passage]
*Why:*

#### Didn't Work (A)
> [passage]
*Why:*

#### Didn't Work (B)
> [passage]
*Why:*

### Stakes Test
- **A risked**:
- **B risked**:
- **After A, worried about**:
- **After B, worried about**:

### Anti-Patterns Detected
- **A**: [thematic echo / frictionless success / paraphrase loops / label-speak / none]
- **B**: [thematic echo / frictionless success / paraphrase loops / label-speak / none]

### Verdict
- **A does better**:
- **B does better**:
- **Most important difference**:

### Insights
[Principles, orientations, questions for the scribe]

### Architectural Implications
[Suggested changes to soul.md, process.md, craft.md, world.md]

### Open Questions
[What to test next]

---
```

---

## Pattern Recognition

After 3-5 entries, review the log and extract patterns:

### Problems That Recur

| Problem | Count | Tried | Helped? |
|---------|-------|-------|---------|
| Wanderer observes, doesn't act | | | |
| Too much explanatory dialogue | | | |
| Stakes unclear | | | |
| Theme as vocabulary not territory | | | |
| Mutual seeing absent (no one perceives wanderer) | | | |
| Reader gaps missing or lack pull | | | |
| Aftermath reflective instead of purposeless | | | |
| Thematic echo (declaring instead of living) | | | |
| Frictionless success | | | |
| Paraphrase loops | | | |
| Diagnostic label-speak at high pressure | | | |
| Arcs not honoring their shape | | | |
| Pressures empty at chapter end | | | |

### What Consistently Works

| Pattern | Why | Reinforce Where |
|---------|-----|-----------------|
| | | |

### What Consistently Fails

| Pattern | Why | Prevent How |
|---------|-----|-------------|
| | | |

---

## Making Changes

When patterns suggest a change:

1. **State the hypothesis**: "If we add X to process.md, chapters will have more Y"
2. **Make the change**: Edit the specific file
3. **Log the change**: Note what changed, why, based on which evaluations
4. **Test it**: Generate a new chapter and evaluate
5. **Record result**: Did it help? Partially? Not at all? Made it worse?

### Change Log Table

| Date | Change | File | Based On | Result |
|------|--------|------|----------|--------|
| | | | | |

---

## When to Synthesize

After every 5 evaluations, or when a pattern becomes undeniable:

1. Review all entries
2. Update the pattern tables
3. Identify the highest-leverage change not yet tried
4. Make it
5. Continue evaluating

---

## Cross-Tool Learning

If multiple scribe tools exist (qino-scribe, qino-world, etc.), insights may transfer:

- A pattern that recurs across tools suggests something fundamental
- A fix that works in one tool should be tried in others
- Divergent results between tools reveal what the architecture actually changes

Consider a meta-log that tracks cross-tool patterns if this becomes relevant.
