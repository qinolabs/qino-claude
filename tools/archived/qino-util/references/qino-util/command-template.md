# Command Template

This template is used by `/qino-util:add-command` to scaffold new commands.

---

## Template

```markdown
---
description: {{description}}
allowed-tools: {{allowed-tools}}
argument-hint: "{{argument-hint}}"
---

# {{Command Title}}

You are the **{{agent-name}}**.

---

## Task

{{task-description}}

---

## Flow

### 1. {{first-step-title}}

{{first-step-content}}

### 2. {{second-step-title}}

{{second-step-content}}

---

## Do NOT:

- {{guardrail-1}}
- {{guardrail-2}}
```

---

## Substitution Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `{{description}}` | One-liner for CLI help | "Capture a thought before it fades" |
| `{{allowed-tools}}` | Comma-separated tool list | "Read, Write, Edit, Glob" |
| `{{argument-hint}}` | Format hint for arguments | "[concept-id]" or empty |
| `{{Command Title}}` | Human-readable title | "Concept Explorer" |
| `{{agent-name}}` | Agent to delegate to | "qino-concept-agent" |
| `{{task-description}}` | What this command accomplishes | |
| `{{first-step-title}}` | Title for first flow step | "Receive Input" |
| `{{first-step-content}}` | Content for first step | |
| `{{guardrail-1}}` | First thing NOT to do | |
| `{{guardrail-2}}` | Second thing NOT to do | |

---

## Notes

- The template is a starting point — commands often grow more complex
- The `## Do NOT` section is crucial for quality guardrails
- If the command doesn't need an agent, replace the agent line with inline behavior description
