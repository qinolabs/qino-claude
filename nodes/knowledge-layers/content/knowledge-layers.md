# Knowledge Layers

Where durable knowledge lives across the qino workspace, what each layer is for, and the audit practice that keeps content in the layer where future readers will look for it.

Distilled from the 2026-04-08 memory audit, which found that principles crystallized in late March had been caught by Claude Code auto-memory rather than absorbed into the qino-protocol graph — invisible to anyone browsing the ecosystem through its normal surfaces.

---

## The five layers

| Layer | Scope | What it holds | Failure mode |
|---|---|---|---|
| **Claude Code auto-memory** | This user's Claude Code sessions only | Interaction-pattern feedback, ephemeral project state, references to external systems | Crystallizes durable content that should have been promoted |
| **CLAUDE.md files** | Whichever repo the file lives in | Orientation, commands, repo-level conventions, pointers into the graph | Stale state (counts, iteration numbers) that should be derived from the filesystem |
| **`.claude/rules/`** | Whichever repo the file lives in | Always-loaded code/style rules that shape how Claude writes code in this codebase | Principles that belong in the protocol graph because they describe *what* the ecosystem is, not *how* to write code for it |
| **qino-protocol graph** | Cross-repo, addressable, navigable | Concepts (vision, domain language, design principles), implementation notes (story + content + iterations), research, references | — (this is the layer everything else should promote into when it matures) |
| **`qinolabs-repo/snippets/`** | Handover artifacts | Reusable setup guides, onboarding docs, shareable explainers | Drift from current reality when the underlying system changes |

Each layer has a scope it serves well. The failure mode in any given layer is content that should have moved to a different layer by now.

### Layer 1 — Claude Code auto-memory

Auto-memory is designed for things Claude needs to remember *about working with this user*, not things the *ecosystem* needs to remember. Good memory entries: "user prefers iteration files over plan mode," "don't frame qino as a platform," "qino-evaluation is not a git repo." Bad memory entries: the architecture of a pipeline, the design principles behind a concept, a four-dimensional craft framework — those are content that the rest of the ecosystem will also need.

The asymmetry is discoverability. Auto-memory is invisible to any process that isn't the current Claude Code session. Nothing in the viewer shows it. No `search_nodes` call finds it. No other agent sees it. When a principle lives only in memory, the rest of the ecosystem is blind to it.

### Layer 2 — CLAUDE.md files

Each repo has a CLAUDE.md that orients an agent to that repo: commands, structure, conventions, entry points. The workspace root `CLAUDE.md` orients across repos. App-level `CLAUDE.md` files add domain context for that app.

CLAUDE.md is always loaded. That makes it powerful for durable orientation, but it also means changing state (iteration counts, "we are currently working on X") becomes load-bearing noise. The rule: CLAUDE.md holds things that don't change, or that should be derived from the filesystem when asked. Not a status board.

### Layer 3 — `.claude/rules/`

Rules files scope-load based on path or load on startup. They carry the *how* of writing code in this codebase: TypeScript conventions, Tailwind setup, TanStack Router patterns, error handling. An agent can consult them as reference without polluting the conversation context.

The test for whether something belongs in a rule vs the protocol graph is: *does this describe what the ecosystem is, or how to write code that fits into it?* A principle like "figures are local; figure threads are cross-modality identity patterns" describes what the ecosystem is — that belongs in concepts. "Use `??` instead of `||`" describes how to write code — that belongs in rules.

### Layer 4 — The qino-protocol graph

The graph is the durable layer. It is addressable, navigable, cross-repo, and visible through the viewer. Content here accumulates value over time because every session can find it.

The graph has internal structure:

- **Concepts** (`qino-concepts/concepts/`) — vision, domain language, ecosystem design principles, patterns carry assumptions. The *what* and *why* of the ecosystem.
- **Implementations** (`qinolabs-repo/implementations/`) — each app is a node. `story.md` holds the technical context; `content/` holds iteration files AND non-iteration content (design principles extracted from iterations, cross-app architecture, settled patterns).
- **Docs** (`qinolabs-repo/implementations/docs/`) — cross-app architecture and patterns. Not app-scoped.
- **Research** (`qino-research/`) — investigations, technical writing.
- **References** (here, in `qino-claude/`) — like this node. Meta-work about the ecosystem itself.

The distinction inside implementation `content/` is important. Iteration files (`NN-descriptive-name.md`) are artifacts of work done — they capture why a change happened and what was learned, but they are tied to a specific moment. Non-iteration content files are durable: they hold principles, frameworks, and learnings that survive being lifted out of the iteration that produced them. When an iteration produces a learning that generalizes, the learning should be promoted into a content file that does not carry the iteration number in its name.

### Layer 5 — `snippets/`

Reusable handover artifacts that need to live outside the graph because they are sent to collaborators who don't have access to it. Setup guides, explainers, onboarding flows. Check here before writing a new shareable artifact.

---

## The failure mode: crystallization buffer

