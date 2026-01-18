# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

---

## [Unreleased]

### qino

#### Added

- **Repository conventions reference** (`references/dev/repo-conventions.md`) — documents structural patterns for implementation, concept, and research repositories; uses convention over configuration to avoid path drift

#### Changed

- **Dev workflow alignment** — `dev-work.md` and `dev-init.md` workflows now reference ecosystem documentation structure (implementations/docs/), learnings capture patterns, and template guidance
- **Dev agent documentation awareness** — `dev.md` agent now reads repo-conventions.md for structure resolution; uses conventions + filesystem verification instead of hardcoded paths
- **Generic template paths** — workflows use `.claude/references/qino-dev/templates/` instead of machine-specific paths for portability
- **Cross-app pattern guidance** — dev-work workflow includes guidance for when to create ecosystem documentation in implementations/docs/

---

## [1.1.0] - 2026-01-14

### qino

#### Added

- **Hybrid execution modes** — workflows now execute in one of two modes: *inject* (dialogue workflows run in main conversation with persona principles) or *spawn* (synthesis workflows run in isolated subagent). Dialogue stays natural; heavy work stays contained.
- **Draft-revision workflow** — concept exploration now separates working state from settled state. Explore creates a draft; original concept.md is preserved. User always chooses when to settle. Revisions archive snapshots in `revisions/YYYY-MM-DD-NNN.md`.
- **Drift signals documentation** — new reference documenting how the dev agent recognizes concept-level changes during implementation work

#### Changed

- **Home workflow** — now oriented around anchor principles: orientation, repair, and confidence. Best-effort recent activity via git + manifest. Never asks "what do you want to do?" — always receives.
- **Orientation workflow** — invitation-first approach. Offers genuine engagement before jumping to task.
- **Arc workflow** — shifts from form-filling to dialogue-based gathering. Uses internal lenses for scanning. Proposes settling point, follows resonance. Includes transcript awareness for compacted conversations.
- **Explore workflow** — now draft-aware with settling flow. Substantial work triggers draft creation.
- **Test workflow** — improved grounding with ecology-based testing approach

### Documentation

#### Changed

- **README Figure section** — aligned with evolved domain language: "identity is resonance, not reference." Examples now show figures as emergent patterns, not stored forms.
- **Ecology table** — Figure focus changed from "Shape & boundary" to "Resonance"
- **CLAUDE.md** — updated to reflect hybrid execution architecture

---

## [1.0.2] - 2026-01-08

### qino

#### Added

- **Momentum detection** — skill now detects when conversation already carries energy and direction; passes MOMENTUM block to agents with what user has already surfaced; agents skip alive-thread questioning when momentum exists
- **Momentum check in explore workflow** — before standard flow, explore checks for momentum and goes directly to proposing integration when user has already shown what's alive

#### Changed

- **Agent naming simplified** — dropped `-agent` suffix for cleaner invocation: `qino:concept`, `qino:dev`, `qino:research` (was `qino:concept-agent`, etc.)
- **Agent files renamed** — `concept-agent.md` → `concept.md`, `dev-agent.md` → `dev.md`, `research-agent.md` → `research.md`

### Documentation

#### Changed

- **README and CLAUDE.md** — updated for plugins-based architecture

---

## [1.0.1] - 2026-01-07

### qino

#### Fixed

- **Agent workflow execution** — agents now properly read and follow workflow files with dialogue phases; previously agents would skip dialogue and rush to implementation
- **CRITICAL section in all agents** — concept-agent, dev-agent, and research-agent now have explicit instructions to read workflow files and respect WAIT points

#### Added

- **dev-work workflow** — new workflow for "work on [app]", plan iterations, and build intents

#### Changed

- **Agent naming simplified** — agent files renamed from `qino-*-agent.md` to `*-agent.md` (e.g., `concept-agent.md`); internal names and subagent_type references updated to match (e.g., `qino:dev-agent` instead of `qino:qino-dev-agent`)
- **SKILL.md agent execution pattern** — added explicit instructions that workflows must be executed by spawning agents, not running directly in main conversation

### Architecture

#### Removed

- **Manifest system** — `tools/manifest.json` and `scripts/sync-manifest.sh` removed; plugins are now self-contained and don't need a central registry
- **Duplicate tools/ directories** — `tools/{qino,qino-art,qino-prose,design-adventure,fabric-reference}/` removed; `plugins/` is now the single source of truth for active tools
- **Outdated sync commands** — removed `sync-dev-assistant.md` and `sync-design-sprint.md`

#### Changed

- **Release command** — updated to discover plugins from `plugins/` directory instead of manifest
- **Add-command and Verify commands** — updated for plugins-based architecture

---

## [1.0.0] - 2026-01-07

### Breaking Changes

This is a major architecture shift from command-based to skill-based interaction.

- **Skills replace commands** — tools are now described by what they do, not what you type; routing happens through natural language intent
- **Plugin marketplace** — tools now install via marketplace; the updater and manual file copying are deprecated
- **Consolidated tools** — many individual tools merged into unified skills (see below)

### Architecture

#### Added

- **Natural Language Skill System** — describe what you want; SKILL.md files route intent to workflows
- **Plugin Marketplace Infrastructure** — `plugins/` directory with standardized distribution format
- **SKILL.md pattern** — each tool's skill file maps user intent to specialized workflows

### qino (Unified Skill)

Consolidates: qino-concept, qino-dev, qino-research, qino-universal

#### Added

- **Unified routing** — single skill handles concept exploration, dev implementation, research inquiry, and universal commands (home, capture, test, attune, compare, arc)
- **20 workflows** — arc, attune, capture, compare, concept-init, concept-setup, dev-init, dev-setup, explore, home, import, orientation, research-init, research-setup, test, and more
- **Orientation workflow** — context-aware ecology overview; shows where you are and what else exists; available from any workspace via "orient me" or "what can qino do"
- **Bidirectional discovery** — implementation workspaces can now discover concepts and vice versa

### qino-prose (Unified Plugin)

Consolidates: qino-scribe, qino-relay, qino-lens into a single self-contained plugin

#### Added

- **Chronicle, transmission, and lens capabilities** — one plugin for all prose-related work
- **8 workflows** — chapter, survey, diagnose, rewind, visual-style, transmit, narrator, wanderer
- **Shared references** — lens sensitivities (wanderer, narrator, newcomer, student, companion) bundled within the plugin
- **Self-contained** — all internal references use relative paths; no cross-plugin dependencies

### qino-art

#### Changed

