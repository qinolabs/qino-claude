# qino Research

A space for open-ended research — before ideas become concepts.

---

## What is this?

Research is pre-concept work:
- **Explorations** — Open-ended inquiry without structure pressure
- **Calibrations** — Refining aesthetic qualities into teachable craft
- **Experiments** — Controlled tests with crafted data
- **Graduation** — Moving insights to concepts-repo when ready

Unlike concepts (which stabilize over time), research moves fast, welcomes uncertainty, and accepts inconclusive results as valuable data.

---

## Commands

| Command | Purpose |
|---------|---------|
| `/research:home` | See the research landscape |
| `/research:begin [topic]` | Start or continue an exploration |
| `/research:experiment [hypothesis]` | Run a controlled test |
| `/research:graduate [id]` | Promote to concepts-repo |

---

## Folder Structure

```
research-repo/
├── manifest.json
├── explorations/
│   └── [id]/
│       ├── thread.md
│       └── fragments/
├── calibrations/
│   └── [quality]/
│       ├── research.md
│       ├── transformations.md
│       └── examples/
├── experiments/
│   └── [date]_[id]/
│       ├── hypothesis.md
│       ├── test-data/
│       ├── results/
│       └── analysis.md
└── graduated/
```

---

## Integration

Works with:
- **qino-concept** — Graduation destination for mature insights
- **qino-attune** — Calibrations use attune:calibrate, experiments use attune:compare

---

## Installation

Copy to `.claude/` in your research repo:
```
commands/research/    →  .claude/commands/research/
agents/               →  .claude/agents/
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
  "explorations": [],
  "calibrations": [],
  "experiments": [],
  "graduated": []
}
```

---

## Philosophy

Research welcomes uncertainty. Not all explorations become concepts — and that's fine. The research space is where ideas can wander before they crystallize.

Graduation happens when ready, not before.
