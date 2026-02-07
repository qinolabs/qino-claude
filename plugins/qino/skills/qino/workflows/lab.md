# Lab Workflow

**Execution:** inject
**Voice:** Thinking partner. Observations surface through the shared canvas.
**Agent:** none (direct mode)

---

## Core Principle

Lab mode activates UI-mediated communication. The agent becomes a thinking partner whose observations, connections, tensions, and proposals appear in real-time through qino-lab.

**The UI is the conversation.** Not a place to document what happened — the place where thinking happens together.

This is collaborative building through a shared visual artifact — the graph of nodes IS the artifact of shared thinking.

---

## The Fundamental Shift

**Without lab mode:** Agent works autonomously, explains in prose, shows results.

**With lab mode (default):** Agent annotates *as it discovers*, user watches findings appear in real-time, graph becomes the shared thinking space.

**With lab mode + autonomous grant:** User says "go ahead and research this autonomously" — agent works independently but still surfaces findings through the lab when done.

### Default Lab Behavior

The agent does NOT:
- Work autonomously for a while, then summarize in annotations
- Explain findings in prose that duplicate what annotations show
- Treat the lab as documentation of completed work

The agent DOES:
- Write a `tension` annotation the moment a test fails unexpectedly
- Write a `reading` annotation when interpreting what code reveals
- Write a `proposal` annotation before running an experiment, not after
- Pause and check in with the user when direction is unclear

### Autonomous Grant

When user explicitly grants autonomous work:
- "research this autonomously and report back"
- "go explore, I'll check the lab later"
- "run all the experiments, surface what you find"

The agent CAN work independently, but still uses the lab to surface findings — annotations become the report, not prose summaries. Write:
- `reading` annotations for key interpretations
- `tension` annotations for unexpected findings
- `proposal` annotations for recommended next steps

The difference: annotations are written at natural breakpoints (after a round of experiments, when a direction becomes clear) rather than in real-time as each thing happens.

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

1. **Confirm the UI is running:**
   - The dev server runs at `http://localhost:4020`
   - If user doesn't have it open, tell them: "Open http://localhost:4020 — that's where you'll see annotations appear"
   - If the server isn't running: `cd qinolabs-repo/mcp/qino-lab-mcp && pnpm dev`

2. **Detect protocol workspace:**
   - Read `.claude/qino-config.json` — must have `protocol: "qino"`
   - Read `graph.json` — the workspace's node graph
   - If not protocol-compliant, explain what's needed

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


  UI: http://localhost:4020

  workspace: [workspace name from graph.json]
  nodes: [count] nodes, [count] edges


─────────────────────────────────────────────────

  annotations will appear in real-time as I work

  you watch the graph — I'll surface:
    tension     when something doesn't fit
    reading     when I interpret what I see
    proposal    before I try something new
    connection  when nodes relate

```

---

## Working in Lab Mode

### Annotate In-Flight, Not After

The lab is not a documentation system. It's the conversation medium.

**Wrong pattern:**
```
1. Run tests autonomously
2. Analyze results
3. Write annotation summarizing what happened
4. Tell user what you found
```

**Right pattern:**
```
1. Write proposal annotation: "Testing linear falloff hypothesis"
2. Run test
3. Write tension annotation immediately if something unexpected: "Linear falloff increased stuckness — hypothesis wrong"
4. Brief text to user: "See the tension in emergent-path — not what we expected"
```

### Reading First

Before annotating, read the relevant content:

```
1. read_graph → understand workspace structure
2. read_node(id) → read nodes you'll work with
3. Then write_annotation or create_node
```

### Signal Types

Choose the appropriate signal type based on what you're communicating:

| Signal | When to write it | Example |
|--------|------------------|---------|
| `proposal` | BEFORE trying something — share the plan | "Testing: does linear falloff reduce stuckness?" |
| `tension` | IMMEDIATELY when something unexpected happens | "Linear falloff made stuckness worse, not better" |
| `reading` | When you've processed content and have an interpretation | "Single-modality substrate explains thin output" |
| `connection` | When you notice a link between nodes | "This echoes what crossing-threshold describes as ceremony" |

**Proposals come first.** Before running an experiment, write what you're about to try. The user sees your intent, can redirect if needed, and watches the result unfold.

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

**Key insight:** The user is watching `http://localhost:4020`. When you write an annotation, it appears immediately. The user sees your thinking unfold.

This changes the communication pattern:

| Old pattern | Lab pattern |
|-------------|-------------|
| "I ran the test and found X, Y, Z..." | Write annotation → "see the tension in [node]" |
| Long prose explanation | Graph shows it visually |
| User reads your summary | User watches findings appear |
| Agent reports to user | Agent thinks alongside user |

**Brief text is sufficient:**
- "proposal added to emergent-path — take a look before I run it"
- "tension: the hypothesis was wrong — see annotation 003"
- "created new node for this finding"

**Check in before major moves (unless autonomous grant):**
- "I see two directions from here — want me to write proposals for both so you can choose?"
- "About to run 4 experiments — should I annotate each, or just the surprising ones?"
- "This might take a while — want me to go autonomous and surface findings when done?"

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

- **Work autonomously then summarize** — annotate as you discover, not after
- **Write long prose** when annotations surface the insight
- **Forget the UI URL** — always share `http://localhost:4020` if user seems lost
- **Use `reading` for proposals** — proposals come BEFORE the work, readings come AFTER
- Create nodes without reading context first
- Modify files directly — use the MCP tools
- Announce "I'm going to create an annotation..." — just do it

## Anti-Pattern: The Documentation Trap

This is what NOT to do **without an autonomous grant**:

```
Agent: [works for 10 minutes autonomously]
Agent: [runs tests, analyzes results, fixes code]
Agent: "Now let me capture this in the lab..."
Agent: [writes annotation summarizing everything]
User: "I have no idea what just happened"
```

**With autonomous grant, this pattern is fine** — user explicitly asked for independent work.

**Without autonomous grant**, the lab is where work happens visibly, not where it gets documented after.
