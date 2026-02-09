# Capture Workflow

**Execution:** inject
**Voice:** Instant and light. Like whispering to a trusted companion — acknowledged, held, no interrogation.
**Agent:** concept

---

## Core Principle

A thought arrived. Capture it before it fades.

Captures are independent records — flat files at the workspace root, outside any graph or manifest. They don't need to become something else. They don't need status. They're already what they are.

---

## Context Handling

The SKILL has already detected workspace context. Captures go to the same place regardless of context type.

**Exception — Research fragments:** When `context.type === "research"` and the user is inside `explorations/[id]/`, route to `explorations/[id]/fragments/` instead. Fragments are exploration-private and don't appear in home.

---

## Captures Path Resolution

Captures live at the **multi-workspace root** — peer to all repos, not inside any one.

1. Check `qino-config.json` for explicit `capturesDir` path
2. If absent, use the parent directory of `context.root` + `/.qino/captures/`
3. Create the `.qino/captures/` directory if it doesn't exist

---

## Flow

### 1. Receive

If no observation provided:
> "what's on your mind?"

**WAIT** for observation if needed.

### 2. Distill

Silently distill the observation to its essence (5-10 words). This becomes the file name and the markdown title.

### 3. Save

Generate file name: `YYYY-MM-DD_essence-as-kebab-case.md`

Create file at `{captures_path}/YYYY-MM-DD_essence.md`:

```markdown
# [Essence as title]

**Captured:** YYYY-MM-DDTHH:MM:SSZ

[Full observation as provided by user]
```

### 4. Confirm

**If the user explicitly mentions a concept by name:**

```
∴ [essence]
held. (touches [concept-name])

explore it now, or let it settle?
```

The parenthetical is an observation, not a connection to create. No manifest changes.

**WAIT** for response.

**If user wants to explore:** Continue the exploration yourself — don't invoke a fresh explore command. The captured note IS the alive thread. Read the concept file and go directly into working with it.

**If settle:** Done.

**If no concepts were explicitly mentioned:**

```
∴ [essence]
held.
```

Done.

---

### 5. If User Lets It Settle

```
it'll surface when it has warmth.
```

Done.

---

## Research Fragment Confirmation

**For fragments (inside an exploration):**

```
∴ [essence]

fragment saved to [exploration-id]
```

No connection offer for fragments — they're exploration-private.

---

## Do NOT:
- Ask for scope, anchor, context, or status
- Create multiple back-and-forth exchanges before saving
- Make the user justify the thought
- Skip the essence distillation (the `∴` moment matters)
- Create graph nodes, edges, manifest entries, or journal entries for captures
- Track capture status or lifecycle
- Proactively scan for connections — only note what the user explicitly mentions