The 2026-04-08 audit found auto-memory had accumulated content with this pattern: a learning was captured during a session as a memory entry (legitimately — the session was mid-work, the insight was fresh, and memory was the closest durable layer). But the promotion step — moving the learning into the graph where future sessions could find it — never happened. Memory became an unintended crystallization buffer.

Five principles were caught that way:

- The four dimensions of metalogue prose craft (register, peripheral atmosphere, Student in motion, dialogue curation) lived in `feedback_metalogue_prose_quality.md` — invisible unless the exact file was recalled by name.
- The harness-layering framework (CLI → protocol → SDK, build in that order) lived in `feedback_eval_harness_layering.md` — while the iteration that produced it (`06-agent-sdk-evaluation-harness.md`) was already in the graph, the generalizable principle wasn't.
- The perception-not-vocabulary principle for epistemic register design lived in `feedback_perception_not_vocabulary.md`.
- The figure-sensitivity mutual-learning principle lived in `feedback_figure_sensitivity.md`.
- The cross-modality insight flow principle lived in `feedback_cross_modality_insight_flow.md`.

Each had the same shape: the principle was real, durable, and cross-session — but it was not where future sessions would look for it.

### Why this happened

Memory is the closest layer when a learning first appears. It is one write call away. Promoting a principle to a concept or implementation content file requires deciding where it goes, choosing a filename, writing a longer-form version of the learning, and often updating the index or neighboring files. The friction gradient points toward memory.

The gradient is fine if there is a regular audit that walks the accumulated memory and promotes what has matured. Without that audit, memory becomes the default terminus rather than the staging area.

---

## The audit methodology

The 2026-04-08 audit followed this sequence. It is documented here because the next audit can follow the same steps.

### 1. Inventory

List every memory file and classify each one:

- **Interaction pattern** — belongs in memory (e.g., "user prefers iteration files over plan mode")
- **Ephemeral project state** — should be deleted, not promoted (e.g., "currently working on iteration 62")
- **Reference to external system** — belongs in memory (e.g., "pixel-bg favorites list")
- **Durable principle** — candidate for promotion
- **Duplicate** — already exists in a durable layer, delete from memory

### 2. Temporal diagnostic

For each candidate for promotion, compare the memory file's mtime against the git log of the target node or concept. If the target has been updated *since* the memory was written and the memory content is not reflected there, the content never got promoted. If the target predates the memory, the memory may be the primary record and promotion is the right move.

This is the step that catches the crystallization buffer pattern.

### 3. Target selection

For each promotable principle, decide which layer it belongs in:

- **Domain language, design principles, ecosystem vision** → concepts
- **Cross-app technical architecture** → `implementations/docs/content/`
- **App-scoped principles extracted from iterations** → that app's `content/` as a non-iteration file
- **Code/style rules** → `.claude/rules/`
- **Handover artifacts** → `snippets/`

The decision hinges on scope. If the principle speaks to one app, it goes in that app's implementation node. If it speaks across apps, it goes in docs or concepts. If it speaks to writing code in this codebase, it goes in rules.

### 4. Content-directory inspection

Before writing a new content file, read every existing content file in the target node's `content/` directory. Duplicate content is the worst outcome — two files saying the same thing in slightly different words. Either extend an existing file or confirm the new file covers distinct ground.

### 5. Cross-reference loops

When a principle is extracted from an iteration, update the iteration file to point at the new durable content file. The iteration keeps the operational detail (the specific drift catches, the calibration runs, the example-by-example rewrites); the new file holds just the generalizable principle with a back-reference to the iteration as the originating artifact. Future readers can enter from either direction.

### 6. Memory cleanup

Delete the promoted entry from memory. Update `MEMORY.md` to remove the pointer. Leave behind only the narrow interaction-pattern feedback that memory is actually for.

### 7. Graph absorption

Create a meta-node (like this one) that references the promoted content. Add cross-graph edges from the meta-node to each target. Write `connection` annotations on each target pointing back to the meta-node. This closes the loop: the methodology is discoverable from the content it produced, and vice versa.

---

## Signals that another audit is due

- Memory has grown past twenty or thirty files.
- You find yourself writing to a memory file and the content is longer than a few sentences.
- A new collaborator or agent asks where a principle lives and you realize the answer is "it's in my memory."
- A concept or implementation node has no recent content additions but the work on its topic has continued.
- An iteration file has grown a "Learnings" section that could be lifted into its own content file.

---

## Related

- `qino-claude:knowledge-layers` (this node)
- `qinolabs-repo:dialogue-quality` — holds `perception-not-vocabulary.md`
- `qinolabs-repo:agentic-substrate-inquiry` — holds `figure-sensitivity-mutual-learning.md`
- `qinolabs-repo:docs` — holds `ecological-state-interfaces.md`
- `qinolabs-repo:evaluation-loop` — holds `harness-layering.md`
- `qinolabs-repo:metalogue-writing-pipeline` — holds `pipeline-design-learnings.md` and `prose-craft-dimensions.md`
- `qino-concepts:ecosystem-design-principles` — holds `cross-modality-insight-flow.md`

Each of these nodes carries a `connection` annotation pointing back to this methodology node.
