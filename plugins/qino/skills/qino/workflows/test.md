# Test Workflow

**Voice:** Quieter than explore. It observes, it does not develop.

**Agent:** concept

**Reference:** Read `references/qino-concept/ecology-tests.md` for the eight ecology tests.
Read `references/qino-concept/manifest-project-spec.md` — Section 5-6 for note structure and references.

---

## Task

Test observes. It does not develop. It invites noticing through ecology-specific questions, then offers to capture what surfaces.

**Target determination:**

The test applies to whatever the user brings:
- A concept-id → test that concept
- An exploration-id (research context) → test that exploration
- A file path → test that artifact
- Context from conversation → test that idea or feature
- Decision context → test options against the concept (see Decision Context Mode)
- No argument → prompt for target

---

## Decision Context Mode

**When the user arrives with a decision to make** — options to evaluate, approaches to compare, a choice that needs grounding — the test workflow adapts.

**Signals:**
- "help inform the decision"
- "which approach..."
- "I'm deciding between..."
- Conversation context contains explicit options/alternatives
- MOMENTUM block describes a decision with multiple paths

**How this differs from single-concept mode:**

In single-concept mode, the user notices *through* the concept. The concept is the lens.

In decision context mode, the concept provides the *grounding* — the test is applied concretely to each option. The user sees how each option fares against the ecology test.

**Steps for decision context:**

1. Read the concept (as in single-concept mode).

2. Identify the options from conversation context or MOMENTUM block.

3. Discern which ecology applies (as in single-concept mode).

4. **Ground the test in the concept.** Find the key insight or principle that the test will reveal:
   > "From the concept:
   > '[Extract the relevant principle — the sentence or framing that makes the ecology test concrete]'
   >
   > The [ecology] test: [test question]"

5. **Apply the test to each option.** Walk through each alternative, showing what the test reveals:
   > "[Option A]:
   > [What the test reveals about this option — concrete, specific]
   >
   > [Option B]:
   > [What the test reveals about this option — concrete, specific]
   >
   > [Continue for each option...]"

6. **Surface the pattern:**
   > "Holding the [ecology] test against these options:
   >
   > [Brief synthesis — which approaches make the [key quality] visible vs. hidden/blurred/flattened]"

7. **Invite noticing:**
   > "What do you notice?"

   **WAIT** for response.

8. Continue with distillation and capture as in single-concept mode (steps 8-12).

**Example (figure ecology, embedding decision):**

> From the concept:
> "The figure isn't at the origin. The figure is the thread A→B→C reveals."
>
> The figure test: Can this figure be returned to and re-entered and still feel like "the same thing," even though it has changed?
>
> ---
>
> **Most recent embedding:**
> You return to the figure. You meet who they are now. The thread is invisible.
> Does it feel like the same thing? Only if you trust that "now" carries "then" implicitly.
>
> **Composite (averaged):**
> You return to the figure. You meet a blur of all encounters. The thread is flattened.
> Does it feel like the same thing? Possibly not — it's no particular moment.
>
> **LLM-synthesized essence:**
> You return to the figure. You meet an interpreted figure — something like "strategic patience."
> Does it feel like the same thing? Possibly more so — the synthesis identifies what persists.
>
> ---
>
> Holding figure ecology against these options:
> - Most recent: hides the pattern
> - Composite: blurs the pattern
> - Synthesized essence: names the pattern
>
> What do you notice?

---

## Context Handling

The SKILL has already detected workspace context. Use it to determine capture destination:

| context.type | Capture destination |
|--------------|---------------------|
| `concepts` | notes/ |
| `research` | notes/ or fragments/ (path-based) |
| `implementation` | notes/ in conceptsRepo (tagged) |

For `implementation`:
- Use `context.conceptsRepo` as workspace root for note creation
- Use `context.linkedConcept` as default test target if no argument
- Get repository name from current directory (for `source` field)

For `research`:
- If inside `explorations/[id]/` → capture to `explorations/[id]/fragments/`
- Otherwise → capture to `notes/`

---

## Single-Concept Mode

**Purpose:** Notice a concept through ecology tests.

**Steps:**

1. Read `manifest.json` and find the concept by `id`.

2. Read the full `concept.md` using the `path` field.

3. If user provided context with the invocation, use it to discern which ecology. If not, begin with:
   > "What would you like to notice?"

   **WAIT** for response.

