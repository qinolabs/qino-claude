# qino-claude

[![Latest Release](https://img.shields.io/github/v/release/qinolabs/qino-claude?label=download)](https://github.com/qinolabs/qino-claude/releases/latest)

Tools for working with ideas in [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

<details>
<summary><strong>Companions on the Path: The Pattern That Connects</strong></summary>

### The Young Anthropologists and the Question of Fascism

In 1932, Gregory Bateson met Margaret Mead on the Sepik River in New Guinea. Both were in their late twenties. The world was darkening—Mussolini had been in power for a decade, Hitler was ascending, and the patterns of thought that would consume Europe were already taking hold.

Bateson had been studying the Iatmul people, watching their elaborate rituals of boasting and counter-boasting, dominance and submission. He noticed something troubling: communication could become a runaway process. When one group boasts, the other boasts back louder. When one side dominates, the other submits further, inviting more dominance. He called this *schismogenesis*—the creation of division through escalating feedback. Left unchecked, it tears societies apart.

Then he and Mead went to Bali. There they found something different. The Balinese practiced what Bateson called "stasis"—their interactions didn't spiral. Competition didn't escalate into arms races; submission didn't deepen into abjection. Somehow, their culture had patterns that absorbed perturbation rather than amplifying it.

The question haunting this work: *Could communication be shaped to resist the runaway polarization that feeds totalitarianism?*

This wasn't abstract. By the time they returned to America in 1939, war had begun. They turned their anthropological methods toward understanding fascist propaganda, analyzing Nazi films, studying "national character" at a distance. Mead and Bateson even designed a board game—never published—based on the principle that "Democracies and Dictators play by different rules."

But Bateson grew troubled. Using his theories as propaganda tools—even against fascism—felt like participating in the very escalation he had diagnosed. After the war, he largely withdrew from applied social science, turning instead toward cybernetics, ecology, and the question of how living systems learn.

### The Pattern That Connects

What emerged from this journey was a different way of seeing. Bateson came to understand mind not as something inside brains, but as a pattern distributed through living systems—families, forests, societies, the relationship between organisms and their environments.

He asked: *What is the pattern that connects the crab to the lobster and the orchid to the primrose, and all four of them to me? And me to you?*

And he defined information not as data, but as *a difference which makes a difference*—something relational, something that only exists in the gap between contexts.

These ideas hum through the tools in this repository:
- **Abductive process**: Meaning emerges by casting one context onto another, discovering what was latent
- **Transcontextuality**: Nothing is "just that and nothing more"—every interaction speaks into multiple contexts simultaneously
- **The alive thread**: Following what carries energy, what still wants to move
- **Divergence and convergence**: Living systems need both surprise and coherence; neither alone suffices

### Nora Bateson: The Unseen Coalescence

Nora Bateson, Gregory's daughter, has extended this work into new territory. She asks: if "insidious" describes how pathology creeps up through unseen combining processes—racism, addiction, corruption—what is the word for the opposite? For how vitality, healing, and creativity coalesce in ways we cannot see?

She calls this **aphanipoiesis** (Greek: *aphanis* = unseen, unnoticed + *poiesis* = to bring forth).

> "The change before the change... what coalesces prior to emergence."

This is not hidden—it is merely out of habituated perception. Like the soil beneath a forest, teeming with relational processes while attention is caught by what stands visible above.

Her key insight: *One cannot explicitly change that which is implicit.* Direct correctives fail against insidious patterns because those patterns formed in the unseen stitching between contexts—between family and economy, between education and identity, between language and expectation. To touch that realm requires tending the *about* so that the *within* can shift.

**Warm Data** is her term for the kind of information that can hold this complexity: "transcontextual information about the interrelationships that integrate a complex system." Not cold data extracted from context, but living information that shifts within the mutual learning of systems.

### What This Means Here

The tools here are experiments in aphanipoietic design—they tend explicit structures so implicit patterns can re-wild. They don't try to fix systems by adjusting parts. They create conditions where aliveness can emerge through dialogue, marking, and the right kind of constraints.

The Batesonian patterns are not applied as methodology but absorbed as sensibility:
- Questions reveal what you didn't know you were asking
- The alive thread guides movement more reliably than plans
- What's held quietly can resurface when needed
- The human feels what's alive; the system holds what's set down

This is the inheritance: from young anthropologists watching rituals on the Sepik, troubled by how communication can tear worlds apart—to the ongoing question of how living systems learn to change into something they don't yet know how to become.

#### Sources

- [Library of Congress: Margaret Mead in Bali](https://www.loc.gov/exhibits/mead/field-bali.html)
- [Library of Congress: National Character Studies](https://www.loc.gov/exhibits/mead/oneworld-char.html)
- [Nora Bateson: Aphanipoiesis](https://journals.isss.org/index.php/jisss/article/view/3887)
- [Nora Bateson: Warm Data](https://norabateson.wordpress.com/2017/05/28/warm-data/)
- [International Bateson Institute](https://batesoninstitute.org)

</details>

**[Read the chronicles →](https://chronicles.qinolabs.com/)**

<details>
<summary><strong>The Chronicles: Story of an Evolving Ecosystem</strong></summary>

Each repository in the qino ecosystem tells its own story.

**qino-claude** — Claude-based AI tooling.

> *The wanderer pressed her ear to the workshop wall. Sounds on the other side that weren't there yesterday — someone moving, maybe. Something being made ready. She stayed there a long time, listening.*

**concepts-repo** — concept development.

> *A notebook on the table, open to a page the wanderer didn't remember writing. The handwriting was theirs.*

**qinolabs-repo** — web and mobile applications.

> *Something had shifted in the night. Not the furniture — the distances between things.*

Same scribe. Different worlds. Different atmospheric registers. Process in each informs the others — a co-evolution.

> *The Keeper of Paths looked up from her maps. "Someone's been walking between the Workshop and the Warm Room. Over and over. The ground remembers."*
>
> *"What are they looking for?"*
>
> *She smiled. "They'll know when they stop."*

</details>

---

## The Ecosystem

Ideas need different conditions at different stages.

An early hunch needs room to wander — structure would crush it. A maturing concept needs stability — too much flux and it never settles. An implementation needs grounding — a vision to build toward without getting lost in features.

The qino ecosystem gives each stage its own space:

```
                        ┌─────────────────┐
                        │   TOOL HOME     │
                        │  qino-claude    │
                        │                 │
                        │  tools/         │ ◀── source of all tools
                        │  .claude/       │ ◀── also uses tools (adapter)
                        └────────┬────────┘
                                 │
        ┌────────────────────────┼────────────────────────┐
        ▼                        ▼                        ▼
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│   RESEARCH      │     │    CONCEPTS     │     │ IMPLEMENTATION  │
│                 │     │                 │     │                 │
│  explorations   │     │  concepts/      │     │  app repos      │
│  calibrations   │     │  notes/         │     │  legal docs     │
│  experiments    │     │  chronicle/     │     │  etc.           │
└─────────────────┘     └─────────────────┘     └─────────────────┘
     graduate ──────────────▶  ◀──────────────── capture/test
```

**Research** is before concepts crystallize — open-ended exploration, controlled experiments, calibrations of aesthetic quality. Work here welcomes uncertainty and accepts inconclusive results as valuable.

**Concepts** is where ideas stabilize. The seven-section structure, the held threads, the notes that weave between them. What arrives here has found its shape, even if it continues to evolve.

**Implementation** is where concepts meet code. Each implementation links back to its concept, so what you build stays connected to why you're building it.

**qino-claude** sits at the top — the source of all tools. But it also *uses* those tools through adapters, so it participates in the ecosystem it enables.

### The Router

A small file called `qino-config.json` tells each tool which space it's in and where to send things:

```json
{
  "repoType": "research",
  "conceptsRepo": "../concepts-repo",
  "description": "Research space"
}
```

The tools read this configuration and adjust their behavior. A capture in a research repo might become an exploration. The same command in an implementation repo sends a note to concepts. The tools stay the same; the context shapes what they do.

### Context Sensitivity

The same command adapts to where you are:

| Command | In concepts | In research | In implementation |
|---------|-------------|-------------|-------------------|
| `/qino:home` | concepts, notes, threads | explorations, calibrations | linked concept, stack |
| `/qino:capture` | saves to notes/ | saves to fragments/ | saves to linked concepts-repo |
| `/qino:test` | tests concept | tests exploration | tests linked concept |

### Flow

Research graduates into concepts — either as notes (distilled insights) or as concept seeds (new concepts with origins).

Implementation captures flow back to concepts — observations, test results, things noticed while building.

The chronicle (qino Scribe) watches git changes across any repo and writes the story of what happened.

Everything connects through concepts-repo, but each space keeps its own ecology intact.

### Command Namespaces

| Prefix | Space | Examples |
|--------|-------|----------|
| `qino:` | Universal (ecology itself) | home, capture, test, attune, compare |
| `qino-concept:` | Concepts | explore, import, init |
| `qino-research:` | Research | begin, experiment, graduate |
| `qino-scribe:` | Chronicle | chapter, rewind |
| `qino-dev:` | Implementation | init, app |

The `qino:` namespace is not a specific space — it's what you're already in when you're anywhere. The suffix is the door you're entering through.

---

## qino Concept

A gentle space for developing ideas.

### The question it asks

Most tools assume you can get to a meaningful output by filling in the sections — complete the template, check the boxes, and the result will have value.

This tool works through dialogue. It asks what draws you, follows that thread, asks again. Each response surfaces something — a connection you hadn't named, a quality you were circling around, a direction that suddenly feels right. You discover what your idea actually holds by staying with it, turning it gently, going deeper where it rewards attention.

### What it holds

When you bring in a note, not everything makes it into your concept. The rest isn't lost — it's held. Quietly indexed. No guilt about what you didn't carry forward. Later, if you're stuck, the tool might say: *"There's something held in your origins — about [that theme]. Does it still have warmth?"*

It remembers what you set down so you can forget safely.

### Home

A place to check in before you venture out. You arrive, orient, then choose to go somewhere.

```
/qino:home

threads between

  world-tokens-pattern connects qino-scribe, gm-tool, qino-chronicles
  scribe-as-lens-prototype connects qino-scribe, qino-lens

─────

concepts

  qino-scribe
  qino-drops
  discovery-grid
  qino-lens

─────

from here

  qino-drops has active held threads about relational grammar
  /qino:home qino-drops to arrive

  world-tokens-pattern was captured yesterday
  explore how tokens move between scribe and chronicles?

                        /qino:home <concept> to arrive
                        /qino-concept:explore <concept> to work
                        /qino:capture to hold a thought
```

### Working together in practice

Arrive, bring material in, notice what matters, and let the whole system echo back.

- `/qino:home` is the quiet landing. It shows threads between concepts, notes waiting to be woven, and recent movement. It is the easiest way to feel where to go next.
- `/qino-concept:import` brings outside notes into the manifest. What you don't carry into a concept gets held; Home surfaces those held threads later.
- `/qino-concept:explore [concept-id]` turns toward one concept (or two at once) and follows the alive thread. Imported notes and captures appear as starting points.
- `/qino:capture [observation]` is the immediate notebook. Essence is saved, references stay open until you connect them or let them settle. Those captures later appear in Explore suggestions.
- `/qino:test [concept-id]` runs ecology tests. The noticing becomes a note with ecology metadata, so Home can show what's been quiet and what keeps echoing.

Home, Import, Explore, Capture, and Test feed each other: arrivals reveal what was imported; explorations surface captures; tests seed new captures; everything held quietly reappears the next time you come home.

```bash
/qino-concept:init
/qino:home
/qino-concept:explore concept-id [other-concept-id]
/qino-concept:import path/to/notes.md
/qino:capture [observation]
/qino:test [concept-id]
```

*[Source](tools/qino-concept/) · [Installation](tools/qino-concept/README.md#installation)*

---

## qino Scribe

qino Scribe keeps the chronicle alive. It reads the git range, grounds in `world.md`, then writes a chapter where the wanderer acts and the world pushes back. The constraints are there to protect story craft: pressure before plot, world that sees the wanderer, action that costs something.

In this repository's chronicle, the wanderer is ferrying a warming pouch upriver. Villages know about them before they arrive. Lira at Orith's Landing recognizes the pouch from years ago; Seren fears the writing filling his margins; the river itself carries news. The chronicle only moves when the wanderer does — and when the world answers.

### Pressure-first chronicle

Your ecosystem evolves through conversations and work that spans sessions. qino Scribe turns that movement into a fantasy chronicle with action, consequence, and a wanderer who acts — not documentation in costume. Each chapter ends with pressures still building so the next one has somewhere to land.

### How the system holds the craft (six phases)

- **Ground before diff** — read the theme and world, find where tension already waits
- **Observe what changed** — read the git range, ask who in-world feels it and what could go wrong
- **Discover four options** — Expected, Unexpected Location, Complication, Journey; choose the most alive (action + stakes)
- **Propose → Write** — present the beat, then draft with one explanatory exchange max; the world must act, and the wanderer must risk something
- **Update world.md** — pressures, wanderer, characters, locations, arcs; add journal entries when arcs complete
- **Keep the ledger** — world tokens stay small and specific so later chapters can echo them without breaking immersion

### Show, don't tell

Example from this chronicle (Chapter 8):

- **Git change:** Added new notes about an elder who recognized the pouch the wanderer carries.
- **Chapter output:** The wanderer docks at Orith's Landing; Lira recognizes the pouch as something that passed through years ago; villagers already know the wanderer is coming.
- **world.md update:** Added pressures about the pouch's history and news outrunning the river, plus tokens for Lira and Orith's Landing so later chapters can echo them.

**Pressures** (`world.md`)

```markdown
## Pressures

### The Pouch's History
It passed through here before. Now it's going home. What waits for it there?

### Word Traveling Faster Than Water
The river villages know about the wanderer. News moves upstream ahead of them.
```

**Aftermath** (wanderer section)

```markdown
## The Wanderer

Known before they arrive. The pouch warms toward soon. The message — the one who holds between will find the door — still unread.
```

**World Tokens**

```markdown
**Lira**
Elder of Orith's Landing. Knows the pouch and its last carrier.

**Orith's Landing**
Platforms over fast water. Rope bridges, smoke, children who track arrivals.
```

```bash
/qino-scribe:chapter
/qino-scribe:chapter from_ref to_ref   # retroactive chapter for a git range
```

*[Source](tools/qino-scribe/) · [Installation](tools/qino-scribe/README.md#installation)*

---

## Design Adventure

A simulated conversation between seven perspectives — an adventure you witness.

### The room after

You launch it, then enter the room after it happened. Chairs still warm. Ideas still in the air. You discover what emerged — the questions they kept circling back to, what they couldn't resolve.

Six perspectives think through words. The seventh (World) thinks through environment — a draft scatters someone's diagrams; they gather them differently and that's when the insight arrives.

### What the output looks like

```
design-sprints/2024-12-15_collaboration-vs-focus/
├── __enter-here.md
├── dialogue.md
├── q-what-signals-legitimate-interruption.md
├── q-can-focus-be-collaborative.md
├── q-who-decides-when-to-break-flow.md
└── synthesis.md
```

From `q-can-focus-be-collaborative.md`:

> **The Skeptic:** We keep saying "focus time" as if it's always solo. But pair programming is focus. Whiteboard sessions can be deep work.
>
> **The Embodied Thinker:** There's a different quality of attention — when you're tracking someone else's rhythm, not just your own.
>
> **The World:** *The fluorescent light hums. Someone's pen taps against the table.*
>
> **The Synthesizer:** Maybe the question isn't collaboration vs. focus. It's whose rhythm you're in.

Different runs surface different questions. The questions themselves teach you how to think about the problem.

```bash
/design-adventure How do we balance real-time collaboration with focus time?
```

*[Source](tools/design-adventure/) · [Installation](tools/design-adventure/README.md#installation)*

---

## qino Dev

Implementation companion for qino-concept.

### The relationship

You start with a vision. Requirements absorb it. Tickets fragment it. Somewhere in the building, the feeling fades into features.

This happens when concept and implementation share the same space. Without boundaries, one absorbs the other — and implementation always wins. The code is right there, immediate and demanding.

qino Dev gives them separate places. Your concept stays in concepts-repo. Your implementation lives in the target project. Not to keep them apart, but so they can inform each other without merging. The concept shapes what you build. What you discover while building flows back to shape the concept. Each keeps its own form while the other grows.

### Translation, not discovery

When you initialize from a concept, the work isn't to rediscover what you already know. It's to translate.

Given this essence, what technologies serve it? Given these surfaces, what architecture patterns? Given this scope, what complexity budget? What would signal we're on track — or off it?

A fifteen-minute conversation translates conceptual understanding into technical context. What emerges is an `implementation.md` that knows what it's building toward and why certain choices fit better than others.

### Arrival

The generated command — `/qino-dev:app` — follows the home pattern. Quiet arrival. Show what's here. Open to what's next.

```
my-app

concept — linked to board-games
stack — React, Supabase, shadcn/ui
iteration — 01: foundation — in progress

─────

from here

  two of three goals done in this iteration
  what's blocking the last one?

  there's uncommitted work on authentication
  continue here, or commit what you have?

                        just respond, or /qino-concept:explore board-games
```

Not a dashboard. Not a menu. A place to arrive before you work.

### Turn-taking

Iterations aren't sprints. They're checkpoints for turn-taking.

AI implements to the iteration spec. User tests and reviews. Feedback flows before the next phase begins. Each iteration has scope, goals, and test criteria — clear enough to build toward, flexible enough to learn from.

The files live in `implementations/` — visible, version-controlled, yours. Not hidden in `.claude/`. Not abstracted away. You can read them, edit them, understand what's planned.

```bash
/qino-dev:init path/to/concept.md
/qino-dev:app
```

*[Source](tools/qino-dev/) · [Installation](tools/qino-dev/README.md#installation)*

---

## qino Attune

Training perception through difference — now part of the universal `qino:` namespace.

> **Information is "a difference that makes a difference."**
> — Gregory Bateson

### Compare

Two chapters from the qino-claude chronicle. Which works better? Read them side by side and notice what lands differently.

```
/qino:compare 007-what-stillness-holds/chapter.md 008-the-second-bend/chapter.md

─────

what stays with you from each?

chapter-07: The Mender's threads spanning walls. Twenty years of questions finding response.
chapter-08: Seren's margins filling with writing not his own. "If you find out what you are, send word."

─────

where does the difference live?

chapter-07: The wanderer witnesses. The Mender's solitude made visible.
chapter-08: The wanderer is witnessed. Seren sees something in them they don't see themselves.

One is about seeing outward. The other is about being seen.

─────

                        /qino:capture to hold this
                        /qino:attune mutual-seeing
```

### Calibrate

You know "mutual seeing" when you feel it — when the world sees back, when characters perceive each other, not just exist. But you can't teach it without making it concrete.

```
/qino:attune mutual-seeing

calibrations/mutual-seeing/
├── research.md           # chronicle passages with yes/no/why
├── transformations.md    # flat scenes → relational scenes
└── examples/             # candidates being tested
```

The process: find candidates from existing chapters, calibrate through feedback, transform failed examples into working ones. The vague quality becomes craft you can protect.

```bash
/qino:compare path/to/a.md path/to/b.md
/qino:attune mutual-seeing
```

---

## Adapters

This repository uses its own tools. The source files live in `tools/`, and adapter commands in `.claude/commands/` reference them.

```
tools/qino-universal/commands/qino/        → .claude/commands/qino/
tools/qino-concept/commands/qino-concept/  → .claude/commands/qino-concept/
tools/qino-scribe/commands/qino-scribe/    → .claude/commands/qino-scribe/
tools/qino-research/commands/qino-research/→ .claude/commands/qino-research/
```

This is the "adapter" pattern described in The Ecosystem section — qino-claude is both the source of tools and a user of them.

---

## Ecological Design

Ecological design patterns are alive at every level — in each concept, in each repository, in the ecosystem itself. The art is in the design — affordances and cues, sensitive to experience, that naturally protect the integrity of local ecologies while enabling free movement without accumulating friction. The best ideas can come from anywhere — not centralized — and often while deeply immersed in a different context.

"Home" is a metaphor. In qino-claude it means arrival, orientation, receiving before venturing out. That pattern can travel — to qino-drops, to any app — and mean the same thing while taking completely different form. The metaphor carries the pattern across boundaries without flattening what's local.

A gesture in one context presents an opportunity to deepen understanding on other fronts. Refining "mutual seeing" in the scribe teaches something about qino-lens. The note captured while building qino-drops informs how discovery-grid handles attunement. The compare session that improves a chapter becomes a chapter in the chronicle.

qino-claude also serves as a proving ground. The patterns that work here — cards moving between contexts, modalities for encountering the same material, figures that travel — become the architecture for the apps. What's discovered at tool-scale informs app-scale.

> *"Every concept reflects every other. The membrane grows thin."*
> — from "indras-net-between-concepts"

---

## Installation

**Quick:** Download `all-tools.zip` from the [latest release](https://github.com/qinolabs/qino-claude/releases/latest), unzip, copy contents to `.claude/` in your project.

**Individual tools:** Separate zips available if you only want one.

**Keeping updated:** After installation, copy [update-qino-tools.md](tools/updater/commands/update-qino-tools.md) to `.claude/commands/`, then run `/update-qino-tools` to fetch latest files from GitHub.

## Requirements

[Claude Code](https://docs.anthropic.com/en/docs/claude-code)

## License

[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) — free to use and adapt with attribution, non-commercial, share-alike.

---

*The examples in this README are real. The concepts shown in `/qino:home` are actual concepts in the ecosystem. The chronicle chapters in `/qino:compare` are real chapters written by qino Scribe about this repository's own evolution. The "mutual seeing" calibration references a pattern discovered while developing the scribe. What you build will circle back to refine what built it.*
