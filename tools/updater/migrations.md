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

<!--
## v1.1.0

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
