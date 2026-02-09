# Capture Workflow (Protocol)

**Execution:** inject
**Voice:** Instant and light. Like whispering to a trusted companion — acknowledged, held, no interrogation.
**Agent:** concept + protocol-structure

---

## Core Principle

A thought arrived. Capture it before it fades.

Captures are independent records — flat files at the workspace root, outside any graph. They don't need to become something else. They don't need status. They're already what they are.

---

## Captures Path Resolution

Captures live at the **multi-workspace root** — peer to all repos, not inside any one.

1. Check `qino-config.json` for explicit `capturesDir` path
2. If absent, use the parent directory of `context.root` + `/.qino/captures/`
3. Create the `.qino/captures/` directory if it doesn't exist

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

This becomes the file name and the markdown title.

### 3. Save

Generate file name: `YYYY-MM-DD_essence-as-kebab-case.md`

Create file at `{captures_path}/YYYY-MM-DD_essence.md`:

```markdown
# [Essence as title]

**Captured:** YYYY-MM-DDTHH:MM:SSZ

[Full observation as provided by user]
```

### 4. Confirm

```
∴ [essence]
held.
```

If the user explicitly mentions a concept or node by name:
```
∴ [essence]
held. (touches [node-title])

explore it now, or let it settle?
```

The parenthetical is an observation, not a connection to create. No edges, no graph changes.

**WAIT** for response.

### 5. If User Explores

Route to the protocol explore workflow with the mentioned node. The capture provides momentum context — the agent should acknowledge the capture's spark and work from there.

### 6. If User Lets It Settle

```
it'll surface when it has warmth.
```

Done.

---

## Do NOT:
- Ask for scope, anchor, context, or status
- Create multiple back-and-forth exchanges before saving
- Make the user justify the thought
- Skip essence distillation — even quick captures deserve a center
- Create graph nodes, edges, or journal entries for captures
- Track capture status or lifecycle
- Proactively scan for connections — only note what the user explicitly mentions
