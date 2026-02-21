# Bug Workflow

**Execution:** inject
**Voice:** Clear. Thorough. Capturing enough context that a future session can pick this up cold.
**Agent:** none (direct mode — uses qino-lab MCP tools)

**References:**
- `references/protocol/protocol-spec.md` — Node types, edge types, graph structure
- `references/protocol/information-model.md` — Finding type semantics
- `references/lab/lab-operations.md` — MCP tool patterns (annotation format, journal entries)

---

## What This Is

A structured bug ticket as a protocol node. The goal is twofold:

1. **Handover** — capture enough context (reproduction, investigation, hypotheses) that a future debugging session can start immediately, not from scratch
2. **Knowledge catalogue** — resolved bugs with root cause and resolution become searchable patterns

Bugs are `finding` nodes in the implementation graph. A finding is "what persisted beyond the session that produced it" — a bug is exactly that: a discovery that persists until resolved.

---

## Context Handling

This workflow operates on the **implementation graph** (`qinolabs-repo/graph.json`). If the conversation is happening in a different workspace, resolve the implementation graph path from context.

Requires: an implementation workspace with a `graph.json`.

---

## Flow

### 1. Gather Context

If the conversation already carries bug context (the user has been debugging, or described a problem), extract what you can. Then fill gaps by asking.

**Extract from conversation:**
- Which app/package is affected
- Observed behavior — **preserve the user's exact words** when they describe what's happening. Verbatim descriptions carry precision that paraphrasing loses ("browser just never stops loading even though content is visible" is more useful than "infinite loading state").
- Expected behavior
- Any code already read or hypotheses formed
- Stack traces or error messages
- What works vs. what doesn't — the **key discriminator** (e.g., "doesn't happen on the setup page")

**Ask for what's missing.** Use a single round of questions — not an interrogation:

> Filing a bug for [app-name].
>
> What I have so far:
> - [observed behavior from conversation]
> - [any investigation context]
>
> What's missing:
> - [specific gaps — e.g., "How do you reproduce this?" or "What should happen instead?"]

**WAIT** for response.

**If the user invokes this cold** (no prior conversation context):

> Filing a bug. Which app, and what's happening?

**WAIT** for response.

### 2. Determine Severity

Assess from the description — don't force the user to pick a category. Infer from urgency signals:

| Signal | Severity | Tag |
|--------|----------|-----|
| "crashes", "data loss", "blocks all work" | Critical | `severity:critical` |
| "broken feature", "wrong behavior", "can't use X" | High | `severity:high` |
| "annoying", "looks wrong", "minor issue" | Medium | `severity:medium` |
| "cosmetic", "nice to fix", "edge case" | Low | `severity:low` |

Default to `severity:medium` if unclear.

### 3. Create the Bug Node

Use `create_node` on the implementation graph:

```json
{
  "id": "bug-{descriptive-slug}",
  "title": "{Clear bug title}",
  "type": "finding",
  "status": "active",
  "story": "{1-2 sentence impulse — what's broken and why it matters}",
  "edges": [
    {
      "target": "{affected-app-id}",
      "type": "sparked-by",
      "context": "Bug discovered in {app-name}: {brief description}"
    }
  ]
}
```

**After `create_node`**, edit `node.json` to add tags — `create_node` doesn't support tags directly:

```json
"tags": ["{severity-tag}", "bug"]
```

Also create the content directory (`mkdir content/`) — `create_node` only produces `node.json` + `story.md`.

**ID convention:** `bug-{app}-{descriptive-slug}` (e.g., `bug-walk-index-infinite-loading`, `bug-world-session-crash-on-empty-substrate`)

**Story:** The impulse — concise, specific. "Index page in qino-walk loads indefinitely on reload. Content renders but loading never resolves. Does not happen on the setup page."

### 4. Write Bug Content

Write a content file `content/bug-report.md` to the node's content directory:

