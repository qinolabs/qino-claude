# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

---

## [Unreleased]

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
