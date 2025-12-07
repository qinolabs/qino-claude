---
description: Update qino-claude tools from GitHub to latest versions
---

# Update Tools

Update all qino-claude tools to their latest versions from GitHub.

## Process

Follow these steps in order:

### Step 1: Check Current Versions

Check which tools are installed by looking for version.json files:

- `.claude/references/dev-assistant/version.json`
- `.claude/references/design-sprint/version.json`
- `.claude/references/design-adventure/version.json`
- `.claude/references/qino-concept/version.json`

For each file that exists, read the `version` field. If a file doesn't exist, that tool isn't installed.

Report to user:
```
Installed tools:
  dev-assistant: 1.5.0
  design-sprint: 2.1.0
  design-adventure: not installed
  qino-concept: not installed
```

### Step 2: Fetch Migrations

Fetch the migrations file to check for breaking changes:
```bash
curl -sL "https://raw.githubusercontent.com/qinolabs/qino-claude/main/tools/updater/migrations.md"
```

Parse it to find migrations between installed versions and latest.

### Step 3: Show Migration Actions (if any)

If migrations require actions (deletions, renames, user changes), display them:

```
Migration required (v1.0.0 → v1.1.0):

DELETE (old files to remove):
  - .claude/references/qino-concept/old-spec.md

RENAME (files that moved):
  - .claude/commands/qino/start.md → .claude/commands/qino/home.md

USER ACTION (manual changes needed):
  - Update concept files: change 'start_command' to 'home_command'
```

**Ask user to confirm** before proceeding with deletions and renames.

If confirmed:
- Delete listed files
- Rename listed files (if source exists)

### Step 4: Fetch Latest Files

Create directories and fetch all files:

