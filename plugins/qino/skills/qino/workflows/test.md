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
- No argument → prompt for target

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

6. Once ecology is confirmed, hold the test as a frame:
   > "Holding that question — what do you notice?"

   **WAIT** for the user's noticing.

7. When the user shares what they notice, distill to essence:
   ```
   ∴ [essence — 5-10 words capturing what was noticed]
   ```

8. Offer the capture choice:
   > "Capture this, or let it inform without persisting?"

   **WAIT** for response.

9. **If captured:** Create a note with ecology reference.

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

10. After capturing (or not), offer continuation:
    ```
    another ecology, or step back?

                        "test [target]" to notice another
                        "where am I" to step back
                        "explore [concept]" to go deeper
                        "attune [quality]" if a quality is emerging
    ```

11. **If not captured:**
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