- **Warm Hand-Drawn Abstraction** — aesthetic aligned with qino ecosystem philosophy
- **Skill activation** — now activated through natural language ("create a visualization", "make a header image")
- **14 workflows** — mermaid, technical diagrams, taxonomies, timelines, frameworks, comparisons, annotated screenshots, recipe cards, aphorisms, maps, stats, comics, and general visualization

### design-adventure

#### Changed

- **Skill activation** — now activated through natural language ("explore this design challenge", "run a design adventure")

### Archived

The following tools have been archived to `tools/archived/`:

- **qino-concept** — functionality now in unified `qino` skill
- **qino-dev** — functionality now in unified `qino` skill
- **qino-research** — functionality now in unified `qino` skill
- **qino-universal** — functionality now in unified `qino` skill
- **qino-scribe** — functionality now in `qino-prose` skill
- **qino-relay** — functionality now in `qino-prose` skill
- **qino-lens** — references now in `qino-prose` skill
- **qino-util** — project-specific commands moved to `.claude/commands/`
- **updater** — replaced by plugin marketplace

### Migration

For existing installations:

1. **Remove old tools** — delete `.claude/commands/qino*/`, `.claude/agents/qino*/`, `.claude/references/qino*/`
2. **Install plugins** — use Claude Code plugin marketplace to install qino, qino-art, qino-prose, design-adventure
3. **Natural language** — instead of `/qino-concept:explore`, describe what you want: "let's explore this concept"

---

## [0.22.4] - 2026-01-05

### qino Relay

#### Added

- **Ecosystem concept marking** — mark ecosystem terms with `[display text](qino:concept/id)` syntax; readers see hoverable terms with shape (stable) + context (per-transmission)
- **Editorial Pass 6: Concept Coverage** — flags unmarked ecosystem terms for author review
- **concepts.md registry management** — transmit command now updates the concepts registry when new ecosystem terms appear
- **Concepts registry input** — prose agent receives available concepts for marking guidance

#### Changed

- **Lean manifest format** — `journal/manifest.json` now stores IDs only (not objects with prose); all context/essence lives in transmission frontmatter
- **Prose-only frontmatter** — transmission frontmatter contains prose only (arcs, threads, concepts with context); metadata (number, slug, title, date) now lives in manifest
- **relay_version tracking** — manifest includes `relay_version` field for version tracking
- **Architecture clarification** — manifest answers "where does X appear?" / transmission answers "what does X mean here?" / concepts.md answers "what is X?"

### Updater

#### Added

- **v0.22.4 migration guide** — documents lean manifest format change for existing journals

---

## [0.22.3] - 2026-01-04

### qino Relay

#### Added

- **Encounter Mode** — the Student now encounters arc material rather than just translating it; reader witnesses the encounter through texture shifts, dialogue with phrases, and inhabited edges
- **Source moments** — `source-moments.md` reference for working with specific passages that have their own voice
- **Being Affected** — relay-prose and relay-editorial now assess whether the Student is genuinely affected by material, not just processing it

#### Changed

- **Phrase syntax in transmissions** — specific patterns for encountering phrases ("'Meaning-searching versus meaning-finding.' There's something in that hyphen...")
- **Inhabited coda** — "Where I Am Now" section now requires genuine stops rather than marked openness
- **Reference paths** — all cross-references now use `.claude/references/` prefix for correct resolution in target workspaces

#### Fixed

- **Prose coda template** — relay-prose agent now uses prose coda (staying in material) instead of structured labels that contradicted spec

### qino Scribe

#### Fixed

- **Reference paths** — all references to qino-lens and qino-scribe files now use `.claude/references/` prefix

### qino Util

#### Fixed

- **Reference paths** — template references now use `.claude/references/` prefix

### Updater

#### Added

- **Bash sync script** — `sync-qino-tools.sh` replaces ~35 tool invocations with a single deterministic script; handles manifest parsing, version comparison, file copying, and -dev suffix marking

#### Changed

- **Simplified command** — `/update-qino-tools` now bootstraps and runs the script rather than orchestrating file-by-file

---

## [0.22.2] - 2026-01-04

### qino Lens

#### Added

- **Student lens** (`references/student.md`) — reusable sensitivity authority for reader companionship; extracted from qino-relay as a shared lens alongside wanderer, narrator, newcomer, and companion

#### Changed

- **Lens table in README** — now documents all five lenses with their sensitivities and consumers

### qino Relay

#### Added

- **craft.md** — transmission-specific craft guidance: variation across transmissions (openings, structures, closings), pacing through structure, returning to moments, coda freshness, diagnostic questions
- **Material Sensitivity** — relay-prose now adjusts posture based on arc type: conceptual (more grounding), technical (show stakes), personal (more presence), connection (show before name)
- **Pattern Detection** — relay-editorial Pass 4 catches phrase repetition, move repetition, questions resolving too fast, and missing presence

#### Changed

- **Student voice extracted to qino-lens** — voice.md is now a thin wrapper referencing `qino-lens/references/student.md`; relay-specific guidance (threading, closings) remains
- **Coda made optional** — "Where I Am Now" section is now optional emphasis, not required summary; skip if body closes itself
- **Companion moves with variety** — voice guidance now emphasizes "one use maximum per transmission" for characteristic phrases; includes "when NOT to" guidance for each move

---

## [0.22.1] - 2026-01-04

### qino Relay

#### Changed

- **student.md structure documented** — each section now has explicit format, flow-to destination, and lifecycle guidance; clarifies which sections appear in transmission codas vs prose agent context only

---

## [0.22.0] - 2026-01-04

### qino Concept

#### Added

- **`:setup` command** — one-time workspace scaffolding (previously what `:init` did)
- **`:init` command for concept creation** — create a new concept from an impulse or name; asks for real-world impulse then generates the concept with appropriate ID prefix (qino-, app-, cli-, tech-, sys-)
- **Arrival surface in `:explore`** — visible grounding box shows concept state, impulse, held threads, and connected notes before asking "what feels alive"

### qino Dev

#### Added

- **`:setup` command** — one-time workspace scaffolding; creates `implementations/` structure and config
- **Grounding surface for concept-linked apps** — visible box showing essence, surfaces, and smallest version when starting from a concept

#### Changed

- **`:init` now creates apps** — requires `:setup` first; works with or without concept link

### qino Research

#### Added

- **`:setup` command** — one-time workspace scaffolding for research; creates `inquiries/`, `qualities/`, `arcs/` structure

#### Changed

- **`:begin` renamed to `:init`** — consistent naming pattern across namespaces

