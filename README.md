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
/plugin install speech@qino-claude                  # Read responses aloud (macOS)
```

Updates happen automatically when you run `/plugin marketplace update`.

**Set up your workspaces:**

Most projects need more than one workspace from the start. The skill guides you through setup, offering project shapes that create the right constellation:

| Shape | Workspaces created |
|-------|--------------------|
| **minimal** | Concepts only |
| **standard** | Concepts + implementations |
| **full** | Concepts + research + implementations |
| **custom** | You choose |

Each workspace is seeded from an **archetype** that provides the right node types, colors, and usage hints for its role:

| Archetype | Purpose | Node types |
|-----------|---------|------------|
| **research** | Open-ended inquiry | inquiry, finding, session, reference |
| **concepts** | Vision and design | app, tool, ecosystem, capture |
| **implementation** | Building software | app, package, tool, infra, reference |
| **evaluation** | Quality assessment | evaluation, comparison, simulation, snapshot |
| **general** | Flexible starting point | reference, exploration |

The skill detects existing structure and offers to enhance it. Workspaces evolve their own vocabulary over time — add types, adjust colors, refine hints. The config teaches future agents what belongs here.

**qino-os** starts automatically when the plugin loads. It's the active environment that makes the protocol alive — providing agents with graph tools to read and write nodes, edges, and annotations, while giving humans a visual surface at `http://localhost:4020` to see the same graph the agent sees. The filesystem becomes a shared medium.

**Just talk to it.** The qino skill routes from natural language — you don't need to remember commands:

```
"what's here?"                          → orientation (home)
"capture this thought"                  → capture workflow
"explore [concept-name]"                → explore a node's neighborhood
"what's next for [app]"                 → dev workflow
"what evolved in my deck?"              → actualization reading
"start research on [topic]"             → research workspace
"use the lab"                           → lab mode (graph + terminal)
```

Slash commands (`/qino home`, `/qino deck [name]`, `/qino bug`) exist as shortcuts, but natural conversation is the primary interface. The skill reads your intent and context.

<br>

---

## The Protocol

The qino-protocol is what you work _in_, not what you _use_. It defines a universal file-based structure for human-AI workspaces — a medium where nodes, edges, annotations, and signals carry the thinking.

**qino-os** cultivates this medium. It provides MCP tools that let agents create nodes, write annotations, and trace edges — and a browser viewer where humans see the same graph. But its deeper role is environmental: type hints teach agents what kinds of nodes belong in each workspace. Soft warnings guide without blocking. Workspace config becomes shared vocabulary between human and agent. The filesystem doesn't just store a knowledge graph — it becomes a self-regulating ecosystem where structure emerges from use and coherence increases through practice.

You don't need to think about this structure. What you interact with is the thinking, not the files. You say "I've been thinking about X" and the agent finds the node, reads its neighborhood, surfaces what's changed. You explore a concept and the agent notices a tension with something in a neighboring workspace — it writes that as an annotation. You're working on an implementation and a connection to a research finding surfaces without you asking.

This happens because the system gives the agent peripheral vision at every step. The graph, the config, the annotations — they're all visible to the agent, all the time. Proposals, tensions, and connections surface naturally through this awareness. The practice feels less like managing a knowledge base and more like thinking alongside someone who remembers everything and notices what you missed.

### The Medium

Every workspace shares the same shape:

```
workspace/
  .claude/qino-config.json     # Workspace identity and vocabulary
  graph.json                   # Nodes and edges — the visible structure
  nodes/
    {node-name}/
      node.json                # Identity (title, type, status, edges)
      story.md                 # The impulse — what this node IS, in a breath
      content/                 # Developed material
      annotations/             # Agent signals attached here
```

A concept workspace and an implementation workspace look the same structurally — nodes, edges, annotations. What differs is the **vocabulary**: each workspace defines its own grammar of types, and that grammar shapes what the space holds.

