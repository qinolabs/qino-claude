---
name: prose
description: |
  Chronicle writing, research transmission, and prose lens application.
  Use when: writing chronicle chapters, surveying git history for chapters,
  transmitting research arcs, applying narrator or wanderer lenses,
  diagnosing scribe system, rewinding chapters, configuring visual style.
  Consolidates qino-scribe, qino-lens, and qino-relay.
---

# Prose Skill

Chronicle writing, research transmission, and prose transformation. Natural language activation — users describe intent, Claude routes to the appropriate workflow.

---

## Routing

Match user intent to workflow. Read the workflow file and follow its instructions.

| User Intent | Workflow |
|-------------|----------|
| Write chronicle chapter, "next chapter" | [workflows/chapter.md](workflows/chapter.md) |
| Survey git history, "plan chapters" | [workflows/survey.md](workflows/survey.md) |
| Diagnose scribe system, "check scribe" | [workflows/diagnose.md](workflows/diagnose.md) |
| Rewind last chapter, "undo chapter" | [workflows/rewind.md](workflows/rewind.md) |
| Create visual style, "configure images" | [workflows/visual-style.md](workflows/visual-style.md) |
| Transmit research, "create transmission" | [workflows/transmit.md](workflows/transmit.md) |
| Apply narrator lens | [workflows/narrator.md](workflows/narrator.md) |
| Apply wanderer lens | [workflows/wanderer.md](workflows/wanderer.md) |

---

## Three Domains

### Chronicle (from qino-scribe)

Transform git history into narrative. Multi-agent architecture with prep, prose, and editorial stages.

**Workflows:** chapter, survey, diagnose, rewind, visual-style

**Agents:**
- `agents/scribe-prep.md` — Lens-first prep with checkpoints
- `agents/scribe-prose.md` — Fantasy author writing from constraint
- `agents/scribe-editorial.md` — Voice review and revision

**References:**
- `references/qino-scribe/voice.md` — Craft devices and patterns
- `references/qino-scribe/craft.md` — Chapter format, world structure
- `references/qino-scribe/layers.md` — Layer architecture
- `references/qino-scribe/story-lenses.md` — Twelve lenses
- `references/qino-scribe/disturbance.md` — Git diff interpretation
- `references/qino-scribe/principles.md` — Relational substrate
- `references/qino-scribe/foundation.md` — World-seed configuration

### Transmission (from qino-relay)

Voice research arcs through the Student as reader companion.

**Workflows:** transmit

**Agents:**
- `agents/relay-prose.md` — Student voice
- `agents/relay-editorial.md` — Voice integrity review

**References:**
- `references/qino-relay/voice.md` — Student voice patterns
- `references/qino-relay/student-guide.md` — How the Student works
- `references/qino-relay/transmission-format.md` — Format specification
- `references/qino-relay/reader-journey-guide.md` — Reader journey prep

### Lenses (from qino-lens)

Transform prose through specific qualities of attention.

**Workflows:** narrator, wanderer

**References:**
- `references/qino-lens/narrator.md` — World as participant, body first
- `references/qino-lens/wanderer.md` — Embodied presence, contextual density
- `references/qino-lens/companion.md` — Companionship lens
- `references/qino-lens/newcomer.md` — Newcomer lens
- `references/qino-lens/student.md` — Student lens

---

## Context Detection

Before routing, check for chronicle or journal context:

1. **Chronicle context:** Look for `chronicle/manifest.json`
2. **Journal context:** Look for `journal/manifest.json` or via `.claude/qino-config.json`

This determines which workflows are available and where they operate.

---

## Error States

**No chronicle for chapter/survey/rewind:**
> "No chronicle found. Create one with: write a chronicle chapter"

**No journal for transmit:**
> "No journal found. Set up research workspace first."

**Unknown intent:**
> Route to `workflows/chapter.md` if chronicle exists, otherwise explain available workflows.

---

## Agent Reference

Agents are organized by domain:

**Chronicle agents:**
- `agents/scribe-prep.md`
- `agents/scribe-prose.md`
- `agents/scribe-editorial.md`

**Transmission agents:**
- `agents/relay-prose.md`
- `agents/relay-editorial.md`

**Lens workflows are direct transformations — no agents needed.**
