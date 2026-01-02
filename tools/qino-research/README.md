# qino Research

A space for open-ended research — where ideas can move before they stabilize.

---

## What is this?

Research is exploratory work:
- **Inquiries** — Open-ended following of threads
- **Qualities** — Refining aesthetic sensibilities into speakable craft
- **Arcs** — Capturing how inquiry moved through the ecosystem

Unlike concepts (which stabilize over time), research moves fast, welcomes uncertainty, and accepts inconclusive results as valuable data.

---

## Commands

| Command | Purpose |
|---------|---------|
| `/qino:home` | See the research landscape (universal command, context-aware) |
| `/qino-research:begin [topic]` | Start or continue an inquiry |
| `/qino:arc [title]` | Capture an emergence pattern |

---

## Folder Structure

```
research-repo/
├── manifest.json
├── inquiries/
│   └── [id]/
│       ├── thread.md
│       └── fragments/
├── qualities/
│   └── [quality]/
│       ├── research.md
│       ├── transformations.md
│       └── examples/
└── arcs/
    └── YYYY-MM-DD_[id].md
```

---

## Arcs

Arcs capture how inquiry moved through the ecosystem — what touched what, what crystallized.

**When to capture:** After a session where multiple threads connected, or something emerged that wasn't planned.

**Information flow:**
- **Into arcs:** Session work → artifacts created → arc capture (`/qino:arc`)
- **Out of arcs:** Scribe queries by date + repo, Journal queries by recency

Arcs are evidence. They don't need maintenance — they accumulate as ecosystem memory.

---

## Integration

Works with:
- **qino-concept** — Notes can reference inquiry insights
- **qino-scribe** — Queries arcs for chapter context (see below)
- **qino-journal** — Draws from arcs for research transmissions (planned)

### Scribe Integration

When scribe-prep prepares a chapter, it queries research arcs by date range + repo:

1. Gets the git range for the chapter (commits to chronicle)
2. Extracts date range from commits
3. Finds arcs where `span` overlaps and `repos` includes current repo
4. Includes relevant inquiry context in the chapter prep

This reveals what inquiry was happening alongside the code changes — conceptual work that may illuminate what's being chronicled.

**Requires:** The repo running scribe must have `researchRepo` configured in `.claude/qino-config.json`.

---

## Installation

Copy to `.claude/` in your research repo:
```
commands/qino-research/    →  .claude/commands/qino-research/
agents/                    →  .claude/agents/
references/qino-research/  →  .claude/references/qino-research/
```

Create `.claude/qino-config.json`:
```json
{
  "repoType": "research",
  "conceptsRepo": "../concepts-repo",
  "linkedConcepts": [],
  "description": "Your research space"
}
```

Create `manifest.json`:
```json
{
  "version": 1,
  "type": "research",
  "inquiries": [],
  "qualities": [],
  "arcs": []
}
```

---

## Philosophy

Research welcomes uncertainty. Not all inquiries become concepts — and that's fine. Research and concepts coexist, interact, activate each other.

Arcs are evidence of ecosystem participation. They capture how inquiry moved — what touched what, what emerged.
