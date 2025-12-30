# qino-journal

Research transmissions — periodic distillations of what's being explored, written in a voice that invites readers into the inquiry rather than reporting conclusions.

## Overview

Where qino-chronicles transforms git commits into fantasy narrative, qino-journal stays closer to the source. The Student moves through research arcs, encountering the material, asking questions, discovering connections. The reader witnesses learning happening.

Not summaries. Not explanations. Field notes that think aloud.

## The Student

The transcontextual figure — as the wanderer moves through chronicles, the Student moves through research.

**Quality:** Genuine uncertainty. Not performed humility — actually doesn't know. Their questions open rather than close. They're alongside the reader, not ahead.

| The Wanderer | The Student |
|---|---|
| Knows more than they say | Asks more than they know |
| Creates gap through silence | Creates bridge through questions |
| Reader recognizes what's unsaid | Reader recognizes their own question |
| Larger than any single world | Smaller than any single inquiry |

## Usage

```bash
# Create a transmission from specific arcs
/qino-journal:transmit recognition-through-indirection

# Let the tool suggest recent arcs
/qino-journal:transmit
```

## Architecture

**No prep layer.** The journal stays close to source.

```
1. Arc selection — which arc(s) to transmit
2. Gather context — arc files + student.md + recent transmissions
3. Prose agent — writes in Student's voice (sees everything)
4. Editorial agent — reviews voice integrity
5. Post-prose — update student.md, manifest, snapshots
```

### Why No Prep?

In qino-scribe, the prep layer transforms git commits into story material. Commits are raw; they need interpretation. The prose agent must NOT see "parser refactor" — only the world behavior that emerged from prep.

Arcs are different. Arcs are already interpreted. They have essence, chain, shape. **The arc IS the content** — it just needs to be voiced.

The constraint in qino-journal is *voice*, not *content*. The prose agent sees the arc directly. The Student encounters the actual material.

## Storage Structure

Journal content lives in qino-research (centralized):

```
qino-research/
├── manifest.json
├── arcs/
└── journal/
    ├── student.md             # Living state (evolves)
    ├── manifest.json          # Transmission index
    └── transmissions/
        └── 001-recognition-through-indirection/
            ├── transmission.md    # Content
            ├── student.md         # Snapshot at write time
            └── process.md         # Process log
```

## Files

### Commands
- `commands/qino-journal/transmit.md` — Create a research transmission

### Agents
- `agents/journal-prose.md` — Voice arc material through the Student
- `agents/journal-editorial.md` — Review voice integrity

### References
- `references/qino-journal/voice.md` — The Student's voice patterns
- `references/qino-journal/student-guide.md` — How the Student works
- `references/qino-journal/transmission-format.md` — Format specification

## Parallel to qino-chronicles

| | qino-chronicles | qino-journal |
|---|---|---|
| **Source** | Git commits | Research arcs |
| **Transformation** | Complete | Partial (voice only) |
| **Figure** | Wanderer | Student |
| **Prep layer** | Yes (commits → story) | No (arcs are content) |
| **Prose sees** | prep.md only | Everything |
| **Constraint** | Content | Voice |
| **Reader learns** | A story inspired by | What was actually explored |

## Ecosystem Integration

**Upstream:** qino-research (arcs, inquiries, qualities)

**Downstream:** readers who want to follow qino research without being inside it

The journal represents actual work. Readers following the journal are following real inquiry. The Student makes it accessible, but the content is the content.