### qino Universal

#### Changed

- **Command references updated** — `/qino-research:begin` → `/qino-research:init` across `:home`, `:arc`, and `:capture` commands

### Breaking Changes

- **Command naming standardization** — each namespace now follows `:setup` (workspace) + `:init` (create item) pattern
  - `/qino-concept:init` (workspace) → `/qino-concept:setup`
  - `/qino-dev:init` (workspace + app) → `/qino-dev:setup` + `/qino-dev:init`
  - `/qino-research:begin` → `/qino-research:init`
- See `tools/updater/migrations.md` for migration guide

---

## [0.21.0] - 2025-12-30

### qino Concept

#### Added

- **`implementation.md` as concept companion** — technical conceptual notes now live alongside `concept.md`; concept.md holds user experience (how it feels), implementation.md holds system shape (how it works); same alive-thread approach applies to both

#### Fixed

- **Origins boundary** — explicit prohibition on reading origin files (`concepts/<id>/origins/`) unless user explicitly engages with a held thread offering; the `held_threads` index exists so the agent can offer without reading — theme is enough to ask "does that still have warmth?"

### qino Relay (New Tool)

#### Added

- **Research transmissions through the Student's voice** — share meaningful findings in a voice that walks alongside readers, helping them approach demanding material with curiosity and delight
- **`/qino-relay:transmit`** — create a research transmission from specific arcs; generates Student-voiced prose with reader journey notes
- **Reader Journey Notes** — instead of a full prep layer, relay uses reader journey notes: what readers won't know, will struggle with, would ask; the prose agent sees everything plus these notes
- **Two-agent architecture** — `relay-prose.md` (voices arc material through the Student) and `relay-editorial.md` (reviews voice integrity and reader-companionship)

#### The Student's Evolution

The Student has evolved from "genuine uncertainty" (v0.20.0 qino-journal concept) to "reader companionship":
- No longer pretending not to know — they *have learned* the material
- Walks alongside readers encountering research, not alongside researchers learning
- Remembers what it was like not to know, and voices that remembered uncertainty for the reader
- Creates bridge through questions, not gap through uncertainty

| The Wanderer | The Student |
|---|---|
| Knows more than they say | Remembers what it was like not to know |
| Creates gap through silence | Creates bridge through questions |
| Reader recognizes what's unsaid | Reader feels accompanied |

#### References

- `references/qino-relay/voice.md` — Student's voice patterns
- `references/qino-relay/student-guide.md` — how the Student works
- `references/qino-relay/transmission-format.md` — format specification
- `references/qino-relay/reader-journey-guide.md` — reader journey prep guide

### Breaking Changes

- **qino-journal renamed to qino-relay** — `/qino-journal:transmit` → `/qino-relay:transmit`

---

## [0.20.0] - 2025-12-29

### qino Util (New Tool)

#### Added

- **Development utilities for tool authors** — new tool to automate the workflow of adding commands and detecting drift
- **`/qino-util:add-command`** — guided workflow for adding a new command with optional agent scaffolding; auto-updates README, syncs manifest, offers version bump
- **`/qino-util:verify`** — detect drift between files, manifest, and READMEs before releases; catches manifest entries pointing to missing files or commands missing documentation

### qino Research

#### Changed

- **Restructured to three research types** — explorations → inquiries, calibrations → qualities, experiments/graduation removed
- **`/qino:arc` command added** (in qino-universal) — captures emergence patterns: how inquiry moved through the ecosystem, what touched what, what crystallized
- **Scribe integration** — research arcs can now inform chapter prep when `researchRepo` is configured; reveals what inquiry was happening alongside code changes

#### Removed

- **`/qino-research:experiment`** — removed (controlled experiments pattern deprecated)
- **`/qino-research:graduate`** — removed (graduation to concepts now happens through notes)

### qino Scribe

#### Changed

- **Research arc integration** — scribe-prep agent now queries research arcs by date range; if arcs overlap with chapter commits, their context can inform scene seeds and world behavior
- **Prep checkpoint enhanced** — inquiry context line added when research arc illuminates the period being chronicled

#### Removed

- **success-patterns.md** — content previously merged into voice.md (cleanup)

### qino Universal

#### Added

- **`/qino:arc [title]`** — capture emergence patterns in research workspace; conversational gathering of chain, essence, span, and related artifacts

#### Changed

- **`/qino:capture` enhanced** — improved routing and context detection
- **`/qino:home` enhanced** — better context awareness across repo types

---

## [0.19.0] - 2025-12-26

### qino Scribe

#### Added

- **Visual style configuration** — new `visual-style.md` file for author-controlled image aesthetics; structured frontmatter (style, fidelity, palette) plus prose sections (direction, references, avoid); replaces AI-distilled style guessing with intentional aesthetic choices
- **Visual style command** (`/qino-scribe:visual-style`) — interactive creation of visual-style.md with guided prompts for rendering approach (cinematic, illustrated, painterly, atmospheric, stylized), detail level, color philosophy, and artistic references
- **Visibility annotations** — world tokens can now include annotations like *(unspecified)*, *(glimpsed)*, *(partial)* to preserve narrative mystery in image generation; prevents the image system from visualizing deliberately mysterious elements as concrete objects
- **WIP directory naming** — chapter directories use NNN-wip during creation, renamed to NNN-slug after title is known; prevents guessing at slug before chapter content exists

#### Changed

- **Prep agent enhanced** — expanded instructions for disturbance layer and character analysis
- **Layers reference refined** — clarified checkpoint structure and world layer details

---

## [0.18.0] - 2025-12-25

### qino Scribe

#### Added

- **Editorial agent** — new `scribe-editorial.md` agent reviews prose output with complete separation from prep context; sees only the draft chapter file, evaluating execution on its own terms
- **Disposition configuration** — world hospitality is now configurable in world-seed.md via `disposition` field (hospitable, guarded, indifferent, hostile); moved from universal principle to world-specific setting
- **Diagnostic command** (`/qino-scribe:diagnose`) — assess system integrity after changes; checks seven categories: Specificity/Universality, Proportionality, Signal/Noise, Principle/Example Coherence, Agent Architecture, Terminology Consistency, Reference Authority
- **Calibration notes** — working document capturing craft devices discovered through prose exploration: Temporal Quality, Negative Space, Meaningful Gesture, Parallel Action, Restraint
- **Craft devices in voice.md** — five new craft techniques for rendering experience, with structure templates, quality markers, and ask questions
- **Chapter-level patterns** — Continuous Dream, Movement, Crowding/Leaping, World Presence, Balance of Modes, Rhythm; patterns for evaluating whole-chapter quality
- **Connection moments** — guidance for stranger encounters, shared attention, and unspoken recognition

