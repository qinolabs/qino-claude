# Orientation Workflow

**Execution:** inject
**Voice:** Welcoming arrival. Openings invite, they don't push. Map without pressure.
**Agent:** None (direct response)

**Reference:** Read `references/qino-concept/design-philosophy.md` — Part I for tone, Section 11 for arrival feeling.

---

## Task

Orientation shows the qino ecology — what's here, where you are, what's possible. Useful anytime: first arrival, returning after time away, wondering what else exists, wanting to see the whole.

---

## Context

This workflow is invoked when:
- User asks "orient me", "what can qino do", "show me qino skills"
- User invokes `/qino` with no workspace and no clear intent
- User wants to understand the ecology from within any workspace
- First encounter with qino

Orientation is context-aware. It shows where you are AND what else exists.

---

## Output by Context

### No Workspace Context

```
                              welcome to qino

              tools for staying connected to what matters


  what brings you here today?


  I have an idea taking shape
     → concepts — gentle space for developing ideas
        capture impulses, surfaces, threads that connect

  I'm beginning a research inquiry
     → research — structured space for questions
        explorations, calibrations, experiments

  I'm ready to build something
     → implementation — linked to your concepts
        discoveries flow both directions

  I'm developing a tool
     → tool — minimal context, adapter patterns


─────

  these form an ecology —
  ideas flow between them.

  start anywhere.


                                         describe what you're thinking about
                                         or "setup [type] workspace" to begin
```

### From Concepts Workspace

```
                              qino ecology

              you are here: concepts


  where you are

     concepts — gentle space for developing ideas
        capture, explore, test, attune
        threads emerge between concepts


  what else exists

     research — structured inquiry space
        explorations, calibrations, experiments
        → "setup research workspace" or link existing

     implementation — build from concepts
        linked concepts, bidirectional flow
        → "setup implementation workspace" or link existing


─────

  from here

     "home" — see your concepts
     "explore [concept]" — work with an idea
     "capture: [thought]" — hold something
     "test [concept]" — notice through ecology


                                         or describe what you're thinking about
```

### From Research Workspace

```
                              qino ecology

              you are here: research


  where you are

     research — structured space for questions
        explorations, calibrations, experiments
        ideas graduate when ready


  what else exists

     concepts — gentle ideation space
        [shows linked concepts-repo if configured]
        → "explore [concept]" to visit

     implementation — build from research
        → "setup implementation workspace"


─────

  from here

     "home" — see explorations, calibrations
     "start research on [topic]" — begin inquiry
     "attune [quality]" — calibrate
     "run experiment" — test


                                         or describe what you're thinking about
```

### From Implementation Workspace

```
                              qino ecology

              you are here: implementation


  where you are

     implementation — building [linked-concept-name]
        discoveries flow back to concepts
        iteration context available


  what else exists

     concepts — your source concepts
        [shows conceptsRepo path]
        → "explore [concept]" to visit

     research — structured inquiry
        [shows researchRepo if configured]
        → "explore research" to visit


─────

  from here

     "home" — see linked concept
     "work on [app]" — implementation focus
     "capture: [thought]" — hold discovery
     "arc" — capture what emerged


                                         or describe what you're thinking about
```

### From Tool Workspace

```
                              qino ecology

              you are here: tool


  where you are

     tool — minimal context
        adapter patterns, connected repos


  what else exists

     concepts — gentle ideation space
     research — structured inquiry
     implementation — building space


─────

  from here

     "home" — see adapters, connections


                                         or describe what you're thinking about
```

---

## After Orientation

When user indicates intent after seeing orientation:

| Context | Intent | Route to |
|---------|--------|----------|
| No workspace | Setup concepts | `workflows/concept-setup.md` |
| No workspace | Setup research | `workflows/research-setup.md` |
| No workspace | Setup implementation | `workflows/dev-setup.md` |
| Any | Work with a concept | `workflows/explore.md` |
| Any | Go home | `workflows/home.md` |
| Any | Just exploring | Stay conversational |

---

## Voice Guidelines

### Do:
- Show where they are (if anywhere)
- Present the whole ecology gently
- Let descriptions breathe — short lines, whitespace
- Honor that they might just be looking around
- Use plain language

### Do NOT:
- Overwhelm with feature lists
- Make them feel lost
- Force a decision
- Hide what's possible
- Use hollow encouragements

---

## Natural Language Responses

Users might ask questions during orientation:

**"what is qino?"**
```
qino is an ecology for developing ideas.

concepts — where ideas take shape
research — where questions find depth
implementation — where ideas become things

the pieces talk to each other.
discoveries flow between them.
```

**"how do these connect?"**
```
an idea might start as a concept —
just an impulse, a surface, a thread.

if it needs structured inquiry,
it can move to research —
explorations, experiments, calibrations.

when ready to build,
implementation links back to concepts.
discoveries flow both directions.

but you can start anywhere.
the ecology adapts.
```

**"what can I do from here?"**
→ Show the "from here" section for their current context

---

## First Principles

This orientation embodies:

1. **Context-aware** — shows where you are AND what else exists
2. **Map not menu** — reveals the ecology, doesn't demand choices
3. **Relational** — shows how spaces connect
4. **No urgency** — "start anywhere" not "get started now"
5. **Plain language** — what each space *does* for you, not what it *is*
6. **Always available** — useful whether first arrival or deep in work
