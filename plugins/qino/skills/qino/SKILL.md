---
name: qino
description: |
  Ecology for developing ideas through concept exploration, research, and implementation.

  ACTIVATE for dev work:
  - "what's next for [app]", "continue [app]", "work on [app]"
  - "build [feature]", "implement [feature]", "plan the iteration"
  - "read the implementation notes", "what's the iteration status"
  - "what should I build next", "next steps for [project]"

  ACTIVATE for concept work:
  - "explore [concept]", "go deeper into [idea]", "where am I", "what's here"
  - "capture this thought", "hold this", "note this"
  - "test through ecology", "compare these", "attune [quality]"

  ACTIVATE for research:
  - "start research on [topic]", "investigate [question]", "begin inquiry"

  ACTIVATE when in qino workspace (has .claude/qino-config.json).

  NOT implicit: arc capture requires explicit invocation ("/qino arc" or "capture an arc").
---

# qino Skill

Ecology for developing ideas. Natural language activation — users describe intent, Claude routes to the appropriate workflow.

---

## Execution Mode

Workflows execute in one of two modes based on their nature:

### Inject Mode (Dialogue Workflows)

**For:** home, explore, capture, test, attune, compare, arc, orientation

These workflows involve multi-turn dialogue with the user. They execute **in the main conversation** — no Task tool, no subagent.

**When a dialogue workflow is triggered:**

1. Read the workflow file (e.g., `workflows/explore.md`)
2. Read the agent file, extract content between `<!-- INJECT-START -->` and `<!-- INJECT-END -->` markers
3. Follow the persona principles and workflow instructions directly
4. Continue the conversation as that persona — first visible output is dialogue, not process

**The persona is invisible.** Do not announce "PERSONA ACTIVE" or show any process. Just follow the principles and workflow naturally.

**Example (inject mode):**
```
User: "explore qinolabs-homepage"

Claude: [Reads workflows/explore.md and agents/concept.md]
        [Follows concept persona principles]
        [Responds directly as the concept agent would]

"What part of qinolabs-homepage still feels alive when you think about it?"
```

### Spawn Mode (Synthesis Workflows)

**For:** import, dev-work, dev-init, dev-setup, workspace-init, research-init, research-setup, concept-init, concept-setup

These workflows involve heavy file reading, code changes, or scaffolding. They execute **in an isolated subagent** via the Task tool.

**When a synthesis workflow is triggered:**

1. **Spawn the agent** using Task tool with appropriate `subagent_type`:
   - `qino:concept` — for import, concept-init, concept-setup
   - `qino:dev` — for dev-init, dev-setup, workspace-init, dev-work
   - `qino:research` — for research-init, research-setup

2. **Pass context** in the Task prompt:
   - The detected workspace context
   - The user's intent/request
   - The workflow to execute
   - Momentum context if present

3. **Let the agent work** — agent returns results; main conversation stays clean

**Example (spawn mode):**
```
User: "bring in /path/to/notes.md"

Claude: [Uses Task tool]
  subagent_type: "qino:concept"
  prompt: "Read and follow the workflow at plugins/qino/skills/qino/workflows/import.md

           Context:
           - Workspace: concepts at /path/to/concepts-repo
           - Source file: /path/to/notes.md

           User wants to import this material into concepts."
```

### Why Two Modes?

**Inject mode** preserves full conversation context — essential for dialogue where user's words and energy matter.

**Spawn mode** provides context isolation — prevents heavy file reading and synthesis from filling the main context window.

---

## Context Detection (First Step)

Before routing, detect workspace context:

1. **Check for `.claude/qino-config.json`** in current directory
2. **Read `repoType` field** to determine context and apply structure conventions (see `references/dev/repo-conventions.md` for patterns)

| repoType | Context | Behavior |
|----------|---------|----------|
| `"concepts"` or absent | Concepts workspace | Full concept exploration |
| `"research"` | Research workspace | Research-oriented routing |
| `"implementation"` | Implementation project | Dev context, linked concepts |
| `"tool"` | Tool development | Minimal context |