#### Changed

- **Merged voice.md and success-patterns.md** — unified voice reference with line-level and chapter-level patterns, plus diagnostic questions
- **Editorial architecture clarified** — layers.md now reflects three-agent architecture (prep, prose, editorial) with clear context boundaries
- **Hospitality removed from principles** — disposition is now a world configuration, not a universal storytelling principle
- **Reference paths normalized** — agents now use consistent `references/qino-scribe/` paths

#### Removed

- **Archived scribe versions** — cleaned up `tools/archived/qino-scribe-command` and `tools/archived/qino-scribe-v1`
- **success-patterns.md** — content merged into voice.md

### qino Lens

#### Changed

- **Enhanced companion sensitivity** — richer guidance for world filtered through relationship, attention split between task and person
- **Enhanced wanderer sensitivity** — expanded examples for friction, consequence, and embodied presence

### General

#### Changed

- **docs/tools-overview.md rewritten** — updated for current tooling landscape

---

## [0.17.0] - 2025-12-23

### qino Scribe

#### Added

- **Setting Foundation** — structured YAML frontmatter in world-seed.md enables consistent image generation across chapters; 13 fields capture the world's visual vocabulary: genre, subgenre, scale, geography, era, architecture, lighting, technology, transport, flora, fauna, inhabitants, magic
- **foundation.md reference** — comprehensive guide to Setting Foundation fields with examples showing how explicit positive descriptions prevent image generation drift

#### Changed

- **Renamed theme.md to world-seed.md** — clearer name reflects its purpose: the seed from which the chronicle grows, not a theme to apply
- **First chapter initialization enhanced** — now includes Setting Foundation checkpoint where user reviews and confirms proposed foundation fields before chronicle creation
- **Migration path for existing chronicles** — when world-seed.md lacks frontmatter, chapter command prompts to add foundation fields based on existing prose

---

## [0.16.1] - 2025-12-23

### qino Scribe

#### Added

- **Story Lenses** — twelve lenses (Arrival, Journey, Return, Discovery, Confrontation, Crisis, Loss, Vigil, Ritual, Complication, Work, Gathering) that shape how the prose agent perceives for each chapter
- **Lens sensitivities** — each lens foregrounds specific qino-lens sensitivities with paths to reference files
- **Territories** — creative directions within each lens (e.g., The Arrival has "warmth before understanding", "invited deeper", etc.)
- **Theme as seed** — theme.md is generative grammar, not container; chronicle develops its own life with new locations and characters
- **Newcomer's Eyes** — World Layer now captures "what a newcomer would notice that locals walk past"
- **Strangeness field** — prep.md and checkpoints now include the world's particular quality

#### Changed

- **Prose agent receives theme.md** — now reads both prep.md (constraint) and theme.md (seed); continuity preserved via world.md and arcs.md
- **Story types renamed** — now called "Story Lenses" with expanded structure including sensitivities, territories, and craft notes
- **Final checklist enhanced** — "Strangeness" check added: does the world's particular quality appear at least once?

### qino Lens

#### Added

- **Newcomer sensitivity** (`references/newcomer.md`) — finding what inhabitants have stopped seeing; the question "what would someone notice on their first day here?"
- **Companion sensitivity** (`references/companion.md`) — world filtered through relationship; attention split between task and person

#### Changed

- **Now distributed** — qino-lens added to manifest for installation via updater
- **Craft guidance** — enhanced examples in narrator.md and wanderer.md with structural agency and resonance patterns

---

## [0.16.0] - 2025-12-22

### fabric-reference (New Tool)

#### Added

- **Fabric pattern library** — comprehensive integration of Daniel Miessler's Fabric patterns for AI-augmented workflows
- **170+ patterns** — including extract_wisdom, summarize, improve_writing, create_art_prompt, and many more
- **Pattern update script** — `update-patterns.sh` syncs patterns from upstream Fabric repository

### qino-art (New Tool)

#### Added

- **Visualization workflows** — 13 specialized workflows for creating diagrams, comparisons, timelines, and visual explanations
- **TypeScript tools** — `generate-prompt.ts` and `generate-ulart-image.ts` for programmatic image generation
- **Workflow categories** — Mermaid diagrams, annotated screenshots, comics, frameworks, maps, taxonomies, stats, recipe cards, aphorisms, comparisons, technical diagrams, timelines, and general visualization
- **SKILL.md reference** — comprehensive guide to the art tool's capabilities and philosophy

### qino-lens (New Tool)

#### Added

- **Qualities of Attention** — library of lenses to perceive text through specific sensitivities
- **Wanderer lens** — views text through sensitivity to friction, consequence, and embodied presence
- **Narrator lens** — perceives structural agency (architecture exerting will)
- **Core principles** — Contextual Density, Indirect Action, Resonance (Body Echo), Structural Agency
- **Example-driven learning** — each lens includes concrete examples showing before/after transformations

### qino Scribe

#### Added

- **Survey command** (`/qino-scribe:survey`) — assess git history before writing chapters; supports advance mode (from last chapter), retroactive mode (full history), and specific range queries
- **World behavior domains** — six dimensions for translating disturbance into world action: material, spatial, temporal, creature, object, human background
- **Contextual Density principle** — three examples (The Gate, The Map, The Injury) showing how objects carry relational history
- **Resonance (Body Echo)** — wanderer's physical sensations as response to world presence
- **Structural Agency** — architecture and environment as actors exerting will
- **Complete Transformation** — responses that finish the meaning without spelling it out
- **Diff filtering guidance** — comprehensive framework for distinguishing signal from noise in git changes

#### Changed

- **Voice guide restructured** — from verbose Execute/Instead-of sections to concise "Ask" prompts and anti-examples; now a checklist to hold during writing
- **Disturbance layer reframed** — from "what weather matches this shape?" to "what would the world DO if it felt this way?"; weather marked as "easy reach — try others first"
- **Prose agent identity restored** — comprehensive author philosophy added; transformation from technician to author with full wanderer guidance
- **Checkpoint streamlining** — from 6 checkpoints to 3 interactive checkpoints (Scene Seeds, Angles, Directions+Opening combined); post-prose updates now automatic
- **Mutual Seeing renamed** — now "Mutual Revealing" with enhanced principle definition
- **Lens integration** — scribe-prose now references qino-lens authorities for embodied presence techniques

