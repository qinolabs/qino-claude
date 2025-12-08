# Migrations

This file documents breaking changes between versions. The update command reads this to guide users through migrations.

## Format

Each version section includes:
- **Summary**: What changed and why
- **Delete**: Files to remove (old names, deprecated)
- **Rename**: Files that moved locations
- **User action**: Changes needed in user-generated files

---

## v1.0.0

Initial release. No migrations needed.

**Tools included:**
- dev-assistant v1.0.0
- design-sprint v1.0.0
- design-adventure v1.0.0
- qino-concept v1.0.0

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
