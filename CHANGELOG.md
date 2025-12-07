# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

---

## [Unreleased]

---

## [0.2.0] - 2025-12-07

### Qino Concept

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
- **Update command** (`/update-tools`) — fetch latest tool files from GitHub with a single command
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

### Qino Concept

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
- Introduced Qino Concept Agent with full specification
- Developed Design Adventure from Design Sprint foundations
- Established reference document system for agent behavior

### July-September 2025
- Initial Dev Assistant development
- Exploration-based onboarding approach
- Template system for architectural guidance
- Monorepo support and improved developer ergonomics

---

*This changelog captures meaningful evolution, not just commits. Generated with Claude's understanding of the system's development.*
