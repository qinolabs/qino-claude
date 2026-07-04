# Iteration {{NUMBER}} — {{NAME}}

**Status**: {{STATUS}}. {{Brief status sentence — Planning / In flight / Complete; first revision audit-revised / second revision; what this iter is about.}}

## The story

*Told in experiential register. What becomes possible in the world after this iter ships, what trade-offs the design accepts, what texture this contributes to the ecosystem and the larger arc. Written at plan time as forward-shaped; lightly revised at commit if learnings reshape it.*

*This section is load-bearing for orchestrator cognition — story rides along when technical writing doesn't. When this iter is referenced in agent chats, summarized into prompts, or partially recalled weeks later, the story-shaped texture survives the flattening; the technical surface does not. Aim for texture-dense, not detail-dense — the kind of writing that produces the right intuitions when held peripherally.*

*Use the ecosystem's domain language (Figures, Substrate, Awakening, Rubbing Area, etc.). Connect to the arc this iter sits inside. Tell what becomes possible, what trade-offs are accepted, what the world can now do that it couldn't before. Not feature list; not rationale; the story of what this iter is for.*

*Exemplar: `qinolabs-repo:implementations/qino-world/content/129a-mention-maturation-coreference-foundation.md`.*

## Why this is the right cut

*Why this iter, why this scope, why now. Forces converging on the cut. Not what becomes possible (that's The story) — why this specific work is right-sized and right-timed.*

## Out of scope

*Boundaries. What this iter explicitly does not address and where those concerns live (next iter, future inquiry, etc.). Prevents scope creep at code time.*

## Positioning decisions

*Five-dimension records for design stances that constrain downstream work. PD-1, PD-2, ... Each carries: the decision, framing, forward implications, revisit triggers, cross-references. See `qinolabs-repo:.claude/rules/research-and-design.md` Pattern 3.*

*Only judgment-laden iters need this section. Routine implementation iters use one-line Technical Decisions entries instead.*

## Design

*Numbered sections (§1, §2, ...) for each substantive design surface. Include code snippets, query shapes, type signatures where load-bearing. Reference exact file paths and line numbers.*

### 1. {{First design surface}}

### 2. {{Second design surface}}

## Realistic cases this iter handles

*Per `qinolabs-repo:.claude/rules/research-and-design.md` Pattern 2 (judgment-laden iters only). Concrete cases the iter should handle, baseline behavior before, expected behavior after. The empirical acceptance bar.*

| Case ID | Description | Baseline | Expected post-iter |
|---|---|---|---|

## Tests

*Test files + cases that gate the iter. Reference exact paths.*

## Changes

*Per-file change list, grouped by package/area. Granular enough that a reviewer can scan the surface area without reading the iter prose.*

### {{Package name}}
- `path/to/file.ts` — what changes

## Boundaries

*What this iter doesn't touch by design (separate from Out of scope — boundaries are within-iter constraints; out-of-scope is between-iter staging).*

## Open questions to test

*Numbered questions that resolve at first code touch. Each carries the resolution mechanism (run a query / read a file / test against fixture / decide at commit).*

## Reference

*Cross-references to prior iters, research artifacts, design principles, methodology rules. Grouped by source.*

## Scope expansion outlook

*Forward-staging table: what comes after this iter on the arc, what triggers each successor.*

## Technical Decisions

*Captured during implementation. One-line entries for routine decisions; five-dimension positioning records for design-stance decisions. Empty at plan time.*

## Learnings

*Captured at commit.*

### What shifted
*Understanding that changed during the iter.*

### What worked
*Approaches that proved effective.*

### What surprised
*Unexpected discoveries.*

### Led to
*Downstream effects — new artifacts, pattern recognition, other iters.*

### Story refinements
*If commit-time understanding reshaped The story, note the deltas here. Optionally apply edits back to The story section.*

---

## Notes on this template

**Descriptive, not prescriptive.** This template documents the de-facto judgment-laden iteration shape that emerged through the maturation arc (127 / 128a / 128b / 129a). Routine feature iters and refactor iters use lighter shapes — see `template-guidance.md` § "Three iteration shapes" for the spectrum.

**Section order is encounter order.** The first sections a reader (or agent) encounters are *The story* (orientation) → *Why this is the right cut* (rationale) → *Out of scope* (boundaries) → *Positioning decisions* (load-bearing design stances). Technical surface comes after. This is deliberate: a reader picking up the file should encounter what it means before what it does.

**Sections you don't need, omit.** A small refactor iter with no judgment surfaces doesn't need *Positioning decisions* or *Realistic cases*. The template is a menu, not a checklist.
