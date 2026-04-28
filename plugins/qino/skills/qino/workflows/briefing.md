# Briefing Workflow

**Execution:** spawn
**Voice:** Composed, calm, direct.
**Agent:** brief

**References:**
- `qinolabs-repo/implementations/qino-practice/content/03-morning-briefing-routine.md` — design spec the briefing implements

---

## Task

Compose today's morning briefing. A single-screen markdown file at `qinolabs-repo/implementations/qino-practice/briefings/YYYY-MM-DD.md` that the practitioner reads on the phone before walking, to orient for the day without graph exploration.

This is part of qino-practice — the way of working co-designed with a life practice. The briefing pre-resolves the day's reading into a form that survives mobile attention.

---

## When to invoke

The user says one of:

- "compose a briefing", "morning briefing", "today's briefing"
- "/qino brief", "/qino briefing"
- "what's the briefing for today"
- "prepare for tomorrow", "compose tomorrow's reading"

---

## Routing

Spawn `qino:brief` as an isolated subagent via the Task tool. The agent reads the graph, composes the file, and stages (does not commit) the result. The practitioner reviews and commits.

The agent definition is at `agents/brief.md` in this plugin. It carries the full format contract, composition algorithm, and tone guidance.

---

## Context handling

This workflow assumes:

- A qino workspace is set up (`.claude/qino-config.json` exists)
- The qino-os MCP server is available
- `qinolabs-repo/implementations/qino-practice/` exists (the qino-practice implementation node)

If `qinolabs-repo/implementations/qino-practice/briefings/` does not exist yet, the agent creates it as part of writing the first briefing.

If today's briefing already exists, the agent asks before overwriting.

---

## Arrival pattern

The agent's first move is `read_activity` to see workspaces, recent changes, and active iterations. From there it reads selectively — only what's needed to find the held thread and three openings.

The agent does not interrogate the practitioner. It composes from existing material. If the graph is sparse, the briefing is short. Padding is forbidden.

---

## Output

A single markdown file at the path above, plus a staged but uncommitted git change. The practitioner reviews the briefing, commits, and pushes — making it readable from the phone in the cloud session.

Briefings are immutable once committed. Recomposing a same-day briefing is a future-iteration question; the agent does not handle it.

---

## Failure modes

| Failure | Behavior |
|---|---|
| qino-os MCP unavailable | Fall back to filesystem reads; note in provenance |
| Today's briefing exists | Ask practitioner before overwriting |
| Graph genuinely sparse | Compose a shorter briefing; do not invent material |
| `qino-practice` node missing | Stop. Surface the issue. Do not synthesize a placeholder |

---

## Notes

- The briefing format is a contract; the agent does not improvise on structure
- The composition is the artifact; the file is the deliverable
- Manual commit by the practitioner is intentional for the first implementation — establishes feedback loop on briefing quality before automation
