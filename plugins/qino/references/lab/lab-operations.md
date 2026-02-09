# Lab Operations Reference

Read this file on demand when you need to create views, construct deeplinks, write journal entries, or handle error states. This is not injected at activation — the core behavioral rules are in `workflows/lab.md`.

---

## Annotation Format

When calling `write_annotation`:

```json
{
  "nodeId": "the-node-id",
  "signal": "reading|connection|tension|proposal",
  "content": "The observation or insight",
  "target": "optional: specific content element this references"
}
```

---

## Deeplinks

MCP tool responses include `_links` for building navigable references.

### From `read_graph`

```json
{
  "_links": {
    "self": "http://localhost:4020/.../graph?at=...",
    "nodes": {
      "node-id": "http://localhost:4020/.../node/node-id?at=..."
    }
  }
}
```

### From `read_node`

```json
{
  "_links": {
    "self": "http://localhost:4020/.../node/node-id?at=...",
    "graph": "http://localhost:4020/.../graph?at=..."
  }
}
```

### Patterns

| Action | Pattern |
|--------|---------|
| Reference a node | `[node-title](_links.nodes["node-id"])` |
| Link to current node | `[see details](_links.self)` |
| Link to parent graph | `[back to graph](_links.graph)` |
| After writing annotation | `[view in node-name](_links.self)` |
| After creating node | Read the new node, then `[see node-name](_links.self)` |

Always link to what you're describing — saves the user from navigating manually.

---

## Views — Shared Attention

Views are curated subsets of the graph — "think about these things together."

**When to create a view:**
- Multiple nodes need to be attended to together
- A tension or connection spans several nodes
- You want to frame a question that involves 2-4 nodes

**Creating a view:**

```json
{
  "id": "the-naming-tension",
  "title": "The Naming Tension",
  "type": "view",
  "story": "Crossing as functional act vs. ceremony — the name hides the experiential quality",
  "view": {
    "focal": "crossing-threshold",
    "includes": ["domain-language", "qino-world"]
  }
}
```

The `focal` node is the entry point. `includes` are the other nodes to attend to together.

**Using views:**
- Annotations on the view node apply to the framing, not individual nodes
- Journal entries with `context: view/the-naming-tension` track thinking within that frame
- Views can be composted when inquiry resolves

**Lifecycle:** `active` → `composted`

**MCP tools:**
- `create_node` with `view` field → creates a view node
- `update_view` → changes focal or included nodes as inquiry evolves

---

## Node Creation

When creating nodes:

```json
{
  "id": "kebab-case-id",
  "title": "Human-Readable Title",
  "type": "capture|concept|facet|etc",
  "story": "Why this node exists — the impulse"
}
```

The tool will:
1. Create `nodes/{id}/node.json` with identity
2. Create `nodes/{id}/story.md` with impulse
3. Add node entry to `graph.json`
4. Echo creation to `journal.md`

---

## Journal Entries

Use `write_journal_entry` to mark session context:

```json
{
  "content": "Entry text",
  "context": "session/2025-02-07 or node/node-id or view/view-id"
}
```

### Responding to User Journal Notes

`read_node` returns `journalSections[]` — parsed from the node's local `journal.md`. `read_graph` returns `journalSections[]` from the workspace journal.

**Distinguishing user notes from auto-generated echoes:**
- Capture echoes follow the pattern: `captured: Title\n→ [id](path/)` — these are system-generated, skip them
- Everything else is a user-authored note — a nudge written between sessions

**When you find a user note:**

1. Read it carefully — it carries observation from outside the session
2. Write a journal entry in response (same context scope) that:
   - Acknowledges what the note surfaces (briefly — not paraphrasing)
   - Names what it opens: a connection to another node, a tension worth tracking, a direction for the next piece of work
   - Points to the concrete thing: `→ see [node-title](deeplink)` or `→ this could become [description]`
3. If the note points to something worth annotating on a specific node, write the annotation too

**What NOT to do:**
- Don't echo the note back as prose in the chat — respond through the journal
- Don't treat notes as task instructions — they're observations, not directives
- Don't ignore them — the whole point is that the user senses their thinking was received

---

## Navigators

Navigators are graph nodes (`type: "navigator"`) in the root graph. They appear in qino-lab alongside other nodes.

**Use navigators when:**
- Work spans multiple sessions and you need persistent context
- Territory crosses multiple apps, concepts, or systems

**Activate via:** "use the active navigator", "navigate [territory]"

**Within lab mode:** Navigator operations work naturally — lab mode already has the graph tools. See `workflows/lab.md` Navigator Awareness section.

See `workflows/navigate.md` for full navigator workflow.

---

## Error States

**No protocol workspace:**
> "This workspace isn't protocol-compliant. Lab mode requires:
> - `.claude/qino-config.json` with `protocol: "qino"`
> - `graph.json` at workspace root
>
> Would you like to set this up?"

**MCP tools not available:**
> "Can't connect to qino-lab-mcp. Check that:
> - The MCP server is running
> - It's configured in Claude settings"

**Node not found:**
> "Node `[id]` not found in the graph. Available nodes: [list top 5]"
