# Implementation Repository

A workspace for building from concepts—where ideas meet code in discrete, testable phases.

## What This Is

This is an **implementation workspace** where concepts become working software. Unlike concepts (which refine through exploration) or research (which may never conclude), implementations ship iteratively with clear goals.

Think of it as the space where vision grounds in technical reality—where "what has pull" becomes "what works."

## Structure

```
implementations-repo/
├── implementations/
│   ├── docs/              # Cross-app architecture
│   ├── manifest.json      # Registry of apps
│   └── {app}/
│       ├── implementation.md    # Technical context
│       ├── iterations/          # Phase-by-phase work
│       └── research/           # (optional) App-specific research
└── .claude/
    ├── qino-config.json        # Marks this as implementation workspace
    └── references/
        └── dev/
            ├── repo-conventions.md
            ├── template-guidance.md
            ├── home-pattern.md
            ├── drift-signals.md
            └── templates/
                ├── implementation-template.md
                ├── iteration-template.md
                └── app-command-template.md
```

**Two-tier hierarchy:**
- **Ecosystem level** (`docs/`) — Cross-app patterns and architecture
- **Scoped level** (`{app}/`) — Per-app context and iterations

## Getting Started

### Installation

1. **Fork this template** on GitHub
2. **Clone locally:**
   ```bash
   git clone <your-fork-url> implementations-repo
   cd implementations-repo
   ```

3. **Install qino skill:**
   ```bash
   /plugin marketplace add qinolabs/qino-claude
   /plugin install qino@qinolabs/qino-claude
   ```

4. **Start building:**
   ```bash
   /qino implement [concept-path]
   ```

### First Steps

**Link to a concept:**
```bash
# If you have a concepts repo
/qino implement ../concepts-repo/concepts/my-idea
```

The dev agent will:
- Initialize implementation structure
- Link to concept in qino-config
- Create `implementation.md` with technical context
- Set up first iteration

**Or start standalone:**
```bash
/qino dev init my-app
```

Build without concept linkage (can link later).

## Working with Implementations

### The Implementation Structure

Each app has:

**implementation.md** — Technical context that doesn't change often:
- Problem and solution
- Stack and architecture
- Boundaries (in scope / out of scope)
- Success criteria

