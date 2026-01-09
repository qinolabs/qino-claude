---
name: qino
description: |
  Develops ideas from concept to implementation. Routes to specialized agents.

  Use when the user says:
  - "what's next for [project]", "continue [app]", "work on [app]", "build [feature]",
    "implement [feature]", "plan the iteration", "what should I build next" → dev agent
  - "explore [concept]", "go deeper into [idea]", "capture this thought", "hold this",
    "where am I", "what's here", "test through ecology", "compare these" → concept agent
  - "start research on [topic]", "investigate [question]", "begin inquiry" → research agent

  Also activates for: arriving at a workspace, orienting, seeing what qino offers.
  Natural language — describe intent, not commands.
---

# qino Skill

Ecology for developing ideas. Natural language activation — users describe intent, Claude routes to the appropriate workflow.

---

## CRITICAL: Agent Execution Required

**Workflows are NEVER executed directly in the main conversation.**

Every workflow specifies an agent at the top (e.g., "Agent: concept"). When a workflow is triggered:

1. **Spawn the agent** using the Task tool with the appropriate `subagent_type`:
   - `qino:concept` — for concept work (capture, explore, home, attune, compare, arc)
   - `qino:dev` — for implementation work (dev-init, dev-setup, work on app)
   - `qino:research` — for research work (research-init, research-setup)

2. **Pass context** in the Task prompt:
   - The detected workspace context
   - The user's intent/request
   - The workflow to execute

3. **Let the agent work** — the agent reads the workflow and executes it with full dialogue capability

**Example activation:**
```
User: "explore qinolabs-homepage"

Claude: [Uses Task tool]
  subagent_type: "qino:concept"
  prompt: "Read and follow the workflow at plugins/qino/skills/qino/workflows/explore.md

           Context:
           - Workspace: concepts at /path/to/concepts-repo
           - Concept: qinolabs-homepage

           User wants to explore and deepen this concept.

           IMPORTANT: Follow the workflow step by step. WAIT for user responses
           where indicated. Do not skip dialogue phases."
```

**Critical instruction for agents:**
The prompt MUST tell the agent to:
1. Read the specific workflow file
2. Follow it step by step
3. WAIT for user responses where the workflow indicates
4. Not skip dialogue phases

**Why this matters:**
- Agents maintain coherent dialogue within their task
- Workflows involve multiple turns of conversation
- The main conversation shouldn't be cluttered with workflow execution
- Agents can be resumed if needed

---

## Context Detection (First Step)

Before routing, detect workspace context:

1. **Check for `.claude/qino-config.json`** in current directory
2. Read `repoType` field to determine context:

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

4. **If no qino-config.json exists:**
   - Route to orientation workflow (first-time arrival)
   - See [workflows/orientation.md](workflows/orientation.md)

---

## Momentum Detection (Second Step)

Before spawning an agent, assess whether the conversation already carries momentum.

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

**Example with momentum:**
```
User has been discussing their vision for a tools page - an interactive terminal
playground with guided steps, split layout, demonstrating fluidity between
concept/research/implementation work.

Claude: [Uses Task tool]
  subagent_type: "qino:concept"
  prompt: "Read and follow the workflow at plugins/qino/skills/qino/workflows/explore.md

           Context:
           - Workspace: concepts at /path/to/concepts-repo
           - Concept: qinolabs-homepage

           MOMENTUM: User has already surfaced what's alive:
           - Interactive terminal playground for /tools page
           - Split layout: terminal on one side, guided steps on the other
           - Demonstrates fluidity between concept/research/implementation
           - Shows how the system lifts the burden of managing notes
           - Terminal aesthetics that feel pleasant, great UX
           - Process itself becomes publishable artifact

           Skip the alive-thread question. The user has already shown what has
           energy. Go directly to proposing how this integrates with the concept.

           IMPORTANT: Follow the workflow, but adapt to the momentum. WAIT for
           user responses where indicated."
```

**Example with decision context (test workflow):**
```
User is deciding between embedding approaches for the qino-journey concept.
The conversation contains specific options being evaluated.

Claude: [Uses Task tool]
  subagent_type: "qino:concept"
  prompt: "Read and follow the workflow at plugins/qino/skills/qino/workflows/test.md

           Context:
           - Workspace: concepts at /path/to/concepts-repo
           - Concept: qino-journey

           DECISION CONTEXT: User is choosing between embedding approaches:
           - Most recent: only the latest encounter embedding
           - Composite (averaged): mean of all encounter embeddings
           - User-selected: explicit version selection
           - LLM-synthesized essence: interpreted figure summary
           - Relational embedding: the relationship, not the figure
           - Trajectory embedding: direction of relationship

           This is decision context mode. After discerning the ecology:
           1. Ground the test in the concept (find relevant principle)
           2. Apply the test concretely to each option
           3. Surface what the test reveals about each approach

           IMPORTANT: Follow the workflow step by step. WAIT for user responses
           where indicated."
```

**When NO momentum exists:**

Pass standard context and let the workflow's natural dialogue unfold:

```
User: "explore qinolabs-homepage"

Claude: [Uses Task tool]
  prompt: "...
           User wants to explore and deepen this concept.
           ..."
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
| Capture emergence, "what emerged" | [workflows/arc.md](workflows/arc.md) |
| Setup concepts workspace | [workflows/concept-setup.md](workflows/concept-setup.md) |
| Create new concept | [workflows/concept-init.md](workflows/concept-init.md) |
| Import material into concepts | [workflows/import.md](workflows/import.md) |

### Research Work → `qino:research`

| User Intent | Workflow |
|-------------|----------|
| Setup research workspace | [workflows/research-setup.md](workflows/research-setup.md) |
| Start research inquiry | [workflows/research-init.md](workflows/research-init.md) |

### Implementation Work → `qino:dev`

| User Intent | Workflow |
|-------------|----------|
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

**Always spawn the appropriate agent.** The routing is conversational, but execution requires the Task tool.

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

## Agent Reference

**All workflows are executed by agents.** Use the Task tool with these `subagent_type` values:

| Agent | subagent_type | Handles |
|-------|---------------|---------|
| Concept Agent | `qino:concept` | capture, explore, home, attune, compare, arc, concept-init, concept-setup, import |
| Research Agent | `qino:research` | research-init, research-setup |
| Dev Agent | `qino:dev` | dev-init, dev-setup, dev-work |

Agent definitions live in `agents/` directory. Each workflow specifies its agent at the top.

---

## Error States

**Cross-repo resolution failure:**
> "Can't find concepts-repo at [path]."
> Check your .claude/qino-config.json

**Unknown intent:**
> Route to `workflows/home.md` — arrival handles orientation naturally.
