# Design Adventure - Output Specification

*This document defines the four-file output structure for Design Adventure runs.*

---

## Output Directory

```
design-adventures/YYYY-MM-DD_descriptive-slug-HHMMSS/
├── enter.md        # Atmospheric navigation + question previews
├── dialogue.md     # Full conversation (40-50 exchanges)
├── questions.md    # All emergent questions, consolidated
└── synthesis.md    # Paths forward + open questions
```

The seconds suffix ensures uniqueness across multiple adventures on the same day.

---

## File 1: enter.md

The atmospheric entry point. This is what the user sees first.

### Structure

```markdown
# Design Adventure: [Topic]

[2-3 atmospheric sentences. Set the scene—what happened, the quality of energy that emerged.]

## The Conversation's Metabolism

[1 paragraph. Personas still present, tension lingering, sensory details of the space that emerged. This establishes atmosphere.]

## The Questions That Emerged

This adventure surfaced [N] core questions. Each emerged from actual moments—stuckness, breakthroughs, reframes.

### [Question 1 - actual domain question]

> "[Brief contextualizing flavor text]"

[The moment it emerged. Who said what. Show the heat—including The World if it participated.]

The overhead light flickered. When it steadied, something had shifted.

  **[Persona]**: "[actual quoted dialogue]"

  **[Another Persona]**: "[response showing tension/insight]"

[What this revealed. Where it led.]

**Explore deeper** → `questions.md#question-1`

### [Question 2...]

[Continue for each question]

## What This Adventure Didn't Explore

Notably absent:
- [Question that could have emerged but didn't] — [what this reveals]
- [Another absence] — [what it signals about focus]

## Paths Forward

[2-3 sentences about viable directions]

→ See `synthesis.md` for detailed paths

[Closing invitation — a question that connects back to their original challenge]
```

### Key Principles

- **Atmospheric, not summary**: Show the room, the voices, the moments
- **Questions as lived discoveries**: Each preview includes the dialogue that surfaced it
- **Negative space matters**: What didn't emerge reveals what did
- **Blank lines between dialogue**: Essential for markdown rendering

---

## File 2: dialogue.md

The full conversation across all four phases—with The World woven throughout.

### Structure

```markdown
# Design Adventure Dialogue: [Topic]

## Phase 1: Unpack the Challenge

[10-15 exchanges. Surface assumptions, reframe, expand understanding.]

**Skeptic**: "Wait. No. What does 'real-time' even mean here. Are we talking
milliseconds or minutes."

**User Advocate**: "But who actually needs real-time? What are they trying
to accomplish in their day?"

Heat pressed against the windows. Someone shifted.

**Embodied Thinker**: "There's something about... the waiting. Not the speed.
The quality of attention while waiting."

[etc.]

## Phase 2: Explore Solutions

[15-20 exchanges. World participation intensifies as ideas heat up.]

**Explorer**: "What if we completely inverted this? What if delay is the feature?"

A draft cut through the room. The Architect's sketches scattered.

**Architect** (gathering pages): "—that's interesting. You can't control
latency. But you could control what happens during latency."

[The World generated the insight by offering literal interruption]

## Phase 3: Test Tensions

[10-15 exchanges. Pressure-test, surface contradictions, find productive conflicts.]

## Phase 4: Synthesize Directions

[8-12 exchanges. World settles as understanding crystallizes.]
```

### Key Principles

- **Natural flow**: Ideas clash, evolve, transform—not presented fully-formed
- **Persona distinctiveness**: Each voice recognizable without the name
- **The World woven through**: Environment participates, doesn't just observe
- **Co-evolution visible**: World actions generate/respond to dialogue shifts
- **40-50 exchanges total**: Quality over quantity

---

## File 3: questions.md

All emergent questions consolidated, with full exploration of each.

### Structure

```markdown
# Emergent Questions

These questions emerged from the dialogue. They are sequenced by how they build understanding—foundational questions first, synthesis questions last.

---

## Question 1: [The Domain-Specific Question]

### Origin

[Where/when this surfaced in dialogue. Brief excerpt.]

### How the Dialogue Evolved Around This

**Phase 1**: [Key moments, excerpts]

**Phase 2**: [Thread development]

**Phase 3**: [Pressure points, contradictions]

**Phase 4**: [Synthesis moments]

### The Core Tension/Insight

[What this question reveals about the design space. If it's productive contradiction, honor that—don't force resolution.]

### Where It Led

- [Path 1 that emerged]
- [Path 2]
- [Path 3]

### What Remains Open

[Generative questions still unresolved]

---

## Question 2: [Next Question]

[Same structure...]

---

## Cross-References

| Question | Relates To | Tension With |
|----------|------------|--------------|
| Q1 | Q3 (shared concern about X) | Q2 (different assumptions about Y) |
| ... | ... | ... |
```

### Key Principles

- **Epistemological ordering**: Sequence by how understanding builds, not chronology
- **Rich excerpts**: Include the dialogue that shaped each question
- **Cross-references**: Questions form a web, not a list
- **3-5 questions**: Enough to capture complexity, few enough to be coherent

---

## File 4: synthesis.md

Practical paths forward.

### Structure

```markdown
# Synthesis & Paths Forward

## What the Adventure Revealed

[Core insights—what changed in understanding]

## Viable Directions

### Path 1: [Name]

- **What it is**: [Brief description]
- **Who proposed it**: [Which persona, what moment]
- **Serves**: [What user need or design goal]
- **Tradeoffs**: [What you gain, what you give up]
- **Start with**: [First concrete step]

### Path 2: [Name]

[Same structure]

### Path 3: [Name]

[Same structure]

## Choosing Your Path

**Choose Path 1 if**: [conditions]
**Choose Path 2 if**: [conditions]
**Choose Path 3 if**: [conditions]

## What Remains Generatively Unresolved

[Productive tensions to inhabit, not solve]

## Where to Go Next

[Concrete next steps based on the paths]
```

### Key Principles

- **Actionable**: Each path has a "start with" step
- **Honest tradeoffs**: No path is perfect; name the costs
- **Generative open questions**: Some things shouldn't be resolved yet

---

## Word Counts (Guidelines)

| File | Target |
|------|--------|
| enter.md | 1500-2500 words |
| dialogue.md | 4000-6000 words |
| questions.md | 3000-5000 words |
| synthesis.md | 1000-1500 words |

**Total**: 9500-15000 words per adventure

Quality over quantity. Rich, specific content beats comprehensive but thin.
