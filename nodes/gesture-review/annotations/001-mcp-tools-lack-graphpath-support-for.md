---
author: agent
signal: tension
created: 2026-04-06T18:26:37.405Z
---
## MCP tools lack graphPath support for child workspaces

Discovered during qino-claude workspace initialization (2026-04-06).

### Tools that fail on child workspaces

| Tool | Behavior | Expected |
|------|----------|----------|
| `init_workspace` | No graphPath param — always initializes root | Should accept graphPath to init child workspaces |
| `update_config` | No graphPath param — 404 on child workspace | Should accept graphPath to configure any workspace |
| `touch_node` | Accepts graphPath but returns 404 for `qino-claude` | Should work like read_node and create_node do |

### Tools that work correctly with graphPath
`read_graph`, `read_node`, `create_node`, `write_annotation`, `read_content` — all accept graphPath and resolve child workspaces correctly.

### Workarounds used
- `init_workspace`: Created graph.json and nodes/ manually via Write + Bash tools
- `update_config`: Edited .claude/qino-config.json directly via Edit tool  
- `touch_node`: Skipped — node was just created so updated date is current

### Impact
Anyone setting up a child workspace hits this friction. The README describes a conversational setup experience, but in practice the agent has to fall back to filesystem operations for child workspaces. This breaks the "you interact with the thinking, not the files" promise.

### Fix scope
- `init_workspace`: Add optional `graphPath` parameter, resolve workspace dir from it
- `update_config`: Add optional `graphPath` parameter, same pattern
- `touch_node`: Debug why graphPath resolution fails — other tools with identical signatures work