**iterations/** — Phase-by-phase work:
- `01-foundation.md` — First phase
- `02-feature-name.md` — Next phase
- Each has: Scope, Goals (checkboxes), Test Criteria, Technical Decisions, Learnings

**Why separate?** Implementation context is stable; iterations are ephemeral. Don't mix long-lived and short-lived docs.

### Building in Phases

Iterations aren't sprints. They're checkpoints for turn-taking:

1. **AI implements** to the iteration spec
2. **User tests** and reviews
3. **Feedback flows** before next phase
4. **Capture learnings** in iteration file

Each iteration documents:
- What was built (scope)
- Why choices were made (Technical Decisions)
- What was learned (Learnings section)

**Format:** Narrative, not bullet points. Future you needs to understand *reasoning*, not just *what* was done.

### Linking to Concepts

In `.claude/qino-config.json`:

```json
{
  "repoType": "implementation",
  "conceptsRepo": "../concepts-repo",
  "linkedConcept": "concepts/my-idea"
}
```

**Benefits of linking:**
- Dev agent reads concept for context
- Drift detection (concept ↔ code)
- Can update concept when building reveals truths

### Drift Detection

Building reveals truths concept exploration couldn't predict:

**Implementation → Concept** (discovering while building):
```
(you)   Actually "Match" should be "Session"—it's not competitive.

(dev)   That's a domain model shift. The concept still uses "Match."

        • update concept — invoke concept agent
        • note for later — capture as observation
        • continue — stay in implementation
```

**Concept → Implementation** (concept evolved):
```
my-app

concept — updated since last check
board-games (modified 2 days ago)

what changed
+ Timer feature (new in scoped features)
~ "Match" → "Session" (entity renamed)

Want to:
  • review — see details
  • reconcile — update iteration plan
  • acknowledge — sync timestamp, continue
```

## Manifest Structure

### implementations/manifest.json

Registry of all apps in this workspace:

```json
{
  "version": 1,
  "apps": [
    {
      "id": "my-app",
      "name": "My App",
      "path": "my-app",
      "description": "What this app does",
      "status": "active"
    }
  ]
}
```

**Status values:**
- `active` — Under development
- `shipped` — In production
- `dormant` — Paused
- `archived` — No longer maintained

## The qino Skill

The [qino skill](https://github.com/qinolabs/qino-claude) recognizes this as an implementation workspace via `.claude/qino-config.json`.

**Key commands:**

- `/qino implement [concept-path]` — Initialize from concept
- `/qino dev init [app-name]` — Start standalone
- `/qino home` — Arrival pattern (show context, uncommitted work, next steps)
- `/qino where` — Orient within workspace

**Generated commands:**
Each app gets a command (e.g., `/my-app`) following the home pattern:
```
my-app

concept — linked to board-games
stack — React, Supabase, shadcn/ui
iteration — 01: foundation — in progress

─────

from here

  two of three goals done
  what's blocking the last one?

                    just respond, or explore board-games
```

## Ecosystem Architecture

As your implementation grows beyond a single app, document cross-app patterns in `implementations/docs/`:

**Example docs:**
- `seeding-architecture.md` — How World/Arc/Journey seeding works
- `rpc-service-bindings.md` — Worker-to-worker communication
- `integration-patterns.md` — How modalities integrate

These become reference material for the dev agent when building new apps.

## Tolerance for Uncertainty

Implementations have **low tolerance** for flux—they must ship:

| Aspect | Research | Concepts | Implementations |
|--------|----------|----------|-----------------|
| **Completion** | May never conclude | Stabilizes over time | Discrete phases with goals |
| **Structure** | Freeform sections | 7-section structure | Iteration template |
| **Evolution** | transformations.md | revisions.md | Technical Decisions |
| **Memory** | arcs/ | origins/ | iterations/ |
| **Goal** | Understanding | Shape | Shipping |

**Why separation matters:** Mixing concept exploration with implementation creates "build pressure" that forces premature decisions. Keeping them separate (but linked) lets concept inform building without collapsing.

## What Doesn't Belong Here

**Not implementations:**
- ❌ Concept exploration (belongs in concepts repo)
- ❌ Open-ended research (belongs in research repo)
- ❌ Unscoped experimentation (low tolerance for drift)
- ❌ Work without clear goals (iterations need test criteria)

## Philosophy

This structure comes from building [qinolabs](https://github.com/qinolabs/qinolabs-repo)—a multi-app ecosystem where concepts guide building without being overrun by it.

**Key insights:**
- Concepts shape what to build (but stay separate)
- Iterations are turn-taking checkpoints (not sprints)
- Learnings capture reasoning (not just facts)
- Drift detection keeps concept ↔ code synchronized

> "Building reveals truths that concept exploration couldn't predict. Sometimes the domain model doesn't fit. Sometimes features need adding or removing. The dev agent notices these moments and offers to update the concept—keeping them in sync as understanding evolves."

Implementation is where vision meets constraints—and both change as a result.

## Reference Documents

Located in `.claude/references/dev/`:

- **repo-conventions.md** — Structure patterns across repo types
- **template-guidance.md** — How to capture learnings through colocation
- **home-pattern.md** — Arrival pattern for generated commands
- **drift-signals.md** — Recognizing when concept ↔ code diverge
- **templates/** — Implementation, iteration, app command templates

## License

[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)

Free to use and adapt with attribution, non-commercial, share-alike.

## Further Reading

- [qino-claude](https://github.com/qinolabs/qino-claude) — The skill system
- [Implementations docs](https://github.com/qinolabs/qinolabs-repo/tree/main/implementations/docs) — Example architecture docs
- [Chronicles](https://chronicles.qinolabs.com/) — See git become story
- [Journal](https://journal.qinolabs.com/) — Research transmissions

---

_Build in phases._
_Let concept guide without constraining._
_Capture learnings where work happens._