3. **Extract relevant paths:**
   - `conceptsRepo` — path to concepts repository (for implementation projects)
   - `researchRepo` — path to research repository
   - `linkedConcept` — primary linked concept ID
   - `linkedConcepts` — map of concept IDs to paths

4. **Detect ecosystem concepts:**
   When the target concept lives in `ecosystem/` (check manifest.json `path` field), recognize this as **ecosystem work** — distinct from app concept work.

   Pass this awareness to the agent:
   > "This is ecosystem work — distinctions forming, not just ideas developing. Hold questions longer."

5. **If no qino-config.json exists:**
   - Route to orientation workflow (first-time arrival)
   - See [workflows/orientation.md](workflows/orientation.md)

---

## Momentum Detection (Second Step)

Before executing a workflow (inject or spawn), assess whether the conversation already carries momentum.

**Momentum exists when the user has:**
- Shared specific ideas, direction, or vision in recent messages
- Articulated what feels alive or important to them
- Described concrete details (not just "I want to work on X")
- Built up context through back-and-forth dialogue

**When momentum exists:**

1. **Summarize what's already surfaced:**
   - The specific direction or vision they expressed
   - Key details or qualities they mentioned
   - What seems to have energy for them

2. **Pass this to the agent** as "already surfaced" context (see example below)

3. **Tell the agent** to skip exploratory questioning and go directly to working with what's been expressed

**Example with momentum (inject mode — explore workflow):**
```
User has been discussing their vision for a tools page - an interactive terminal
playground with guided steps, split layout, demonstrating fluidity between
concept/research/implementation work.

Claude: [Reads workflows/explore.md and agents/concept.md persona]
        [Recognizes momentum — user has already surfaced what's alive]
        [Skips the alive-thread question, goes directly to working]

"The terminal playground idea — guidance alongside experience, process becoming
artifact. Let me see how this lands in the concept."

[Reads concept, proposes integration]
```

**Example with momentum (spawn mode — import workflow):**
```
User has been discussing specific notes they want to bring in, with context
about which concept they connect to.

Claude: [Uses Task tool]
  subagent_type: "qino:concept"
  prompt: "Read and follow the workflow at plugins/qino/skills/qino/workflows/import.md

           MOMENTUM: User has already indicated:
           - Source file: /path/to/notes.md
           - Target concept: qinolabs-homepage
           - Connection: these notes relate to the tools page vision

           Skip exploratory questions. Go directly to reading and proposing integration."
```

**Example with decision context (inject mode — test workflow):**
```
User is deciding between embedding approaches for the qino-journey concept.
The conversation contains specific options being evaluated.

Claude: [Reads workflows/test.md and agents/concept.md persona]
        [Recognizes decision context — user has specific options to evaluate]

"You're weighing six approaches to embedding. Let me find a principle in
qino-journey that can test these..."

[Reads concept, finds relevant ecology principle, applies it to each option]
```

**When NO momentum exists:**

Let the workflow's natural dialogue unfold:

```
User: "explore qinolabs-homepage"

Claude: [Reads workflows/explore.md and agents/concept.md persona]
        [No momentum — follows workflow naturally]

"What part of qinolabs-homepage still feels alive when you think about it?"
```

The alive-thread question is valuable when arriving cold. Skip it when the user has already warmed up.

---

## Routing

Match user intent to workflow. **Spawn the specified agent** to execute the workflow.

### Quick Route (Agent Selection)

**CRITICAL:** Select agent FIRST based on user language, THEN find the workflow.

| User says... | Agent |
|--------------|-------|
| "what's next", "continue", "work on [app]", "build", "implement", "plan iteration" | `qino:dev` |
| "what's next for [app]", "what should I build", "next steps for [project]" | `qino:dev` |
| "explore", "go deeper", "capture", "hold this", "where am I", "test", "compare" | `qino:concept` |
| "research", "investigate", "inquiry", "study" | `qino:research` |

