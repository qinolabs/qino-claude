# Iteration Workflow

**Execution:** spawn
**Voice:** Grounded. Practical. Let's build.
**Agent:** build + protocol-structure

**References:**
- `references/build/repo-conventions.md` — Implementation repo structure patterns
- `references/build/home-pattern.md` — Arrival pattern for generated commands
- `references/build/template-guidance.md` — How to capture learnings through colocation

---

## Task

Arrive at an app and work on it. This is the ongoing development workflow — planning iterations, building features, checking progress.

Protocol version: reads graph-based structure (node.json, story.md, content/) instead of legacy paths (implementation.md, iterations/, manifest.json).

---

## Context Handling

The SKILL has already detected workspace context. This workflow requires:

- `context.type === "implementation"`
- `context.protocol === "qino"`
- `"concept grounds"` edges in the implementation graph for concept links

If not in an implementation context:

> "This isn't an implementation workspace. Use 'setup implementation workspace' first."

---

## Arrival Pattern

When user says "work on [app]" or similar:

1. **Find the implementation context:**
   - Read `graph.json` at workspace root — locate the app node by id or title match
   - The `nodesDir` field in graph.json tells you where nodes live (e.g., `"implementations"`)
   - Read `{nodesDir}/{app}/node.json` for identity (title, type, status)
   - Read `{nodesDir}/{app}/story.md` for technical context (stack, boundaries, flags)
   - Scan `{nodesDir}/{app}/content/` for iteration files
   - Check root graph for active navigator nodes relevant to this app (via `read_graph`, filter `type: "navigator"`)

2. **Read current state:**
   - Scan `content/` files sorted by prefix number — find the first non-complete iteration
   - What's the git state? (recent commits, uncommitted changes)
   - Any blockers noted in iteration files?

2b. **Read the neighborhood:**
   - Read edges from the root graph where this app node is source or target
   - Which connected nodes are relevant to this task? Follow edges whose context relates to the current work
   - This is peripheral vision — don't read every neighbor in full, but let edge context inform what you surface on arrival

3. **Check concept sync (git-based):**
   - Find the concept via `"concept grounds"` edges in the implementation graph (target uses cross-graph format `"workspace:concept-id"`)
   - Get last concept change: `git -C {conceptsPath} log -1 --format=%ci -- {nodesDir}/{concept-id}/`
   - Get last implementation change: `git log -1 --format=%ci -- {nodesDir}/{app}/`
   - If concept is more recent than implementation, flag for user attention in arrival surface

4. **Check for active navigators:**
   - From the graph, filter nodes with `type: "navigator"` and `status: "active"`
   - If any navigator's territory references this app, note it
   - If a navigator is active, `read_node` to load its terrain — open questions inform "what's next" suggestions

5. **Output arrival surface:**

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
│ navigator (if active)                   │
│ [navigator name] — [open question count]│
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
                        "activate navigator" to load terrain context
```

**If concept changed since last implementation work**, use this variant instead:

```
┌─────────────────────────────────────────┐
│ [app-name]                              │
│                                         │
│ concept — updated since last work       │
│ [concept-name]                          │
│ modified [relative time]                │
│                                         │
│ what changed                            │
│ [brief summary — run git diff on        │
│ concept path to see what shifted]       │
│                                         │
│ iteration                               │
│ [current] — [status]                    │
│                                         │
└─────────────────────────────────────────┘

Use `AskUserQuestion` to let the user decide:

| Header | Question | Options |
|--------|----------|---------|
| "Concept sync" | "The linked concept evolved since your last implementation work. How do you want to handle it?" | Review ("See what changed in detail"), Reconcile ("Update iteration plan if needed"), Acknowledge ("Continue as-is") |

