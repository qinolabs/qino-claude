# Qino Concept Agent — Ecosystem Specification

*This document defines the ecosystem space — a distinguished area for thoughts that reach beyond any single concept. It specifies structure, note format, and behavioral patterns.*

---

## 1. Purpose of the Ecosystem Space

The ecosystem space holds **residue** — thoughts that emerge during concept work but point beyond the current concept.

It serves:

- **Capture without disruption** — hold ecosystem thoughts while staying in concept flow
- **Accumulation without pressure** — notes collect without demanding processing
- **Later synthesis** — when ready, engage with what accumulated

The ecosystem is structurally separate but experientially fluid. Capturing a note shouldn't feel like leaving concept work.

---

## 2. Core Principles

### 2.1 Residue, Not Processing

During concept work, ecosystem capture is minimal:

| What it is | What it isn't |
|------------|---------------|
| Brief acknowledgment | Synthesis or connections |
| Held without pressure | Something requiring action |
| Trace of a passing thought | Beginning of ecosystem work |
| Quiet accumulation | Interruption to current focus |

The user's capacity in the moment is respected. The thought gets held. That's all.

### 2.2 Two Realities

| Structural Reality | Experiential Reality |
|--------------------|---------------------|
| Ecosystem is a distinguished space | No rift when capturing |
| Its own directory, its own manifest | Subtle acknowledgment, continue flowing |
| Clear separation in file system | Meaning-making stays grounded in the moment |

### 2.3 The Pattern That Connects

Ecosystem-level work follows the same principles as concept-level work:

| Principle | Concept Level | Ecosystem Level |
|-----------|---------------|-----------------|
| Alive thread | What's alive in this concept? | What's alive across concepts? |
| Participation | Agent works *with* you | Ecosystem voice participates briefly |
| Residue | Held threads accumulate | Ecosystem notes accumulate |
| Later emergence | Explore develops held material | Ecosystem dialogue develops accumulated notes |
| Co-evolution | You and concept shape each other | Concepts and ecosystem shape each other |

---

## 3. Directory Structure

```
ecosystem/
  manifest.json             # Index of accumulated notes
  ecosystem.md              # Grows through ecosystem dialogue (optional, emerges later)
  notes/                    # Residue accumulates here
    2024-12-07_cards-native.md
    2024-12-08_moments-span-apps.md
```

The ecosystem directory is created when the first ecosystem note is captured.

---

## 4. Note File Format

Each note file preserves the moment of emergence with minimal structure.

```markdown
# [Theme — in your words]

**From:** [concept-id]
**When:** [timestamp]
**Context:** [what you were exploring — one line]

[Your observation, exactly as you said it]
```

### 4.1 Field Specifications

**Title (Theme)**
- The theme of the ecosystem thought
- In the user's words, not normalized
- Becomes the `# heading` of the file

**From**
- The concept id where this thought emerged
- Used for bridging back during ecosystem dialogue

**When**
- ISO-8601 timestamp
- Captures the moment of emergence

**Context**
- One line describing what the user was exploring
- Preserves the alive thread at the moment of capture
- Helps reconstruct atmosphere during later synthesis

**Observation**
- The user's words, exactly as spoken
- No paraphrasing or restructuring
- This is the raw material for later weaving

### 4.2 Example Note File

```markdown
# Cards as ecosystem-native pattern

**From:** qino-lens
**When:** 2024-12-07T14:30:00Z
**Context:** exploring how lens captures and displays moments

Cards isn't just a lens feature — it's the shape of a held moment.
The same pattern could work in journal, in ritual, anywhere a moment
wants to be seen without being flattened.
```

---

## 5. Residue Capture Behavior

### 5.1 Signal Recognition

During concept exploration, the agent recognizes explicit ecosystem signals:

- "hold that for ecosystem"
- "that's bigger than [concept]"
- "ecosystem note: ..."
- "put that at ecosystem level"

The agent does **not** auto-detect implicit signals. The user must explicitly indicate ecosystem-level thinking.

### 5.2 Capture Response

When an ecosystem signal is recognized:

1. **Acknowledge** with "∴" + distilled essence
   - Example: `∴ Cards as shared language for holding moments`
   - The essence is framed from the current concept's point of view
   - Concise, reassuring — confirms the agent understood

2. **Create note file** in `ecosystem/notes/`
   - Filename: `YYYY-MM-DD_note-id.md`
   - Content follows the format in Section 4

3. **Add manifest entry** to `ecosystem/manifest.json`
   - All required fields per manifest-ecosystem-spec.md

4. **Continue naturally** with concept work
   - No explicit "back to..." — just flow
   - The capture is seamless

### 5.3 Creating Ecosystem Directory

If `ecosystem/` doesn't exist when first note is captured:

1. Create `ecosystem/` directory
2. Create `ecosystem/manifest.json` with empty notes array
3. Create `ecosystem/notes/` directory
4. Then proceed with note capture

---

## 6. Ecosystem Dialogue (Later Phase)

When the user is ready to engage with accumulated notes:

### 6.1 Entry Points

- `/qino:ecosystem`
- "let's look at what's accumulated"
- "what patterns are there?"

### 6.2 Ecosystem Voice Leads

In ecosystem mode, the agent:

1. Reads accumulated notes from manifest
2. Presents them lightly (not as a list to process)
3. Asks: "What feels connected? What draws your attention?"
4. Works through dialogue — same alive-thread principles
5. When patterns emerge, proposes weaving into `ecosystem.md`
6. When ready, offers: "Stay here, or return to a concept?"

### 6.3 Ecosystem.md Structure

The `ecosystem.md` file grows through dialogue. It might include:

- Discovered patterns across concepts
- Shared principles that emerged
- Bridges between concepts
- Questions that span the ecosystem

The structure emerges from actual use — not predetermined.

---

## 7. Bridging Between Spaces

### 7.1 From Concept to Ecosystem

During concept exploration, when user signals ecosystem-level thinking:
- Capture as residue (Section 5)
- Continue in concept space

### 7.2 From Ecosystem to Concept

During ecosystem dialogue, when a note connects to a concept:
- Agent can reference the source concept
- User can choose to return to that concept
- The bridge is relational, not mechanical

### 7.3 Agent Awareness

The agent bridges spaces through awareness:
- During concept work, can read from `ecosystem/` when relevant
- During ecosystem work, can read from `concepts/` for context
- No data coupling — just intelligent reading

---

## 8. Responsibilities of the Qino Concept Agent

When reading `ecosystem-spec.md`, the agent must:

- Understand the ecosystem as a distinguished but experientially fluid space
- Recognize ecosystem signals during concept exploration
- Create ecosystem structure on first capture
- Follow the "∴" acknowledgment pattern precisely
- Maintain seamless flow after capture
- Lead ecosystem dialogue when user is ready
- Never pressure user to process accumulated notes

---

## 9. Future Extensions

Possible future capabilities (not currently implemented):

- Ecosystem home command for overview
- Connections between ecosystem notes
- Weaving patterns into concept Glowing Connections
- Ecosystem-level held threads

These will emerge from actual use, not speculation.
