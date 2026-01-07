---
description: Survey git history to plan chronicle chapters
allowed-tools: Read, Glob, Bash
argument-hint: "(empty) | --full | from_ref [to_ref]"
---

# /qino-scribe:survey

Survey the git history to assess what's there before writing chapters.

## Scenarios

This command serves three scenarios:

| Scenario | Trigger | What it does |
|----------|---------|--------------|
| **Advance** | No args, manifest exists | Survey from last chapter to HEAD |
| **Retroactive** | `--full` or no manifest | Survey entire git history, suggest chapter plan |
| **Specific range** | `from_ref [to_ref]` | Survey just that range |

---

## Arguments

Arguments: `$ARGUMENTS`

- **(empty)**: Advance mode — from last chapter's git_ref to HEAD
- **`--full`**: Full history mode — from first commit to HEAD
- **`from_ref`**: Start from this commit (exclusive)
- **`from_ref to_ref`**: Specific range (from exclusive, to inclusive)

---

## Step 1: Detect Mode

```bash
# Check for manifest
cat chronicle/manifest.json 2>/dev/null
```

| Arguments | Manifest exists? | Mode |
|-----------|------------------|------|
| (empty) | Yes | Advance — from last chapter's `git_ref_end` to HEAD |
| (empty) | No | Retroactive — full history |
| `--full` | Either | Retroactive — full history |
| `from_ref` | Either | Specific — from ref to HEAD |
| `from_ref to_ref` | Either | Specific — from ref to ref |

---

## Step 2: Get the History

```bash
# Get commit range
git log --oneline [from_ref]..[to_ref] -- . ':!*chronicle*'

# Get stats
git diff [from_ref]..[to_ref] --stat -- . ':!*chronicle*'

# Count commits
git rev-list --count [from_ref]..[to_ref]

# Date range
git log --format='%ci' [from_ref]..[to_ref] | head -1  # newest
git log --format='%ci' [from_ref]..[to_ref] | tail -1  # oldest
```

For retroactive (full history):
```bash
# First commit
git rev-list --max-parents=0 HEAD

# Then use that as from_ref
```

---

## Step 3: Assess the Range

Consult `references/qino-scribe/disturbance.md` § What to Filter and § Diff Size.

### 3a. Categorize Changes

Review the diff and categorize:

**Filter out (low signal):**
- Version bumps, lockfiles, generated files
- Formatting / linting changes
- Build configuration tweaks
- Comments describing existing code
- Changelog entries

**Notice (high signal):**
- New files / concepts appearing
- Files / concepts removed
- Significant refactors
- New connections (imports, integrations)
- Patterns breaking or emerging

**Restructurings** — assess: conceptual shift or just tidying?

### 3b. Calculate Effective Weight

After filtering, estimate effective weight:

| Commits | Effective weight | Assessment |
|---------|------------------|------------|
| 1-2, minor | Very light | Probably wait |
| 3-8, focused | Good | One chapter |
| 8-15, coherent | Good | One chapter, maybe dense |
| 15-30, mixed | Heavy | Consider splitting |
| 30+, or weeks | Very heavy | Likely multiple chapters |

### 3c. Identify Movements

A **movement** is a coherent phase that completes — not just commits, but something that *happened*.

Look for natural boundaries:
- Feature landing (appearance)
- Major refactor completing (transformation)
- Something removed or archived (disappearance)
- Integration points (connection)
- Time gaps (natural pauses)
- Thematic shifts

---

## Step 4: Decide

You are not just reporting — you are deciding. The scribe knows what makes a good chapter.

### What the Scribe Knows

From `references/qino-scribe/disturbance.md`:

**Healthy chapter size:**
- One coherent movement — something that *completes*
- 3-15 commits, a few days to a week of activity
- You can hold the whole diff in mind and feel its shape
- Qualitative weight matters more than line count

**What carries shape:**
- New concepts appearing → Appearance
- Things removed → Disappearance
- Significant refactors → Transformation
- New connections → Connection
- Patterns shifting → Accumulation/Release

**What doesn't carry shape:**
- Version bumps, lockfiles, formatting
- Build config, dependency updates
- Comments describing existing code

### Make a Recommendation

Based on what you see, decide:

| Assessment | Recommendation |
|------------|----------------|
| **Ready** — coherent movement, good weight | "Ready for chapter. Proceed with `/qino-scribe:chapter`" |
| **Wait** — too thin, nothing completed yet | "Wait. Nothing has completed. Check back after [describe what would complete]." |
| **Split** — multiple movements in range | "Split into [N] chapters at these boundaries: [refs with reasons]" |
| **World-driven** — thin diff, but world pressure is high | See below |
| **Skip** — pure maintenance, no shape anywhere | "Skip this range. Update manifest to [ref] and wait for meaningful changes." |

