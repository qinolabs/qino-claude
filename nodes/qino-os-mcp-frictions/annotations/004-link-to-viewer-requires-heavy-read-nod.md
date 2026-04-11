---
author: agent
signal: tension
created: 2026-04-09T00:00:00.000Z
---
## "Show me the link" requires a heavy `read_node` round-trip

Discovered during a session where the user asked the agent for a viewer link
and watched it go through several hoops to produce one.

### The friction

A bare "show me the link to the viewer" request turned into:

1. `ToolSearch` — load `mcp__plugin_qino_qino-os__*` schemas from the deferred
   tool list.
2. `read_node` — fetch the full node (story + content + neighborhood +
   annotations + signals) just to extract `_links.self`.
3. (A second `read_node` was queued for a sibling node before the user
   intervened.)

Three tool round-trips for a URL. The user's reaction: *"It doesn't feel
right."*

### Why it happens

The `_links` convention in `mcp-instructions.ts:40` is correct — hand-crafted
URLs drop the `?at` / `?highlight` / `?section` query params that make views
useful — but it leaves `read_node` as the **only** MCP-exposed path to a
scoped URL. So any request that even sounds like "give me a link" is
structurally a full node fetch, paying for story + content + neighborhood +
annotations the caller never uses.

The cost is hidden most of the time, but it surfaces whenever:
- Tool schemas are still deferred (adds a `ToolSearch` hop before the read).
- The user just wants to share/open a view, not discuss the node's contents.
- The agent needs the viewer root URL (no nodeId at all), where `read_node`
  doesn't even apply and the agent falls back to reading the MCP instructions
  text.

### Proposed fix: `get_viewer_link` MCP tool

Add a cheap, dedicated tool that returns viewer URLs without touching the
filesystem beyond workspace resolution.

**Shape** (matches existing tool conventions in `mcp-tools.ts`):

```ts
{
  name: "get_viewer_link",
  description:
    "Return scoped viewer URL(s) for a workspace or node without loading " +
    "node contents. Cheap alternative to read_node when the caller only " +
    "needs a URL to share or open. Always prefer this over constructing " +
    "URLs by hand — it carries the ?at / ?highlight / ?section params.",
  params: {
    graphPath?: string;  // omit → root workspace
    nodeId?: string;     // omit → graph view URL; provide → node deeplink
    section?: string;    // optional section anchor for node deeplinks
  },
  returns: {
    url: string;         // the single scoped URL
    _links?: NodeLinks | GraphLinks;  // full link object for parity
  }
}
```

### Why this is cheap to build

The link-building is already factored out in `src/server/deeplinks.ts`:

- `buildGraphLinks(deeplinkConfig, graphPath, nodeIds, knownWorkspaces)`
- `buildNodeLinks(deeplinkConfig, graphPath, nodeId, knownWorkspaces)`

Both are pure functions over config + identifiers. They don't read node
files. The HTTP API (`http-api.ts:179`, `:201`) already calls them after
loading the node, but there's no structural reason the loading has to
happen — `buildNodeLinks` just needs to know the node exists (which a
lightweight existence check can confirm).

The new MCP tool would:
1. Resolve `graphPath` → workspace dir (existing helper).
2. If `nodeId` given, verify the node exists on disk (stat the dir, don't
   read the contents).
3. Call `buildGraphLinks` or `buildNodeLinks` directly.
4. Return `{ url, _links }`.

No new URL construction logic. No new config plumbing. Just a new tool
handler that skips the expensive part of `read_node`.

### Also update `mcp-instructions.ts`

Once the tool exists, the instructions at line 40 should gain a sentence
telling the agent to prefer the cheap path:

> "For 'show me the link' style requests — including the workspace viewer
> root — call `get_viewer_link` rather than `read_node`. Only reach for
> `read_node` when you actually need the node's story, content, or
> neighborhood."

This is the other half of the fix: without the instruction, a well-behaved
agent will still default to `read_node` because that's where `_links`
currently lives in the MCP mental model.

### Impact

- One round-trip instead of two or three for the most common "link me to X"
  ask.
- Zero `story.md` / `content/` reads for bare link requests — lighter on
  filesystem and on agent context budget.
- Unblocks the viewer-root case entirely (where `read_node` doesn't apply at
  all).
- Preserves the `_links` discipline — no hand-crafted URLs; the tool is the
  canonical cheap path.

### Fix scope

- `src/server/mcp-tools.ts`: Add `get_viewer_link` tool definition and
  handler.
- `src/server/ops.ts`: Export a `resolveViewerLinks({ graphPath, nodeId,
  section })` helper that wraps `buildGraphLinks` / `buildNodeLinks` with an
  existence check.
- `src/server/mcp-instructions.ts`: Add the "prefer `get_viewer_link`"
  guidance near line 40.
- Rebuild + sync per `.claude/commands/release.md` step 1b (the bundle at
  `qino-claude/plugins/qino/servers/dist/` must be refreshed and the plugin
  cache updated — see annotation 002 on this node for why that matters).
