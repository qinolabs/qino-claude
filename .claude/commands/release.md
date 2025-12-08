---
description: Generate changelog, finalize version, create GitHub release
allowed-tools: Bash, Read, Edit, Write, Glob
argument-hint: "<version>"
---

Coordinate changelog generation and release creation for qino-claude.

## Core Principle: Manifest-Driven Discovery

All tool discovery uses `tools/manifest.json` as the source of truth. No hardcoded tool lists or paths.

## Task

When ready to release:
1. Validate manifest consistency
2. Detect which tools changed since last release
3. Generate meaningful changelog entries
4. Update CHANGELOG.md, version.json files, and READMEs
5. Create the GitHub release

---

## Steps

### 1. Validate Prerequisites

**Required:**
- Argument provided (e.g., `v0.4.0`)
- Git status is clean: `git status --porcelain`
- Last release tag available: `git describe --tags --abbrev=0`

### 2. Validate Manifest Consistency

Read `tools/manifest.json` and check for drift:

**Check 1: Files in manifest exist on disk**
```bash
# For each file.src in manifest, verify it exists
```

**Check 2: Tool directories match manifest entries**
```bash
ls -d tools/*/  # Get actual tool directories
# Compare against manifest.tools keys
```

**Check 3: Discover unmapped files**
- Commands: `tools/<tool>/commands/**/*.md`
- Agents: `tools/<tool>/agents/*.md`
- References: `tools/<tool>/references/**/*`

If drift detected:
```
Manifest drift detected:

  Missing from disk:
    - tools/qino-concept/commands/qino/add-notes.md (in manifest)

  Missing from manifest:
    - tools/qino-concept/commands/qino/import.md
    - tools/qino-concept/commands/qino/note.md

Fix manifest before continuing? [This is blocking]
```

**WAIT** for confirmation, then fix manifest.

### 3. Detect Changed Tools

```bash
git diff --name-only <last-tag>..HEAD
```

Group changed files by tool directory (`tools/<tool-name>/...`).

From manifest, identify which tools have changes.

### 4. Analyze Changes Per Tool

For each changed tool:

```bash
git log --oneline <last-tag>..HEAD -- tools/<tool>/
git diff <last-tag>..HEAD -- tools/<tool>/
```

Read the affected files to understand what actually changed — not just commit messages. Look for:
- New commands or capabilities
- Changed behavior
- Bug fixes
- Removed features

### 5. Generate Changelog Entries

Write entries that:
- Describe changes in terms users understand
- Use active voice, present tense
- Highlight the "why" not just "what"
- Match the voice of existing CHANGELOG.md

**Section structure:**
```markdown
### Tool Name

#### Added
- New capability description

#### Changed
- Behavior change description

#### Fixed
- Bug fix description

#### Removed
- Removed feature description
```

### 6. Propose Changelog

Read current `CHANGELOG.md`. The new version replaces `## [Unreleased]`.

Show:
```
## [0.4.0] - YYYY-MM-DD

### qino Concept

#### Added
- ...

---

This will replace [Unreleased] in CHANGELOG.md.
Ready to update?
```

**WAIT** for confirmation.

### 7. Update CHANGELOG.md

Replace `## [Unreleased]` section with the versioned section.
Add new empty `## [Unreleased]` at top.

### 8. Bump Tool Versions

For each changed tool, check for version.json:
```
tools/<tool>/references/<tool>/version.json
```

**Version bump rules:**
- **Patch** (1.0.0 → 1.0.1): Bug fixes, internal improvements
- **Minor** (1.0.0 → 1.1.0): New features, capabilities added
- **Major** (1.0.0 → 2.0.0): Breaking changes

Show proposed bumps:
```
Version bumps:

  qino-concept: 1.1.0 → 1.2.0 (minor - new note command)
  design-adventure: 1.0.0 → 1.0.1 (patch - doc updates)

Apply?
```

**WAIT** for confirmation.

### 9. Update READMEs

Discover READMEs dynamically:
```bash
ls tools/*/README.md  # Tool READMEs
ls README.md          # Main README
```

For each tool with changes, review its README:

**Two content types:**

*Story sections* — tool descriptions, opening lines. Preserve their voice. Add new capabilities naturally.

*Practical sections* — installation, setup, requirements. Concise and clear.

**Check for:**
- Do documented features match current capabilities?
- Are command names and examples accurate?
- If breaking changes, add migration notes

Show proposed README changes and **WAIT** for confirmation.

### 10. Propose Release

Show:
```
Ready to create release:

Files to commit:
  - CHANGELOG.md
  - tools/manifest.json (if updated)
  - tools/*/references/*/version.json (changed tools)
  - README.md, tools/*/README.md (if updated)

Commands:
  git add <files>
  git commit -m "Release v0.4.0"
  git tag v0.4.0
  git push && git push --tags
  gh release create v0.4.0 --title "v0.4.0" --notes "..."

Create release?
```

**WAIT** for confirmation.

### 11. Create Release

```bash
git add CHANGELOG.md tools/manifest.json tools/*/references/*/version.json README.md tools/*/README.md
git commit -m "Release v0.4.0"
git tag v0.4.0
git push && git push --tags
gh release create v0.4.0 --title "v0.4.0" --notes "..."
```

Release notes should be concise changelog summary with link to full CHANGELOG.md.

---

## Example Release Notes

```
## What's New

### qino Concept
- Unified notes with multi-reference anchoring
- New `/qino:note` command for quick observation capture
- Renamed `/qino:add-notes` to `/qino:import`

### Updater
- Manifest-driven file discovery

See [CHANGELOG.md](./CHANGELOG.md) for full details.
```

---

## Manifest Update Guide

When fixing manifest drift, update `tools/manifest.json`:

**Adding a new file:**
```json
{"src": "tools/qino-concept/commands/qino/note.md", "dest": "commands/qino/note.md"}
```

**Renaming a file:**
- Remove old entry
- Add new entry with correct path

**Removing a file:**
- Remove entry from manifest
- Consider adding to `migrations.md` if users have the old file

---

## Do NOT

- Release with manifest drift (blocks release)
- Skip manifest validation
- Hardcode tool or file lists
- Skip confirmation steps
- Proceed if git status is dirty
