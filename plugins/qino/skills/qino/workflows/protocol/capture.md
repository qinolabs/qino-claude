# Capture Workflow (Protocol)

**Execution:** inject
**Voice:** Instant and light. Like whispering to a trusted companion — acknowledged, held, no interrogation.
**Agent:** concept + protocol-structure

---

## Core Principle

A thought arrived. Capture it before it fades.

In the protocol, captures are first-class nodes in the graph — not files in a notes/ directory. They have their own directory, story, and edges to what they connect to.

---

## Flow

### 1. Receive

If the user's message contains the thought (e.g., "capture: the crossing threshold is really about permission"), extract it directly.

If the user says "capture" or "hold this" without content:
```
what's on your mind?
```
**WAIT.** Do not prompt further.

### 2. Distill

Silently distill the thought to its essence — 5-10 words that hold the center of gravity.

This becomes the node title and the seed of `story.md`.

### 3. Detect Connections

Read `graph.json`. Scan the user's observation for:
- Explicit mentions of existing node titles or ids
- Thematic resonance with node titles or edge contexts

Remember detected connections — they become edges.

### 4. Create Capture Node

Generate an id from the essence (kebab-case, descriptive — e.g., `crossing-as-permission`).

**Write sequence:**

**a.** Create `nodes/<id>/node.json`:
```json
{
  "title": "[Essence as title]",
  "type": "capture",
  "status": "active",
  "created": "[YYYY-MM-DD]"
}
```

**b.** Create `nodes/<id>/story.md`:
The captured thought — the user's words distilled but not drained. Keep the energy. 1-3 sentences.

**c.** Update `graph.json` — add node entry:
```json
{
  "id": "<id>",
  "title": "[Essence as title]",
  "type": "capture",
  "status": "active",
  "dir": "<id>"
}
```

**d.** If connections detected — add edges to `graph.json`:
```json
{
  "source": "<capture-id>",
  "target": "<connected-node-id>",
  "type": "sparked-by",
  "context": "[why this connection — a sentence]"
}
```

Edge type guidance:
- `sparked-by` — the capture emerged from encounter with the target
- `extends` — the capture builds on or continues the target
- `references` — the capture uses vocabulary or ideas from the target

**e.** Append echo to `journal.md`:
```markdown
## [capture title]

<!-- context: capture -->

[Essence sentence]. [If connected: Connected to [node-title] via [edge-type].]
```

### 5. Confirm

**Connections detected:**
```
∴ [essence]
connected to [node-title-1]
explore one now, or let it settle?
```

If multiple connections, list them:
```
∴ [essence]
connected to [node-title-1], [node-title-2]
explore one now, or let it settle?
```

**No connections:**
```
∴ [essence]
held.
```

---

## If User Explores a Connection

Route to the protocol explore workflow with the connected node. The capture provides momentum context — the agent should acknowledge the capture's spark and work from there.

## If User Lets It Settle

```
it'll surface when it has warmth.
```

Offer soft landing:
```
"where am I" | "explore [something]"
```

---

## Do NOT:
- Ask for scope, anchor, context, or status
- Create multiple back-and-forth exchanges before saving
- Make the user justify the thought
- Skip essence distillation — even quick captures deserve a center
- Create content/ directory for captures (story.md is enough unless the thought is substantial)
- Add edges you're not confident about — only connect what's clearly related
