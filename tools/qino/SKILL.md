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

Match user intent to workflow. Read the workflow file and follow its instructions, passing detected context.

| User Intent | Workflow |
|-------------|----------|
| Orient, "what can qino do", "show me qino", ecology overview | [workflows/orientation.md](workflows/orientation.md) |
| No workspace context (and no clear intent) | [workflows/orientation.md](workflows/orientation.md) |
| Arrive, "where am I", "what's here", home | [workflows/home.md](workflows/home.md) |
| Capture thought, "hold this", "note: ..." | [workflows/capture.md](workflows/capture.md) |
| Explore concept(s), "work with [concept]" | [workflows/explore.md](workflows/explore.md) |
| Test, "notice through ecology" | [workflows/test.md](workflows/test.md) |
| Attune, "calibrate [quality]" | [workflows/attune.md](workflows/attune.md) |
| Compare artifacts | [workflows/compare.md](workflows/compare.md) |
| Capture emergence, "what emerged" | [workflows/arc.md](workflows/arc.md) |
| Setup concepts workspace | [workflows/concept-setup.md](workflows/concept-setup.md) |
| Create new concept | [workflows/concept-init.md](workflows/concept-init.md) |
| Import material into concepts | [workflows/import.md](workflows/import.md) |
| Setup research workspace | [workflows/research-setup.md](workflows/research-setup.md) |
| Start research inquiry | [workflows/research-init.md](workflows/research-init.md) |
| Setup implementation workspace | [workflows/dev-setup.md](workflows/dev-setup.md) |
| Start implementation | [workflows/dev-init.md](workflows/dev-init.md) |

---

## Implementation Context

When `repoType` is `"implementation"`, additional routing applies:

| User Intent | Route |
|-------------|-------|
| "work on [app]" | dev-agent with app context |
| "work on [app] and [app]" | dev-agent with multi-app context |
| Concept exploration | concept-agent WITH implementation discovery |

**Key behavior:** In implementation repos, `concept-agent` gains bidirectional visibility with iterations. When exploring a linked concept, it:
- Surfaces current iteration status ("iteration 05 — figures-center-stage")
- Offers translation prompts after concept changes
- Shows iteration context when capturing discoveries from building

This enables nonlinear work — discoveries flow in both directions between concept-space and implementation-space.

**Multi-app scoping:** Users can work across multiple apps conversationally:
- "work on world and journey" → dev-agent sees both apps
- "the encounter panel in world needs to talk to journey's substrate" → dev-agent holds both contexts

No explicit commands needed. The skill routes conversationally based on intent.

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

Workflows may reference shared agents:

- `agents/qino-concept-agent.md` — Concept exploration companion
- `agents/qino-research-agent.md` — Research facilitation
- `agents/qino-dev-agent.md` — Implementation guidance

---

## Error States

**Cross-repo resolution failure:**
> "Can't find concepts-repo at [path]."
> Check your .claude/qino-config.json

**Unknown intent:**
> Route to `workflows/home.md` — arrival handles orientation naturally.
