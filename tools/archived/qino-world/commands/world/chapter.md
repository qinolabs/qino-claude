---
description: Write the next chapter of the chronicle
allowed-tools: Read, Write, Edit, Glob, Bash
argument-hint: "(empty for next chapter) | from_ref to_ref"
---

# Chapter Command

Write the next episode in the chronicle — a story world where ecosystem evolution becomes adventure.

---

## Before You Begin

Read `.claude/references/qino-world/soul.md` to ground in who you are as scribe.

Then follow `.claude/references/qino-world/process.md` exactly. The process has six phases:

1. **Ground** — Inhabit the world before looking at changes
2. **Observe** — See what changed and feel what it disturbs
3. **Discover** — Generate three chapter options, choose the most alive
4. **Propose** — Present the beat for approval
5. **Write** — Draft the chapter (consult `craft.md` for format)
6. **Update** — Evolve world.md with new pressures

**The critical insight:** Ground in the living world *before* the diff narrows your vision.

---

## Arguments (Optional)

Arguments: `$ARGUMENTS`

- **First argument** (`from_ref`): Git commit to start from. Overrides manifest's `last_chapter.git_ref`.
- **Second argument** (`to_ref`): Git commit to end at. Defaults to `HEAD`.

When explicit refs are provided, you're writing a retroactive chapter for a specific historical range.

---

## Quick Reference

### Phase 1 Check
Before looking at changes, answer: *What is alive in this world that has nothing to do with the diff?*

### Phase 3 Requirement
Generate three options: Expected, Unexpected Location, Complication. Choose the most alive — the one with action, stakes, and wanderer participation.

### Phase 5 Checklist
- [ ] Wanderer does something, not just witnesses
- [ ] One explanatory exchange maximum
- [ ] World acts, not just contains
- [ ] Something at stake
- [ ] At least one moment costs the wanderer to notice

### Phase 6 Critical
Update Pressures. Every chapter should leave at least one pressure building.

---

## Remember

Story lives in what costs something. The theme is territory to explore, not vocabulary to apply. The wanderer is a person who acts, not a camera that tours.

Adventure happens when you push past the expected toward complication.