```bash
BASE_URL="https://raw.githubusercontent.com/qinolabs/qino-claude/main"

# Create directories
mkdir -p .claude/commands/core
mkdir -p .claude/commands/qino
mkdir -p .claude/agents
mkdir -p .claude/references/dev-assistant/instructions
mkdir -p .claude/references/dev-assistant/templates
mkdir -p .claude/references/dev-assistant/examples
mkdir -p .claude/references/design-sprint
mkdir -p .claude/references/design-adventure
mkdir -p .claude/references/qino-concept

# === DEV ASSISTANT (11 files) ===
curl -sL "$BASE_URL/tools/dev-assistant/references/dev-assistant/version.json" -o .claude/references/dev-assistant/version.json
curl -sL "$BASE_URL/tools/dev-assistant/commands/core/project-init.md" -o .claude/commands/core/project-init.md
curl -sL "$BASE_URL/tools/dev-assistant/commands/core/iteration-plan.md" -o .claude/commands/core/iteration-plan.md
curl -sL "$BASE_URL/tools/dev-assistant/commands/core/update-commands.md" -o .claude/commands/core/update-commands.md
curl -sL "$BASE_URL/tools/dev-assistant/instructions/exploration-behavior.md" -o .claude/references/dev-assistant/instructions/exploration-behavior.md
curl -sL "$BASE_URL/tools/dev-assistant/templates/exploration-process.md" -o .claude/references/dev-assistant/templates/exploration-process.md
curl -sL "$BASE_URL/tools/dev-assistant/templates/commands-template.md" -o .claude/references/dev-assistant/templates/commands-template.md
curl -sL "$BASE_URL/tools/dev-assistant/templates/guide-template.md" -o .claude/references/dev-assistant/templates/guide-template.md
curl -sL "$BASE_URL/tools/dev-assistant/templates/intelligence-library.md" -o .claude/references/dev-assistant/templates/intelligence-library.md
curl -sL "$BASE_URL/tools/dev-assistant/templates/iteration-framework-template.md" -o .claude/references/dev-assistant/templates/iteration-framework-template.md
curl -sL "$BASE_URL/tools/dev-assistant/examples/exploration-example.md" -o .claude/references/dev-assistant/examples/exploration-example.md

# === DESIGN SPRINT (3 files) ===
curl -sL "$BASE_URL/tools/design-sprint/references/design-sprint/version.json" -o .claude/references/design-sprint/version.json
curl -sL "$BASE_URL/tools/design-sprint/commands/design-sprint.md" -o .claude/commands/design-sprint.md
curl -sL "$BASE_URL/tools/design-sprint/agents/design-sprint.md" -o .claude/agents/design-sprint.md

# === DESIGN ADVENTURE (6 files) ===
curl -sL "$BASE_URL/tools/design-adventure/references/design-adventure/version.json" -o .claude/references/design-adventure/version.json
curl -sL "$BASE_URL/tools/design-adventure/commands/design-adventure.md" -o .claude/commands/design-adventure.md
curl -sL "$BASE_URL/tools/design-adventure/agents/design-adventure.md" -o .claude/agents/design-adventure.md
curl -sL "$BASE_URL/tools/design-adventure/references/design-adventure/personas-spec.md" -o .claude/references/design-adventure/personas-spec.md
curl -sL "$BASE_URL/tools/design-adventure/references/design-adventure/output-spec.md" -o .claude/references/design-adventure/output-spec.md
curl -sL "$BASE_URL/tools/design-adventure/references/design-adventure/atmosphere-guide.md" -o .claude/references/design-adventure/atmosphere-guide.md

# === QINO CONCEPT (12 files) ===
curl -sL "$BASE_URL/tools/qino-concept/references/qino-concept/version.json" -o .claude/references/qino-concept/version.json
curl -sL "$BASE_URL/tools/qino-concept/commands/qino/home.md" -o .claude/commands/qino/home.md
curl -sL "$BASE_URL/tools/qino-concept/commands/qino/explore.md" -o .claude/commands/qino/explore.md
curl -sL "$BASE_URL/tools/qino-concept/commands/qino/add-notes.md" -o .claude/commands/qino/add-notes.md
curl -sL "$BASE_URL/tools/qino-concept/commands/qino/init.md" -o .claude/commands/qino/init.md
curl -sL "$BASE_URL/tools/qino-concept/commands/qino/ecosystem.md" -o .claude/commands/qino/ecosystem.md
curl -sL "$BASE_URL/tools/qino-concept/agents/qino-concept-agent.md" -o .claude/agents/qino-concept-agent.md
curl -sL "$BASE_URL/tools/qino-concept/references/qino-concept/concept-spec.md" -o .claude/references/qino-concept/concept-spec.md
curl -sL "$BASE_URL/tools/qino-concept/references/qino-concept/manifest-project-spec.md" -o .claude/references/qino-concept/manifest-project-spec.md
curl -sL "$BASE_URL/tools/qino-concept/references/qino-concept/design-philosophy.md" -o .claude/references/qino-concept/design-philosophy.md
curl -sL "$BASE_URL/tools/qino-concept/references/qino-concept/ecosystem-spec.md" -o .claude/references/qino-concept/ecosystem-spec.md
curl -sL "$BASE_URL/tools/qino-concept/references/qino-concept/manifest-ecosystem-spec.md" -o .claude/references/qino-concept/manifest-ecosystem-spec.md
```

### Step 5: Report Results

Read the version.json files to get new versions and report:

```
Update complete:
  dev-assistant: 1.5.0 → 1.6.0
  design-sprint: 2.1.0 (unchanged)
  design-adventure: 1.0.0 (new)
  qino-concept: 1.0.0 (new)

32 files updated.
```

If there were USER ACTION items from migrations, remind the user:

```
Reminder - manual action needed:
  - Update concept files: change 'start_command' to 'home_command'
```

## Notes

- Files are fetched from the `main` branch of qinolabs/qino-claude
- Project-specific files (guides, concepts, generated commands) are not affected
- Requires `curl` (available by default on macOS and most Linux)
