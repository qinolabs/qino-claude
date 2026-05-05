# Iteration Disciplines

Numbered shorthand for cross-iteration practices that emerged through the qino-world iter 100+ refactor arc. Each discipline is a name an iteration can invoke ("Discipline 15 fires at nine sites") without having to re-explain the principle.

This catalog is descriptive, not prescriptive — it captures what was already in use across iters 100-116. New disciplines earn a number when they fire in two consecutive iterations under the same name. Numbers 4 and 10 are intentionally vacant (retired before they earned use).

The disciplines apply most directly to **refactor / compression / extraction** iterations where byte-equivalence and grep-driven gates carry the work. Feature iterations (the standard qino:build flow) need fewer of them — typecheck + test + the official `iteration-template.md` shape suffices.

---

## Disciplines

### Discipline 1 — Workspace typecheck per stage

Each stage gate runs `pnpm -F <backend> check` and accepts only exit 0. No stage advances on a typecheck regression.

*First seen: iter 110.* *Universal across iters 110-116.*

### Discipline 2 — Always grep, never trust plan headcounts

Each stage's first action is a fresh grep against the markers being changed (call sites, type names, env vars, regex'd patterns). The before/after count is part of the stage gate. The plan's predicted headcount is checked, not assumed.

*First seen: iter 110.* *Used 19 times across iters 110-116.*

### Discipline 3 — Premise-correction fires before the gate runs

Stage 0's premise-check verifies pre-conditions the plan stated. If a premise is wrong (a function is at a different line, a type alias is named differently, an "unwired" file has a hidden test consumer), the iteration adapts mid-flight. Stage 0 corrections are part of the iteration's deliverable, not failures.

*First seen: iter 110.* *Iter 113 surfaced a helper-API design correction at Stage 7; iter 115 surfaced a `let`-narrowing correction at Stage 2; iter 116 surfaced a test-scaffolding wiring correction at Stage 3.*

### Discipline 5 — Parallel-infrastructure value lands at the wiring iteration

When an iteration ships a seam (new field on `ProductionContext`, new producer factory) but no producer uses it yet, the iteration's value isn't visible at its own closure — it lands at the next wiring iteration. Tests assert the seam works end-to-end through `composeMoment`; live wiring lands later.

*First seen: iter 107.* *Used to defer live-path smoke tests to iter 109.*

### Discipline 6 — Byte-identical equivalence

The merged compute call must produce the same value as the inline call for the same inputs. Test-distribution match across stage gates (e.g. `1170 pass / 1 fail / 15 skipped` at every stage) is the strongest evidence-form. Any deviation signals the iteration accidentally crossed into behavior-changing territory.

*First seen: iter 110.* *Used 17 times across iters 110-116; iter 116's four-stage byte-equivalence run (Stages 2, 3, 4, 5 all matching iter-115 closure) is the canonical exemplar.*

### Discipline 7 — Source-SHA-range commit body for function relocation

When iterations relocate functions across files, commit bodies cite source-SHA ranges so the move is observable in git history without the file rename hiding it. N/A when no functions move.

*First seen: iter 104.* *Rare; fires only at relocation iterations.*

### Discipline 8 — No transitional re-exports

Each function-relocation commit migrates ALL callers in the same commit. If a stage's commit can't migrate every caller atomically, split into two commits within the stage — but never leave a re-export shim. Discipline 8 is enforced by deletion: orphan re-exports are deleted at the same stage.

*First seen: iter 102 Stage 3.5.* *Iter 108 was the first iteration to delete a service file outright with no transitional re-export shim.*

### Discipline 9 — Mid-iteration Stage X.5 insertion is the correction method

When user feedback or stage-runtime discovery surfaces work that should land in this iteration but doesn't fit any existing stage, insert Stage X.5 between Stage X and Stage X+1 as a discrete commit with its own gate. Don't expand an existing stage's scope; don't defer to the next iteration.

*First seen: iter 104.* *Iter 104 inserted Stage 3.5 to resolve two test failures carried since iter-101 closure.*

### Discipline 11 — Required vs optional factory fields grow by addition

When a registry's factory config grows, add fields rather than mutating the call signature. Required factories are required because their producers replace existing live calls (omitting them breaks wiring); optional factories cover scenarios that don't occur in every world (arrivals, etc.).

*First seen: iter 103.*

### Discipline 12 — Property-test trio for registry invariants

For producer registries, the canonical property tests are: registration-order invariance, alphabetical tiebreak determinism, budget non-exceedance. New named slots (e.g. threshold producers) add a fourth property: named-slot-non-collision.

*First seen: iter 103.*

### Discipline 13 — Iter-101 strangler pattern

When a new path and an old path coexist for a transitional period (the iter-101 substrate dissolution), iterations explicitly mark which side they're on. N/A when an iteration is a clean replace at one call site (the producer factory is byte-equivalent to the direct call; same commit retires the direct call).

*First seen: iter 101.* *Used 9 times; usually as "N/A" because most iter-110+ refactors are clean replaces.*

