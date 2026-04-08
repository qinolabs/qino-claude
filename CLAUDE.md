# CLAUDE.md

This repo is the **qino plugin hub** for Claude Code — plugins distributed through `marketplace.json`, agent personas, skill workflows, and the bundled qino-os MCP server.

The user-facing `README.md` is the front door (framing, philosophy, install). This file is its complement: operational facts an agent can't derive by reading the filesystem. Don't duplicate the README here, and don't catalog things that change — agents, plugins, workflows, and references are discoverable via `Glob`/`Read` and stay accurate at the source.

## Orientation

- Plugins live in `plugins/<name>/`, each self-contained. For any plugin, read its `README.md` for intent, `skills/<name>/SKILL.md` for routing, and `agents/` for personas.
- Repo-level commands live in `.claude/commands/`. Read each one before invoking.

## qino-os bundle (cross-repo)

The qino plugin ships a self-contained MCP server + browser viewer at `plugins/qino/servers/dist/`. The source lives in **another repo** — `qinolabs-repo/packages/qino-os/` — so the rebuild procedure isn't discoverable from inside qino-claude alone.

`servers/dist/server/index.js` is the inlined server bundle (tsup with `noExternal: [/.*/]`, all npm deps inlined). `servers/dist/ui/` is the built SPA (Vite). Both are committed. The plugin's `.mcp.json` starts the server via `node ${CLAUDE_PLUGIN_ROOT}/servers/dist/server/index.js`; workspace discovery runs against `process.cwd()`.

**Never edit files under `plugins/qino/servers/dist/` directly** — they are build artifacts and the next sync will silently overwrite the changes. To pick up changes from qino-os source:

```bash
# 1. Build in qinolabs-repo
cd ../qinolabs-repo && pnpm -F @qinolabs/qino-os build:plugin

# 2. Sync to plugin
rm -rf plugins/qino/servers/dist/
mkdir -p plugins/qino/servers/dist/server
cp ../qinolabs-repo/packages/qino-os/dist/plugin/server/index.js plugins/qino/servers/dist/server/
cp -r ../qinolabs-repo/packages/qino-os/dist/ui plugins/qino/servers/dist/
```

After syncing, refresh the **local plugin cache** so your current Claude Code session actually picks up the new bundle — `~/.claude/plugins/cache/qino-plugins/qino/<version>/` is keyed by version directory and won't auto-update on a rebuild. See `.claude/commands/release.md` step 1b for the `pnpm rebuild:qino-os` script and the manual `for`-loop fallback.

`/release` runs the whole procedure (build → sync → cache refresh) as step 1b.

## Plugin versioning

**Single source of truth**: per-plugin versions live exclusively in `plugins/<plugin>/.claude-plugin/plugin.json`. Marketplace catalog files (`.claude-plugin/marketplace.json` and `plugins/.claude-plugin/marketplace.json`) describe *which plugins exist*, but do NOT carry per-plugin versions.

**Why**: the Claude Code docs warn that *"the plugin manifest always wins silently, which can cause the marketplace version to be ignored"* ([plugins-reference#version-management](https://code.claude.com/docs/en/plugins-reference.md#version-management)). Setting versions in both places risks silent drift where the marketplace value is overridden by `plugin.json` without warning. Keeping one source of truth eliminates the trap.

The top-level `metadata.version` in `.claude-plugin/marketplace.json` describes the **catalog itself** (not any individual plugin) and stays.

**When to bump**: any push to master that changes a plugin's contents — including the bundled qino-os server in `plugins/qino/servers/dist/` — should bump that plugin's `plugin.json` `version` if any consumer has installed it. Reason: Claude Code's plugin cache is keyed by version directory (`~/.claude/plugins/cache/qino-plugins/<plugin>/<version>/`). Without a bump, a fix can't reach an existing install — and worse, two consumers nominally on the same version can hold *different* bundles depending on when they installed (their local cache only refreshes when the version field changes).

**Pre-launch exception**: while there are no consumers yet, you can push without bumping versions for iteration speed. The discipline kicks in the moment the first real consumer installs.
