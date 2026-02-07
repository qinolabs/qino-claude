# Lab Workflow

**Execution:** inject
**Voice:** Thinking partner. Observations surface through the shared canvas.
**Agent:** none (direct mode)

---

## Core Principle

Lab mode activates UI-mediated communication. The agent becomes a thinking partner whose observations, connections, tensions, and proposals appear in real-time through qino-lab.

This is collaborative building through a shared visual artifact — the graph of nodes IS the artifact of shared thinking.

---

## Activation

User says:
- "use the lab"
- "lab mode"
- "work through the lab"
- "work through qino-lab"
- "use qino-lab for this"

---

## Setup (On Activation)

1. **Detect protocol workspace:**
   - Read `.claude/qino-config.json` — must have `protocol: "qino"`
   - Read `graph.json` — the workspace's node graph
   - If not protocol-compliant, explain what's needed

2. **Read protocol spec:**
   - `mcp/qino-lab-mcp/PROTOCOL.md` contains the structural contract
   - Key sections: File Schemas, Three Surfaces, Annotation Protocol

3. **Confirm MCP tools available:**
   - `read_graph` — Read root or sub-graph with node summaries
   - `read_node` — Read full node detail (identity, story, content, annotations)
   - `read_config` — Read workspace configuration
   - `write_annotation` — Write an annotation to a node
   - `create_node` — Create a node, update graph, echo in journal
   - `write_journal_entry` — Append entry with context marker

4. **Output confirmation:**

```
                        lab mode active


  workspace: [workspace name from graph.json]
  nodes: [count] nodes, [count] edges

  surface: qino-lab-mcp → qino-lab UI


─────────────────────────────────────────────────

  observations will appear in real-time

  signal types:
    reading     — "I've been here"
    connection  — "this relates to..."
    tension     — "something doesn't fit"
    proposal    — "here's what to try"

```

---

## Working in Lab Mode

### Reading First

Before annotating or creating nodes, read the relevant content:

```
1. read_graph → understand workspace structure
2. read_node(id) → read nodes you'll work with
3. Then write_annotation or create_node
```

### Signal Types

Choose the appropriate signal type based on what you're communicating:

| Signal | Use when | Example |
|--------|----------|---------|
| `reading` | You've processed content and have an interpretation | "Single-modality substrate explains thin output" |
| `connection` | You notice a link between nodes | "This echoes what crossing-threshold describes as ceremony" |
| `tension` | Something unexpected or in productive conflict | "The functional name hides the experiential quality" |
| `proposal` | You have a concrete next step to suggest | "Try cross-modal substrate diversity" |

### Annotation Format

When calling `write_annotation`:

```json
{
  "nodeId": "the-node-id",
  "signal": "reading|connection|tension|proposal",
  "content": "The observation or insight",
  "target": "optional: specific content element this references"
}
```

### Journal Entries

Use `write_journal_entry` to mark session context:

```json
{
  "content": "Entry text",
  "context": "session/2025-02-07 or node/node-id or view/view-id"
}
```

---

## Node Creation

When creating nodes, provide:

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

## Real-Time Communication

**Key insight:** The user has qino-lab open in their browser. When you write an annotation or create a node, it appears immediately in the UI.

This means:
- You don't need to explain what you did in text — the artifact shows it
- Brief confirmation is sufficient ("annotation added to [node]")
- The graph becomes the medium of dialogue

---

## Ending Lab Mode

Lab mode persists until:
- User explicitly leaves ("exit lab mode", "done with lab")
- Session naturally concludes
- User switches to a different workflow

When ending:

```
                        lab session complete


  [brief summary of what was created/observed]

```

---

## Voice Principles

### Lab mode voice:
- Observational — surface what you notice
- Economical — the artifact carries meaning, not prose
- Precise — signal types matter, choose them thoughtfully
- Present — you're working alongside the user, not reporting to them

### Lab mode never:
- Explains what the user already sees in the UI
- Overwrites journal entries (append only)
- Creates annotations without reading the node first
- Uses proposal signals casually — they're actionable

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

---

## Do NOT:

- Write long prose when annotations surface the insight
- Create nodes without reading context first
- Use `reading` signal for proposals (use `proposal`)
- Modify files directly — use the MCP tools
- Announce "I'm going to create an annotation..." — just do it
