# Research Repository

A workspace for open-ended inquiry—following threads before they crystallize into concepts.

## What This Is

This is a **research workspace** that welcomes uncertainty. Unlike concepts (which stabilize over time) or implementations (which must ship), research may never conclude—and that's valuable data.

Think of it as pre-concept work: the space where you notice patterns, follow hunches, and let understanding accumulate before forcing it into structure.

## Structure

```
research-repo/
├── manifest.json          # Registry of inquiries, qualities, and arcs
├── inquiries/            # Open-ended threads across sessions
├── qualities/            # Aesthetic sensitivities being refined
├── arcs/                 # Active containers for emergence
└── .claude/
    ├── qino-config.json  # Marks this as a research workspace
    └── references/
        └── research/
            ├── arc-spec.md
            └── research-spec.md
```

**Three experiential types:**

- **Inquiries** — Questions that stay alive across weeks/months
- **Qualities** — From "I know it when I see it" to speakable craft
- **Arcs** — Emergence tracked while it's happening (not just retrospectively)

## Getting Started

### Installation

1. **Fork this template** on GitHub
2. **Clone locally:**
   ```bash
   git clone <your-fork-url> research-repo
   cd research-repo
   ```

3. **Install qino skill:**
   ```bash
   /plugin marketplace add qinolabs/qino-claude
   /plugin install qino@qinolabs/qino-claude
   ```

4. **Start researching:**
   ```bash
   /qino begin inquiry [question]
   ```

### First Steps

**Start an inquiry:**
```bash
/qino begin inquiry "How do containers shape what they hold?"
```

Open-ended following of a thread. No forcing conclusions.

**Begin an arc:**
```bash
/qino begin arc
```

When you notice something emerging across sessions, open an arc. It accumulates sessions and pointers until you're ready to close and capture.

**Refine a quality:**
```bash
/qino attune presence
```

Calibrate aesthetic sensitivity through comparison: "does this have the quality?" Builds teachable distinctions from tacit knowledge.

## Working with Research

### Inquiries

Sustained longitudinal threads. A question you return to across sessions:

```
inquiries/
└── how-containers-shape/
    ├── thread.md           # Free-form exploration
    ├── fragments/          # Raw captures
    └── connections.md      # What this touches
```

**Key characteristic:** May never conclude. That's data about the question.

### Qualities

From hunch to craft. Refining what you can feel but not yet articulate:

```
qualities/
└── presence/
    ├── research.md         # What this quality is
    ├── calibrations/       # Attune sessions
    └── transformations.md  # Process to principles
```

**Example:** "Presence" in writing—you know it when you see it, but can't teach it. Attune builds distinctions: works ✓ / doesn't work ✗. Gradually speakable.

### Arcs

Active containers for emergence. Open when you notice something surfacing, close when ready to capture:

```
arcs/
└── 2025-01-20_containers-across-ecosystem/
    └── arc.md              # Full ecology at closure
```

**Lifecycle:**
1. Notice something emerging → `begin arc`
2. Sessions accumulate automatically (⟡ symbol shows active)
3. Pointers gather (concepts touched, territory explored)
4. Close when ready → retrospective capture runs
5. Full ecology recorded (∴ symbol shows captured)

**What arcs record:**
- Ground (why this had energy)
- Essence (one sentence: what emerged)
- Instrument (how noticing happened)
- The Recurring (pattern across contexts)
- Traces (artifacts created/touched)
- Seeds (what remains alive)

## Manifest Structure

Registry of all research work:

```json
{
  "version": 1,
  "inquiries": [
    {
      "id": "how-containers-shape",
      "question": "How do containers shape what they hold?",
      "path": "inquiries/how-containers-shape",
      "opened": "2025-01-18",
      "status": "active"
    }
  ],
  "qualities": [
    {
      "id": "presence",
      "name": "Presence",
      "path": "qualities/presence",
      "status": "calibrating"
    }
  ],
  "arcs": [
    {
      "id": "2025-01-20_containers-across-ecosystem",
      "title": "Containers Across Ecosystem",
      "path": "arcs/2025-01-20_containers-across-ecosystem",
      "opened": "2025-01-20",
      "closed": "2025-01-25",
      "status": "captured"
    }
  ]
}
```

**Status values:**
- Inquiries: `active` | `dormant` | `closed`
- Qualities: `noticing` | `calibrating` | `calibrated`
- Arcs: `active` | `captured`

## The qino Skill

The [qino skill](https://github.com/qinolabs/qino-claude) recognizes this as a research workspace via `.claude/qino-config.json`.

**Key commands:**

- `/qino begin inquiry [question]` — Start sustained thread
- `/qino begin arc` — Open emergence container
- `/qino close arc` — Capture full ecology
- `/qino attune [quality]` — Calibrate aesthetic sensitivity
- `/qino compare [a] [b]` — Find differences through parallel mirror

**Agent awareness:** All agents check for active arcs on arrival and surface them contextually.

## Tolerance for Uncertainty

Research has **high tolerance** for inconclusion:

| Aspect | Research | Concepts | Implementations |
|--------|----------|----------|-----------------|
| **Completion** | May never conclude | Stabilizes over time | Discrete phases |
| **Structure** | Freeform, emergent | 7-section template | Iteration template |
| **Evolution** | transformations.md | revisions.md | Technical Decisions |
| **Memory** | arcs/ | origins/ | iterations/ |
| **Goal** | Understanding | Shape | Shipping |

**Why separation matters:** Mixing research with implementation creates pressure to conclude prematurely. Keeping them separate honors different rhythms.

## Graduation Path

Research findings can settle into other repos:

**Research → Concepts:** When an inquiry crystallizes enough to become something to build
```bash
# In concepts-repo after research settles
/qino create concept [from-research-finding]
```

**Research → Implementation:** When calibrated qualities inform building
```
implementations/docs/prose-quality-standards.md
# References: research-repo/qualities/presence/
```

**Research → Ecosystem:** When patterns become foundational
```
concepts-repo/ecosystem/arc-pattern.md
# Originated from: research-repo/inquiries/emergence-tracking/
```

## What Doesn't Belong Here

**Not research:**
- ❌ Concepts ready to build (belongs in concepts repo)
- ❌ Implementation work (belongs in implementation repo)
- ❌ Decided questions (research welcomes undecided)
- ❌ Linear documentation (research is exploratory)

## Philosophy

This structure comes from building [qinolabs](https://github.com/qinolabs/qino-research)—a research workspace that discovered arcs, qualities, and inquiry patterns through use.

**Key insights:**
- Uncertainty is valuable data (not a problem to solve)
- Accumulation without forcing (let understanding gather)
- Active containers (arcs hold emergence while it's happening)
- Calibration over definition (qualities refined through comparison)

> "Research is pre-concept work—following threads before they crystallize. The research workspace holds inquiries, qualities, and arcs. Compare and Attune are methods for perceiving difference."

Research creates conditions for understanding to emerge rather than extracting it forcibly.

## Reference Documents

Located in `.claude/references/research/`:

- **arc-spec.md** — Complete arc format and lifecycle
- **research-spec.md** — Manifest patterns and conventions

## License

[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)

Free to use and adapt with attribution, non-commercial, share-alike.

## Further Reading

- [qino-claude](https://github.com/qinolabs/qino-claude) — The skill system
- [Arcs](https://github.com/qinolabs/qino-research/tree/main/arcs) — See captured emergence
- [Chronicles](https://chronicles.qinolabs.com/) — Story from git
- [Journal](https://journal.qinolabs.com/) — Research transmissions

---

_Research welcomes uncertainty._
_Accumulation without forcing._
_Some questions stay open—that's data._
