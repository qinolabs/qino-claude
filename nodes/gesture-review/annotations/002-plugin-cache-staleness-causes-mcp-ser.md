---
author: agent
signal: tension
created: 2026-04-06T18:26:54.691Z
---
## Plugin cache staleness causes MCP server crash

Discovered during qino-claude README session (2026-04-06).

### The problem
Claude Code runs plugin MCP servers from `~/.claude/plugins/cache/`, not from the repo. When qino-os is rebuilt in the monorepo, the cache retains the old build. The April 5 cached build lacked the `probeExistingServer` client-mode logic added in iter 29-30. When the dev server was already running on port 4020, the cached MCP server crashed with `EADDRINUSE` — silently. Claude Code reported "Failed to reconnect to plugin:qino:qino-os" with no diagnostic information.

### Root cause
The April 5 build tried to bind port 4020. The April 6 build detects an existing server and delegates to it (client mode). But the cache had the April 5 build.

### Fix applied
- Created `scripts/rebuild-qino-os.sh` — builds and syncs to both repo and cache
- Added `pnpm rebuild:qino-os` script to package.json
- Updated release command to include cache sync step

### Remaining risk
Any new qino-os feature that changes MCP server startup behavior will silently break for users who have a cached older build. The `/reload-plugins` command does NOT update the cache from the repo — it re-reads config but keeps the cached binary. Only reinstalling the plugin or manually syncing the cache updates the server code.

### Possible deeper fix
Could the plugin `.mcp.json` point to the repo source during development instead of the cache? Or could the rebuild script be a hook that runs automatically when qino-os source changes?