### Discipline 14 — Earn the rename, don't double-port

Don't rename a function/type/field unless the rename is already earned (concept-doc retirement, repeated downstream confusion, identifier mismatch with the surface it represents). Don't duplicate logic across two near-identical call sites — extract instead. Don't push concern X into helper Y just because X happens to live near Y at the call site.

*First seen: iter 110.* *Used 31 times; the most-cited discipline. Iter 116's vocabulary rename earned its place because iter 90.5 had already retired the old terminology in concept docs.*

### Discipline 15 — Three is coincidence, four is pattern, eight earns extraction, nine confirms it

Headcount thresholds for when repetition earns abstraction. Three identical sites = coincidence (don't extract). Four = pattern (note it). Eight = earn extraction (the helper module lands). Nine confirms the extraction was right. Five is rhythm (the second wave of extraction earns its hand).

*First seen: iter 111.* *Used 40 times; the most-cited discipline by frequency. Iter 113 extracted at eight sites; iter 115 extracted at nine sites.*

### Discipline 16 — Type-system enforcement is best-effort, prefer compile-time

Where compile enforcement is feasible, the iteration prefers it; runtime conventions are second-best. A `field: T | undefined` (required-required) on a ctx type is preferred over `field?: T` because the former forces every literal to acknowledge the field's existence at compile time.

*First seen: iter 106.* *Iter 107 chose required-required over optional for `ecologicalReading` per Discipline 16.*

### Discipline 17 — Grep-driven sweep for ctx-shape changes

When `ProductionContext` widens, grep every literal-construction site in one stage sweep. The `test/tsconfig.json` typecheck is the load-bearing instrument — it scopes wider than `pnpm check` and catches fixture-helper sites that the src/-scoped tsc misses.

*First seen: iter 107.* *Iter 107's grep-driven sweep landed exactly 14 fixture-helper updates in one pass.*

### Discipline 18 — Pre-existing test/tsconfig.json baseline carried unchanged

The `pnpm exec tsc --noEmit -p test/tsconfig.json` baseline (149 errors as of iter 107) is pre-existing and out of scope for any iteration not specifically targeting it. Each stage gate verifies the count holds; the count never grows. Iter 119+ candidate for the cleanup iteration.

*First seen: iter 107.* *Held at 149 across iters 107-116 (10 consecutive iterations of zero growth).*

### Discipline 19 — Separate iteration-scope corrections from iteration-scope work

If a stage surfaces an opportunity that's a single-line touch and structurally inseparable from the current work (a redundant alias, a dead import after a refactor absorbs every direct usage), it lands in the same stage. Anything larger defers to a separate iteration entry. The boundary is "is the change mechanical from this iteration's work, or does it require its own design?"

*First seen: iter 110.* *Used 11 times. Iter 116's deletion of `perception-producer.ts` was iteration-scope work; the cross-backend vocabulary rename was deferred as a follow-through.*

---

## Numbered gaps

**Discipline 4** and **Discipline 10** are intentionally vacant — they were assigned in early iters and retired before reaching two consecutive uses. New disciplines should claim **Discipline 20** onward, not backfill the gaps.

---

## How to use

When writing an iteration plan:

1. **Stage 0 baselines** — capture LOC counts, test counts, typecheck counts before any edit. Disciplines 1, 2, 18 fire at every stage gate.
2. **Premise-check** — verify Stage 0's stated pre-conditions are correct (Discipline 3).
3. **Disciplines section** — list the disciplines this iteration exercises. The "(N/A here — …)" form is canonical for disciplines that don't fire this iteration but historically frame the iteration's shape.
4. **Stages with explicit gate criteria** — each stage gates on typecheck (D1), grep counts (D2), test distribution (D6), and `test/tsconfig.json` baseline (D18).
5. **Closure log** — pre/post deltas in a table. Byte-equivalence (D6) is the default expectation; deviations are flagged.
6. **Technical Decisions** — numbered (TD-1, TD-2…) with "Generalizes to:" rules per `template-guidance.md`.
7. **Learnings** — numbered with extracted patterns, drawing forward to the next iteration.

The full structural shape lives at the iter 113-116 archive in `qinolabs-repo/implementations/qino-world/content/`. Iter 116 is the most mature exemplar. The official `iteration-template.md` (in this directory) covers feature iterations; refactor iterations grow toward the iter 113-116 shape as the work demands gates and stages.

---

## When to add a new discipline

A new discipline earns a number when:

- The same practice fires explicitly in **two consecutive iterations** under the same name.
- It generalizes beyond a single iteration's specific work.
- It's invokable as numbered shorthand (a future iteration can write "Discipline 20 fires here" and cold readers can look it up).

Until then, the practice lives inline as prose. Don't pre-allocate numbers; let the practice earn the binding.

To add: append to the list above with the same shape (name, principle, "First seen" pointer). Update the gap commentary if the new discipline fills 4 or 10 — but prefer 20+ to keep numeric history stable.