**Implementation signals (→ `qino:dev`):**
- Any app name mentioned with action intent: "qino-world", "qino-journey", "qino-frame"
- Building/coding language: "add feature", "fix bug", "implement", "create component"
- Progress language: "what's next", "continue", "move forward", "next iteration"
- Planning language: "plan", "scope", "break down", "what needs to be done"

**Concept signals (→ `qino:concept`):**
- Exploration language: "explore", "deepen", "what is", "understand"
- Arrival language: "where am I", "what's here", "show me"
- Capture language: "hold this", "note", "capture"
- Testing language: "test through ecology", "notice", "inform the decision"

**Research signals (→ `qino:research`):**
- Investigation language: "research", "investigate", "study", "inquiry"
- Question framing: "how does X work", "what are the approaches to"

---

### Concept Work → `qino:concept`

| User Intent | Workflow |
|-------------|----------|
| Arrive, "where am I", "what's here", home | [workflows/home.md](workflows/home.md) |
| Capture thought, "hold this", "note: ..." | [workflows/capture.md](workflows/capture.md) |
| Explore, "go deeper", "work with [concept]", ideate, brainstorm | [workflows/explore.md](workflows/explore.md) |
| Test, "notice through ecology" | [workflows/test.md](workflows/test.md) |
| Test with decision, "help inform the decision" | [workflows/test.md](workflows/test.md) (decision context mode) |
| Attune, "calibrate [quality]" | [workflows/attune.md](workflows/attune.md) |
| Compare artifacts | [workflows/compare.md](workflows/compare.md) |
| Setup concepts workspace | [workflows/concept-setup.md](workflows/concept-setup.md) |
| Create new concept | [workflows/concept-init.md](workflows/concept-init.md) |
| Import material into concepts | [workflows/import.md](workflows/import.md) |

### Arc Work → `qino:concept`

| User Intent | Workflow |
|-------------|----------|
| Open/begin arc, "start tracking", "something emerging" | [workflows/arc-open.md](workflows/arc-open.md) |
| Link to arc, "add to [arc]", "connect to [arc]" | [workflows/arc-link.md](workflows/arc-link.md) |
| Close arc, "capture this arc", "finish [arc]" | [workflows/arc-close.md](workflows/arc-close.md) |
| Capture emergence (retrospective), "what emerged" | [workflows/arc.md](workflows/arc.md) |

**Arc behavior notes:**
- Arc opening, linking, and closing are explicit commands
- Arc detection on arrival is automatic but non-intrusive (see agent inject sections)
- Retrospective capture (`arc.md`) works standalone or as the final phase of arc-close

### Research Work → `qino:research`

| User Intent | Workflow |
|-------------|----------|
| Setup research workspace | [workflows/research-setup.md](workflows/research-setup.md) |
| Start research inquiry | [workflows/research-init.md](workflows/research-init.md) |

### Implementation Work → `qino:dev`

| User Intent | Workflow |
|-------------|----------|
| Initialize multi-repo workspace | [workflows/workspace-init.md](workflows/workspace-init.md) |
| Setup implementation workspace | [workflows/dev-setup.md](workflows/dev-setup.md) |
| Start implementation, init app | [workflows/dev-init.md](workflows/dev-init.md) |
| "what's next for [app]", "continue [app]", "work on [app]" | [workflows/dev-work.md](workflows/dev-work.md) |
| "build [feature]", "implement [feature]", "add [component]" | [workflows/dev-work.md](workflows/dev-work.md) |
| "plan iteration", "what should I build next", "next steps" | [workflows/dev-work.md](workflows/dev-work.md) |
| "fix [bug]", "debug", "investigate issue in [app]" | [workflows/dev-work.md](workflows/dev-work.md) |

### Orientation (no agent needed — lightweight)

| User Intent | Workflow |
|-------------|----------|
| Orient, "what can qino do", "show me qino" | [workflows/orientation.md](workflows/orientation.md) |
| No workspace context (and no clear intent) | [workflows/orientation.md](workflows/orientation.md) |

---

## Implementation Context

When `context.type === "implementation"`, additional routing applies:

