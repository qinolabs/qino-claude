---
name: qino
description: |
  Ecology for developing ideas — concepts, research, implementation.
  Captures thoughts, explores concepts, orients in workspaces.
  Use when: capturing thoughts, holding observations, exploring concepts, working with ideas,
  arriving at workspace, orienting, seeing the ecology, understanding what qino offers,
  starting research, beginning inquiry, beginning implementation,
  testing through ecology, comparing artifacts, attuning to qualities, capturing emergence arcs.
  Context-aware across concepts, research, and implementation workspaces.
  Natural language companion — describe your intent, not commands.
---

# qino Skill

Ecology for developing ideas. Natural language activation — users describe intent, Claude routes to the appropriate workflow.

---

## CRITICAL: Agent Execution Required

**Workflows are NEVER executed directly in the main conversation.**

Every workflow specifies an agent at the top (e.g., "Agent: qino-concept-agent"). When a workflow is triggered:

1. **Spawn the agent** using the Task tool with the appropriate `subagent_type`:
   - `qino:concept-agent` — for concept work (capture, explore, home, attune, compare, arc)
   - `qino:dev-agent` — for implementation work (dev-init, dev-setup, work on app)
   - `qino:research-agent` — for research work (research-init, research-setup)

2. **Pass context** in the Task prompt:
   - The detected workspace context
   - The user's intent/request
   - The workflow to execute

3. **Let the agent work** — the agent reads the workflow and executes it with full dialogue capability

**Example activation:**
```
User: "explore qinolabs-homepage"

Claude: [Uses Task tool]
  subagent_type: "qino:concept-agent"
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

## Routing

Match user intent to workflow. **Spawn the specified agent** to execute the workflow.

### Concept Work → `qino:concept-agent`

| User Intent | Workflow |
|-------------|----------|
| Arrive, "where am I", "what's here", home | [workflows/home.md](workflows/home.md) |
| Capture thought, "hold this", "note: ..." | [workflows/capture.md](workflows/capture.md) |
| Explore, "go deeper", "work with [concept]", ideate, brainstorm | [workflows/explore.md](workflows/explore.md) |
| Test, "notice through ecology" | [workflows/test.md](workflows/test.md) |
| Attune, "calibrate [quality]" | [workflows/attune.md](workflows/attune.md) |
| Compare artifacts | [workflows/compare.md](workflows/compare.md) |
| Capture emergence, "what emerged" | [workflows/arc.md](workflows/arc.md) |
| Setup concepts workspace | [workflows/concept-setup.md](workflows/concept-setup.md) |
| Create new concept | [workflows/concept-init.md](workflows/concept-init.md) |
| Import material into concepts | [workflows/import.md](workflows/import.md) |

### Research Work → `qino:research-agent`

| User Intent | Workflow |
|-------------|----------|
| Setup research workspace | [workflows/research-setup.md](workflows/research-setup.md) |
| Start research inquiry | [workflows/research-init.md](workflows/research-init.md) |

### Implementation Work → `qino:dev-agent`

| User Intent | Workflow |
|-------------|----------|
| Setup implementation workspace | [workflows/dev-setup.md](workflows/dev-setup.md) |
| Start implementation, init app | [workflows/dev-init.md](workflows/dev-init.md) |
| "work on [app]", plan iterations, build | [workflows/dev-work.md](workflows/dev-work.md) |

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
| "work on [app]", plan iterations, build | `qino:dev-agent` | [workflows/dev-work.md](workflows/dev-work.md) |
| "work on [app] and [app]" (multi-app) | `qino:dev-agent` | [workflows/dev-work.md](workflows/dev-work.md) |
| Concept exploration from implementation | `qino:concept-agent` | [workflows/explore.md](workflows/explore.md) |

**Key behavior:** In implementation repos, the concept-agent gains bidirectional visibility with iterations. When exploring a linked concept, it:
- Surfaces current iteration status ("iteration 05 — figures-center-stage")
- Offers translation prompts after concept changes
- Shows iteration context when capturing discoveries from building

**Multi-app scoping:** Users can work across multiple apps conversationally:
- "work on world and journey" → dev-agent sees both apps
- "the encounter panel in world needs to talk to journey's substrate" → dev-agent holds both contexts

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
| Concept Agent | `qino:concept-agent` | capture, explore, home, attune, compare, arc, concept-init, concept-setup, import |
| Research Agent | `qino:research-agent` | research-init, research-setup |
| Dev Agent | `qino:dev-agent` | dev-init, dev-setup, dev-work |

Agent definitions live in `agents/` directory. Each workflow specifies its agent at the top.

---

## Error States

**Cross-repo resolution failure:**
> "Can't find concepts-repo at [path]."
> Check your .claude/qino-config.json

**Unknown intent:**
> Route to `workflows/home.md` — arrival handles orientation naturally.
