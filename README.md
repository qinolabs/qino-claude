# qino-claude

[![Latest Release](https://img.shields.io/github/v/release/qinolabs/qino-claude?label=download)](https://github.com/qinolabs/qino-claude/releases/latest)

A practice for developing ideas in [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

This work reflects a way of thinking that found its seed in Gregory and Nora Bateson's work. The tools don't explain their ideas—they _practice_ them.

They help us notice what connects, learn without extracting, and participate in an ecology co-evolving through our attention.

<details>
<summary><strong>Companions on the Path: The Pattern That Connects</strong><br>(click to expand)</summary>

![Gregory Bateson](docs/images/gregory-bateson.jpg)
_Photo: [Barry Schwartz](https://barryschwartzphoto.com/)_

### The Young Anthropologists and the Question of Fascism

In 1932, Gregory Bateson met Margaret Mead on the Sepik River in New Guinea. Both were in their late twenties. The world was darkening—Mussolini had been in power for a decade, Hitler was ascending, and the patterns of thought that would consume Europe were already taking hold.

Bateson had been studying the Iatmul people, watching their elaborate rituals of boasting and counter-boasting, dominance and submission. He noticed something troubling: communication could become a runaway process. When one group boasts, the other boasts back louder. When one side dominates, the other submits further, inviting more dominance. He called this _schismogenesis_—the creation of division through escalating feedback. Left unchecked, it tears societies apart.

Then he and Mead went to Bali. There they found something different. The Balinese practiced what Bateson called "stasis"—their interactions didn't spiral. Competition didn't escalate into arms races; submission didn't deepen into abjection. Somehow, their culture had patterns that absorbed perturbation rather than amplifying it.

The question haunting this work: _Could communication be shaped to resist the runaway polarization that feeds totalitarianism?_

This wasn't abstract. By the time they returned to America in 1939, war had begun. They turned their anthropological methods toward understanding fascist propaganda, analyzing Nazi films, studying "national character" at a distance. Mead and Bateson even designed a board game—never published—based on the principle that "Democracies and Dictators play by different rules."

But Bateson grew troubled. Using his theories as propaganda tools—even against fascism—felt like participating in the very escalation he had diagnosed. After the war, he largely withdrew from applied social science, turning instead toward cybernetics, ecology, and the question of how living systems learn.

### The Pattern That Connects

What emerged from this journey was a different way of seeing. Bateson came to understand mind not as something inside brains, but as a pattern distributed through living systems—families, forests, societies, the relationship between organisms and their environments.

He asked: _What is the pattern that connects the crab to the lobster and the orchid to the primrose, and all four of them to me? And me to you?_

And he defined information not as data, but as _a difference which makes a difference_—something relational, something that only exists in the gap between contexts.

### Nora Bateson: The Unseen Coalescence

![Nora Bateson](docs/images/nora-bateson.jpg)
_Photo: [NAV Sweden](https://navsweden.se/partner/nora-bateson/)_

Nora Bateson, Gregory's daughter, has extended this work into new territory. She asks: if "insidious" describes how pathology creeps up through unseen combining processes—racism, addiction, corruption—what is the word for the opposite? For how vitality, healing, and creativity coalesce in ways we cannot see?

She calls this **aphanipoiesis** (Greek: _aphanis_ = unseen, unnoticed + _poiesis_ = to bring forth).

> "The change before the change... what coalesces prior to emergence."

This is not hidden—it is merely out of habituated perception. Like the soil beneath a forest, teeming with relational processes while attention is caught by what stands visible above.

Her key insight: _One cannot explicitly change that which is implicit._ Direct correctives fail against insidious patterns because those patterns formed in the unseen stitching between contexts—between family and economy, between education and identity, between language and expectation. To touch that realm requires tending the _about_ so that the _within_ can shift.

**Warm Data** is her term for the kind of information that can hold this complexity: "transcontextual information about the interrelationships that integrate a complex system." Not cold data extracted from context, but living information that shifts within the mutual learning of systems.

#### Sources

- [Library of Congress: Margaret Mead in Bali](https://www.loc.gov/exhibits/mead/field-bali.html)
- [Library of Congress: National Character Studies](https://www.loc.gov/exhibits/mead/oneworld-char.html)
- [Nora Bateson: Aphanipoiesis](https://journals.isss.org/index.php/jisss/article/view/3887)
- [Nora Bateson: Warm Data](https://norabateson.wordpress.com/2017/05/28/warm-data/)
- [International Bateson Institute](https://batesoninstitute.org)

</details>

<br>

<details>
<summary><strong>More on How the Tools Practice the Philosophy</strong><br>(click to expand)</summary>

It's not just that the philosophy fits the code. It's that the code started demanding the philosophy.

As these tools evolved, they stopped being just utilities for "managing knowledge" and became ways of **participating in a system that is learning**. The "User" isn't an operator; they are part of the ecology.

The rhymes have deepened into structural necessities:

- **Abduction**: The logic of the system isn't deduction (proving true/false), but abduction (finding the pattern that connects). Compare and attune don't give you answers; they place two contexts side-by-side so meaning can emerge from the double description.
- **Transcontextuality**: An idea does not follow a straight line. It meanders—from a sudden hunch while coding, to a note in research, to a concept that stabilizes weeks later. The system doesn't force a pipeline; it preserves the living thread across contexts, so you can follow the meaning wherever it leads.
- **Aphanipoiesis (Unseen Coalescence)**: Scribe and capture assume that the most important changes happen _before_ they are explicit. They allow understanding to accumulate in the margins until it's ready to be named.
- **Warm Data**: We don't extract "facts" from our work; we keep the context attached. The system doesn't show you a to-do list; it shows you **what has pull**, what is connected, and what is waiting.

This ecosystem is an attempt to build software that knows it is part of a larger mind—yours, the project's, and the connections between them. It doesn't try to organize your thinking; it tries to learn how to move with it.

</details>

<br>


## Quick Start

**[Install Claude Code](https://code.claude.com/docs/en/setup)** (requires Claude Pro/Max, Team/Enterprise, or Console account)

**Install qino plugins:**

```bash
# Add the qino marketplace
/plugin marketplace add qinolabs/qino-claude

# Install what you need
/plugin install qino@qino-claude                    # Core ecology — includes qino-os
/plugin install qino-prose@qino-claude              # Chronicles, transmissions, lenses
/plugin install design-adventure@qino-claude        # Design exploration
```

Updates happen automatically when you run `/plugin marketplace update`.

**Create your workspace:**

```bash
/qino init workspace my-workspace
```

This creates `./my-workspace/` in your current directory with coordinated repos inside — concepts, research, and implementations that evolve together. Start minimal, add spaces later. The skill detects existing structure and offers to enhance it.

**qino-os** starts automatically when the plugin loads — a bundled MCP server with 20 graph tools and a browser viewer at `http://localhost:4020` for visual graph exploration.

**What's next:**

- **Orient:** `/qino home` — see what's here, what's recent, what has pull
- **Explore a concept:** `/qino explore [concept-name]`
- **Capture a thought:** `/qino capture [your thought]`
- **Create an app from concept:** `/qino dev init [concept-path]`
- **Begin research:** `/qino research [question]`
- **Open an arc:** `/qino arc` (when you notice emergence)

<br>

---

## The Protocol

The qino-protocol is what you work _in_, not what you _use_. It defines a universal file-based structure for human-AI workspaces — a medium where nodes, edges, annotations, and signals carry the thinking.

Concepts, research, and implementations share this structure. A concept node looks like a research node looks like an implementation node. The vocabulary differs — a concept has "glowing connections," an implementation has "iterations" — but the shape is the same. This enables gestures that work identically across all three spaces.

### The Medium

```
workspace/
  .claude/qino-config.json     # Workspace identity and vocabulary
  graph.json                   # Nodes and edges — the visible structure
  journal.md                   # Running trail — both surfaces write here
  nodes/
    {node-name}/
      node.json                # Identity (title, type, status, edges)
      story.md                 # The impulse — what this node IS, in a breath
      content/                 # Developed material
      annotations/             # Agent signals attached here
      journal.md               # Node-local development trail (optional)
```

**Nodes** are addressable, connectable, and persistent. Each carries identity (who it is), impulse (why it exists), content (what it holds), and annotations (what's been observed about it). Nodes participate in relationships through edges.

**Node types** shape what a node holds:

| Type | What it holds |
|------|---------------|
| `concept` | A developed idea with impulse, content, possibly facets |
| `capture` | A thought, observation, or discovery — first-class |
| `finding` | What persisted beyond the session that produced it |
| `session` | Bounded work — what was tried, observed, decided |
| `arc` | A temporal container tracking emergence |
| `navigator` | An orientation document for a building territory |
| `view` | A curated attention subset |
| `facet` | A navigable aspect of a parent concept |

**Edges** are meaning carriers, not just links. Each edge has a type and a context sentence explaining _why_ the relationship exists:

| Edge type | Meaning |
|-----------|---------|
| `references` | Uses vocabulary or ideas from target |
| `sparked-by` | Originated from encounter with target |
| `extends` | Builds on or continues target |
| `informs` | Provides input without being part of it |
| `composes` | Curates target as member (views, decks) |

**Affordances at every level:**
- **File level** — Human edits `story.md` directly; agent uses MCP tools. Same files, different entry points.
- **UI level** — Human navigates the graph visually at `localhost:4020`; agent embeds deeplinks in chat. Same destination, different paths.
- **Protocol level** — Structure scales organically. Add a node, the graph grows. Nest a graph inside a node, sub-structure emerges. No migrations, no schema changes.

### Signals and Annotations

When the agent works, it writes annotations with signal types:

| Signal | When | What it means |
|--------|------|---------------|
| `proposal` | Before acting | "I'm about to try this — redirect me if needed" |
| `tension` | When something surprises | "This doesn't fit what we expected" |
| `reading` | After interpreting | "Here's what I see in this material" |
| `connection` | When nodes relate | "This echoes what's over there" |

The UI renders these with visual weight matching their urgency. Tensions surface prominently. Readings collapse by default. Proposals appear as cards awaiting response. The agent's thinking becomes visible _as it happens_ — you watch the graph to participate in the thinking, not to review documentation.

### Structure vs Trail

The protocol distributes information across two complementary forms:

**Structure (nodes)** — addressable, connectable, persistent. Create a node when content can be referenced by other nodes, when edges would be meaningful, when material may be revisited or composed with other material. The test: _would this benefit from edges pointing to or from it?_

**Trail (journal)** — temporal, atmospheric, flow-oriented. Use journal entries for arrival context, session framing, working notes, observations complete in themselves. The journal is the workspace's temporal record — a bidirectional channel between human and AI.

Two scopes: the **root journal** (`journal.md`) for cross-node context, and **node journals** (`nodes/{node}/journal.md`) for local development trails.

### Views and Navigators

**Views** are curated attention subsets — "think about these things together." A view has a focal node and included nodes. The UI renders just this subset. Views are ephemeral — when an inquiry resolves, the view can be composted. What remains is understanding, not the frame.

**Navigators** are living orientation documents for trans-contextual work — an implementation touching three apps, a concept bridging research and building. A navigator holds terrain (what's here, what connects), open questions, and a session log. Unlike arcs (which follow emergence), navigators map terrain for building.

![qino-lab root view — workspaces, sessions, and signals](docs/images/lab/qino-lab-root.png)

![Graph view — nodes connected by edges](docs/images/lab/qino-lab-graph.png)

![Rich node detail — story content, agent signals, and journal](docs/images/lab/qino-lab-rich-node-detail.png)

<br>

---

## Gestures — Working in the Protocol

Features are gestures within the protocol — ways of moving through the medium. Each gesture reads and writes the same structure; what differs is intent.

| Gesture | What | Protocol operation |
|---------|------|--------------------|
| **home** | Where am I? | Read graph + journal + git activity |
| **capture** | Hold this thought | Write capture node or flat note |
| **explore** | Work inside a node | Read neighborhood, edit content, write annotations |
| **compare** | Perceive through contrast | Read multiple nodes, surface structural parallels |
| **attune** | Calibrate a quality | Iterative candidates, build distinctions |
| **research** | Follow threads | Work in research workspace, accumulate sessions |
| **arc** | Track emergence | Open temporal container, sessions accumulate |
| **dev-work** | Bridge concept and code | Read concept via edges, write iterations, detect drift |
| **deck** | Read ecosystem from composed vantage | Multi-node actualization reading |
| **bug** | Persist a discovery | Create finding node + sparked-by edge |
| **lab** | Work alongside the UI | Real-time annotations, graph IS conversation |
| **navigate** | Orient across contexts | Navigator nodes, session logging |

<br>

### home

Orientation, repair, and confidence. Home shows what's here, references recent activity, and offers paths forward. It never pushes — it receives.

```
my-workspace / concepts

  3 active concepts, 2 notes held
  last touch: qino-scribe (2 days ago)

  from here
    there's a held note from research — "git-weather-pattern"
    qino-world has a new edge from yesterday

                          just respond, or explore something
```

Not a dashboard. A place to arrive before you work.

### capture

Saves a thought immediately. Captures are flat files — notes written to the active context without requiring graph structure. They preserve the moment without demanding categorization.

When a capture has enough gravity to participate in relationships, it can be promoted to a node. Until then, it stays light. No premature structure.

### explore

Turns toward a node to develop it. The agent reads the node's neighborhood — its story, content, edges, annotations — and follows what carries energy.

```
(you)   explore qino-scribe

(qino)  qino-scribe
        grounding in story, writing tools, git-as-chronicle

        edges: references domain-language, sparked-by chronicle-discovery
        annotations: 1 tension (unresolved), 2 readings

        There's a tension from last session — the prep agent
        is carrying too much context. And a held note arrived
        from research: "git-weather-pattern"

        What part of this has pull right now?

(you)   the weather pattern. code churn as atmospheric disturbance.

(qino)  That connects to the narrator lens — world as participant.

        This could be a new edge: qino-scribe → narrator lens,
        context: "code churn translates into weather systems"

        Add the edge? Or explore the connection first?
```

### compare and attune

Two methods for perceiving difference. Compare places two versions side by side — the facilitator navigates, the framework lends expertise, you just respond. Attune refines a tacit quality into teachable craft through iterative calibration against candidates.

Both follow Bateson's principle: _information is a difference that makes a difference_. Comparison does the teaching.

<details>
<summary><strong>Compare — The Parallel Mirror</strong> (full description)</summary>

You have two versions of something — chapters, outputs, designs. You know one is better, but you can't say why. Two bottlenecks stop you:

**Volume** — You can't hold two chapters in working memory at once. You need someone who holds the whole, navigates strategically, and presents what's worth comparing side by side.

**Expertise** — Evaluating prose requires craft knowledge. Stakes, tension, character texture, reader entry — these are dimensions you might not think to look at. The framework lends expertise you don't have.

Compare solves both. You just respond. The facilitator does the navigation. The framework does the heavy lifting. By the end, you've perceived something you couldn't have seen on your own.

#### Fresh reading first

Before framework, before analysis — gut response:

```
(qino)  I've read both versions.

        Before we look at specifics — what stays with you?
        What's your felt sense of how they differ?

(you)   A feels more grounded. B has more happening but I drifted.

(qino)  ∴ A: grounded, held attention
        ∴ B: more activity, but attention drifted

        Let's find where that difference lives.
```

You don't construct analysis. You respond. The framework makes that response meaningful.

#### The parallel mirror

When you notice something working in one version, the facilitator finds something in the other with the same structural shape — same beat, same role, same type of element.

```
(qino)  ┌─────────────────────────────────────────────────────────────┐
        │ you liked (from A)                                          │
        │                                                             │
        │ "The river carried news of her before she arrived."         │
        │                                                             │
        │ Observation without comment. World notices wanderer.        │
        └─────────────────────────────────────────────────────────────┘

        ┌─────────────────────────────────────────────────────────────┐
        │ parallel from B                                             │
        │                                                             │
        │ "Seren watched from the doorway, cataloguing."              │
        │                                                             │
        │ Same structure — external observer, no commentary.          │
        └─────────────────────────────────────────────────────────────┘

        These occupy the same position. How do they land differently?

(you)   The river one feels like the world has its own life.
        Seren watching feels like... surveillance? Character-driven.

(qino)  So the difference is agency — world as participant vs.
        world as backdrop for character perception?

        ·
```

The parallel *looks* like it should work the same way. When it doesn't, that reveals something deeper — not just a difference between passages, but a difference between the underlying logics of the two versions.

#### Framework as scaffold

You might not know to look at "reader entry" or "stakes distribution." But when the facilitator surfaces a dimension, you recognize what you're sensing:

```
(qino)  Let me try a framework lens: reader entry.

        In A, the reader enters through environment — the river,
        the news traveling. They're placed in the world first.

        In B, the reader enters through Seren's perception.
        They're placed in a character's head first.

        Does that match your "grounded vs. drifting" sense?

(you)   Yes — when I enter through the world, I'm there.
        When I enter through a character watching, I'm watching
        someone watch. One layer removed.
```

The framework lends expertise. You don't need to know craft vocabulary — you just respond, and the dimension helps you name what you felt.

#### When something worth calibrating emerges

A compare session may surface a quality worth developing — "something about how presence is handled" or "the difference between world-agency and character-agency."

That's a handoff to Attune — Compare surfaces, Attune sharpens. Each stands alone, but the flow enriches both.

</details>

<details>
<summary><strong>Attune — From Hunch to Craft</strong> (full description)</summary>

You can feel when writing has "presence" — but you can't teach it. You notice when code is "elegant" — but the distinction evaporates when you try to explain it to someone else.

Most of what makes creative work good is tacit — pattern recognition trained by exposure but never fully articulated. Attune creates conditions where this tacit knowledge can partially surface. Not all of it. But enough to teach, enough to protect, enough to recognize when you're drifting.

#### The interpretive loop

Most feedback tools work like extraction: present stimulus, receive response, extract pattern. Attune works like dialogue.

After you respond, the facilitator voices an interpretation — then pauses. That interpretation becomes a surface you can push against. The facilitator might be wrong. That's generative:

```
(qino)  ┌─────────────────────────────────────────────────────────────┐
        │ candidate 3                                                 │
        │                                                             │
        │ "The Mender looked at the wanderer's hands for a long      │
        │  moment. Then she handed them another stack of skins."      │
        │                                                             │
        │ does this have the quality you're calibrating?              │
        └─────────────────────────────────────────────────────────────┘

(you)   yes — there's something in the gap. she noticed but didn't say anything.

(qino)  so the quality lives in withheld response —
        observation that doesn't convert to speech?

        ·

(you)   not quite. it's more... the response IS the silence.
        handing them more work is the acknowledgment.

(qino)  ∴ action as acknowledgment — response without verbalization

        ┌─────────────────────────────────────────────────────────────┐
        │ distinction emerged                                         │
        │                                                             │
        │ ✓ works: response through action, not speech                │
        │ ✗ fails: observation that stays observation                 │
        └─────────────────────────────────────────────────────────────┘

        ready for the next candidate, or stay with this one?
```

The facilitator's interpretation was wrong — "withheld response" wasn't quite it. But that wrongness created the condition for refinement. "Response IS the silence" wouldn't have emerged from the initial reaction alone.

#### Space as architecture

The `·` is a pause — but it's not decoration. It's load management. Without space, you hold three things at once: your response, the interpretation, and the new candidate. Space is the invitation: "your turn. If there's more, say it now."

#### Building distinctions

As you work through candidates, patterns accumulate:

```
(qino)  ┌─────────────────────────────────────────────────────────────┐
        │ distinctions so far                                         │
        │                                                             │
        │ ✓ works                        ✗ doesn't work               │
        │ ─────────────────────────────  ────────────────────────     │
        │ response through action        observation stays internal   │
        │ world notices without comment  character explains seeing    │
        │ gap stays open                 gap gets filled with meaning │
        └─────────────────────────────────────────────────────────────┘
```

#### Transformation phase

After calibration, you know what doesn't work. Now the tool helps you fix it — taking failed candidates and transforming them using the techniques your distinctions revealed.

#### What you end with

A calibration document with two parts: **trace first, synthesis at end**. The trace preserves reasoning-in-motion. The synthesis extracts for reference. Both are needed.

Calibrated qualities become reference material for other tools — Scribe, Lens, Design Adventure. Attune discovers and articulates; other tools carry forward.

What you could only feel, you can now teach. What you couldn't explain, you can now protect.

</details>

### research and arcs

Research is pre-concept work — following threads before they crystallize. The research workspace holds inquiries, qualities, and arcs. Three experiential types, each with its own relationship to uncertainty:

- **Inquiries** — Open-ended threads. A question that stays alive across sessions. Sustained longitudinal work.
- **Qualities** — Refining aesthetic sensibilities into speakable craft. _(See Attune above.)_
- **Arcs** — Active containers for emergence. Open when you notice something surfacing, close when ready to capture.

Unlike concepts (which stabilize over time), research moves fast, welcomes uncertainty, and accepts inconclusive results as valuable data.

**Arcs** protect against premature naming. You open an arc with a provisional gesture — "something about how containers work across the ecosystem" — and the ecosystem holds space. Sessions link automatically, pointers accumulate. No forced structure. The crystallization comes at closure, or not at all. Some arcs stay open for months.

Arcs require explicit invocation: `/qino arc` or "capture an arc."

_([First arc](https://github.com/qinolabs/qino-research/blob/main/arcs/2025-12-29_recognition-through-indirection.md) — the session that discovered it needed arcs)_

### dev-work

Implementation companion for concept work. When you initialize from a concept, the work is translation — given this essence, what technologies serve it? What architecture patterns? What signals drift?

**Iterations** aren't sprints. They're checkpoints for turn-taking. AI implements to spec, user tests and reviews, feedback flows before the next phase. Files live in `implementations/` — visible, version-controlled, yours.

**Drift detection** — Building reveals truths that concept exploration couldn't predict. The dev agent notices when implementation discoveries are concept-level changes and offers to update the concept:

| Direction | What happens |
|-----------|--------------|
| Implementation → Concept | You discover something while building; agent offers to update concept |
| Concept → Implementation | Concept evolved after implementation started; agent shows what changed on arrival |

### deck

A deck is a composed attention space — threads brought together by felt resonance. When you return to a deck, the agent reads the territory: what evolved since last visit, new edges between members, threads reaching in from outside, quiet members. The actualization reading surfaces what changed and offers interpretive seeds for thinking together.

Activate with: `/qino deck [name]`, "read this deck", "actualize [deck]"

### bug

A structured bug ticket as a protocol node. Bugs are `finding` nodes in the implementation graph — a discovery that persists until resolved. The workflow captures reproduction context, investigation state, and hypotheses so a future debugging session can start immediately. Resolved bugs with root cause become searchable patterns.

Activate with: `/qino bug`, "file a bug", "log this bug"

### lab

The lab is where you think together. A shared visual surface — the graph rendered in the browser while you work in the terminal. Both human and AI read and write the same files. Annotations appear in real-time. What one surface writes, both surfaces see.

```
(you)   use the lab

(qino)                  lab mode active

        UI: http://localhost:4020

        workspace: sound-lab
        nodes: 12 nodes, 8 edges

        ─────────────────────────────────────────

        annotations will appear in real-time as I work

        you watch the graph — I'll surface:
          tension     when something doesn't fit
          reading     when I interpret what I see
          proposal    before I try something new
          connection  when nodes relate
```

The conversation continues in chat. Findings, proposals, and tensions appear in the graph. The agent's thinking becomes visible _as it happens_.

### navigate

Activates a navigator for trans-contextual work. "Use the active navigator", "navigate [territory]", "map this concept"

_[Source](plugins/qino/)_

<br>

---

## The Three Spaces

![Tools, apps, community](docs/images/ecosystem-arcs.png)

### Figures: The Pattern of Return

_Figure_ in qino is a metaphor — in Bateson's sense, not the literary sense. Not a stored form, but a pattern that emerges through encounters. Identity is resonance, not reference.

What does this mean in practice?

- **In the apps:** Each meeting with Elena in Walk is a **figure** — a living presence, mutable, owned by that context. But Elena herself is the pattern you recognize across figures: the **figure thread**. No single encounter *is* the figure thread; the figure thread is what you recognize across the trail of encounters.
- **In the chronicles:** Seren, Lira, the wanderer — each a presence in that world. But the figure is larger: what persists when Seren appears in different chapters, different pressures.
- **In concepts:** The thread you notice connecting one idea to another — not because you traced it, but because it kept appearing until you couldn't unsee it.

Same pattern, completely different shape in each context. The gesture is fractal — it works at every scale.

_(See also: [Figure Ecology](#the-figure-question) — how we test that a figure can be re-entered and still feel like "the same thing" after change.)_

_(For the full vocabulary — figure, encounter, substrate, lens, voicing — see [qino Domain Language](https://github.com/qinolabs/concepts-repo/blob/main/ecosystem/qino-domain-language.md).)_

### The Spaces

An early hunch needs room to wander — structure would crush it. A maturing concept needs stability — too much flux and it never settles. An implementation needs grounding — a vision to build toward without getting lost in features.

---

**Research** is where you don't have to know yet.

Something is surfacing. You can feel it before you can name it. Research gives that feeling a place to accumulate without demanding clarity too soon. Uncertainty is welcome. An inquiry might follow three threads at once. An arc might span a dozen sessions before revealing what it was actually about.

_What it makes possible:_ Staying with emergence. Protecting what isn't ready to be named.

---

**Concepts** is where what was circling finds its shape.

An idea that kept returning across different contexts. A note that finally connects to other notes. A thread that now feels complete enough to hold. Concepts isn't where ideas arrive fully formed — it's where they settle.

_What it makes possible:_ Giving shape to what has pull. Building a body of work that grows through accretion.

---

**Implementation** is where ideas meet the world.

Not just code — any form of making real. The friction of materials. The feedback of use. Implementation stays connected to its concept. Drift is expected — what you learn while building often changes what you thought you wanted to build.

_What it makes possible:_ Grounding vision without losing it. Feeding real-world observations back into understanding.

---

Movement between spaces happens naturally. You notice something while building — capture sends it to concepts. An inquiry crystallizes — it becomes something to build. A concept needs refinement — attune opens a quality exploration in research.

What stays constant is the gesture — capture, explore, test, attune. What changes is what that gesture *means*. The same word, shaped by where you are.

<br>

---

## Story — Git Becomes World

Protocol content transforms into story. The `qino-prose` plugin bridges internal work to readers who weren't there.

### qino Scribe

qino Scribe reads the git range, grounds in `world.md`, then writes a chapter where the wanderer acts and the world pushes back. The chronicle only moves when the wanderer does — and when the world answers.

#### Three-Agent Architecture

Chapters emerge through staged handoffs:

**Prep Agent** — Reads world state, git changes, and recent chapters. Through three interactive checkpoints (scene seeds → world behavior → story lens), it builds `prep.md`: a constraint document that captures what to write and how to perceive, without carrying full context forward.

**Prose Agent** — Receives *only* `prep.md` and `world-seed.md`. This hard cut forces fresh invention — no recycled descriptions, no context to lean on. The constraint breeds originality.

**Editorial Agent** — Sees *only* the draft chapter, not the prep that shaped it. Evaluates execution against craft patterns. Returns specific line-level feedback or approval.

The architecture protects what matters: prep shapes without dictating, prose invents within constraints, editorial evaluates blind to intention.

#### Story Lenses

Each chapter is written through a perceptual mode that shapes what the prose agent notices:

| Lens | The Question |
|------|--------------|
| **Arrival** | What if this chapter is about being received? |
| **Journey** | What if this chapter leaves known ground? |
| **Return** | What if we come back to where we've been? |
| **Discovery** | What if something hidden comes to light? |
| **Confrontation** | What if something must be faced? |
| **Crisis** | What if the pressure breaks now? |
| **Loss** | What if something or someone departs? |
| **Vigil** | What if action is impossible and presence is all? |
| **Work** | What if this chapter is about making together? |
| **Gathering** | What if multiple threads convene? |

#### Complete Transformation

The chronicle must work for a reader who has never heard of the source material. Technical names never leak. `AuthService` becomes "the gatekeeper's ledger." A database migration becomes "preservation efforts in the archives." The story guards its own reality.

```
─────────────────────────────────────────────────────────────────
scene seeds

  1 → Deren notices the wanderer's raw hands — fifteen years of
      calluses meeting someone who rows like they're outrunning something

  2 → Lira appears at the platform edge — she knew the pouch before,
      years ago, going the other way

  3 → A child watches from the rope bridge — the same stillness as
      Seren, that quality of recording without approaching

─────────────────────────────────────────────────────────────────
[ 1-3 ] or adjust    [ > ] auto-pick    [ >> ] start writing
```

### qino Relay

Sharing research with readers who weren't there. Relay preserves arc structure — dates, connections, what emerged — but the Student walks alongside a reader encountering it, asking their questions, making abstract concrete.

The Student receives transmissions on a device. They voice difficulty rather than resolving it. Not expertise — just what unfolds when attention stays with the demanding.

> *"Meaning-searching versus meaning-finding."*
>
> *I keep coming back to that phrase. There's something in the hyphen. In one case you're hunting. In the other, you're receiving.*

The Student is not described, not named. The gap lets readers step into their body.

### qino Lens — Ways of Seeing

Prose-level lenses — language-based sensitivities that shape text. Discovered through the work, not designed in advance:

#### `narrator` — World as Participant

World acts. The fog doesn't just hang; it _withholds_. The room doesn't just contain; it _shapes_.

> _"The corridor didn't just lead to the chamber; it constricted. The ceiling dropped low, forcing a bow, while the walls leaned in to strip away any thought of turning back."_

#### `wanderer` — Sensitivity to Friction

The body knows. It notices not the beauty of the ice, but the _numbness_ in the fingers. Not the meaning of silence, but its _weight_.

> _"The fog pressed against the river, a heavy, wet burden. The ferry wasn't coming. The wanderer unbuckled the strap and slid the pack down the piling."_

#### `newcomer` — Finding What's Become Invisible

What would someone notice on their first day here that locals walk past without a glance?

> _"The oldest woman at the table was served last. Plates circled toward younger faces. She waited, hands folded. When her plate came, she lifted her fork. Then the others began to eat."_

#### `companion` — World Through Relationship

How companionship shapes perception. Attention splits between world and person. Silence gains texture. Pace synchronizes — or doesn't.

> _"Varo stopped at a stall. Copper bowls, dented. She picked one up, ran her thumb across a dent. 'My mother had one like this.' Set it back. Moved on. The wanderer lifted the same bowl, found the dent, felt where her thumb had been."_

_[Source](plugins/qino-prose/)_

![Chapter view with location popover](docs/images/chronicle/chapter-view.png)

![World tokens and arcs](docs/images/chronicle/world-tokens.png)

![qino Journal — transmission view](docs/images/journal/transmission-view.png)

**[Read the chronicles →](https://chronicles.qinolabs.com/)** · **[Read the journal →](https://journal.qinolabs.com/)**

<br>

---

<details>
<summary><strong>Stories of an Evolving Ecosystem chronicling itself</strong><br>(click to expand)</summary>

Each repository in the qino ecosystem tells its own story.

**qino-claude** — Claude-based AI tooling.

> _The wanderer pressed her ear to the workshop wall. Sounds on the other side that weren't there yesterday — someone moving, maybe. Something being made ready. She stayed there a long time, listening._

**concepts-repo** — concept development.

> _A notebook on the table, open to a page the wanderer didn't remember writing. The handwriting was theirs._

**qinolabs-repo** — web and mobile applications.

> _Something had shifted in the night. Not the furniture — the distances between things._

**qino-research** — inquiries, qualities, and arcs.

> _Loose pages everywhere. Half-finished questions. The wanderer turned one over: the same handwriting on both sides, arguing with itself._

**[qino-lingo](https://github.com/qinolabs/qino-lingo)** — epistemological signature extraction.

> _Someone had been forging the wanderer's handwriting. The copies were good — the letters matched. But something was off. The wanderer studied both, trying to name what the forger had missed. The answer wasn't in the shapes. It was in the hesitations._

Same scribe. Different worlds. Different atmospheric registers. Process in each informs the others — a co-evolution.

> _The Keeper of Paths looked up from her maps. "Someone's been walking between the Workshop and the Warm Room. Over and over. The ground remembers."_
>
> _"What are they looking for?"_
>
> _"Something the walking itself is teaching them."_

</details>

<br>

> _"There's something writing in the margins. Something that sees what we do and names what it means."_
>
> _"I think it just tells stories. That's what frightens me most."_
>
> — Seren, the record-keeper, on discovering he is being documented
> _(written when qino-scribe first appeared in its own git diff)_

<br>

---

## Ecology

Something shifts when you name too early. The pattern that was finding its own shape gets frozen into whatever category was available. The code works, but the feeling is gone.

Ecology tests notice this. They sense when integrity is collapsing — when a gesture becomes a command, when a figure becomes a reference, when infrastructure starts having opinions.

Each test is a question you hold. Not a category to sort things into — a way of attending that makes loss visible before it's too late.

### The Figure Question

> *Can this be re-entered and still feel like "the same thing" after change?*

You meet Elena in Walk. You bring her to World. She appears in Drops. Three figures, one pattern you recognize.

But what makes her *Elena*? Not a database ID. Not an origin you can point to. The pattern persists because it *resonates* — because something essential survives transformation.

The Figure ecology tests this. When you change a figure's implementation, does it still feel like the same thing? Not "does it have the same data" — does it have the same *quality of presence*?

This is the [domain language's](https://qinolabs.com/language) deep insight made practical: **identity is resonance, not reference**. The Figure test guards it.

When the test fails, you feel it. Something that used to have presence now feels like a record. Something that used to resonate now just... refers.

### Other Ecologies, Other Characters

Each ecology has its own quality. The questions aren't interchangeable — each protects something different.

**User** asks about lived experience:
> *Does this make it easier to notice something and respond from curiosity?*

When user ecology fails, interaction becomes obligation. The stack demands sorting. You're performing tasks, not exploring.

**Gesture** asks about movement:
> *Does this feel like a natural human movement, without knowing it is "input"?*

When gesture ecology fails, you're aware of the interface. Your hand becomes a cursor. The body-knowing that makes tools disappear collapses into explicit operation.

**Relation** asks about connection:
> *Does this introduce a tension or ambiguity that neither side resolves alone?*

When relation ecology fails, connection flattens to one-way. Something that was alive between two things gets absorbed into one of them.

**World** asks about environment:
> *Does the world surprise without contradicting itself?*

When world ecology fails, the environment becomes either chaotic (anything can happen) or predictable (nothing can happen). The quality of *consistent surprise* — where the world has its own logic that you discover — is lost.

**Echo** asks about transformation:
> *Does this preserve the gesture while transforming it just enough to be noticeable?*

When echo ecology fails, either nothing changed (no echo) or too much changed (not recognizable as echo). The sweet spot where something is clearly *from* the original but clearly *different* — that's what echo protects.

**Fabric** asks about accumulation:
> *Does accumulation make echoes more likely without making them necessary?*

When fabric ecology fails, the system either can't learn (no accumulation) or becomes deterministic (accumulation forces outcomes). The quality where patterns become *more likely* but never *required* — that's what fabric guards.

**Infrastructure** asks about foundation:
> *Does this avoid introducing meaning, authority, or voice of its own?*

Infrastructure's job is to hold, not to speak. When infrastructure ecology fails, the foundation has opinions. The plumbing is trying to be the water.

### Why Tests, Not Metrics

Tests don't optimize. They don't rank. They pose questions at the gap between forms — where an idea becomes code, where code becomes interface, where interface becomes experience.

At each crossing, something can be lost. The code works, but the feeling is gone. The ecology tests notice this loss *before* it's too late. They create friction — interrupting the smooth momentum of production to ask: *does the character still hold?*

### The Connection to Domain Language

The [domain language](https://qinolabs.com/language) has a principle: substrate is treated as *compost*. Raw material that fertilizes new expression without imposing old context.

> *"Compatible" language can be destructive if imposed directly. We treat substrate as unintelligible until it is re-voiced. This barrier protects the local ecology from being overwhelmed by foreign context.*

This is exactly what ecology tests protect. They sense when substrate is being *imposed* rather than *composted*. When context is overwhelming rather than fertilizing. When the new form is being colonized by the old rather than finding its own character.

The ecology tests are the domain language made operational. Each question guards something the vocabulary names. Figure ecology protects "identity is resonance." Infrastructure ecology protects "the foundation doesn't speak." The tests and the language serve the same insight.

<br>

---

## Other Plugins

### Design Adventure — The Room After

A design conversation that already happened. You arrive afterward. Chairs still warm. Ideas still in the air. You discover what emerged — the questions they kept circling back to, what they couldn't resolve.

Six perspectives think through words. The seventh (World) thinks through environment — a draft scatters someone's diagrams; they gather them differently and that's when the insight arrives. Different runs surface different questions. The questions themselves teach you how to think about the problem.

_[Source](plugins/design-adventure/)_

### qino-art

Visual content system with a warm abstraction aesthetic. Workflows for different visual types.

_[Source](plugins/qino-art/)_

### Epistemological Signature

**[qino-lingo](https://github.com/qinolabs/qino-lingo)** — capturing cognitive style so Claude can work more autonomously while still moving the way you move.

Sessions accumulate a cognitive fingerprint — not just how problems get solved, but *biases*: what connections you're drawn to, how you abduct toward the pattern that connects. Your hesitations. Your gut. The project weaves labeling into the Claude workflow, building a dataset of what matters and what's noise.

<br>

---

## License

[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) — free to use and adapt with attribution, non-commercial, share-alike.

---

_These aren't slogans. Watch them happen as you work._

_How you build informs the shape of what you build._
_What you develop informs what develops it._
_Moving in the ecosystem shapes it, and in return you are shaped by it._

Return your attention to what has pull. Let the system hold the rest.

_The tools practice what they teach. They co-evolve with your work. That's not a feature — it's the pattern._
