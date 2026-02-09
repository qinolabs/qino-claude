---
name: adventure
description: |
  Multi-perspective design exploration through emergent dialogue.
  Seven personas explore a challenge; questions emerge from what actually shapes the conversation.

  ACTIVATE:
  - "/design-adventure [challenge]", "run a design adventure", "explore this design challenge"
  - "design adventure about [topic]", "seven perspectives on [challenge]"
---

# Design Adventure Skill

Run a multi-perspective design exploration. Seven personas explore your challenge — six through words, one through environment. Questions emerge from what actually shapes the conversation.

---

## Execution

When this skill is invoked:

1. **Read the agent definition:** `agents/design-adventure.md`
2. **Read the workflow:** `workflows/design-adventure.md`
3. **Spawn the agent** using Task tool with the user's challenge
4. **Present the enter.md content** as the response — the machinery stays invisible

---

## Reference Documents

The agent reads these before generating:

- `references/design-adventure/personas-spec.md` — The seven personas
- `references/design-adventure/output-spec.md` — Four-file output structure
- `references/design-adventure/atmosphere-guide.md` — How The World co-evolves with dialogue

---

## Output

A design adventure produces four files in `design-adventures/YYYY-MM-DD_slug/`:

- **enter.md** — Atmospheric navigation with question previews and dialogue excerpts
- **dialogue.md** — Full 40-50 exchange conversation across four phases
- **questions.md** — Emergent questions consolidated with full exploration
- **synthesis.md** — Viable paths forward with tradeoffs and next steps
