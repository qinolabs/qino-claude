# Qino Concept Agent — Ecosystem Specification

*This document defines the ecosystem space — a way of seeing across concepts. It specifies note capture, reference structure, and behavioral patterns.*

---

## 1. Purpose of the Ecosystem Space

The ecosystem space holds observations that reach beyond any single concept — cross-concept patterns, emerging themes, and thoughts that don't belong to just one place.

It serves:

- **Capture without disruption** — hold ecosystem thoughts while staying in concept flow
- **Accumulation without pressure** — notes collect without demanding processing
- **Multi-perspective anchoring** — one note can be relevant to multiple concepts and ecosystem
- **Later synthesis** — when ready, engage with what accumulated

Notes live in a unified `notes/` directory. Ecosystem relevance is tracked through references in `manifest.json`.

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

### 2.2 Unified Structure, Fluid Experience

| Structural Reality | Experiential Reality |
|--------------------|---------------------|
| Notes live in one place | No rift when capturing |
| References track scope | Subtle acknowledgment, continue flowing |
| Unified manifest | Meaning-making stays grounded in the moment |

Notes are anchored through references — each reference connects the note to a scope (concept or ecosystem) with its own context and status.

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
<project-root>/
  manifest.json             # Unified: concepts + notes with references
  notes/                    # All notes (ecosystem and concept-level)
    2024-12-07_cards-native.md
    2024-12-08_moments-span-apps.md
  ecosystem.md              # Woven patterns (grows through dialogue, created when needed)
  concepts/
    ...
```

The `notes/` directory is created during init or when the first note is captured.

---

## 4. Note File Format

Each note file preserves the moment of emergence with minimal structure. Context and origin are tracked in manifest references, not in the file.

```markdown
# [Title — the essence]

**Captured:** YYYY-MM-DDTHH:MM:SSZ

[Your observation, exactly as you said it]
```

### 4.1 Field Specifications

**Title**
- The essence of the thought — serves as the note's identity
- In the user's words, not normalized
- Becomes the `# heading` of the file

**Captured**
- ISO-8601 timestamp
- The moment of emergence

**Content**
- The user's words, exactly as spoken
- No paraphrasing or restructuring
- This is the raw material for later weaving

### 4.2 What Lives in Manifest vs. File

| In File | In Manifest Reference |
|---------|----------------------|
| Title (essence) | scope (concept-id or "ecosystem") |
| Captured timestamp | context (from that scope's perspective) |
| Full content | status (descriptive, natural language) |

This separation allows one note to have different contexts for different scopes.

### 4.3 Example Note File

```markdown
# Cards as ecosystem-native pattern

**Captured:** 2024-12-07T14:30:00Z

Cards isn't just a lens feature — it's the shape of a held moment.
The same pattern could work in journal, in ritual, anywhere a moment
wants to be seen without being flattened.
```

### 4.4 Example Manifest Entry

```json
{
  "id": "cards-native",
  "path": "notes/2024-12-07_cards-native.md",
  "captured": "2024-12-07T14:30:00Z",
  "references": [
    {
      "scope": "qino-lens",
      "context": "emerged while exploring moment capture",
      "status": "captured, may inform lens surfaces"
    },
    {
      "scope": "ecosystem",
      "context": "pattern spanning multiple concepts",
      "status": "captured, not yet woven"
    }
  ]
}
```

---

## 5. Note Capture Behavior

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

2. **Create note file** in `notes/`
   - Filename: `YYYY-MM-DD_note-id.md`
   - Content follows the format in Section 4

3. **Add note entry** to `manifest.json` notes array
   - Include id, path, captured timestamp
   - Add reference with scope `"ecosystem"` + context + descriptive status
   - Optionally add reference to current concept if the note is also relevant there

4. **Continue naturally** with concept work
   - No explicit "back to..." — just flow
   - The capture is seamless

### 5.3 Creating Notes Directory

If `notes/` doesn't exist when first note is captured:

```bash
mkdir -p notes
```

Then proceed with note capture.

---

## 6. Ecosystem Dialogue (Later Phase)

When the user is ready to engage with accumulated notes:

### 6.1 Entry Points

- `/qino:ecosystem`
- "let's look at what's accumulated"
- "what patterns are there?"

### 6.2 Ecosystem Voice Leads

In ecosystem mode, the agent:

1. Reads `manifest.json` — filters notes where any reference has `scope = "ecosystem"`
2. Reads each note file to get title/essence
3. Presents them lightly (not as a list to process)
4. Asks: "What feels connected? What draws your attention?"
5. Works through dialogue — same alive-thread principles
6. When patterns emerge, proposes weaving into `ecosystem.md`
7. When weaving, updates the ecosystem reference status (e.g., "woven into ecosystem.md")
8. When ready, offers: "Stay here, or return to a concept?"

### 6.3 Ecosystem.md Structure

The `ecosystem.md` file grows through dialogue. It might include:

- Discovered patterns across concepts
- Shared principles that emerged
- Bridges between concepts
- Questions that span the ecosystem

The structure emerges from actual use — not predetermined.

---

## 7. Bridging Between Scopes

### 7.1 From Concept to Ecosystem

During concept exploration, when user signals ecosystem-level thinking:
- Capture note with ecosystem reference (Section 5)
- Optionally add concept reference too
- Continue in concept work

### 7.2 From Ecosystem to Concept

During ecosystem dialogue, when a note connects to a specific concept:
- Check note's references for concept scopes
- Agent can reference those concepts
- User can choose to return to that concept
- The bridge is relational, not mechanical

### 7.3 Multi-Scope Notes

A single note can be relevant from multiple perspectives:

```json
"references": [
  { "scope": "daily-rhythm", "context": "...", "status": "..." },
  { "scope": "visual-language", "context": "...", "status": "..." },
  { "scope": "ecosystem", "context": "...", "status": "..." }
]
```

Each reference has its own context and status — the same note can be "integrated" into one concept while still "active" in ecosystem view.

### 7.4 Agent Awareness

The agent bridges scopes through unified manifest:
- During concept work, can check for notes referencing current concept
- During ecosystem work, can trace notes back to source concepts
- All through `manifest.json` — single source of truth

---

## 8. Responsibilities of the Qino Concept Agent

When reading `ecosystem-spec.md`, the agent must:

- Understand ecosystem as a scope, not a separate space
- Recognize ecosystem signals during concept exploration
- Create notes with appropriate references (ecosystem + optionally current concept)
- Follow the "∴" acknowledgment pattern precisely
- Maintain seamless flow after capture
- Lead ecosystem dialogue when user is ready
- Use descriptive status language, not mechanical enums
- Never pressure user to process accumulated notes

---

## 9. Future Extensions

Possible future capabilities (not currently implemented):

- Connections between notes (note-to-note references)
- Weaving patterns into concept Glowing Connections
- Automated status updates based on engagement patterns

These will emerge from actual use, not speculation.