If "Review", show `git -C {conceptsWorkspace} diff` on the concept path.
If "Reconcile", read full concept and compare to current iteration goals. Offer to adjust iteration scope/goals based on concept changes.
```

No stored timestamps to update — git IS the sync mechanism. The next arrival will re-compare naturally.

---

## Plan Iterations

When user says "plan iterations" or similar:

### If no iteration files exist in content/:

1. Read the linked concept fully:
   - `{conceptsWorkspace}/nodes/{concept-id}/story.md` for impulse
   - `{conceptsWorkspace}/nodes/{concept-id}/content/` for developed material
2. Read `story.md` in the implementation node for technical context
3. Facilitate iteration planning dialogue:

   > "Let's plan the iterations for [app-name]."
   >
   > Looking at the concept, here's what needs to happen:
   > [2-3 major phases identified from concept content]
   >
   > What feels like the right first iteration?

4. **WAIT** for response.

5. For each iteration, define:
   - Scope (what this phase accomplishes)
   - Goals (as checkboxes)
   - Test Before Moving On (how to know it's ready)

6. Create iteration files in `content/`:
   - `content/01-[name].md`
   - `content/02-[name].md`
   - etc.

   Fill in:
   - Scope from iteration discussion
   - Goals as checkboxes
   - Test criteria
   - Leave Technical Decisions and Learnings sections empty for capture during work

### If iteration files already exist in content/:

1. Show current iteration state (scan content/ files, find active iteration)
2. Use `AskUserQuestion` to determine direction:

   | Header | Question | Options |
   |--------|----------|---------|
   | "Iterations" | "What do you want to do with iterations?" | Review current ("Review and adjust the current iteration"), Plan next ("Define the next iteration"), Reorder ("Reorder iteration sequence") |

---

## Build Mode

When user says "build [goal]" or wants to work on current iteration:

1. Read current iteration file from `content/`
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
   - **Write tests for new behavior** — especially for AI generation (integration tests), orchestration logic, and service methods
   - Document significant technical decisions in iteration's "Technical Decisions" section
   - Note learnings in iteration's "Learnings" section as they emerge
   - Check off completed goals
   - **Write annotations when you notice cross-cutting signals** — not just proposals. Use the appropriate signal type:
     - `reading` — an observation about what's here (something noticed, not yet actionable)
     - `connection` — a link to another node (auto-creates an edge; writing a connection IS creating structural context)
     - `tension` — something feels off or misaligned
     - `proposal` — a concrete suggestion for future work

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

Surface the observation in prose, then use `AskUserQuestion`:

> "[Brief observation of the shift — what changed and why it matters]"

| Header | Question | Options |
|--------|----------|---------|
| "Drift" | "This looks like a concept-level change." | Update concept ("Invoke os agent to make the change"), Note for later ("Capture as observation — uncertain insights"), Continue ("Stay in implementation") |

**If user chooses "update concept":**
1. Invoke os agent via Task tool with context:
   - What drift was detected
   - Current implementation state
   - Suggested change to concept
2. Os agent edits `story.md` or `content/` in concepts repo at `{conceptsWorkspace}/nodes/{concept-id}/`
3. Control returns to build context

**If user chooses "note for later":**
- Use capture workflow (for observations that aren't decisions yet)
- These notes can be reviewed later via the concept's `"concept grounds"` edge

**Reference:** See `references/build/drift-signals.md` for detailed examples.

---

## Cross-App Patterns

When you discover architectural patterns that apply across multiple apps (seeding, RPC, type sharing, etc.):

1. Document the decision in iteration's Technical Decisions section first
2. If the pattern has settled and is being used by multiple apps:
   - Consider creating documentation in `{nodesDir}/docs/`
   - Reference it from the app's `story.md` "Related Documentation" section

---

## Iteration Transitions

When all goals in an iteration are complete:

1. Run "Test Before Moving On" checks — both automated tests and manual verification steps
2. If passing:

   > "Iteration [name] complete."
   >
   > Ready for next iteration: [next iteration name]
   >
   > Or take time to review what emerged?

3. Update iteration status to "Complete" in the content file

4. **Update node.json** if needed (e.g., status field)

5. Offer to start next iteration

6. **Concept alignment check** (before starting next iteration):

   > "Before moving to [next iteration]:
   >
   > Any concept-level learnings from this iteration?
   > Things that should flow back to the concept?"

   If user has observations, offer to update concept (invoke os agent) or capture for later.

7. **Connection check** — consider whether discoveries during this iteration revealed relationships to other nodes. If cross-cutting patterns, shared concerns, or dependencies surfaced during work, write connection annotations to formalize them. These auto-create edges that future agents will navigate on arrival.

---

## Cross-Context Work

During dev work, essence questions may arise. Recognize signals:

- "is this aligned with the concept?"
- "what was the original impulse?"
- "does this still fit?"

When recognized:

> "That's an essence question — let me check the concept."

Read the linked concept at `{conceptsWorkspace}/nodes/{concept-id}/story.md` and surface relevant context. Don't spawn a separate agent — hold both contexts.

---

## Do NOT:

- Start building without confirming the goal
- Skip iteration planning when none exists
- Check off goals without user confirmation
- Modify concept files (those go through os agent)
- Overwhelm with multiple goals at once
- Look for `implementation.md`, `iterations/`, or `manifest.json` — use protocol paths
- Store concept sync timestamps — git handles this