4. **Discern the ecology.** Based on what the user brings, sense which ecology test applies:
   - Talking about timing, rhythm, experience → likely **user**
   - Talking about interaction, movement, touch → likely **gesture**
   - Talking about shape, boundaries, identity → likely **figure**
   - Talking about connections, tensions, flows → likely **relation**
   - Talking about environment, constraints, coherence → likely **world**
   - Talking about responses, returns, resonance → likely **echo**
   - Talking about patterns, accumulation, weave → likely **fabric**
   - Talking about support, infrastructure, invisibility → likely **infrastructure**

5. Surface your discernment, invite confirmation:
   > "This feels like **[ecology]** ecology."
   >
   > [Present the test question from ecology-tests.md]
   >
   > "Does this test resonate, or is there another ecology?"

   If uncertain between two:
   > "This feels like **user** ecology, but could also be **gesture** — which resonates?"

   **WAIT** for confirmation.

6. **Ground the test in the concept.** Once ecology is confirmed, surface the concept content through that ecology's lens:

   a. Find the key insight, principle, or framing in the concept that makes this ecology test concrete.

   b. Present it alongside the test:
   > "From the concept:
   > '[The relevant principle or framing — 1-3 sentences that ground the test]'
   >
   > The test: [ecology test question]"

   **Why this matters:** The user needs material to notice *from*. An abstract test question without concept content leaves nothing to engage with. The grounding makes the test workable.

   **Signals to surface for each ecology:**
   - **user** → timing, rhythm, how the concept touches daily life
   - **gesture** → interaction patterns, movements, touch points
   - **figure** → identity statements, what persists, boundaries
   - **relation** → connections, tensions, flows between elements
   - **world** → environmental constraints, coherence principles
   - **echo** → response patterns, returns, transformations
   - **fabric** → accumulation patterns, recurring motifs
   - **infrastructure** → support structures, hidden dependencies

7. Hold the question:
   > "What do you notice?"

   **WAIT** for the user's noticing.

8. When the user shares what they notice, distill to essence:
   ```
   ∴ [essence — 5-10 words capturing what was noticed]
   ```

9. Offer the capture choice:
   > "Capture this, or let it inform without persisting?"

   **WAIT** for response.

10. **If captured:** Create a note with ecology reference.

   a. Generate note id from essence (lowercase, hyphenated)

   b. Create `notes/` directory if it doesn't exist

   c. Create note file at `notes/YYYY-MM-DD_note-id.md`:
   ```markdown
   # [Essence as title]

   **Noticed:** YYYY-MM-DDTHH:MM:SSZ
   **Ecology:** [ecology name]

   [What the user noticed, in their words]
   ```

   d. Add entry to `manifest.json` notes array:

   **From concepts repo:**
   ```json
   {
     "id": "note-id",
     "path": "notes/YYYY-MM-DD_note-id.md",
     "captured": "YYYY-MM-DDTHH:MM:SSZ",
     "essence": "[distilled essence]",
     "references": [
       {
         "scope": "[concept-id]",
         "ecology": "[ecology name]",
         "context": "[what was noticed, brief]"
       }
     ]
   }
   ```

   **From implementation context:**
   ```json
   {
     "id": "note-id",
     "path": "notes/YYYY-MM-DD_note-id.md",
     "captured": "YYYY-MM-DDTHH:MM:SSZ",
     "essence": "[distilled essence]",
     "references": [
       {
         "scope": "[linkedConcept from context]",
         "ecology": "[ecology name]",
         "context": "[what was noticed, brief]",
         "source": "[repository name]"
       }
     ]
   }
   ```

11. After capturing (or not), offer continuation:
    ```
    another ecology, or step back?

                        "test [target]" to notice another
                        "where am I" to step back
                        "explore [concept]" to go deeper
                        "attune [quality]" if a quality is emerging
    ```

12. **If not captured:**
    > "The noticing happened. It informed."

    Then offer continuation as above.

---

## No Argument

If no target is provided:

**In concepts context:**
```
which concept would you like to notice through?

  [concept-1]
  [concept-2]
  [concept-3]
```

**In research context:**
```
what would you like to notice through?

  [exploration-1]
  [exploration-2]
  [calibration-1]
```

**In implementation context:** Default to linked concept.

**WAIT** for response, then proceed with the test.

Note: Ecology test patterns across concepts are now surfaced in home (the "noticed" section).

---

## Do NOT:

- Present all eight ecologies as a menu
- Score or rank observations
- Apply tests outside their ecology
- Rush through multiple tests
- Synthesize across ecologies
- Make the user justify their noticing
- Skip the discernment step (sensing which ecology)
- Force capture — letting it inform is equally valid
- **Ask "what do you notice?" without first grounding in concept content** — the user needs material to notice *from*
- **Skip decision context mode when options exist** — if the user arrives with alternatives to evaluate, apply the test concretely to each option
