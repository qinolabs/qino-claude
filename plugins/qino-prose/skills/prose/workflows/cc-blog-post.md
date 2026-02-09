---
description: Write a Character Coherence blog post through staged three-agent architecture
allowed-tools: Read, Write, Edit, Glob, Bash
argument-hint: "CC-1 | CC-3 | (post identifier)"
---

# /qino-prose:cc-blog-post

Write a Character Coherence blog post through a staged three-agent architecture with two user checkpoints.

## Overview

Blog post creation flows through phases:

1. **Prep Agent** — Context collection with 2 steering checkpoints
   - Readiness Check → user confirms dependencies met
   - Outline → user adjusts emphasis
2. **Hard cut** — cc-blog-prep.md complete
3. **Prose Agent** — receives only cc-blog-prep.md, writes draft
4. **Editorial Agent** — reviews draft in separate context, returns edits or approval
5. **Revision** (if needed) — prose agent applies specific edits

User steers readiness and outline. Prose and editorial are automated with quality gates.

---

## Arguments

Arguments: `$ARGUMENTS`

- **Post identifier** (required): e.g., "CC-1", "CC-3", "CC-4"

If no identifier provided, ask which post to write.

---

## Before You Begin

### Validate Post Identifier

Parse the post identifier. Valid identifiers: CC-1 through CC-10.

### Set Up Paths

```
Base: qinolabs-repo/implementations/character-coherence/

Inputs:
  blog-series-plan.md         # Post requirements and structure
  implementation.md           # Technical context
  iterations/                 # Iteration files (for posts 3-9)

Outputs:
  blog/CC-{N}/
    cc-blog-prep.md           # From prep agent
    draft.md                  # From prose agent
    post.md                   # Final after editorial
```

### Create Output Directory

```bash
mkdir -p qinolabs-repo/implementations/character-coherence/blog/CC-{N}
```

---

## Phase 1: Prep Agent

Spawn the prep agent to handle readiness and outline:

```
Use agent: cc-blog-prep

Pass to agent:
- Post identifier: CC-{N}
- Output path: qinolabs-repo/implementations/character-coherence/blog/CC-{N}/cc-blog-prep.md
```

The prep agent handles two checkpoints:

**Checkpoint 1: Readiness**
- Reads blog-series-plan.md, iteration file (if applicable)
- Checks dependencies (iteration complete? lens-lab baseline?)
- Presents readiness status
- User confirms "ready" or identifies blocker

**Checkpoint 2: Outline**
- After readiness confirmed
- Generates outline from iteration findings
- Identifies creative opportunities
- User approves or adjusts

**Completion:**
- Announces "cc-blog-prep.md complete — ready for prose agent"

---

## Phase 2: Hard Cut → Prose Agent

When cc-blog-prep.md is complete, spawn the prose agent:

```
Use agent: cc-blog-prose

The prose agent reads ONLY:
- cc-blog-prep.md
- references/blog/craft.md
- references/blog/cc-sensitivities.md

Output: qinolabs-repo/implementations/character-coherence/blog/CC-{N}/draft.md
```

**Critical:** The prose agent receives ONLY cc-blog-prep.md and references. This constraint is the quality mechanism — it forces fresh invention, prevents rehashing, makes the brief fully generative.

The prose agent will:
1. Read cc-blog-prep.md and reference files
2. Transform prepared context into compelling prose
3. Follow craft guidelines (grounding, earned vocabulary, inviting tone)
4. Present draft to orchestrator

---

## Phase 3: Editorial Review

When the prose agent presents its draft, spawn the editorial agent in a **separate context**:

```
Use agent: cc-blog-editorial

Pass to agent:
- The path to the draft: qinolabs-repo/implementations/character-coherence/blog/CC-{N}/draft.md
- The pass number: 1 (or 2 for second pass)
- Do NOT pass cc-blog-prep.md or iteration files
```