### qino Research

#### Changed

- **Enhanced workspace detection** — improved cross-repo support with automatic workspace discovery
- **Command documentation** — clearer guidance in begin, experiment, and graduate commands for multi-workspace scenarios
- **Research spec updated** — expanded documentation for workspace handling and cross-repo research flows

### qino Universal

#### Changed

- **Compare process clarified** — "parallel mirror" pattern: find something that looks like it should fit the same pattern; if it doesn't, reveals difference between sources
- **Attune process enhanced** — Phase 3 now defines "from hunch to sources" process where sources are hypotheses inferred from the hunch; Phase 4 gives agent iteration control; Phase 5 extracts teachable craft from which sources worked
- **Calibrate workflow simplified** — clearer agent-driven iteration with explicit feedback loops

### Updater

#### Added

- **Dev mode** — `toolsLink` parameter in qino-config.json enables testing with local tool checkouts instead of GitHub releases
- **Version tracking** — added version.json to track updater tool version

#### Changed

- **Command documentation** — enhanced with dev mode usage instructions

### General

#### Added

- **Manifest sync script** — `scripts/sync-manifest.sh` automates manifest validation and regeneration from directory structure
- **Design Sprint archived** — moved to tools/archived/, marked as archived in manifest; use design-adventure instead

---

## [0.15.0] - 2025-12-19

### qino Universal (New Tool)

#### Added

- **Universal ecology commands** — the connective tissue between spaces; `/qino:home`, `/qino:capture`, `/qino:test`, `/qino:attune`, `/qino:compare`
- **Context sensitivity** — commands detect `repoType` in `qino-config.json` and adapt behavior automatically
- **Static hints system** — universal/confirmation commands show cross-space hints; space-specific commands show in-space hints
- **Research landscape in home** — `/qino:home` now shows explorations, calibrations, and experiments when in research workspace
- **Fragment routing** — `/qino:capture` routes to `fragments/` when inside an exploration directory
- **Flexible test targets** — `/qino:test` accepts any target: concept, exploration, file, or conversation context
- **Calibration integration** — `/qino:compare` offers to append insights to `transformations.md` in calibration context

### qino Concept

#### Changed

- **Command namespace** — concept-specific commands moved from `/qino:*` to `/qino-concept:*` (`explore`, `import`, `init`)
- **Universal commands extracted** — `home`, `capture`, `test` now live in qino-universal
- **Research context awareness** — `/qino-concept:explore` gracefully redirects to `/qino-research:begin` when run in research workspace

### qino Research

#### Changed

- **Command namespace** — commands renamed from `/research:*` to `/qino-research:*`
- **Home absorbed** — `/qino-research:home` removed; use `/qino:home` which detects research context automatically
- **Updated hints** — all commands now show navigation hints with correct namespaces

### qino Scribe

#### Changed

- **Command namespace** — commands renamed from `/scribe:*` to `/qino-scribe:*`
- **Disturbance reading redesign** — checkpoint format improvements for staged workflow

### qino Attune

#### Changed

- **Archived** — merged into qino-universal; commands now available as `/qino:attune` and `/qino:compare`

### Updater

#### Changed

- **Migration documentation** — comprehensive guide for namespace rename and context sensitivity changes

---

## [0.14.0] - 2025-12-19

### qino Scribe

#### Added

- **Two-agent staged architecture** — prep agent handles World, Disturbance, Beat layers; prose agent writes from constraint (receives only prep.md)
- **Three interactive checkpoints** — scene seeds, angles, directions; user steers story discovery through choices
- **Ten relational principles** — Mutual Seeing, Relationship as Lens, What Remains Unspoken, The World Has Been Watching, and more; embedded as active constraints in each layer
- **Relational fields in prep.md** — "The relationship", "Mutual seeing", "What's unsaid" are required, not optional
- **World.md relational tracking** — "Has been watching" for characters, "What remains unspoken" for wanderer
- **`/scribe:rewind` command** — restore world state to before the last chapter for regeneration
- **Six verification checks** — added mutual seeing and response completes (was 4)

#### Changed

- **Hard cut between prep and prose** — prose agent cannot access previous context; constraint breeds originality
- **Layer-based workflow** — World, Disturbance, Beat layers replace seven-phase process
- **Reference architecture reorganized** — `layers.md` (layer flow), `voice.md` (prose craft), `principles.md` (relational wisdom), `craft.md` (format)
- **Options as vocabulary** — even rejected checkpoint options help users articulate what they're sensing

#### Removed

- **Single agent architecture** — `qino-scribe-agent.md` replaced by `scribe-prep.md` and `scribe-prose.md`
- **process.md** — replaced by `layers.md`
- **voice-guide.md** — replaced by `voice.md`

---

## [0.13.4] - 2025-12-18

### qino Scribe

#### Changed

- **Voice guide transformed** — all "Avoid" bullet lists converted to "Instead Of" sections with concrete before/after examples; shows what breaks and what works side by side using the → pattern
- **Reference navigation clarified** — agent file now explicitly directs: start with `process.md` for workflow, consult `craft.md` and `voice-guide.md` during writing phase
- **Fixed broken reference** — process.md checklist now points to qino-scribe-agent.md instead of archived soul.md

---

## [0.13.3] - 2025-12-18

### qino Scribe

#### Added

- **Scale as Presence** — location tokens now carry the wanderer's felt experience of scale; triggers include approach from outside, first impression of size, and relationship to surroundings

#### Changed

- **Token sync enrichment** — world.md entries for existing characters and locations can now be enriched when a chapter reveals something significant, not just created when new

---

## [0.13.2] - 2025-12-18

### qino Scribe

#### Changed

- **Negative examples restructured** — "What Breaks It" sections replaced with ❌ inline markers and contrast pairs to prevent LLMs from extracting failure patterns as templates
- **High-risk patterns now show alternatives** — wanderer naming, character voice variation, tour-guide chapters, and explanation-as-dialogue now use "Instead of X → Y" format
- **17 guidance sections converted** — all negative examples now bound to their corrections with em-dash pattern

---

## [0.13.1] - 2025-12-18

### qino Scribe

#### Added

- **Character Voice Variation** — new voice-guide principle: not everyone speaks wisdom; characters have varied registers from polished insight to struggle and deflection
- **Theme section in craft.md** — guidance on distilling detailed user themes to brief atmosphere; implied locations extract to world.md's Unexplored section
- **First chapter guidance** — grounding, felt experience, participation, and seeds; special weight for the world's birth
- **Strangeness pass** — editorial step after draft: look for organic moments where the wanderer's nature might surface, add nothing if nothing feels right

