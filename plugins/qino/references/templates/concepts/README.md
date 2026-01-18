# Concepts Repository

A workspace for concept exploration—giving shape to what has pull before committing to implementation.

## What This Is

This is a **concepts workspace** where ideas stabilize over time. Unlike implementations (which must ship) or research (which may never conclude), concepts find their shape through exploration and refinement.

Think of it as the space between "I have a hunch" and "I'm ready to build"—where resonance guides structure rather than the other way around.

## Structure

```
concepts-repo/
├── manifest.json           # Registry of concepts and active notes
├── notes-archive.json      # Archived notes (for provenance, not current work)
├── concepts/              # Individual concept directories
├── ecosystem/             # Cross-cutting ecosystem concepts
├── notes/                 # Captured thoughts waiting to be woven
└── .claude/
    ├── qino-config.json  # Marks this as a concepts workspace
    └── references/
        └── concept/
            ├── manifest-project-spec.md
            └── revisions-guide.md
```

**Key distinction:**
- `concepts/` — Discrete ideas (like "qino-drops", "lens-lab")
- `ecosystem/` — Foundational patterns that span the whole (like "qino-domain-language", "qino-journey")
- `notes/` — Raw captures not yet woven into concepts

## Getting Started

### Installation

1. **Fork this template** on GitHub
2. **Clone locally:**
   ```bash
   git clone <your-fork-url> concepts-repo
   cd concepts-repo
   ```

3. **Install qino skill:**
   ```bash
   /plugin marketplace add qinolabs/qino-claude
   /plugin install qino@qinolabs/qino-claude
   ```

4. **Start exploring:**
   ```bash
   /qino explore
   ```

### First Steps

**Create your first concept:**
```bash
/qino create concept my-idea
```

The concept agent will guide you through discovery dialogue:
- What draws you to this?
- Where's the energy?
- What makes it different?

**Capture a thought:**
```bash
/qino capture [your thought]
```

Captures go to `notes/` and get indexed in `manifest.json`. They surface when relevant during concept exploration.

**Explore existing concepts:**
```bash
/qino explore my-idea
```

Multi-turn dialogue following the alive thread—what feels resonant right now.

## Working with Concepts

### The Concept Structure

Each concept has a 7-section structure that emerges through exploration:

1. **What Has Pull** — Why this, why now
2. **The Core Gesture** — Essential movement or quality
3. **Surfaces** — Where you encounter it (UI, API, experience)
4. **Scoped Features** — What's in, what's out
5. **Glowing Connections** — Where this connects to other concepts
6. **Essence** — The seed sentence
7. **Open Questions** — Living uncertainties

**Format:** `concept.md` in each concept directory

### Concept vs. Note

**Notes** are raw captures—thoughts that arrive while building, reading, walking. They live in `notes/` until they find a concept to weave into.

**Concepts** are stabilized explorations—they have structure, connections, and boundaries. They're ready to inform building.

### Revisions

When understanding shifts, capture it in `revisions.md`:

```markdown
## 2025-01-18: From "Container" to "Active Surface"

- **Context**: Building the UI revealed that containers aren't passive
- **Previous**: Saw containers as storage (like boxes)
- **New**: Containers are active surfaces that shape what they hold
- **Reasoning**: The edge between container and contained creates meaning
```

**Revisions capture *why* understanding changed**, not just what changed.

## Manifest Structure

### manifest.json

Registry of concepts and **active** notes:

```json
{
  "version": 1,
  "concepts": [
    {
      "id": "my-idea",
      "name": "My Idea",
      "path": "concepts/my-idea",
      "created": "2025-01-18",
      "status": "exploring"
    }
  ],
  "notes": [
    {
      "id": "note-001",
      "content": "Something about edges and boundaries",
      "created": "2025-01-18",
      "tags": ["boundaries", "perception"]
    }
  ]
}
```

**Status values:**
- `exploring` — Active development
- `stable` — Shape found, informing building
- `dormant` — On hold, may return
- `graduated` — Moved to implementation

### notes-archive.json

**Archived notes** that have been integrated into concepts. Kept for provenance, not surfaced during active work:

```json
[
  {
    "id": "note-001",
    "content": "Something about edges",
    "integratedInto": "my-idea",
    "integratedDate": "2025-01-20"
  }
]
```

**Note lifecycle:** Active (`manifest.json`) → Integrated (`notes-archive.json`)

## The qino Skill

The [qino skill](https://github.com/qinolabs/qino-claude) recognizes this as a concepts workspace via `.claude/qino-config.json`.

**Key commands:**

- `/qino explore [concept]` — Follow the alive thread
- `/qino capture [thought]` — Save to notes/
- `/qino import [external-note]` — Bring outside notes into manifest
- `/qino test [concept]` — Ecological testing (does this still resonate?)
- `/qino compare [concept-a] [concept-b]` — Find what differs
- `/qino attune [quality]` — Calibrate aesthetic sensitivity

### Workflow Modes

- **inject** (explore, capture, test, compare, attune) — Persona injected into conversation for multi-turn dialogue
- **spawn** (import, concept-setup) — Agent spawned for synthesis work

## Linking to Implementation

When a concept is ready to build, link it to an implementation repo:

```json
// In workspace-config.json (if using workspace)
{
  "conceptLinks": {
    "my-idea": {
      "concept": "concepts-repo/concepts/my-idea",
      "implementation": "implementations-repo/implementations/my-idea"
    }
  }
}
```

The dev agent will:
- Initialize implementation from concept
- Detect drift (concept ↔ code) during building
- Offer to update concept when building reveals truths

## What Doesn't Belong Here

**Not concepts:**
- ❌ Implementation code (belongs in implementation repo)
- ❌ Research inquiries (belongs in research repo)
- ❌ Technical decisions (belongs in implementation docs)
- ❌ Completed work (may graduate to implementation)

**Why separation matters:**
- Concepts refine through exploration (medium tolerance for uncertainty)
- Research welcomes inconclusion (high tolerance for uncertainty)
- Implementations ship iteratively (low tolerance for uncertainty)

Mixing them collapses distinct rhythms into one.

## Philosophy

This structure comes from building [qinolabs](https://github.com/qinolabs)—a multi-repo ecosystem for developing ideas.

**Key insights:**
- Resonance guides structure (not templates you fill in)
- Nothing gets lost (notes archive, held safely)
- Concepts inform building (but remain separate)
- Understanding evolves (revisions capture why)

> "Most tools assume you can get to a valuable output by filling in the sections—complete the template, check the boxes, and the result will follow. This assumes resonance guides structure. It asks what draws you, follows that thread, asks again."

Concepts find their shape through attention, not by forcing form first.

## Reference Documents

Located in `.claude/references/concept/`:

- **manifest-project-spec.md** — Complete manifest format and patterns
- **revisions-guide.md** — How to capture evolution of understanding

## License

[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)

Free to use and adapt with attribution, non-commercial, share-alike.

## Further Reading

- [qino-claude](https://github.com/qinolabs/qino-claude) — The skill system
- [qino Domain Language](https://github.com/qinolabs/concepts-repo/blob/main/ecosystem/qino-domain-language.md) — The vocabulary
- [Chronicles](https://chronicles.qinolabs.com/) — See concepts becoming apps
- [Journal](https://journal.qinolabs.com/) — Research transmissions

---

_Return your attention to what has pull._
_Let the system hold the rest._