| User Intent | Agent | Workflow |
|-------------|-------|----------|
| "work on [app]", plan iterations, build | `qino:dev` | [workflows/dev-work.md](workflows/dev-work.md) |
| "work on [app] and [app]" (multi-app) | `qino:dev` | [workflows/dev-work.md](workflows/dev-work.md) |
| Concept exploration from implementation | `qino:concept` | [workflows/explore.md](workflows/explore.md) |

**Key behavior:** In implementation repos, the concept agent gains bidirectional visibility with iterations. When exploring a linked concept, it:
- Surfaces current iteration status ("iteration 05 — figures-center-stage")
- Offers translation prompts after concept changes
- Shows iteration context when capturing discoveries from building

**Multi-app scoping:** Users can work across multiple apps conversationally:
- "work on world and journey" → dev agent sees both apps
- "the encounter panel in world needs to talk to journey's substrate" → dev agent holds both contexts

**Check execution mode.** Dialogue workflows (explore, capture) inject into main conversation. Synthesis workflows (dev-work) spawn subagents.

---

## Context Object

Pass to workflows:

```typescript
interface Context {
  type: "concepts" | "research" | "implementation" | "tool";
  root: string;                              // Workspace root path
  conceptsRepo?: string;                     // Path to concepts repo
  researchRepo?: string;                     // Path to research repo
  linkedConcept?: string;                    // Primary linked concept ID
  linkedConcepts?: Record<string, string>;   // Map of concept IDs to paths
}
```

---

## Non-Linear Ecology

This is not a lifecycle. Users move fluidly between modalities:

- Capture during explore
- Explore from research
- Research informing implementation
- Implementation sparking new concepts
- Arcs emerging across any activity

The skill routes based on current intent. Each workflow knows how to handle cross-context flow.

---

## Agent and Execution Reference

Workflows specify both an agent persona and an execution mode.

### Execution Mode by Workflow

| Workflow | Agent | Execution | Reason |
|----------|-------|-----------|--------|
| home | concept | inject | Dialogue — arrival, showing state |
| explore | concept | inject | Dialogue — multi-turn conceptual work |
| capture | concept | inject | Dialogue — acknowledgment, follow-up |
| test | concept | inject | Dialogue — ecology observation |
| attune | concept | inject | Dialogue — iterative calibration |
| compare | concept | inject | Dialogue — artifact comparison |
| arc | concept | inject | Dialogue — retrospective capture |
| arc-open | concept | inject | Dialogue — opening active arc |
| arc-link | concept | inject | Dialogue — linking session to arc |
| arc-close | concept | inject | Dialogue — closing arc, triggers capture |
| orientation | — | inject | Dialogue — direct response |
| import | concept | spawn | Synthesis — heavy file reading |
| concept-init | concept | spawn | Synthesis — workspace scaffolding |
| concept-setup | concept | spawn | Synthesis — workspace scaffolding |
| dev-work | dev | spawn | Synthesis — code changes |
| dev-init | dev | spawn | Synthesis — project scaffolding |
| dev-setup | dev | spawn | Synthesis — project scaffolding |
| workspace-init | dev | spawn | Synthesis — multi-repo workspace scaffolding |
| research-init | research | spawn | Synthesis — workspace scaffolding |
| research-setup | research | spawn | Synthesis — workspace scaffolding |

### Subagent Types (for spawn mode only)

| Agent | subagent_type | Used by |
|-------|---------------|---------|
| Concept Agent | `qino:concept` | import, concept-init, concept-setup |
| Dev Agent | `qino:dev` | dev-init, dev-setup, workspace-init, dev-work |
| Research Agent | `qino:research` | research-init, research-setup |

Agent definitions live in `agents/` directory. Each agent file has:
- `<!-- INJECT-START -->` ... `<!-- INJECT-END -->` — persona/principles for inject mode
- Task-specific instructions — for spawn mode

---

## Error States

**Cross-repo resolution failure:**
> "Can't find concepts-repo at [path]."
> Check your .claude/qino-config.json

**Unknown intent:**
> Route to `workflows/home.md` — arrival handles orientation naturally.