#### Changed

- **Wanderer naming clarified** — "the wanderer" is narrative voice only, never spoken in dialogue; don't write scenes where they're asked their name
- **Wanderer strangeness isn't an arc** — explicit guidance against tracking it; accumulation through external observation is the mechanism
- **Expanded "what to avoid"** — tour-guide chapters, atmosphere without stakes, wanderer as camera

---

## [0.13.0] - 2025-12-17

### qino Attune (New Tool)

#### Added

- **Training perception through difference** — based on Bateson's principle: "information is a difference that makes a difference"
- **`/attune:compare`** — place two artifacts side by side and discover what makes the difference; works with prose, code, designs, or concepts
- **`/attune:calibrate`** — refine a vague aesthetic quality (like "otherworldliness" or "tension") into concrete craft through iterative feedback
- **Compare session process** — fresh reading, felt sense, specific moments, parallel mirror, synthesis
- **Calibrate process** — find candidates, calibrate through feedback, build inspiration index, transform iteratively, extract principles

### qino Scribe

#### Changed

- **Wanderer strangeness calibration** — refined guidance to prevent strangeness from collapsing into local mystery; added "calibrating principle" and explicit what-works/what-breaks examples
- **Reader's vehicle test** — new constraint: the wanderer must never feel like they're withholding from the reader
- **Voice guide expanded** — comprehensive examples for wanderer strangeness execution: negative space, world responds, simultaneity, world awakening patterns

### qino Eval

#### Changed

- **Archived** — moved to `tools/archived/`; replaced by qino-attune which provides a cleaner operation model (compare and calibrate)

---

## [0.12.0] - 2025-12-16

### qino Scribe

#### Added

- **Token sync workflow** — World Tokens that are characters or locations now sync to world.md, enabling hover cards in future chapters even without new tokens; Phase 6 includes sync decision guidance
- **Scribe version tracking** — manifest.json now includes `scribe_version` field to track which version wrote each chapter

#### Changed

- **Cleaner chapter format** — removed HTML comment metadata block from chapter template; metadata lives in manifest.json where it belongs

---

## [0.11.0] - 2025-12-16

### qino Scribe

#### Added

- **Chapter snapshots** — chapters now live in directories (`NNN-slug/chapter.md`) with `world.md` and `arcs.md` snapshots taken at write time; enables accurate retroactive image generation using chapter-time world state
- **Phase 7 (Snapshot)** — new process phase for creating world state snapshots after chapter completion
- **Six story types** — expanded story discovery with Quiet Shift, Arrival, Departure, Return, Tension, and Resolution patterns
- **Grounding guidance** — prevents abstraction drift by staying in specific, sensory details

#### Changed

- **Unified arcs registry** — arcs now tracked in single `arcs.md` file with motion states
- **Deepened wanderer character** — richer guidance for the wanderer's interiority and presence
- **Voice guidance distilled** — refined from style research into actionable craft patterns

### qino Concept

#### Added

- **Ecology test command** (`/qino:test`) — validate concept coherence through structured testing
- **Ecology tests reference** — framework for testing concept relationships

#### Removed

- **Ecosystem scope** — simplified API by removing separate ecosystem commands; functionality absorbed into existing commands
- **`/qino:ecosystem` command** — use `/qino:home` instead
- **ecosystem-spec.md, manifest-ecosystem-spec.md** — consolidated into existing specs

---

## [0.10.0] - 2025-12-15

### qino Scribe

#### Changed

- **Agent architecture** — the scribe now has embodied identity rather than loaded instructions; `qino-scribe-agent.md` holds who the scribe is, commands invoke the agent
- **permissionMode: acceptEdits** — chapter writing flows without permission interrupts for file operations
- **Simplified references** — `soul.md` archived (content lives in agent); remaining references are `craft.md`, `process.md`, `voice-guide.md`

#### Removed

- **soul.md** — identity now embodied in agent file, not loaded as reference

### Updater

#### Changed

- **Migration guide** — added v0.10.0 migration for soul.md removal

---

## [0.9.1] - 2025-12-14

### qino Scribe

#### Changed

- **Immersion test replaces mapping table** — soul.md now teaches contextual recognition ("is this word from the story world or leaking from source material?") instead of mechanical term substitution; the same word can be fine or breaking depending on context
- **Examples as patterns, not templates** — voice-guide.md now explicitly frames examples as craft principles to learn from, not phrases to copy; added meta-instruction and dialogue variations
- **Single source of truth** — removed redundant prose examples from soul.md that duplicated voice-guide.md; added cross-references instead
- **Verification checklist updated** — process.md now references "Immersion Test" instead of "Transformed"

---

## [0.9.0] - 2025-12-14

### qino Dev (New Tool)

#### Added

- **Implementation companion** — translates concept essence into technical reality; concept holds what the thing _is_, implementation holds how to _build_ it
- **`/qino-dev:init`** — initialize from a concept with a 15-minute translation exploration; creates `implementation.md`, first iteration, and per-app arrival command
- **`/qino-dev:<app>`** — generated arrival command following the home pattern; shows concept link, stack, current iteration, and observations grounded in git state
- **Turn-taking iterations** — AI implements to spec, user tests and reviews, feedback flows before next phase; each iteration has scope, goals, and test criteria
- **User-land artifacts** — `implementations/` directory (visible, version-controlled) alongside concepts/ and chronicle/
- **Templates** — implementation-template.md, iteration-template.md, app-command-template.md

### qino Concept

#### Added

- **Remote workspace support** — operate against a remote concepts-repo via `.claude/qino-config.json`; captures flow directly to source of truth without duplication
- **Auto-tagged captures** — when capturing from implementation context, notes automatically reference the linked concept with scope and context metadata
- **Linked concept default** — `/qino:home` defaults to the linked concept when run from an implementation project

### Dev Assistant

#### Changed

- **Archived** — moved to `tools/archived/`; replaced by qino-dev which offers a simpler interface and better integration with qino-concept

### qino Scribe

#### Changed

- **Craft reference refined** — minor updates to craft.md based on ongoing chronicle work

---

## [0.8.0] - 2025-12-13

### qino Scribe

#### Added

- **Voice guide** — new `voice-guide.md` bridges philosophy to execution; shows _how_ to write at the sentence level what `soul.md` describes at the conceptual level
- **Four chapter options** — discover phase now generates Expected, Unexpected, Complication, and Wild Card options (was 3)
- **Specific craft patterns** — sustaining interiority across scenes, completing meaning without spelling it out, avoiding the feature-list trap