```markdown
# {Bug Title}

## Observed Behavior

{What actually happens — preserve the user's exact words where possible}

## Expected Behavior

{What should happen instead}

## Reproduction

{Steps to reproduce, or "discovered during [context]" if not yet reproducible}

## Key Discriminator

{What works vs. what doesn't — the comparison case that narrows the search.
e.g., "Does NOT happen on the setup page, which also makes tRPC calls with service bindings."
This is often the most valuable information in the entire bug report.
Omit if no comparison case is known.}

## Environment

- App: {app-name}
- Context: {where this was discovered — iteration work, manual testing, user report}

## Investigation

{Any investigation done so far — files read, hypotheses, what's been ruled out}

### Files Examined

{List of relevant source files if investigation happened}

### Hypotheses

{What might be causing this — ranked by likelihood if multiple.
Each hypothesis should explain the mechanism, not just name a suspect.}

### What's Been Ruled Out

{Things explicitly investigated and eliminated, with reasoning.
NOT the same as discriminating observations — those go in Key Discriminator.
This section prevents future sessions from retreading dead paths.}

### Suggested Next Steps

{Concrete actions for the next debugging session.
e.g., "Add logging to fetchClerkAuth to see if it resolves on SSR"
This is what makes the difference between a handover and a note.}
```

Omit sections that have no content (e.g., if no investigation has happened yet, omit Investigation entirely). But if investigation happened, always include Suggested Next Steps — a handover without next steps forces the next session to re-derive where to start.

### 5. Add Investigation Annotations (if applicable)

If investigation context exists from the current session, write annotations on the bug node.

**What annotations are for:** Signal that the bug report doesn't carry — generalizable patterns, architectural tensions, observations about code structure. Annotations are *marginal notes*, not a second copy of the hypotheses.

**Do NOT** restate hypotheses from the bug report. The report carries the *what*; annotations carry the *so what*.

- **`tension`** — for structural vulnerabilities or patterns that generalize beyond this bug ("Public routes with conditional auth have no timeout — if auth hangs, the loader hangs forever")
- **`reading`** — for architectural observations about code examined ("Two tRPC clients are in play, both falling back to the same server function — potential double-hang")

### 6. Journal Entry

Write a journal entry to the implementation graph journal:

```json
{
  "content": "Bug filed: {title}. Affects {app-name}. {one-line summary of the issue}.",
  "context": "node/{bug-node-id}"
}
```

### 7. Confirm and Suggest

Output:

```
bug filed: {bug-id}

  {title}
  affects {app-name} | {severity}

  {one-line observed behavior}

  {investigation status — e.g., "no investigation yet" or "2 hypotheses, 1 ruled out"}


from here

  investigate now — start debugging with full context loaded
  hand off — the node carries everything for a future session
```

**WAIT** for response.

**If "investigate now":** Read the bug node's content, load the affected app's implementation context, and begin debugging. The bug node becomes the working context — update its content and annotations as investigation proceeds.

**If "hand off":** Done. The bug node is self-contained.

---

## Resolution Flow

When a bug is resolved (same session or future session):

### 1. Update Node Status

Set the bug node's status to `"composted"` via `update_node` (or the appropriate MCP tool for status changes).

### 2. Write Resolution Annotation

Write a `reading` annotation on the bug node:

```json
{
  "nodeId": "bug-{id}",
  "signal": "reading",
  "content": "Resolved: {root cause}. Fix: {what was changed}. Pattern: {what generalizable insight emerged — what to watch for in the future}."
}
```

### 3. Update Content

Append a `## Resolution` section to `content/bug-report.md`:

```markdown
## Resolution

**Root Cause:** {What was actually wrong}

**Fix:** {What was changed — files, logic, approach}

**Pattern:** {What this generalizes to — "check for undefined vs empty array at data boundaries", "service binding timeouts under concurrent load", etc.}

**Resolved:** {YYYY-MM-DD}
```

### 4. Journal Entry

```json
{
  "content": "Bug resolved: {title}. Root cause: {brief}. See node for full investigation trail.",
  "context": "node/{bug-node-id}"
}
```

---

## Graph Path Resolution

The implementation graph lives at the workspace root. Resolve the path:

1. Check `context.root` from the SKILL's context detection
2. The graph is at `{context.root}/graph.json`
3. When using MCP tools, pass `graphPath` pointing to the implementation repo (e.g., `qinolabs-repo`)

If the workspace has `nodesDir` in graph.json (e.g., `"nodesDir": "implementations"`), bug nodes will be created under that directory.

---

## Do NOT:

- Create bugs without at least: affected app, observed behavior, and expected behavior
- Use `concept` or `capture` type — bugs are `finding` type nodes
- Skip the `sparked-by` edge to the affected app — this is what makes bugs discoverable from the app's node
- Write resolution without root cause — "fixed it" is not a resolution
- Force severity classification on the user — infer from their description
- Paraphrase user descriptions when their exact words are more precise
- Restate bug report hypotheses in annotations — annotations carry signal the report doesn't
