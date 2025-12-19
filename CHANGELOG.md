# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

---

## [Unreleased]

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
- **Implementation companion** — translates concept essence into technical reality; concept holds what the thing *is*, implementation holds how to *build* it
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
- **Voice guide** — new `voice-guide.md` bridges philosophy to execution; shows *how* to write at the sentence level what `soul.md` describes at the conceptual level
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

*This changelog captures meaningful evolution, not just commits. Generated with Claude's understanding of the system's development.*