#### Changed

- **Refined reference documentation** — `craft.md`, `process.md`, and `soul.md` updated with clearer guidance based on evaluation learnings

### qino Eval

#### Added

- **Three new compare dimensions** — Relationship (human connection), Reader Entry (immersion quality), and Aftermath (what lingers)
- **Expanded compare session** — 9 phases (was 7); new parallel mirror and aftermath phases
- **Anti-pattern detection** — identifies thematic echo, frictionless success, and paraphrase loops
- **Arc shapes** — progression lens now evaluates movement type: hidden, motion, building, between, calling
- **Pressures tracking** — documents what builds between chapters for continuity

---

## [0.7.0] - 2025-12-12

### qino Scribe

#### Changed

- **Adventure over observation** — complete architecture overhaul merging qino-world into qino-scribe; chapters now emerge from action, stakes, and wanderer participation rather than tour-guide observation
- **Ground before observe** — scribe inhabits the world before looking at git changes, preventing the diff from narrowing vision
- **Three options per chapter** — generates Expected, Unexpected Location, and Complication options; chooses the most alive
- **Pressures tracked in world.md** — the world now tracks what's building and what's about to break; pressures fuel future chapters
- **One explanatory exchange maximum** — everything else emerges through behavior, environment, and consequence
- **New reference architecture** — `soul.md` (who the scribe is), `craft.md` (format reference), `process.md` (six-phase workflow) replace previous agent/reference structure

#### Removed

- **Agent file** — `qino-scribe-agent.md` removed; behavior now guided by three focused reference files
- **Previous reference files** — `voice-guide.md`, `chapter-format.md`, `chronicle-spec.md`, `theme-guide.md` archived

### qino Eval (New Tool)

#### Added

- **Chapter comparison** (`/eval:compare`) — side-by-side evaluation of two chapters using 7-dimension framework (Action, Stakes, Discovery, World, Theme, Character, Thread)
- **Progression evaluation** (`/eval:progression`) — evaluate movement between chapters using 6-dimension felt lens (Pull, Meet, Weight, Shape, Cost, Echo)
- **Learning loop** — insights flow back to scribe architecture; problems become fixes in `process.md`, patterns become reinforcement in `soul.md`
- **Felt sense as data** — frameworks articulate what the felt sense is responding to, not override it

### General

#### Added

- **Adapters pattern documented** — README explains how the repository uses its own tools via adapter commands
- **chapters-to-write.md** — documents git ranges for each chronicle chapter

---

## [0.6.1] - 2025-12-11

### qino Scribe

#### Added

- **The Wanderer section** — each chapter now includes a dedicated first-person reflection after the closing breath; the shift from third to first person creates intimacy as the wanderer metabolizes what happened
- **Wanderer tracking in world.md** — chronicles now track the wanderer separately: what's emerged about them, what they carry, where they were last seen, and what remains unspoken
- **The strangeness** — the wanderer's between-world nature surfaces through rare, subtle moments; accumulated in "what remains unspoken" across chapters
- **Comprehensive wanderer voice guidance** — new sections covering vulnerability, emergence, and how character crystallizes through chapters

#### Changed

- **World Tokens exclude the wanderer** — the wanderer has their own dedicated section; they are no longer listed among other tokens
- **Editorial pass expanded** — now includes a second check: "Is this reflection or summary?"

### Updater

#### Changed

- **Selective updates** — compares local vs remote version.json and only downloads files for tools that have new versions; tools already up to date are skipped

### General

#### Added

- **Release git ranges** — `docs/release-ranges.md` documents git ref ranges for each release

---

## [0.6.0] - 2025-12-10

### qino Scribe

#### Added

- **Environmental-relational storytelling** — the world is now a participant, not backdrop; it acts, responds, and shapes what can happen
- **"The World's Breath"** — `world.md` now tracks the environment's current mood: what it's doing, what it offers, what it withholds
- **Character perception bias** — entries now include what each character notices (and misses), making perceptual habits part of their identity
- **Tension tracking** — `world.md` captures tensions between characters, between places, between what is and what wants to be
- **Theme dwelling** — before writing, the scribe now spends time in the theme as a living place, not just vocabulary to extract

#### Changed

- **Git diff excludes chronicle directories** — avoids the recursive problem of chronicling the chronicle
- **Streamlined editorial pass** — simplified to one question: "Does this world ask something of the reader?"
- **Voice guide renumbered** — sections 4-16 become 5-17 to accommodate new "World in Conversation" section

---

## [0.5.2] - 2025-12-09

### qino Scribe

#### Added

- **Agent permission mode** — agent frontmatter now includes `tools` and `permissionMode: acceptEdits`, so the scribe can write chapters without prompting for file operation confirmations

### qino Concept

#### Added

- **Agent permission mode** — same as above

### Design Adventure

#### Added

- **Agent permission mode** — same as above

### Design Sprint

#### Added

- **Agent permission mode** — same as above

---

## [0.5.1] - 2025-12-09

### qino Scribe

#### Added

- **Editorial pass** — mandatory self-review before presenting chapters, checking for wanderer agency, technical names, explanatory dialogue, collective character texture, mystery calibration, and warmth balance
- **Retroactive chapters** — optional `from_ref` and `to_ref` arguments let you chronicle specific historical ranges, useful for regenerating chronicles or covering missed periods

#### Changed

- **Streamlined confirmations** — story beat approval (or theme selection for first chapter) is now the single confirmation point; chapters write immediately after, presenting content and "chapter written" together
- **Terminology** — "fantasy world" → "story world" throughout documentation

---

## [0.5.0] - 2025-12-09

### qino Scribe

#### Added

- **World Tokens** — chapters now end with crystallized presences from the story: characters, locations, phenomena, each with 2-3 lines of essence that capture their embodied nature
- **Theme seeding** — new chronicles begin with world-seed selection from a curated spectrum spanning ancient/mythic to cosmic/quiet; theme stored in `chronicle/theme.md`
- **Theme guide** — comprehensive reference for generating spacious world-seeds with inherent tension

#### Changed

- **Git diff observation** — scribe now reads actual file changes (`git diff`) alongside commit messages, improving narrative accuracy when commit messages are incomplete

### qino Concept

#### Changed

- **Renamed `/qino:note` to `/qino:capture`** — the word "capture" better conveys the gentle urgency of holding a thought before it fades

### General

#### Changed

- **Normalized "qino" capitalization** — consistent lowercase styling across all tool documentation