**Critical:** The editorial agent sees ONLY the draft file. This separation is intentional — it evaluates execution without knowing the constraints that shaped it.

The editorial agent will:
1. Read the draft as a reader would
2. Check against craft patterns
3. Return either `APPROVED` or a list of specific line-level edits

---

## Phase 4: Revision Loop

**If APPROVED:** Proceed to Phase 5.

**If NEEDS REVISION returned:**

1. Editorial returns edits in format:
   ```
   NEEDS REVISION (N issues)

   Line 23: "Retrieval is the process of..." → open with concrete scenario
   Line 45: "substrate" deployed before earned → ground with example first
   Line 78: concluding summary → end with question or implication
   ```

2. Pass edit list to prose agent:
   ```
   Apply these specific edits to draft.md
   Do not rewrite sections not flagged.
   ```

3. Prose agent applies edits directly to draft.md

4. **Second editorial pass:**
   - Send revised draft.md to editorial agent (fresh context)
   - If APPROVED → proceed to Phase 5
   - If NEEDS REVISION with ≤5 issues → apply and proceed to Phase 5
   - If NEEDS REVISION with >5 issues → flag for human review

**Maximum 2 editorial passes per post.**

---

## Phase 5: Finalize

After editorial approval:

1. **Copy to final:**
   ```bash
   cp draft.md post.md
   ```

2. **Announce completion:**
   ```
   ─────────────────────────────────────────────────────────────────
   CC-{N}: "{Post Title}"

     {One-line summary of the post's core finding or argument}

     Ready for publication.

   ─────────────────────────────────────────────────────────────────
   files

     prep:  blog/CC-{N}/cc-blog-prep.md
     draft: blog/CC-{N}/draft.md
     final: blog/CC-{N}/post.md

   ─────────────────────────────────────────────────────────────────
                                                        {word count}
   ```

---

## Post Identifier Reference

| Post | Title | Dependencies |
|------|-------|--------------|
| CC-1 | What AI Characters Actually Do | None |
| CC-2 | The Genuine Differences | None |
| CC-3 | 100 Messy Encounters | Iteration 01 |
| CC-4 | Can You Tell the Difference? | Iteration 02 |
| CC-5 | How Long Will You Wait? | Iteration 03 |
| CC-6 | What Users Actually Write | Iteration 04 |
| CC-7 | The Scaling Cliff | Iteration 05 |
| CC-8 | How Do You Know It's Working? | Iteration 06 |
| CC-9 | When Characters Contradict | Iteration 07 |
| CC-10 | What We Learned | All iterations |

---

## Checkpoint Summary

| Phase | Type | User Action |
|-------|------|-------------|
| Readiness | **Interactive** | Confirm dependencies met or identify blocker |
| Outline | **Interactive** | Approve or adjust emphasis |
| Prose | Automatic | None — hard context cut |
| Editorial | Automatic | None — quality gate |
| Revision | Semi-automatic | Review if >5 issues on pass 2 |

Two interactive checkpoints before writing. Editorial is automatic quality control.

---

## User Interaction at Checkpoints

At interactive checkpoints, user can:
- **Proceed:** "ready", "approve" — continue to next phase
- **Adjust:** "more emphasis on X", "include the Elena example"
- **Ask:** "tell me more about the surprise finding"
- **Block:** "iteration 01 isn't complete yet"

Checkpoints surface system certainty to inform user intuition.

---

## Reference Documents

Consult during execution:
- `references/blog/craft.md` — Engineering blog prose craft
- `references/blog/cc-sensitivities.md` — Character-coherence specific guidance

---

## Guardrails

These commonly fail. Keep visible:

- Opening must be concrete scenario, not definition
- Domain terms must be earned before deployment
- Experiments framed as drama, not procedure
- Surprises highlighted, not buried
- Ending opens more than it closes
- No marketing tone ("powerful", "revolutionary")
- No manual tone (dry, procedural lists)
- Honest reckoning frame maintained throughout
