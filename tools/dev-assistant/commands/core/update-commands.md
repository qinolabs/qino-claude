---
description: Regenerate all app commands from latest templates while preserving context
version: 1.5.0
last_synced: 2025-10-05
source: /Users/philhradecs/Code/malao/malao-apps/.claude/commands/core/update-commands.md
---

# Update Commands: Refresh All App Commands

Regenerate all application command files with the latest command templates from `.claude/references/dev-assistant/templates/commands-template.md` while preserving all context files (guides, roadmaps, init logs).

## Your Task

Execute the command regeneration process described below.

## What This Does

1. **Scans for existing apps**: Finds all `.claude/concepts/*-guide.md` files to identify app namespaces
2. **Preserves context**: Leaves all context files untouched (guides, roadmaps, init logs)
3. **Regenerates commands**: Updates command files in `.claude/commands/[appname]/` using latest templates
4. **Maintains namespacing**: Preserves existing `/appname:command` structure

## Execution Process

### Step 1: Discovery Phase

1. **Read the command template**:
   - Load `.claude/references/dev-assistant/templates/commands-template.md`
   - Parse all 5 command definitions (start, build, review, evolve, help)

2. **Find all apps**:
   - Scan `.claude/concepts/` for `*-guide.md` files
   - Extract app namespace from filename (e.g., `contact-bloom-guide.md` → `contact-bloom`)
   - Create list of apps to update

3. **Report discovery**:
   ```
   Found command template with 5 commands
   Found apps: contact-bloom, vibe-check, qino-frame, qino-drops

   Ready to regenerate commands for 4 apps (20 command files total)
   ```

### Step 2: Command Generation

For each app found:

1. **Replace template placeholders**:
   - Replace all `{{PROJECT_NAME}}` with the app namespace
   - Ensure all file paths reference correct context files
   - Preserve frontmatter (description, argument-hint)

2. **Write command files**:
   - Write to `.claude/commands/[appname]/start.md`
   - Write to `.claude/commands/[appname]/build.md`
   - Write to `.claude/commands/[appname]/review.md`
   - Write to `.claude/commands/[appname]/evolve.md`
   - Write to `.claude/commands/[appname]/help.md`

3. **Report progress**:
   ```
   Updating commands for contact-bloom...
     ✓ start.md - Generated with latest template
     ✓ build.md - Generated with latest template (includes $ARGUMENTS)
     ✓ review.md - Generated with latest template (includes $ARGUMENTS)
     ✓ evolve.md - Generated with latest template (includes $ARGUMENTS)
     ✓ help.md - Generated with latest template (includes $ARGUMENTS)
   ```

### Step 3: Verification

1. **Verify command structure**:
   - Each command has frontmatter with description
   - Commands with arguments have argument-hint
   - All commands use $ARGUMENTS placeholder correctly
   - All file paths reference correct app namespace

2. **Confirm preservation**:
   - NO changes to `.claude/concepts/*-guide.md` files
   - NO changes to `.claude/iterations/*-iterations.md` files
   - NO changes to `.claude/init-logs/*-init.md` files

3. **Final report**:
   ```
   ✅ All commands updated successfully

   Summary:
   - Apps updated: 4
   - Commands regenerated: 20
   - Context files preserved: 12

   All commands now include:
   - Proper frontmatter with description
   - $ARGUMENTS placeholders for user input
   - Latest template logic and patterns
   ```

## Command Template Structure

The template defines 5 commands, each with specific patterns:

### Command 1: start
- **No arguments** - pure contextual guidance
- Frontmatter: description only
- Reads all context files and provides intelligent guidance

### Command 2: build
- **Optional argument** - feature description
- Frontmatter: description + argument-hint
- Uses `$ARGUMENTS` - if empty, auto-detect mode

### Command 3: review
- **Optional argument** - specific concern
- Frontmatter: description + argument-hint
- Uses `$ARGUMENTS` - if empty, comprehensive review

### Command 4: evolve
- **Optional argument** - new insight/requirement
- Frontmatter: description + argument-hint
- Uses `$ARGUMENTS` - if empty, open-ended dialogue

### Command 5: help
- **Required argument** - user's question
- Frontmatter: description + argument-hint
- Uses `$ARGUMENTS` to capture the question

## When to Use This Command

- **After template improvements**: When `commands-template.md` is updated with new features
- **Argument placeholder fixes**: When adding/fixing `$ARGUMENTS` usage
- **Bug fixes**: To fix command logic bugs across all apps at once
- **Standardization**: To ensure all apps use consistent command patterns

## Safety Guarantees

✅ **Never modifies**:
- `.claude/concepts/*-guide.md` - Vision and project guides
- `.claude/iterations/*-iterations.md` - Development roadmaps
- `.claude/init-logs/*-init.md` - Onboarding records

✅ **Only updates**:
- `.claude/commands/[appname]/*.md` - Command files only

## Key Improvements in Latest Template

The updated template now includes:

1. **Proper frontmatter** - All commands have description, relevant ones have argument-hint
2. **`$ARGUMENTS` placeholders** - Commands correctly capture user input
3. **Empty argument handling** - Smart defaults when no arguments provided
4. **Consistent structure** - All apps follow same command patterns

This command solves template maintenance by regenerating all app commands while preserving project context.