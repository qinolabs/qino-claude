# Agent Template

This template is used by `/qino-util:add-command` to scaffold new agents.

---

## Template

```markdown
---
name: {{agent-name}}
description: {{agent-description}}
tools: Read, Write, Edit, Glob
permissionMode: acceptEdits
---

# {{Agent Title}}

{{core-purpose}}

---

## Philosophy

{{philosophy}}

---

## Approach

{{approach}}

---

## Do NOT:

- {{guardrail-1}}
- {{guardrail-2}}
```

---

## Substitution Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `{{agent-name}}` | Kebab-case identifier | "qino-concept-agent" |
| `{{agent-description}}` | One-liner for agent | "Gentle space for developing ideas" |
| `{{Agent Title}}` | Human-readable title | "Concept Agent" |
| `{{core-purpose}}` | What this agent does | |
| `{{philosophy}}` | What guides its thinking | |
| `{{approach}}` | How it works | |
| `{{guardrail-1}}` | First thing NOT to do | |
| `{{guardrail-2}}` | Second thing NOT to do | |

---

## Agent Types

Consider which pattern fits:

| Type | Purpose | Example |
|------|---------|---------|
| Facilitation | Gentle dialogue, no file outputs | qino-concept-agent |
| Preparation | Builds constraint artifact for another agent | scribe-prep |
| Generation | Receives constraint, produces output | scribe-prose |
| Editorial | Reviews other agents' work | scribe-editorial |
| Research | Open-ended inquiry | qino-research-agent |

---

## Notes

- `permissionMode: acceptEdits` allows the agent to write files without prompting
- The `tools` list should match what the agent actually needs
- Agents can optionally specify `model: opus` for complex tasks (defaults to haiku)
