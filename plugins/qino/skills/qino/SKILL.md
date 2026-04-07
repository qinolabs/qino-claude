---
name: qino
description: |
  Ecology for developing ideas through concept exploration, research, and implementation.

  ACTIVATE for dev work:
  - "what's next for [app]", "continue [app]", "work on [app]"
  - "build [feature]", "implement [feature]", "plan the iteration"
  - "next steps for [project]", "file a bug"

  ACTIVATE for concept/graph work:
  - "explore [concept]", "go deeper into [idea]", "where am I", "what's here"
  - "capture this thought", "hold this", "note this"
  - "read this deck", "actualize [deck]", "/qino deck [name]"
  - "start research on [topic]", "investigate [question]"
  - "test [concept]", "notice through [ecology]"

  ACTIVATE for setup:
  - "/qino setup", "set up qino", "initialize workspace"

  ACTIVATE when in a qino workspace (has `.claude/qino-config.json`).
---

# qino Skill

Ecology for developing ideas. Natural language activation — users describe intent, the skill routes to the appropriate agent.

---

## Context Detection

1. Check for `.claude/qino-config.json` in the current directory
2. Read the `repoType` field:

| repoType | Context |
|----------|---------|
| `"concepts"` or absent | Concepts workspace |
| `"research"` | Research workspace |
| `"implementation"` | Implementation — build context, concept links discovered via `"concept grounds"` edges |
| `"tool"` | Tool development |

3. If no `qino-config.json` exists:
   - Setup intent → route to setup (see below)
   - Otherwise → os agent orients via `read_activity`

---

## Momentum Detection

Before routing, assess whether the conversation already carries momentum.

**When momentum exists** (user has shared specific ideas, direction, or details):
- Pass as "already surfaced" context to the agent
- Agent skips exploratory questioning, works directly with what's been expressed

**When no momentum exists:**
- Let the agent's arrival pattern unfold naturally

---

## Routing — Three Paths

### 1. Build intent → spawn `qino:build`

**Signals:** "build", "implement", "what's next for [app]", "continue [app]", "plan iteration", "next steps", "work on [app]", any app name with action intent, "file a bug".

| Intent | Workflow |
|--------|----------|
| New app from concept | `workflows/new-app.md` |
| Continue building, next iteration, fix bug | `workflows/iteration.md` |

Build workflows involve heavy file reading, code changes, and scaffolding. They spawn in an isolated subagent via the Task tool.

### 2. Setup intent → os agent with setup workflow

**Signals:** "/qino setup", "set up qino", "initialize workspace", or no workspace + clear setup intent.

Os agent reads `workflows/setup.md` and `references/workspaces.md`, then facilitates the conversational onboarding in the main thread.

### 3. Everything else → os agent (inject mode)

The os agent handles all graph work through MCP tools and persona principles:

- **Arrival/orientation**: `read_activity` → respond to what's there
- **Node exploration**: `read_node` → ground opening in what was found
- **Deck actualization**: `read_decks` → read members → produce reading (consult `references/deck-actualization.md`)
- **Capture**: `create_node(type: "capture")` — brief, don't interrogate
- **Concept creation**: brief dialogue to surface impulse → `create_node(type: "concept")`
- **Research inquiry**: brief dialogue to surface question → `create_node(type: "inquiry")`
- **Ecology lens application**: consult `references/ecology-lenses.md`
- **Annotation**: `write_annotation` — always available, not a mode

No workflow file needed. The agent reads the graph and responds. Dialogue happens in the main conversation (inject mode).

---

## Subagent Types

| Agent | subagent_type | Mode |
|-------|---------------|------|
| OS Agent | `qino:os` | inject (main conversation) |
| Build Agent | `qino:build` | spawn (isolated subagent) |

Agent definitions: `agents/os.md`, `agents/build.md`, `agents/protocol-structure.md`

---

## Error States

**Ambiguous intent:**

| Header | Question | Options |
|--------|----------|---------|
| "Direction" | "Which direction?" | Explore ("Work with ideas or the graph"), Build ("Implement or code something") |

**Unknown intent:**
> Os agent calls `read_activity` — arrival handles orientation naturally.
