# Revisions Guide

How to track conceptual evolution using revisions.md.

## Purpose

`revisions.md` tracks **why the concept changed** - not just what's different, but the reasoning and insights that led to each shift.

## When to Create

Create `concepts/{id}/revisions.md` when:
- The concept has reached some stability and you're making intentional shifts
- You want to track evolution history
- The concept is being referenced by implementations (they benefit from understanding evolution)

**Not required** - concepts can evolve without revisions.md. Create it when tracking becomes useful.

## Format

```markdown
# Revisions

## YYYY-MM-DD: [Concise Title of Change]

- **Context**: Why this revision matters / what triggered it
- **Previous**: What the old framing/terminology was
- **New**: What changed and how it's described now
- **Reasoning**: The insight or principle driving the change
```

**Reverse chronological order** - newest revisions at the top.

## Example

```markdown
# Revisions

## 2026-01-12: Substrate as Compost

- **Context**: Early iterations treated substrate as static context, but implementation work revealed it's generative
- **Previous**: "Substrate provides context and constraints for manifestation"
- **New**: "Substrate is compost — history that fuels emergence rather than constrains it"
- **Reasoning**: The metaphor shift captures that substrate accumulates and transforms, becoming fuel for new growth. Implementation showed that past interactions don't limit; they enrich.
```

## What to Track

Track **conceptual shifts**:
- ✅ Terminology changes (renaming core concepts)
- ✅ Reframing (same content, different understanding)
- ✅ Principle discoveries (insights that change how you see the concept)
- ✅ Structural changes (new sections, reorganized architecture)
- ✅ Ecosystem alignment (updating to match broader patterns)

Don't track **incremental edits**:
- ❌ Typo fixes
- ❌ Minor clarifications
- ❌ Example additions
- ❌ Polish/copyediting

## Relationship to concept.md

- **concept.md** is the source of truth - current, authoritative description
- **revisions.md** is the changelog of understanding - explains how we got here

Read concept.md to understand _what_ the concept is.
Read revisions.md to understand _why_ it's described that way.

## Parallel Pattern

Implementation repos use a similar pattern:
- **Iterations** have "Technical Decisions" sections
- **implementation.md** has "Technical Decisions" section for major decisions

Both use narrative discovery format:
- Concepts track why framing changed (revisions.md)
- Implementations track why technical choices were made (Technical Decisions)

Different granularity, same principle: capture the reasoning, not just the outcome.

---

**Last Updated**: 2025-01-18
