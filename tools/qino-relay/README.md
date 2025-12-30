# qino-relay

Research transmissions — sharing meaningful findings in a voice that walks alongside readers, helping them approach demanding material with curiosity and delight.

## Overview

Where qino-chronicles transforms git commits into fantasy narrative, qino-relay stays closer to the source. The Student walks alongside readers as they encounter research arcs, asking the questions readers would ask, voicing difficulty, making abstract concrete.

Not summaries. Not lectures. A companion who remembers what it was like to learn this material.

## The Student

The transcontextual figure — as the wanderer moves through chronicles, the Student moves through research.

**Quality:** Reader companionship. The Student has learned this material and walks alongside readers as they encounter it. They remember what it was like not to know, and voice that remembered uncertainty for the reader.

| The Wanderer | The Student |
|---|---|
| Knows more than they say | Remembers what it was like not to know |
| Creates gap through silence | Creates bridge through questions |
| Reader recognizes what's unsaid | Reader feels accompanied |
| Larger than any single world | Smaller than any single inquiry |

## Usage

```bash
# Create a transmission from specific arcs
/qino-relay:transmit recognition-through-indirection

# Let the tool suggest recent arcs
/qino-relay:transmit
```

## Architecture

**No prep layer, but reader journey notes.** The relay stays close to source.

```
1. Arc selection — which arc(s) to transmit
2. Gather context — arc files + student.md + recent transmissions
3. Reader journey prep — what readers won't know, will struggle with, would ask
4. Prose agent — writes in Student's voice (sees everything + reader journey notes)
5. Editorial agent — reviews voice integrity and reader-companionship
6. Post-prose — update student.md, manifest, snapshots
```

### Why Reader Journey Notes?

In qino-scribe, the prep layer transforms git commits into story material. Commits are raw; they need interpretation.

Arcs are different. Arcs are already interpreted. They have essence, chain, shape. **The arc IS the content** — it just needs to be voiced *for the reader*.

Reader journey notes help the prose agent voice the *reader's* encounter with the material — their questions, their struggle, their need for concreteness. The Student walks alongside readers, not just through the material.

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
- `commands/qino-relay/transmit.md` — Create a research transmission

### Agents
- `agents/relay-prose.md` — Voice arc material through the Student
- `agents/relay-editorial.md` — Review voice integrity

### References
- `references/qino-relay/voice.md` — The Student's voice patterns
- `references/qino-relay/student-guide.md` — How the Student works
- `references/qino-relay/transmission-format.md` — Format specification
- `references/qino-relay/reader-journey-guide.md` — Reader journey prep guide

## Parallel to qino-chronicles

| | qino-chronicles | qino-relay |
|---|---|---|
| **Source** | Git commits | Research arcs |
| **Transformation** | Complete | Voice for reader |
| **Figure** | Wanderer | Student (companion) |
| **Prep layer** | Yes (commits → story) | Reader journey notes |
| **Prose sees** | prep.md only | Everything + reader notes |
| **Constraint** | Content | Voice + companionship |
| **Reader feels** | Story-wonder | Accompanied |

## Ecosystem Integration

**Upstream:** qino-research (arcs, inquiries, qualities)

**Downstream:** readers who want to follow qino research without being inside it

The relay represents actual work. Readers following transmissions are following real inquiry. The Student makes it accessible — not by dumbing down, but by walking alongside.
