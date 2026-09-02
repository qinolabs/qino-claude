# Template Guidance

How to use the iteration template to capture learnings through colocation — learnings live where the work happens, no separate systems to maintain.

*This is the prose companion to `templates/iteration-template.md` and `disciplines.md`. It covers the iteration shapes and the `## The story` discipline; the authoritative filing rules (where an iteration files, `## The story` as load-bearing, `touch_node` stamping, spine-vs-pointer) live always-in-context in the workspace-root `CLAUDE.md`.*

## Three iteration shapes

Three iteration shapes have emerged in practice. The shape is descriptive — *let the work earn the structure*. Don't impose a heavyweight shape on a small change.

### Feature iteration

The lightweight shape — building a new capability, checking off concrete goals (Scope / Goals / Test / Technical Decisions / Learnings). Suitable for: small new features, bug fixes with non-trivial design, UI work with clear acceptance criteria.

Even feature iters carry `## The story` at the top — see below. Story scales down (a paragraph is enough for a small feature) but doesn't disappear.

### Refactor / compression / extraction iteration

Where byte-equivalence and grep-driven gates carry the work. Grows toward a richer shape: Stage 0 baselines, Premise-check, numbered Stages with explicit gate criteria, numbered Disciplines, Closure log table with pre/post deltas, Forward pointer. This shape emerged through the qino-world iter 100+ refactor arc — see `disciplines.md` for the numbered practices (1, 2, 3, 5-9, 11-19) and `qinolabs-repo:implementations/qino-world/content/` iter 113-116 for mature exemplars (iter 116 is the most recent).

### Judgment-laden iteration

Where the design depends on judgment surfaces (LLM-driven extraction, mixed-initiative dialogue, anything where the same input could produce different outputs). The current full shape of `templates/iteration-template.md`: The story / Why this is the right cut / Out of scope / Positioning decisions / Design / Realistic cases / Tests / Changes / Boundaries / Open questions / Reference / Scope expansion outlook / Technical Decisions / Learnings.

This shape emerged through the mention-maturation arc (127 / 128a / 128b / 129a). It carries the three methodological patterns from the `research-and-design` skill (`qinolabs-repo:.claude/rules/research-and-design.md`) — multi-perspective audit, realistic-cases-first, five-dimension positioning records. Exemplar: `qinolabs-repo:implementations/qino-world/content/129a-mention-maturation-coreference-foundation.md`.

## The story section

**`## The story` sits at the top of every iter file, regardless of shape.** It is the orienting layer — what becomes possible in the world after this iter ships, told in experiential register. Read first by humans; read first by agents.

### Why it's load-bearing

The story is not documentation. It is **cognitive scaffolding for orchestrator work**:

- **Story rides along when technical writing doesn't.** When an iter is referenced in agent chats ("after iter 129a established X..."), the story-shaped texture survives summarization, partial recall, and prompt-build flattening. Technical detail does not — it requires spotlight attention to be useful. Story can be held peripherally; technical writing requires the cognitive foreground.
- **Story is felt-quality, not feature list.** Not "implements coreference + nullable schema" — *"the world starts recognizing itself; the substrate layer learns to hold uncertainty without yet knowing the name."* Use the ecosystem's domain language (Figures, Substrate, Awakening, Rubbing Area). Connect to the arc the iter sits inside.
- **Texture-dense, not detail-dense.** The reader (or agent) leaves with the *shape* of what this enables, not a list of files. That shape is what informs intuitions in subsequent work.

### Where it sits in the file

Between the status header and `## Why this is the right cut`. Encountered first when the file is opened, first when an agent reads it for context, first when it's summarized into a chat.

### How to write it

- **Forward-shaped at plan time.** Write before the technical sections. The act of writing it surfaces design intuitions the technical work then carries.
- **Lightly revised at commit.** If learnings reshaped the story, refine it. Note the deltas in *Learnings → Story refinements*.
- **Use scenes when possible.** Concrete moments (a figure noticing something; a player encountering something new; the world doing something it couldn't before) carry texture better than abstract claims.
- **Name the trade-offs.** Where the design accepts a friction-collapse, register-shift, or porosity-over-friction trade-off, surface it in the story. Future readers should encounter the trade-offs as part of what the iter *means*, not buried in design notes.
- **Connect to the arc.** Where does this iter sit relative to predecessors and successors? What does it set up for the next iter? What did the prior iter set up that this consumes?

### When reading an iter for context

Start with `## The story`. The rest of the file is reference; the story is orientation. When briefing a subagent against past iter work, lead with the story sections of the relevant iters.

## Technical Decisions — capture the reasoning, not just the outcome

**This is where learning happens.** Document decisions with discovery context, not bare conclusions. The `disciplines.md` catalog cites this format ("Generalizes to:" rules).

```markdown
### Optional userId Parameter for seed()

**Problem discovered:** Arc needed to seed World while recording encounters in Journey, but World's seed page needed local-only seeding without Journey overhead.

**What we tried:** Considered separate `seedLocal()` and `seedWithEncounters()` methods.

**Why optional parameter won:** Single method serves both use cases. The optional parameter encodes the use-case branching without fragmenting the API.

**Trade-off:** Dual-purpose function is less obvious, but prevents method proliferation.

**Generalizes to:** Services with both standalone and ecosystem modes can use optional parameters to encode context.
```

**Key elements:** discovery context (why the decision was needed) · alternatives tried (even briefly) · reasoning (why the chosen approach won) · pattern recognition ("Generalizes to:") · cross-links only where directly relevant.

Routine decisions get a one-line entry; design-stance decisions that constrain downstream work become five-dimension Positioning Decisions instead (see the template + `research-and-design` Pattern 3).

## Learnings — what shifted

Capture at commit, in the shape the reflection wants:

- **What shifted** — not "we learned X" but "we thought Y, discovered Z, now understand X."
- **What worked** — approaches that proved effective, useful for future iters and other apps.
- **What surprised** — unexpected discoveries; often reveal an implicit assumption.
- **Led to** — downstream effects: new docs, patterns recognized, changes in other iters.
- **Story refinements** — if commit-time understanding reshaped `## The story`, note the deltas (and optionally apply them back).

## Anti-patterns

- **Outcome-only decision** — "Optional userId parameter enables Journey encounter recording." No context, no learning, no pattern. Cash out the reasoning.
- **Separate learnings file** — a standalone `LEARNINGS.md` fragments; agents don't know to look there and it drifts from context. Keep learnings colocated in the iteration.
- **Exhaustive cross-linking** — link only what's directly relevant; a wall of links is noise.

---

**Key principle:** if you skip adding learnings, the doc still works — just less rich. Colocation gives resilience (the learning lives with the work) rather than fragility (a separate system nobody maintains).
