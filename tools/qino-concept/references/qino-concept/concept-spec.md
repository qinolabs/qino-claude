# Qino Concept Agent - Concept File Specification
*This document defines the canonical structure of a concept.md file used by the **Qino Concept Agent**.
It is a technical specification — not a concept itself.
It guides the agent in reading, creating, refining, and organizing concept documents.*

---

## 1. Purpose of This Document
This file describes the **required structure**, **sections**, and **formatting rules** of every `concept.md` document in a Qino concept ecosystem.
The Qino Concept Agent reads this file on startup to understand:

- how to parse concept files
- how to extract and rewrite specific sections
- how to generate new concept files during ingestion
- how to maintain consistency across the entire ecosystem

This file should remain stable and minimal.

---

## 2. Concept File Structure Overview

Every concept must be stored at:

```
concepts/<concept-id>/
  concept.md
  origins/           # copied source material (optional)
```

The `origins/` directory contains copies of external notes that were integrated into this concept. This keeps references self-contained within the repository.

Each concept.md must follow the structure below:

```
# <Concept Name>

## 1. Real-World Impulse
<Short explanation of the core lived impulse that gave rise to the concept.>

## 2. Glowing Connections
<High-level thematic links to other concepts or ideas. Not technical integrations.>

## 3. Primary Surfaces
<The main experiential surfaces where the user encounters the concept.>

## 4. Tone & Communication
<The concept's voice — how it speaks, what it says and doesn't say, the quality of dialogue.>

## 5. Ecosystem Integration
<How this concept relates to the broader ecosystem—inputs, outputs, flows, complementarities.>

## 6. Scoped Features (Smallest Living Version)
<Key features or abilities required for the simplest meaningful expression of the concept.>

## 7. Build Plan (Rough)
<High-level implementation notes if desired—kept rough and optional.>

## Sources
<Optional list of raw notes or external references linked to this concept.>
```

All sections **must exist**, though some may be empty when a concept is new.

Spacing rules:
- Exactly one `#` title at the top
- All other sections begin with `##`
- No deeper levels (`###`) should be used for core sections
- The Qino Concept Agent rewrites only the body **below** a section heading and above the next heading

---

## 3. Section-by-Section Specification

### **1. Real-World Impulse**
This is the **heartbeat** of the concept.
It must:

- express the lived, human impulse that gave rise to the concept
- stay grounded in real-world phenomena, not abstractions
- emphasize what *still feels alive* today

The agent often refines this section first.

---

### **2. Glowing Connections**
This section captures what **mobilizes energy** and creates vitality within the concept. It holds two kinds of "glow":

**A. Internal Glow (Energetic Qualities)**
The aspects within this concept that create anticipation, delight, or weave together multiple layers of human experience. These are the qualities that make users feel alive. Glowing connections often need interfaces to come alive — it is often the *constraint* of an interface that creates movement and vitality.

Phenomenological markers to listen for:
- "builds anticipation," "invites curiosity," "sparks conversation"
- "everyone feels valued," "creates positive atmosphere"
- "weaves together," "touches multiple dimensions"
- "the love," "life is good," "feels magical"

**B. Relational Glow (Inter-Concept Resonance)**
High-level narrative or thematic connections to other concepts in the ecosystem.

It should include:
- shared impulses between concepts
- conceptual resonance
- areas of potential synergy

It should NOT include:
- technical integration details
- data flows
- feature implementation

**Example (Internal Glow):**
> Session pinning mobilizes energy across multiple layers: human motivation (curiosity about games) → communication (delightful conversations) → materialization (the upcoming session) → positive atmosphere → love for games, friends, and life itself. The constraint of the pinning interface — a visual grid, notifications, voting — creates the movement that makes this glow come alive.

The agent may update this section during `/refine` (internal glow) or `/relate` (relational glow).

---

### **3. Primary Surfaces**
These are the **concrete entry points** where the concept touches a user's actual, embodied, day-to-day life. Surfaces are where glowing connections find form — the constraint of an interface creates the movement that makes vitality tangible.

Primary surfaces answer: *When does this show up? Where is the user? What moment in their day does this interrupt, enhance, or invite?*

**What are surfaces?**
Surfaces exist at multiple scales:
- **Device/Platform level**: mobile phone, desktop browser, AI glasses, smartwatch
- **Modality level**: notifications, visual grids, voice commands, haptic feedback
- **Specific touchpoint level**: the pin button, the session card, the voting gesture

**Guiding questions for identifying surfaces:**
- What interfaces bring this concept to life?
- What are the specific touchpoints where users encounter this?
- What modalities connect to the lived experience? (visual, auditory, haptic, spatial)
- Where does the glow described in Section 2 become tangible?

**Examples:**

*Multi-scale surface description:*
> **Mobile phone** (device) → **Push notifications + visual grid** (modality) → **Session card with pin gesture + vote counter** (specific touchpoint)

