---
description: Generate changelog, finalize version, create GitHub release
allowed-tools: Bash, Read, Edit, Write, Glob
argument-hint: "<version>"
---

Coordinate changelog generation and release creation for qino-claude.

## Structure

- `plugins/` — Active tools (canonical source)
- `tools/archived/` — Archived/deprecated tools

## Task

When ready to release:
1. Validate prerequisites
2. Detect which plugins changed since last release
3. Generate meaningful changelog entries
4. Update CHANGELOG.md and version.json files
5. Create the GitHub release

---

## Steps

### 1. Validate Prerequisites

**Required:**
- Argument provided (e.g., `v1.0.1`)
- Git status is clean: `git status --porcelain`
- Last release tag available: `git describe --tags --abbrev=0`

### 1b. Rebuild qino-os Server Bundle

The qino plugin ships a bundled MCP server + viewer UI from `qinolabs-repo`.

```bash
# Build self-contained server bundle + SPA in qinolabs-repo
cd ../qinolabs-repo && pnpm -F @qinolabs/qino-os build:plugin
```

Then sync the built output to the plugin:

```bash
# Copy server bundle + UI to plugin
rm -rf plugins/qino/servers/dist/
mkdir -p plugins/qino/servers/dist/server
cp ../qinolabs-repo/packages/qino-os/dist/plugin/server/index.js plugins/qino/servers/dist/server/
cp -r ../qinolabs-repo/packages/qino-os/dist/ui plugins/qino/servers/dist/
```

Verify the bundle is fresh:
- `ls -lh plugins/qino/servers/dist/server/index.js` — should be ~1.5 MB, recent timestamp
- `ls plugins/qino/servers/dist/ui/index.html` — should exist

Also update the local plugin cache so the current session picks up the new build:
```bash
pnpm rebuild:qino-os
```

Or if already built, just sync the cache:
```bash
for dir in ~/.claude/plugins/cache/qino-plugins/qino/*/; do
  cp plugins/qino/servers/dist/server/index.js "${dir}servers/dist/server/"
  rm -rf "${dir}servers/dist/ui"
  cp -r plugins/qino/servers/dist/ui "${dir}servers/dist/"
done
```

Show the diff summary and **WAIT** for confirmation before proceeding.

### 2. Detect Changed Plugins

```bash
git diff --name-only <last-tag>..HEAD
```

Group changed files by plugin directory (`plugins/<plugin-name>/...`).

### 3. Analyze Changes Per Plugin

For each changed plugin:

```bash
git log --oneline <last-tag>..HEAD -- plugins/<plugin>/
git diff <last-tag>..HEAD -- plugins/<plugin>/
```

Read the affected files to understand what actually changed. Look for:
- New capabilities
- Changed behavior
- Bug fixes
- Removed features

### 4. Generate Changelog Entries

Write entries that:
- Describe changes in terms users understand
- Use active voice, present tense
- Highlight the "why" not just "what"
- Match the voice of existing CHANGELOG.md

**Section structure:**
```markdown
### Plugin Name

#### Added
- New capability description

#### Changed
- Behavior change description

#### Fixed
- Bug fix description
```

### 5. Propose Changelog

Read current `CHANGELOG.md`. The new version replaces `## [Unreleased]`.

Show proposed changelog section and **WAIT** for confirmation.

### 6. Update CHANGELOG.md

Replace `## [Unreleased]` section with the versioned section.
Add new empty `## [Unreleased]` at top.

### 7. Bump Plugin Versions

Update version locations for changed plugins:

1. **Plugin identity — single source of truth** (what Claude Code reads for `/plugin`):
   ```
   plugins/<plugin>/.claude-plugin/plugin.json  → "version" field
   ```

2. **Reference versions** (per-reference tracking):
   ```
   plugins/<plugin>/references/*/version.json   → "version" field
   ```

3. **Marketplace metadata** (catalog version, not per-plugin):
   ```
   .claude-plugin/marketplace.json              → metadata.version only
   ```

⚠️ **Do NOT add per-plugin `version` fields to either marketplace.json file.** The Claude Code docs warn:

> *"When possible, avoid setting the version in both places. The plugin manifest always wins silently, which can cause the marketplace version to be ignored."*
> — `code.claude.com/docs/en/plugins-reference.md#version-management`

Per-plugin versions live exclusively in `plugins/<plugin>/.claude-plugin/plugin.json`. The marketplace files only describe *which plugins exist* and where their sources live; the version of each plugin is read from its own `plugin.json` at install time.

Use bundle-aligned versioning — plugin version matches the release version where it last changed.

Show proposed bumps and **WAIT** for confirmation.

### 8. Propose Release

Show:
```
Ready to create release:

Files to commit:
  - CHANGELOG.md
  - plugins/*/.claude-plugin/plugin.json (changed plugins)
  - plugins/*/references/*/version.json (changed plugins)
  - .claude-plugin/marketplace.json (only if metadata.version changed)

Commands:
  git add <files>
  git commit -m "Release v1.0.1"
  git tag v1.0.1
  git push && git push --tags
  gh release create v1.0.1 --title "v1.0.1" --notes "..."

Create release?
```

**WAIT** for confirmation.

### 9. Create Release

Execute the git and gh commands. Release notes should be a concise changelog summary with link to full CHANGELOG.md.

---

## Do NOT

- Skip confirmation steps
- Proceed if git status is dirty
- Hardcode plugin lists — discover from `plugins/` directory
