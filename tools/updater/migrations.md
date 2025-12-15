# Migrations

This file documents breaking changes between versions. The update command reads this to guide users through migrations.

## Format

Each version section includes:
- **Summary**: What changed and why
- **Delete**: Files to remove (old names, deprecated)
- **Rename**: Files that moved locations
- **User action**: Changes needed in user-generated files

---

## v0.10.0

**Summary**: qino Scribe adopts agent architecture — identity embodied, not loaded.

**Delete** (qino-scribe):
- `.claude/references/qino-scribe/soul.md` (now embodied in agent)

**New** (qino-scribe):
- `.claude/agents/qino-scribe-agent.md` — the scribe's embodied identity

**User action**:
- Delete `soul.md` before updating (identity now lives in agent file)
- Invocation unchanged: `/scribe:chapter`
- Existing chronicles continue to work

---

## v0.7.0

**Summary**: qino Scribe architecture overhaul — adventure over observation. qino Eval introduced for chapter evaluation.

**Delete** (qino-scribe):
- `.claude/agents/qino-scribe-agent.md` (replaced by reference files)
- `.claude/references/qino-scribe/voice-guide.md` (archived)
- `.claude/references/qino-scribe/chapter-format.md` (archived)
- `.claude/references/qino-scribe/chronicle-spec.md` (archived)
- `.claude/references/qino-scribe/theme-guide.md` (archived)

**New** (qino-scribe):
- `.claude/references/qino-scribe/soul.md` — who the scribe is
- `.claude/references/qino-scribe/craft.md` — format reference
- `.claude/references/qino-scribe/process.md` — six-phase workflow

**New** (qino-eval):
- `.claude/commands/eval/compare.md` — side-by-side chapter comparison
- `.claude/commands/eval/progression.md` — evaluate movement between chapters
- `.claude/references/qino-eval/stance.md` — evaluator stance
- `.claude/references/qino-eval/compare-framework.md` — 7-dimension framework
- `.claude/references/qino-eval/compare-session.md` — facilitation guide
- `.claude/references/qino-eval/progression-lens.md` — 6-dimension felt lens
- `.claude/references/qino-eval/learning-log.md` — capturing insights

**User action**:
- Delete old qino-scribe files listed above before updating
- Chronicles created with old scribe will still work; new chapters use new architecture
- Consider regenerating chronicles to benefit from adventure-over-observation approach

---

## v1.0.0

Initial release. No migrations needed.

**Tools included:**
- dev-assistant v1.0.0
- design-sprint v1.0.0
- design-adventure v1.0.0
- qino-concept v1.0.0

---

## v0.5.0

**Summary**: qino Concept refined capture workflow; qino Scribe introduced World Tokens for thematic continuity.

**Delete**:
- `.claude/commands/qino/note.md` (renamed to capture.md)

**Rename**:
- `/qino:note` → `/qino:capture`

**New**:
- `.claude/references/qino-scribe/theme-guide.md` — World Tokens seeding for chronicle initialization

**User action**:
- Use `/qino:capture` instead of `/qino:note` for quick observation capture

---

## v0.4.0

**Summary**: qino Concept unified notes system with multi-reference anchoring.

**Delete**:
- `.claude/commands/qino/add-notes.md` (renamed to import.md)
- `.claude/references/qino-concept/manifest-ecosystem-spec.md` (deprecated, merged into manifest-project-spec.md)

**Rename**:
- `/qino:add-notes` → `/qino:import`

**New**:
- `.claude/commands/qino/note.md` — quick observation capture
- `/qino:note` command for capturing thoughts without leaving current context

**User action**:
- Use `/qino:import` instead of `/qino:add-notes` for bringing external material into concepts
- Use `/qino:note` to capture quick observations anchored to concepts or ecosystem
- If you have existing ecosystem notes in `ecosystem/manifest.json`, migrate them to the unified `manifest.json` (see manifest-project-spec.md Section 5-6)

---

<!--
## v1.1.0 (template)

Example migration entry for future reference:

**Summary**: Reorganized qino-concept references.

**Delete**:
- `.claude/references/qino-concept/old-spec.md`

**Rename**:
- `.claude/commands/qino/start.md` → `.claude/commands/qino/home.md`

**User action**:
- If you have concept files with `start_command` references, update them to `home_command`
- Run `/qino:home` instead of `/qino:start`

---
-->