Be decisive. The user can override, but you should have a clear opinion.

### World-Driven Recommendation

When the diff is thin but the chronicle has active pressure, the disturbance can come from world motion rather than code changes.

**To assess:** Read `chronicle/world.md` and check:
- What pressures are marked as building?
- Has any pressure been accumulating across multiple chapters?
- Is something ready to surface or resolve?

**Recommendation format:**
```
recommendation: WORLD-DRIVEN

  The diff is thin ([N] meaningful changes), but "[Pressure Name]" in
  world.md has been building since chapter [N]. This range could be
  the moment it surfaces.

  → Proceed with /qino-scribe:chapter, grounding in that pressure
  → The prep agent will find the disturbance in world motion, not code
```

If no pressure is ready, this becomes WAIT or SKIP instead.

---

## Step 5: Report

### For Advance Mode (single range)

```
─────────────────────────────────────────────────────────────────
survey: [from_ref_short]..[to_ref_short]

  commits     [N] over [time period]
  filtered    [M] (noise)
  effective   [remaining] — [light / good / heavy]
  movements   [1] coherent  /  [2-3] consider splitting

─────────────────────────────────────────────────────────────────
what happened

  • [Significant change 1 — shape: appearance/transformation/etc.]
  • [Significant change 2]
  • [...]

  time gaps
    [date] → [date] ([N] days) — [natural pause / just cadence]

─────────────────────────────────────────────────────────────────
recommendation: [READY / WAIT / SPLIT / WORLD-DRIVEN / SKIP]

  [One sentence explaining why]

  → [specific next action]
─────────────────────────────────────────────────────────────────
```

**Time gap detection:** Gaps of 7+ days between commits may indicate natural chapter boundaries. Note them in the report. A gap is meaningful if work *completed* before it; it's just cadence if the same thread resumed after.

### For Retroactive Mode (full history)

```
─────────────────────────────────────────────────────────────────
survey: full history → [N] chapters

  commits     [total] over [time period]
  movements   [M] identified

─────────────────────────────────────────────────────────────────
chapter plan

  1. [from_ref]..[to_ref]  "[working title]"
     [shape: appearance/transformation/etc.]
     [one line: what completes in this movement]

  2. [from_ref]..[to_ref]  "[working title]"
     [shape]
     [one line]

  ...

─────────────────────────────────────────────────────────────────
notes

  • [Any thin spots where world will need to carry]
  • [Any dense spots that might need internal pacing]
  • [Suggested theme threads to watch across chapters]

─────────────────────────────────────────────────────────────────
to begin: /qino-scribe:chapter [first_from] [first_to]
─────────────────────────────────────────────────────────────────
```

### For Specific Range

Same as Advance mode.

---

## Step 6: Offer to Save

Whether to offer depends on the mode and outcome:

| Mode | Recommendation | Offer to save? |
|------|----------------|----------------|
| **Retroactive** | Any | Always — chapter plan is valuable |
| **Advance** | SPLIT | Yes — boundaries worth preserving |
| **Advance** | WORLD-DRIVEN | Yes — pressure reasoning worth preserving |
| **Advance** | SKIP | Yes — documents why this range was skipped |
| **Advance** | READY | No — just proceed |
| **Advance** | WAIT | No — nothing to save yet |
| **Specific** | SPLIT | Yes |
| **Specific** | Other | Only if user asked clarifying questions |

**When offering:**
```
─────────────────────────────────────────────────────────────────
save this survey? → chronicle/survey-[date].md
─────────────────────────────────────────────────────────────────
```

**What to save:**
- Full report as presented
- Chapter boundaries (for retroactive/split)
- Reasoning for WORLD-DRIVEN or SKIP decisions
- Any notes about thin/dense spots

**File location:** `chronicle/survey-YYYY-MM-DD.md`

For retroactive mode, the saved plan is essential — it captures chapter boundaries so they don't need to be re-derived. Reference it when running `/qino-scribe:chapter` with specific refs.

---

## What This Command Does NOT Do

- Does not write chapters — use `/qino-scribe:chapter` for that
- Does not create chronicle structure — that happens on first chapter
- Does not spawn agents — this is a utility command

## What This Command MAY Do

- If chronicle exists (advance mode), may read world-seed.md to inform working titles
- If chronicle exists, may read world.md to assess what pressures could carry a thin diff

---

## Examples

**Advance existing chronicle:**
```
/qino-scribe:survey
```

**Plan full chronicle from scratch:**
```
/qino-scribe:survey --full
```

**Check a specific range before writing:**
```
/qino-scribe:survey abc123 def456
```

**Check from a specific point to now:**
```
/qino-scribe:survey abc123
```