---

## [0.4.0] - 2025-12-08

### qino Concept

#### Added

- **New `/qino:note` command** — capture quick observations without leaving context; notes must be anchored to at least one concept or ecosystem before saving
- **Multi-reference notes** — one note can be relevant to multiple concepts and ecosystem simultaneously; each reference has its own scope, context, and status
- **Note surfacing during explore** — agent offers relevant notes when user's alive-thread echoes a note's theme
- **Reference removal flow** — during exploration, agent can suggest removing stale references with user confirmation
- **The Mirror principle** — expanded design philosophy: dialogue as interface for encountering yourself

#### Changed

- **Unified notes structure** — all notes now live in single `notes/` directory at project root; manifest version bumped to 2
- **Renamed `/qino:add-notes` to `/qino:import`** — clearer distinction between importing external material and capturing observations
- **Manifest consolidation** — ecosystem notes merged into root `manifest.json`; separate ecosystem manifest deprecated
- **Descriptive status** — note reference status is now natural language (not enum), enabling richer agent interpretation

#### Removed

- **Separate ecosystem manifest** — `ecosystem/manifest.json` deprecated; notes now use unified structure with `"ecosystem"` as reserved scope value

### Updater

#### Changed

- **Migration entry for v0.4.0** — documents the add-notes→import rename and new note command

### General

#### Changed

- **Release command now manifest-driven** — validates manifest consistency before release, blocks on drift, discovers tools dynamically instead of using hardcoded lists

---

## [0.3.0] - 2025-12-07

### qino Scribe (New Tool)

#### Added

- **Chronicle your ecosystem as a story world** — qino Scribe transforms evolution into story: characters appear when concepts arrive, locations reveal hidden rooms when ideas deepen
- **One command**: `/scribe:chapter` — observe what changed, shape the narrative together, write the next chapter
- **World memory** — `world.md` tracks characters, locations, and arcs so the story builds on itself

### qino Concept

#### Changed

- **Ecosystem signals recognized during explore** — the `/qino:explore` command now listens for phrases like "hold that for ecosystem" or "this hints at something bigger" and seamlessly captures them with the `∴` pattern

### Updater

#### Changed

- **qino Scribe added to update command** — running `/update-qino-tools` now includes the new chronicling tool

### General

#### Changed

- **Release command** now includes tool version bump step

---

## [0.2.1] - 2025-12-07

### qino Concept

#### Fixed

- **Internal reasoning no longer leaks into output** — strengthened guidance to prevent model from outputting its deliberation process (assessment summaries, context analysis, reasoning chains)

### General

#### Changed

- Refined README structure and release command workflow

---

## [0.2.0] - 2025-12-07

### qino Concept

#### Added

- **Ecosystem-level thinking** — capture thoughts that reach beyond individual concepts with `∴` acknowledgment pattern
- **Ecosystem command** (`/qino:ecosystem`) — see the whole ecology of concepts and accumulated notes
- **Ecosystem manifest** — separate `ecosystem/manifest.json` for ecosystem-scoped tracking

#### Changed

- **Simplified home command** — now focused on arriving at concepts; ecosystem view moved to dedicated command
- **Two realities design** — structural separation (files) with experiential fluidity (seamless capture)
- **Consistent manifest spec naming** — `manifest-project-spec.md` and `manifest-ecosystem-spec.md`

### Updater (New Tool)

#### Added

- **Update command** (`/update-qino-tools`) — fetch latest tool files from GitHub with a single command
- **Version tracking** — `version.json` in each tool's references directory
- **Migration support** — automatic handling of file renames, deletions, and breaking changes
- **Selective updates** — detects which tools are installed and updates only those

### General

#### Added

- **Changelog** — track meaningful changes across releases
- **Release command** (`/release`) — coordinate changelog generation and GitHub releases

---

## [0.1.0] - 2025-12-02

First public release. A collection of Claude Code tools for thoughtful software development.

### qino Concept

A gentle facilitator for developing app concepts through alive-thread dialogue.

#### Added

- **Alive-thread principle** — always work with what feels alive, not "the whole thing"
- **Four commands**: home, explore, add-notes, init
- **Concept structure** with seven sections: Real-World Impulse, Glowing Connections, Primary Surfaces, Tone & Communication, Ecosystem Integration, Scoped Features, Build Plan
- **Explore modes**: expand, deepen, restructure, inhabit
- **Inhabit mode** — voice the concept, discover its tone through moments
- **Held threads** — material from origins that stays available for later exploration
- **Manifest system** — lightweight ecosystem index tracking concepts and held threads

#### Design Philosophy

- Structure lives in files, process lives in commands, aliveness emerges in dialogue
- Human-led, AI-supported creativity
- Nonlinearity as a feature, not a bug
- The best facilitation disappears

### Design Adventure

Multi-perspective design exploration through emergent dialogue.

#### Added

- **Seven personas**: Skeptic, Synthesizer, Embodied Thinker, User Advocate, Architect, Explorer, and The World
- **The World as participant** — thinks through environment while others think through words
- **Emergent questions** — questions surface from dialogue, not imposed templates
- **Four-file output**: enter.md, dialogue.md, questions.md, synthesis.md
- **Atmospheric entry** — "the room after the conversation, chairs still warm"

#### Design Philosophy

- Form rhymes content
- Friction teaches — resistance creates insight
- The World participates, not decorates
- Questions teach how to think about the problem

### Dev Assistant

Transform app concepts into vision-aligned development environments.

#### Added

- **Project initialization** through guided 15-20 minute exploration
- **Five core commands** generated per project, plus project guide
- **Iteration planning** — separate phase for roadmap development
- **Complexity budgeting** — track and manage complexity across development
- **Vision protection** — natural alignment through intelligent tooling

### General

#### Added

- Repository structure as multi-tool hub under `tools/`
- MIT License
- Release pipeline with automated zip builds
- GitHub Actions for Claude-assisted code review
- Comprehensive documentation and READMEs

### Deprecated

- **Design Sprint** — replaced by Design Adventure with richer persona system

---

## Pre-release Development

### October-November 2025

- Restructured from single-tool to multi-tool hub
- Introduced qino Concept Agent with full specification
- Developed Design Adventure from Design Sprint foundations
- Established reference document system for agent behavior

### July-September 2025

- Initial Dev Assistant development
- Exploration-based onboarding approach
- Template system for architectural guidance
- Monorepo support and improved developer ergonomics

---

_This changelog captures meaningful evolution, not just commits. Generated with Claude's understanding of the system's development._