*Ritual-based surface:*
> **Weekly review moment** → Opens app on Sunday evening → Sees timeline of pinned sessions → Taps "reflect" to journal about what happened

**Relationship to Glowing Connections:**
The glow needs surfaces to manifest. If Section 2 describes "builds anticipation through collaborative session selection," Section 3 describes the notification that arrives, the grid users browse, the pin button they tap.

**Quality check:**
Good surfaces adapt to real life — they meet people in the rhythm of their day. But adaptation doesn't mean frictionless. Some friction is intentional: a notification that sparks movement, a constraint that focuses choice. The question is whether the friction serves aliveness or demands compliance.

This section is expanded during `/explore`.

---

### **4. Tone & Communication**
This is the **voice layer** — how the concept speaks, what it says and doesn't say, the felt quality of dialogue. While Primary Surfaces describe *where* users encounter the concept, this section describes *what the conversation feels like*.

**Guiding questions:**
- What's the tone? (warm, understated, playful, quiet, factual)
- What does it say — and what does it withhold?
- What's the rhythm? (immediate, periodic, only when asked)
- How does restraint show up? (what it knows but doesn't push)

**How this section grows:**
This section is best developed through `/qino:explore` **inhabit mode** — stepping into specific moments as a user and discovering what communication would feel supportive. The result is scenario-based content: moments with voice samples that reveal the concept's character.

**Example format:**
```
**Returning after absence**
  "Two sessions happened while you were away."
  Quiet, factual, warmth underneath. No guilt, no urgency.

**Friend pins something you love**
  "Marcus pinned Dune. You're already on the list."
  Playful assumption of your interest. Respects your autonomy.
```

---

### **5. Ecosystem Integration**
This is the concept's **place in the ecology** — how it relates to other concepts functionally, what flows between them, where it sits in the user's journey.

Unlike Glowing Connections (thematic resonance), this section captures *functional relationships* — inputs, outputs, what happens before and after.

**Guiding questions:**
- What does this concept receive from others?
- What does it provide to others?
- Where does it sit in the user's overall journey?
- What would break if this concept didn't exist?

This section grows as concepts mature and relationships become visible.

---

### **6. Scoped Features (Smallest Living Version)**
This is **constraint as creative force** — the irreducible core that makes the concept *itself*. Not "version 1 with fewer features" but the seed that contains the whole tree.

This section embodies the alive-thread principle: focus on what's alive, not everything at once.

**Guiding questions:**
- What's the minimum that makes this concept recognizable?
- What single feature carries the most glow?
- What would kill the concept if removed?
- If you could only ship one surface, what would it be?

The agent helps protect against scope bloat by returning to this section.

---

### **7. Build Plan (Rough)**
This is the **bridge to implementation** — held loosely. Permission to sketch stepping stones without commitment. The word "rough" matters: this is not a spec, just a direction.

**Guiding questions:**
- What technical stepping stones might get us there?
- What's a possible sequence?
- What would we build first to test the core?
- What experiments might we try?

Optional for early concepts. Should stay high-level and non-binding.

---

### **Sources**
The **lineage** — where did this concept come from? Sources maintain connection to the raw material, honoring the origin while allowing the concept to evolve beyond it.

May include:
- raw notes and original documents (copied to `origins/`)
- audio transcripts
- previous drafts
- external references

**Origin files:**
When integrating external notes, the agent copies them to the concept's `origins/` directory. References in this section use relative paths:

```markdown
## Sources
- [origins/idea-sketch.md](origins/idea-sketch.md) — initial brainstorm
- [origins/meeting-notes.txt](origins/meeting-notes.txt) — team discussion
```

This keeps the workspace self-contained and portable.

---

## 4. Encoding & Formatting Requirements

- File encoding: **UTF-8**
- Must be plain Markdown
- No frontmatter blocks (`---`)
- Headings must be exactly as shown
- Section numbers must remain stable
- Each section must be separated by a single blank line
- The agent may reorder sections only under explicit `/organize` commands

---

## 5. Concept Lifecycle Expectations

A concept file:

1. Begins minimal — only the Real-World Impulse may be filled.
2. Gains structure and clarity through refinement (`/refine`).
3. Expands with possibility during exploration (`/explore`).
4. Develops relational coherence during `/relate`.
5. Achieves order and identity during `/organize`.

The specification ensures every concept grows within the same structural frame.

---

## 6. Responsibilities of the Qino Concept Agent

When reading this file, the agent must:

- treat this as the authoritative schema
- follow heading names and numbering exactly
- modify only section bodies, not headings
- generate new concept.md files using this structure
- validate section presence before modification
- create missing sections if needed

---

## 7. Future Extensions

Possible optional sections the agent may someday support:

- `## Narrative Examples`
- `## Energetic Qualities`
- `## Questions to Revisit`

None are required or recognized today.

