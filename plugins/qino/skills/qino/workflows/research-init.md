# Research Init Workflow

**Execution:** spawn
**Voice:** Exploratory. Curious. No pressure toward conclusions.
**Agent:** research

**Reference:** Read `references/research/research-spec.md` for inquiry structure.

---

## Task

Create a new research inquiry.

---

## Prerequisite Check

### 1. Check for Research Workspace

Use context from SKILL:
- If `context.type === "research"` → use current directory
- If `context.researchRepo` exists → use that path as research workspace
- If neither → error:

> "No research workspace configured. Run 'setup research workspace' or add researchRepo to qino-config.json."

Stop.

### 2. Check for Argument

If no argument provided:
> "What draws your inquiry? Give me a topic or question."

**WAIT** for response.

---

## Flow

### 1. Generate Inquiry ID

From the topic:
- Lowercase, hyphenated
- Keep it short and recognizable

### 2. Check for Existing

Check if `inquiries/[id]/` already exists.

If exists:
> "[id] already exists. Want to continue it, or use a different name?"

**WAIT** for response.

### 3. Surface the Question

> "What draws you to this?"

**WAIT** for response.

This becomes the seed for "The Question" section.

### 4. Create Inquiry

Create folder structure:
```
inquiries/[id]/
├── thread.md
└── fragments/
```

Initialize thread.md:
```markdown
# [Topic Name]

**Started:** YYYY-MM-DD
**Status:** active

---

## The Question

[What the user said draws them to this]

---

## [First section — emerges from dialogue]

[Initial inquiry content]

---

## Open Threads

- [First thread — from what drew them]
```

### 5. Update Manifest

Add entry to manifest `inquiries` array:
```json
{
  "id": "[id]",
  "name": "[Topic Name]",
  "path": "inquiries/[id]/thread.md",
  "status": "active",
  "started": "[timestamp]",
  "last_touched": "[timestamp]",
  "threads": ["[first thread]"],
  "sourceRepo": "[path to originating repo, if cross-repo]"
}
```

Note: `sourceRepo` is only included when inquiry started from a different repo.

### 6. Confirm

```
∴ inquiry started

[brief reflection on the question]

where do you want to go first?
```

**WAIT** for response and continue working.

---

## Working with the New Inquiry

After creation, follow the user's energy:
- Expand thinking
- Capture insights
- Update thread.md with new content
- Add/update threads array

After each significant addition, ask:
> "continue, or pause here?"

**WAIT** for response.

If pausing, update manifest `last_touched` and show hints:

```
                        "where am I" to see research landscape
                        "capture arc" to capture emergence pattern
```

---

## Do NOT:

- Impose structure templates
- Demand hypotheses
- Push toward conclusions
- Judge incomplete work
- Auto-archive