```
# A concepts workspace might declare:
types: concept, capture, ecosystem, facet

# A research workspace might declare:
types: inquiry, finding, session, quality

# An implementation workspace might declare:
types: app, package, infra, tool
```

Types are not fixed. Workspaces grow their own as work reveals what's needed. The workspace config declares what types are available, with hints that teach agents when to use each one — `"use inquiry for open questions"`, `"use finding for settled insights"`.

**Nodes** carry identity (who it is), impulse (why it exists), content (what it holds), and annotations (what's been observed about it). A `deck` composes threads by felt resonance. A `capture` holds a thought before it's ready for structure. A `session` records bounded work. The type gives the node its role; the workspace gives the type its meaning.

**Edges** are meaning carriers, not just links. Each edge has a label and a context sentence — the label is a short phrase, the context explains _why_ the relationship exists. Both are free-form:

```json
{
  "to": "ecosystem-design",
  "label": "coherence frontier",
  "context": "Calibration revealed coherence as the next architectural frontier"
}
```

There are no enforced edge types. The meaning lives in how you name the relationship: "coherence frontier", "mesh participant via CLI", "data model shapes props." The label captures the insight; the context preserves the reasoning.

**Affordances at every level:**
- **File level** — Human and agent both read and write the same files. `story.md` is editable by hand; the agent creates and reads it through MCP tools. Same files, different entry points.
- **UI level** — Human navigates the graph visually at `localhost:4020`; agent embeds deeplinks in chat. Same destination, different paths.
- **Protocol level** — Structure scales organically. Add a node, the graph grows. Nest a graph inside a node, sub-structure emerges. No migrations, no schema changes.

### Signals

As the agent works, it leaves signals on nodes — observations that accumulate in the graph's margins:

- **tension** — something doesn't sit right. Surfaces prominently in the UI.
- **proposal** — a concrete suggestion, awaiting your response.
- **connection** — a noticed link to another node or concept.
- **reading** — an interpretation. Collapses by default; there when you want it.

These aren't reports you asked for. They're what the agent notices while doing other work — the peripheral vision made visible. Open the graph viewer and the agent's thinking is there, attached to the nodes it touched.

### Workspace as Environment

The workspace config (`.claude/qino-config.json`) is more than settings — it's how the workspace teaches its visitors. Each workspace declares:

- **Types** with colors and hints — "use `inquiry` for open questions, `finding` for settled insights"
- **A workspace color** that tints the UI — visual identity at a glance
- **Status treatments** — composted nodes fade; active nodes stay prominent

When an agent creates a node with an unrecognized type, qino-os doesn't block it — it returns a hint suggesting the type be added to config. Guidance, not enforcement. Over time, the workspace accumulates a vocabulary that reflects how it's actually used. New agents arriving in fresh sessions read this config and immediately understand what belongs here.

This is the pattern: structure that enables growth without prescribing it. You don't manage the system — you participate in it. Nodes compost naturally when their energy fades. Types evolve as work reveals what's needed. Annotations age into the graph's memory. The ecological design absorbs complexity rather than asking you to organize it.

![qino-lab root view — workspaces, sessions, and signals](docs/images/lab/qino-lab-root.png)

![Graph view — nodes connected by edges](docs/images/lab/qino-lab-graph.png)

![Rich node detail — story content, agent signals, and journal](docs/images/lab/qino-lab-rich-node-detail.png)

<br>

---

## Working in the Practice

You don't invoke gestures by name. You talk — "what's next for qino-world," "I've been thinking about this pattern," "what evolved in my deck?" — and the skill reads your intent, finds the right workspace context, and shapes its response accordingly.

Behind this, a small set of underlying patterns do the work:

**Orientation** — When you arrive, the system reads recent activity, open annotations, and workspace state. It shows what's here without pushing. You don't ask for a dashboard; you just start talking and the context is already there.

**Exploration** — When you turn toward a node, the agent reads its neighborhood: story, content, edges, annotations. It follows what carries energy. Tensions from prior sessions surface. Connections to other workspaces appear. The conversation develops the node.

**Capture** — When a thought needs holding, the system creates a lightweight node — just identity and a story. No edges, no content directory. The thought is in the graph, addressable, but free of premature structure.

**Development** — When you're building, the dev agent reads the implementation graph, checks concept edges for drift, and works in iterations. If building reveals something concept-level, it offers to update the concept. If the concept evolved since you last built, it shows what changed.

**Actualization** — When you return to a deck, the agent reads the territory and surfaces what evolved: new annotations, new edges between members, threads reaching in from outside. The reading is temporal ("three weeks since your last visit"), interpretive (framed as questions), and grounded in specific changes.

These patterns compose naturally. You're exploring a concept and a development question surfaces — the agent shifts. You're building and a research connection appears — it writes an annotation. You don't switch modes; the system follows where the work goes.

### Deck — Composed Attention

You notice three threads keep appearing together — a concept from research, an implementation pattern, a half-formed question. You don't need to resolve why they belong together. You compose them into a deck — the unresolved connection is the starting point, not a problem to solve.

A deck is a **composed attention space**. The composition intent — _why these threads together?_ — is the seed. It might be a hunch. It might be wrong. The deck holds that uncertainty and turns it into possibility.

When you return, the agent reads the territory and surfaces what evolved:

- New annotations on members — someone (human or agent) noticed something
- New edges *between* members — the graph confirming your intuition
- "Reaching-in" threads — nodes from outside that grew connections into your territory
- Quiet members — threads that haven't moved, which is itself information

Decks supersede two earlier concepts: **navigators** (retired — top-down orientation documents) and **views** (dormant — agent-curated graph subsets). Where those imposed structure from above, decks grow from the practitioner's felt sense upward.

_This is experimental and evolving. Draft mechanics, promotion to graph nodes, and actualization readings work. The frontier: seeding qino-world experiences from deck compositions — a bridge from composed attention to lived encounter._

### Deep Work — Compare and Attune

Two capabilities for perceiving difference. Both follow Bateson's principle: _information is a difference that makes a difference_.

**Compare** places two versions side by side — the facilitator navigates, the framework lends expertise, you just respond. The parallel mirror pattern finds structural equivalents across versions and asks why they land differently. You don't need craft vocabulary; the framework supplies the dimensions, you supply the perception.

**Attune** refines a tacit quality into teachable craft. You can feel when writing has "presence" but can't explain it. Through iterative calibration against candidates, the facilitator interprets, you push back, and distinctions emerge from the productive wrongness of the interpretations. What you end with: a calibration document where what you could only feel, you can now teach.

_Both are being revisited for deeper integration with the graph — imagine attune pulling candidates from across the workspace, or compare placing two nodes' neighborhoods side by side._

### Also Available

**Research** — Creates inquiries in the research workspace. **Arcs** track emergence across sessions. **Bug** creates finding nodes with reproduction context. **Lab** activates graph-mediated work — annotations appear in the viewer as the agent works.

_[Source](plugins/qino/)_

<br>

---

## The Ecosystem

qino-claude is the tooling layer of a larger ecosystem. The protocol and plugins live here. But the work they carry extends into apps, writing, and a domain language that has its own depth.

### Co-evolving Contexts

The qino-protocol is a permaculture practice — designed for thinking that lives across contexts. Research, concepts, implementation, evaluation — these aren't stages in a pipeline. Each space creates the conditions for the others to evolve. The protocol makes this mutual evolution concrete through cross-workspace edges. An idea doesn't belong to one space; it moves, and each crossing changes it.

Building an app reveals a concept-level truth — an edge connects the insight back to the concept it came from. Research holds uncertainty long enough for a pattern to emerge — and that pattern seeds what gets built. Evaluation observes the ecosystem's output — and its findings reshape how research asks questions. Implementation grounds vision in friction — and that friction teaches concepts what they didn't know about themselves.

The workspace archetypes seed different relationships to this uncertainty:

**Research** is where you don't have to know yet. An inquiry might follow three threads at once. Vocabulary: `inquiry`, `finding`, `session` — built for accumulation without premature clarity.

**Concepts** is where what was circling finds its shape. Vocabulary: `app`, `tool`, `ecosystem` — for things that have enough gravity to hold.

**Implementation** is where ideas meet the world. Drift is expected. Vocabulary: `app`, `package`, `infra` — for things being made real.

**Evaluation** is where the ecosystem observes itself. Vocabulary: `evaluation`, `comparison`, `simulation` — for assessing quality and tracking what works.

The same patterns (capture, explore, develop, attune) work across all spaces. What changes is what they *mean* in each context.

### The Broader Ecosystem

The apps — World, Walk, Drops, Chronicles — are where the protocol's ideas become lived experience. Figures emerge as living presences in those modalities. A [domain language](https://qinolabs.com/language) names what happens there: encounter, substrate, lens, voicing, crossing, awakening.

The tooling layer and the app layer are integrated. Concepts developed in a workspace can seed a world. Insights from play feed back into research. Decks can bridge from composed attention to lived encounter. The protocol is the connective tissue — not just carrying information between contexts, but enabling them to teach each other.

<br>

---

## Story — Writing Devices and Qualities of Attention

The `qino-prose` plugin is where the ecosystem's writing practice developed. Scribe (git → chronicle), Relay (research → transmission), and Lens (qualities of attention) explored how protocol content becomes story.

These tools are evolving into **metalogue** — a writing pipeline where chapters choose from available devices based on what the material demands. Two writing devices carry the practice:

**The wanderer** notices what unfolds when attention stays present with consequence — the weight lifting when the pack comes off, the cold lingering on a glove. **The Student** voices difficulty rather than resolving it — stopped by a turn of phrase, sitting with what can't yet be resolved. Both create entry points: invitations into a quality of being the reader recognizes as possible for themselves.

**Lenses** are language-based sensitivities that shape what writing notices — `narrator` (world as participant), `wanderer` (sensitivity to friction), `newcomer` (finding what's become invisible), `companion` (world through relationship). Discovered through the work, not designed in advance.

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

**qino-lingo** — epistemological signature extraction.

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

The ecosystem guards against this through **ecology tests** — questions you hold while building. Not metrics. Not categories. Ways of attending that make loss visible before it's too late.

> **Figure:** *Can this be re-entered and still feel like "the same thing" after change?*
> **Gesture:** *Does this feel like a natural movement, without knowing it is "input"?*
> **Infrastructure:** *Does this avoid introducing meaning, authority, or voice of its own?*

That last question — infrastructure — is what qino-os practices. Type hints guide without enforcing. Soft warnings don't block. Config is vocabulary, not prescription. The foundation holds without speaking.

The full ecology (Figure, User, Gesture, Relation, World, Echo, Fabric, Infrastructure) is described in the [domain language](https://qinolabs.com/language). Each question protects something different. Together they create friction — interrupting the momentum of production to ask: *does the character still hold?*

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

### Speech — Listen to Your Ecosystem

`/speech` reads Claude's last response aloud using macOS native text-to-speech. It strips markdown, summarizes code blocks, and speaks the result through your system voice.

A small thing that changes the rhythm of work. You run a research session, ask for a deck actualization, or read a node's neighborhood — then `/speech` and go make breakfast. The ecosystem's findings arrive while your hands are elsewhere. Uses the `say` command built into every Mac — no API keys, no network calls, no setup.

_[Source](plugins/speech/)_

### qino-lingo

Conversation corpus explorer — search, analyze, and discover material from conversation archives.

qino-lingo gives the agent access to full conversation data: searching across sessions, reading cleaned exchanges, extracting thinking patterns, annotating findings. It identifies metalogue-quality conversations — sessions where something genuinely shifted — and can build training data that preserves cognitive style.

The agent can notice patterns across your conversation history, surface connections you didn't see, and ground research in actual data rather than manual capture.

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
