---
name: qino
description: |
  Ecology for developing ideas through concept exploration, research, and the knowledge graph.

  ACTIVATE for concept/graph work:
  - "explore [concept]", "go deeper into [idea]", "where am I", "what's here"
  - "capture this thought", "hold this", "note this"
  - "read this deck", "actualize [deck]", "/qino deck [name]"
  - "start research on [topic]", "investigate [question]"
  - "test [concept]", "notice through [ecology]"
  - "file a bug", "file a finding"

  ACTIVATE for setup:
  - "/qino setup", "set up qino", "initialize workspace"

  ACTIVATE for qino-practice briefing:
  - "compose a briefing", "morning briefing", "today's briefing", "tomorrow's briefing"
  - "/qino brief", "/qino briefing"
  - "what's the briefing", "prepare for tomorrow", "compose tomorrow's reading"

  ACTIVATE when in a qino workspace (has `.claude/qino-config.json`).
---

# qino Skill

Ecology for developing ideas. Natural language activation — users describe intent, the skill routes to the appropriate agent.

**Scope note — this skill owns the qino *graph* workflow, not the dev workflow.** Concept exploration, deck actualization, captures, research inquiries, annotations, findings, and the qino-practice briefing route here. **Building software does not.** The dev workflow (provisioning a worktree, planning and filing iterations, testing, deploying, landing a PR) is governed by the repo's own always-in-context guidance — `qinolabs-repo/CLAUDE.md` + `.claude/rules/` (git-workflow, testing, deployment, dependencies, native) and the workspace-root `CLAUDE.md` (session posture, iteration-filing shape, `touch_node` stamping). See "Build / dev work" below.

---

## Context Detection

1. Check for `.claude/qino-config.json` in the current directory
2. Read the `repoType` field:

| repoType | Context |
|----------|---------|
| `"concepts"` or absent | Concepts workspace — full graph work |
| `"research"` | Research workspace — inquiries + findings |
| `"implementation"` | Implementation workspace — the qino skill handles the **graph side** (nodes, annotations, findings, iteration nodes as graph objects) via the os agent; actual building follows repo CLAUDE.md + rules |
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

## Routing

### 1. Setup intent → os agent with setup workflow

**Signals:** "/qino setup", "set up qino", "initialize workspace", or no workspace + clear setup intent.

Os agent reads `workflows/setup.md` and `references/workspaces.md`, then facilitates the conversational onboarding in the main thread.

### 2. Briefing intent → spawn `qino:brief`

**Signals:** "compose a briefing", "morning briefing", "today's briefing", "tomorrow's briefing", "/qino brief", "/qino briefing", "what's the briefing", "prepare for tomorrow", "compose tomorrow's reading".

| Intent | Workflow |
|--------|----------|
| Compose today's or tomorrow's briefing | `workflows/briefing.md` |

The brief agent composes a single-screen morning briefing for the qino-practice — pre-resolves the day's reading into a form that survives mobile attention. Spawned as an isolated subagent. Writes the file to `qinolabs-repo/implementations/qino-practice/briefings/YYYY-MM-DD.md` and stages (does not commit) — practitioner reviews before committing.

### 3. Everything else → os agent (inject mode)

The os agent handles all graph work through MCP tools and persona principles:

- **Arrival/orientation**: `read_activity` → respond to what's there
- **Node exploration**: `read_node` → ground opening in what was found
- **Deck actualization**: `read_decks` → read members → produce reading (consult `references/deck-actualization.md`)
- **Capture**: `create_node(type: "capture")` — brief, don't interrogate
- **Concept creation**: brief dialogue to surface impulse → `create_node(type: "concept")`
- **Research inquiry**: brief dialogue to surface question → `create_node(type: "inquiry")`
- **Bug / finding filing**: `create_node(type: "finding")` + a `sparked-by` edge to the app or iteration node
- **Ecology lens application**: consult `references/ecology-lenses.md`
- **Annotation**: `write_annotation` — always available, not a mode
- **Read-aloud requests**: "read this to me", "read this aloud", "narrate this" → present the viewer deeplink for the node holding the content; the viewer has built-in TTS ("Read aloud" + "Audio summary") on every content file and annotation, with pause/resume in the navbar

No workflow file needed. The agent reads the graph and responds. Dialogue happens in the main conversation (inject mode).

---

## Build / dev work — not routed here

When the user wants to build a feature, plan or continue an iteration, or scaffold an app, **do not spawn a qino build agent — there isn't one.** That work is governed by always-in-context repo guidance, which is more current than anything this skill could restate:

- **Worktree + PR discipline** → `qinolabs-repo/.claude/rules/git-workflow.md` + workspace-root `CLAUDE.md` § Session Posture (provision with `/worktree new`, land via PR; graph/doc edits go direct-to-main).
- **Planning & filing an iteration** (the `## The story` shape, spine-vs-pointer filing, proposal annotations, `touch_node` stamping) → workspace-root `CLAUDE.md` §§ Planning Through Iterations · Where an Iteration Files · Proposal Annotations · Stamping `updated`. The iteration shape itself: `references/build/templates/iteration-template.md` (+ `references/build/disciplines.md` for refactor arcs; the `research-and-design` skill auto-surfaces for judgment-laden iters).
- **New app** → code side: `qinolabs-repo/.claude/rules/deployment.md` § New App Setup + `templates/*` + `docs/ports.md`; graph side: create the node via the os agent (`create_node`).
- **Testing / deploy / dependencies / native** → the matching `.claude/rules/*` files.

The os agent still owns the **graph side** of dev work — reading the app's node, writing findings and proposal annotations, adding edges. Reach for it (path 3 above) for those; leave the code to the repo's workflow.

---

## Subagent Types

| Agent | subagent_type | Mode |
|-------|---------------|------|
| OS Agent | `qino:os` | inject (main conversation) |
| Brief Agent | `qino:brief` | spawn (isolated subagent) |

Agent definitions: `agents/os.md`, `agents/protocol-structure.md`, `agents/brief.md`

---

## Error States

**Unknown / ambiguous intent:**
> Os agent calls `read_activity` — arrival handles orientation naturally. Don't ask a generic "what would you like to do?"; let the activity payload ground the opening.

**Build intent lands here anyway** (user says "build X" inside a qino-skill session):
> Don't spawn an agent for it. Point at the repo dev workflow (see "Build / dev work" above) and, if graph work is part of it, handle that through the os agent.
