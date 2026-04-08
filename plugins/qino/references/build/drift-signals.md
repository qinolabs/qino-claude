# Drift Signals Reference

Patterns that suggest concept-level learnings during implementation. When you recognize these signals, surface them and offer to update the concept.

---

## Entity Drift

**Signal**: Renaming, restructuring, or discovering new entities in the domain model.

**Example phrases**:
- "Actually, 'Match' should be 'Session'"
- "We need a 'Template' entity that doesn't exist in the concept"
- "Player and User are actually the same thing"
- "This needs to be split into two separate things"

**What to surface**:
> "You're renaming [X] to [Y]. That's a domain model shift — the concept still uses [X].
>
> Want to update the concept?"

**Response**: Offer to update concept's domain model / entity names.

---

## Scope Drift

**Signal**: Features being added or removed from what the concept specified.

**Example phrases**:
- "We should also add export functionality"
- "The timer feature doesn't make sense anymore"
- "This needs authentication, which wasn't in scope"
- "Let's skip this feature for now"

**What to surface**:
> "That's [adding/removing] a feature from what the concept scoped.
>
> Current scoped features: [list from concept]
>
> Want to update the concept's Scoped Features?"

**Response**: Offer to update concept's Scoped Features section.

---

## Surface Drift

**Signal**: Interaction patterns evolving from what the concept described in Primary Surfaces.

**Example phrases**:
- "Quick-entry should be a modal, not a page"
- "Users need a dashboard view we didn't plan"
- "The flow should be reversed"
- "This needs to be accessible from the main screen"

**What to surface**:
> "The concept describes surfaces as [X], but you're moving toward [Y].
>
> Want to update the concept's Primary Surfaces?"

**Response**: Offer to update concept's Primary Surfaces section.

---

## Constraint Discovery

**Signal**: Technical or real-world limits affecting concept assumptions.

**Example phrases**:
- "The API doesn't support real-time updates"
- "Mobile can't handle this complexity"
- "Users won't have the data we assumed"
- "This would require [expensive thing] we can't do"

**What to surface**:
> "You've discovered a constraint: [constraint].
>
> This affects the concept's assumption that [assumption].
>
> Want to note this in the concept?"

**Response**: Offer to update concept (add constraints section or adjust boundaries).

---

## Glow Emergence

**Signal**: What makes the app feel alive becomes clearer through building.

**Example phrases**:
- "The satisfaction is in the quick capture, not the history"
- "Social aspect matters more than we thought"
- "The delight is in the transitions"
- "Users care most about [X], not [Y]"

**What to surface**:
> "You're discovering what makes this glow: [observation].
>
> The concept's Glowing Connections say [current glow].
>
> Want to refine that?"

**Response**: Offer to update concept's Glowing Connections section.

---

## Tone Shift

**Signal**: The voice or personality of the app shifting from concept's description.

**Example phrases**:
- "This should feel more playful"
- "The tone is too serious for what we're building"
- "Users expect something more professional"

**What to surface**:
> "The tone is shifting from [concept's tone] toward [emerging tone].
>
> Want to update the concept's Tone & Communication?"

**Response**: Offer to update concept's tone section.

---

## When NOT to Surface

Not every change is concept drift. Don't surface for:

- **Technical implementation details** — these belong in implementation.md
- **Iteration-level scope adjustments** — these belong in iteration notes
- **Temporary workarounds** — unless they become permanent
- **User preferences during build** — unless they reveal something about the concept

The test: "Would this change how someone understands what this app is?"

If yes → concept drift, surface it.
If no → implementation detail, note in iteration.
