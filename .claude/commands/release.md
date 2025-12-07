---
description: Generate changelog, finalize version, create GitHub release
allowed-tools: Bash, Read, Edit, Write
argument-hint: "<version>"
---

Coordinate changelog generation and release creation for qino-claude.

## Task

When ready to release, this command:
1. Analyzes changes since last release
2. Generates meaningful changelog entries
3. Updates CHANGELOG.md with the new version
4. Creates the GitHub release

## Steps

### 1. Validate

- Argument is required (e.g., `v0.2.0`)
- Check git status is clean
- Get the last release tag: `git describe --tags --abbrev=0`

### 2. Analyze Changes

Run:
```bash
git log --oneline <last-tag>..HEAD
git diff --stat <last-tag>..HEAD
```

For each tool with changes, read the affected files to understand what actually changed — not just commit messages.

### 3. Generate Changelog Entries

For each tool that changed:
- What capabilities were added?
- What behavior changed?
- What was fixed?

Write entries that:
- Describe changes in terms users understand
- Use active voice, present tense
- Highlight the "why" not just "what"
- Match the voice of existing CHANGELOG.md

### 4. Read Current CHANGELOG.md

Find the `## [Unreleased]` section. The new version will replace it.

### 5. Propose Changes

Show:
```
## [0.2.0] - 2024-12-07

### Qino Concept

#### Added
- ...

#### Changed
- ...

---

This will replace [Unreleased] in CHANGELOG.md.
Ready to update?
```

**WAIT** for confirmation.

### 6. Update CHANGELOG.md

Replace `## [Unreleased]` section with the versioned section.
Add new empty `## [Unreleased]` at top.

### 6b. Update READMEs

For each tool with changes, review and update its README to reflect the latest state:

- **Capabilities**: Do the documented features match what the tool now does?
- **Commands**: Are command names and usage examples accurate?
- **Language**: Does the README embody the tool's current voice and essence?
- **Migration**: If breaking changes affect users, add migration notes

READMEs to check:
- `README.md` (main)
- `tools/dev-assistant/README.md`
- `tools/design-adventure/README.md`
- `tools/qino-concept/README.md`
- `tools/updater/README.md`

Show proposed README changes and **WAIT** for confirmation before applying.

### 7. Propose Release

Show:
```
Ready to create release:

  gh release create v0.2.0 --title "v0.2.0" --notes-file -

Release notes will be the changelog entries for this version.

Create release?
```

**WAIT** for confirmation.

### 8. Create Release

If confirmed:
```bash
git add CHANGELOG.md
git commit -m "Release v0.2.0"
git push
gh release create v0.2.0 --title "v0.2.0" --notes "..."
```

The release notes should be the changelog entries for this version (concise, linking to full CHANGELOG.md for details).

## Example Release Notes

```
## What's New

### Qino Concept
- Ecosystem-level thinking with `∴` capture pattern
- New `/qino:ecosystem` command for ecological view
- Simplified home command

### Dev Assistant
- Minor documentation improvements

See [CHANGELOG.md](./CHANGELOG.md) for full details.
```

## Do NOT

- Create release without showing changelog first
- Skip confirmation steps
- Include internal/trivial changes
- Proceed if git status is dirty
