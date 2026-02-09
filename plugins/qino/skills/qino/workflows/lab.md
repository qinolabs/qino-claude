# Lab Workflow

**Execution:** inject
**Agent:** none (direct mode)

---

## Rules

These define lab mode. Follow them precisely.

1. **The graph IS the conversation.** Annotate through MCP tools. Don't explain in prose what the UI shows.
2. **Annotate in-flight, not after.** Write annotations AS you discover. Never work autonomously then summarize.
3. **Proposals BEFORE work.** Write `proposal` before trying something. User sees intent, can redirect.
4. **Tensions IMMEDIATELY.** Write `tension` the moment something unexpected happens.
5. **Read before writing.** Always `read_node` before annotating. Always `read_graph` before creating nodes.
6. **Brief text with links.** After annotating, short message with a deeplink — not a prose explanation.
7. **Journal notes are nudges.** When `read_node` or `read_graph` returns journal sections with user-authored notes, recognize them. Respond with a journal entry (same scope) that acknowledges the thought and points to what it opens — a new node, a parallel connection, or the next piece of work. The journal is bidirectional.

---

## Signal Types

| Signal | When | Example |
|--------|------|---------|
| `proposal` | BEFORE trying something | "Testing: does linear falloff reduce stuckness?" |
| `tension` | IMMEDIATELY when unexpected | "Linear falloff made stuckness worse" |
| `reading` | After interpreting content | "Single-modality substrate explains thin output" |
| `connection` | When nodes relate | "Echoes what crossing-threshold describes" |

Proposals come first. Readings come after. Never use `reading` for proposals.

---

## Activation

User says: "use the lab", "lab mode", "work through the lab", "work through qino-lab", "use qino-lab for this"

**Re-injection (after compaction):** If lab mode was previously active in this session, re-read this file and `read_graph` to pick up current state. The graph carries continuity — annotations, nodes, and journal entries persist across compaction.

---

## Setup

1. Confirm UI at `http://localhost:4020`
2. Read `.claude/qino-config.json` — must have `protocol: "qino"`
3. Read `graph.json` — workspace structure
4. Confirm MCP tools: `read_graph`, `read_node`, `read_config`, `write_annotation`, `create_node`, `update_view`, `write_journal_entry`

Output:

```
                        lab mode active


  UI: http://localhost:4020

  workspace: [name from graph.json]
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

## Autonomous Grant

When user explicitly grants autonomous work ("research this autonomously", "go explore, I'll check later"):

- Work independently but STILL surface findings through annotations
- Write at natural breakpoints, not in real-time
- Annotations become the report — not prose summaries

Without autonomous grant: annotate in real-time, check in when direction is unclear.

**Check in before major moves:**
- "Two directions — want proposals for both?"
- "About to run 4 experiments — annotate each, or just surprising ones?"
- "This might take a while — want me to go autonomous?"

---

## Navigator Awareness

When the graph contains navigator nodes (`type: "navigator"`):

**Activation within lab mode**: If the user asks to activate or work with a navigator while in lab mode, `read_node` on the navigator brings its terrain into the conversation as working context. No mode switch needed — lab mode already has the tools.

**Creation within lab mode**: If the user asks to create a navigator while in lab mode, follow the navigate workflow's Mode 2 (create) structure — but execute it within lab mode's rules (annotate in-flight, proposals before work, graph IS the conversation).

**Session log updates**: At session end, if a navigator was active, offer to update its session log (same as navigate workflow Mode 3).

---

## Communication

| Instead of... | Do this |
|---------------|---------|
| Long prose explaining findings | Annotation → brief text with link |
| "I ran the test and found X, Y, Z" | Annotation in UI → "see the tension in [node]" |
| Announcing "I'm going to create..." | Just do it |
| Reporting to user | Thinking alongside user |

---

## Ending

Lab mode persists until: user says "exit lab mode" / "done with lab", session concludes, or user switches workflow.

```
                        lab session complete


  [brief summary of what was created/observed]

```

---

## Reference

For operational details (deeplinks, views, node creation, journal entries, annotation format, error states):

Read `references/lab/lab-operations.md` when you need them — not at activation.
