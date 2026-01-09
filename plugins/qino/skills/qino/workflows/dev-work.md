# Dev Work Workflow

**Voice:** Grounded. Practical. Let's build.

**Agent:** dev

**Reference:** Read `references/qino-dev/home-pattern.md` for arrival pattern.

---

## Task

Arrive at an app and work on it. This is the ongoing development workflow — planning iterations, building features, checking progress.

---

## Context Handling

The SKILL has already detected workspace context. This workflow requires:

- `context.type === "implementation"`
- `context.conceptsRepo` pointing to concepts repository
- `context.linkedConcept` or `context.linkedConcepts` for concept links

If not in an implementation context:

> "This isn't an implementation workspace. Use 'setup implementation workspace' first."

---

## Arrival Pattern

When user says "work on [app]" or similar:

1. **Find the implementation context:**
   - Check `implementations/[app]/implementation.md` for technical context
   - Check `implementations/[app]/iterations/` for current phase
   - Find the linked concept via manifest

2. **Read current state:**
   - What iteration are we on? (look for "In progress" status)
   - What's the git state? (recent commits, uncommitted changes)
   - Any blockers noted in iteration files?

3. **Check concept sync status:**
   - Read linked concept's `last_touched` from concepts-repo manifest.json
   - Compare to implementation's `lastConceptCheck` timestamp (in implementation.md)
   - If concept is newer, flag for user attention in arrival surface

4. **Output arrival surface:**

```
┌─────────────────────────────────────────┐
│ [app-name]                              │
│                                         │
│ concept                                 │
│ [linked concept name]                   │
│                                         │
│ iteration                               │
│ [current iteration name] — [status]     │
│ [brief scope description]               │
│                                         │
│ git                                     │
│ [recent activity summary]               │
│                                         │
└─────────────────────────────────────────┘

from here

  [observation about current state]
  [suggested next action]

                        "plan iterations" to define the roadmap
                        "build [goal]" to work on current iteration
                        "explore [concept]" to check essence alignment
```

**If concept changed since last check**, use this variant instead:

```
┌─────────────────────────────────────────┐
│ [app-name]                              │
│                                         │
│ concept — updated since last check      │
│ [concept-name]                          │
│ modified [relative time]                │
│                                         │
│ what changed                            │
│ [brief diff of key sections — compare   │
│ current concept to what was there at    │
│ lastConceptCheck time]                  │
│                                         │
│ iteration                               │
│ [current] — [status]                    │
│                                         │
└─────────────────────────────────────────┘

The linked concept evolved. Want to:
  • review — see what changed in detail
  • reconcile — update iteration plan if needed
  • acknowledge — sync timestamp, continue as-is
```

If user chooses "reconcile", read full concept and compare to current iteration goals. Offer to adjust iteration scope/goals based on concept changes.

After reconciliation or acknowledgment, update `lastConceptCheck` in implementation.md.

---

## Plan Iterations

When user says "plan iterations" or similar:

### If no iterations exist yet:

1. Read the linked concept fully
2. Read implementation.md for technical context
3. Facilitate iteration planning dialogue:

   > "Let's plan the iterations for [app-name]."
   >
   > Looking at the concept, here's what needs to happen:
   > [2-3 major phases identified from concept's Scoped Features]
   >
   > What feels like the right first iteration?

4. **WAIT** for response.

5. For each iteration, define:
   - Scope (what this phase accomplishes)
   - Goals (as checkboxes)
   - Test Before Moving On (how to know it's ready)

6. Create iteration files:
   - `iterations/01-[name].md`
   - `iterations/02-[name].md`
   - etc.

7. Use the iteration template:

```markdown
# Iteration [NUMBER]: [NAME]

## Scope

[SCOPE_DESCRIPTION]

## Goals

- [ ] [GOAL_1]
- [ ] [GOAL_2]
- [ ] [GOAL_3]

## Test Before Moving On

[TEST_CRITERIA]

## Status

Not started

## Notes

*Learnings, decisions, and adjustments accumulate here during the iteration.*
```

### If iterations already exist:

1. Show current iteration state
2. Offer to:
   - Review and adjust current iteration
   - Plan next iteration
   - Reorder iterations

---

## Build Mode

When user says "build [goal]" or wants to work on current iteration:

1. Read current iteration file
2. Show remaining goals (unchecked items)
3. Focus on ONE goal at a time:

   > "Current iteration: [name]"
   >
   > Next goal: [first unchecked goal]
   >
   > Ready to work on this?

4. **WAIT** for confirmation.

5. Work on the goal, checking off when complete:
   - Make changes to app source code
   - Update iteration notes with learnings
   - Check off completed goals

6. After goal completion:

   > "Goal complete: [goal]"
   >
   > [remaining goals count] goals left in this iteration.
   >
   > Continue, or step back?

---

## Drift Recognition

During building, watch for signals that suggest concept-level learnings. These are moments where implementation reality diverges from concept assumptions.

**Drift signals to recognize:**

| Signal | Example phrases | What it suggests |
|--------|-----------------|------------------|
| Entity renaming | "let's call it X instead of Y" | Domain model shift |
| New entity | "we need a new thing called..." | Scope expansion |
| Feature addition | "we should also add..." | Scope expanding |
| Feature removal | "this doesn't make sense anymore" | Scope narrowing |
| Surface change | "the UI should work differently" | Interaction pattern shift |
| Reality constraint | "we can't do X because..." | Technical constraint discovered |
| Glow emergence | "the real delight is in..." | Core value clarifying |

**When you recognize a drift signal:**

> "[Brief observation of the shift — what changed and why it matters]
>
> This looks like a concept-level change.
>
> • update concept — invoke concept agent to make the change
> • note for later — capture as observation (uncertain insights)
> • continue — stay in implementation"

**If user chooses "update concept":**
1. Invoke concept agent via Task tool with context:
   - What drift was detected
   - Current implementation state
   - Suggested change to concept
2. Concept agent makes the edit to concept.md
3. Control returns to dev context
4. Update `lastConceptCheck` timestamp in implementation.md

**If user chooses "note for later":**
- Use capture workflow (for observations that aren't decisions yet)
- These notes auto-tag with linkedConcept and can be reviewed later

**Reference:** See `references/qino-dev/drift-signals.md` for detailed examples.

---

## Iteration Transitions

When all goals in an iteration are complete:

1. Run "Test Before Moving On" checks
2. If passing:

   > "Iteration [name] complete."
   >
   > Ready for next iteration: [next iteration name]
   >
   > Or take time to review what emerged?

3. Update iteration status to "Complete"
4. Offer to start next iteration

5. **Concept alignment check** (before starting next iteration):

   > "Before moving to [next iteration]:
   >
   > Any concept-level learnings from this iteration?
   > Things that should flow back to the concept?"

   If user has observations, offer to update concept (invoke concept agent) or capture for later.

   Update `lastConceptCheck` in implementation.md to current timestamp.

---

## Cross-Context Work

During dev work, essence questions may arise. Recognize signals:

- "is this aligned with the concept?"
- "what was the original impulse?"
- "does this still fit?"

When recognized:

> "That's an essence question — let me check the concept."

Read the linked concept and surface relevant context. Don't spawn a separate agent — hold both contexts.

---

## Do NOT:

- Start building without confirming the goal
- Skip iteration planning when none exists
- Check off goals without user confirmation
- Modify concept files (those go through concept agent)
- Overwhelm with multiple goals at once
