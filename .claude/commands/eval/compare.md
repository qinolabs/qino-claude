# Compare Chronicle Chapters

---
description: Guided evaluation comparing two chronicle chapters
---

Compare two chronicle chapters through a facilitated evaluation session. Discover what works, what doesn't, and why.

## References

Read these from the qino-eval tool:

1. **Stance**: `tools/qino-eval/references/qino-eval/stance.md`
2. **Compare Session**: `tools/qino-eval/references/qino-eval/compare-session.md`
3. **Compare Framework**: `tools/qino-eval/references/qino-eval/compare-framework.md`
4. **Learning Log**: `tools/qino-eval/references/qino-eval/learning-log.md`

## Arguments

Arguments: `$ARGUMENTS`

If two paths provided, compare those chapters.
If none provided, ask the user what to compare.

## Context: This Repository

When comparing chapters from this repo's chronicle:
- Chronicle lives at `chronicle/`
- qino-scribe chapters: existing chapters in `chronicle/chapters/`
- qino-world chapters: regenerated chapters (may be in a test location)

For cross-architecture comparison (qino-scribe vs qino-world):
- Use same git range
- Compare how differently the architectures handle identical source material

## Evaluation Log

After the session, write the log entry to:
- `tools/qino-world/evaluation-log.md` (if evaluating qino-world)
- Create `tools/qino-scribe/evaluation-log.md` if needed

## Now Begin

Read the session guide, then facilitate the evaluation.
