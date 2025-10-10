---
description: Run multi-perspective design sprint that organizes discoveries around emergent, domain-specific questions
version: 2.1.0
last_synced: 2025-10-05
source: /Users/philhradecs/Code/malao/malao-apps/.claude/commands/design-sprint.md
---

# Design Sprint

Run a design sprint with six personas exploring your challenge through dialogue. The output is organized around 5-7 questions that emerge FROM the conversation itself - not imposed templates, but the actual tensions, insights, and inflection points that shaped the thinking.

## What You Get

**8-11 files organized by emergent questions:**

- `__enter-here.md` - Atmospheric navigation map showing what emerged
- `__the-room.md` - World-building artifact tracking environmental token emergence
- `dialogue.md` - Full 40-50 exchange conversation
- `q-[domain-question-1].md` through `q-[domain-question-5-7].md` - Each question file gathers ALL relevant content (dialogue excerpts, thread evolution, tensions, synthesis)
- `synthesis.md` - Paths forward and open questions

**Example**: A sprint about "flowing blocks visualization" might generate:
- `q-can-users-read-while-blocks-flow.md`
- `q-is-movement-default-or-exception.md`
- `q-what-does-selection-mean-for-moving-objects.md`
- `q-should-we-build-canvas-or-dom.md`

These questions are specific to THIS challenge, not generic templates.

## How It Works

The design sprint agent:
1. Generates authentic dialogue between six personas (40-50 exchanges)
2. Reflects on what questions actually shaped the conversation
3. Identifies 5-7 domain-specific questions that emerged
4. Creates question-oriented files gathering all relevant discoveries
5. Provides atmospheric onboarding showing what emerged and how to navigate

## Your Task

Invoke the design-sprint agent with the full challenge description as the prompt.

**All arguments become the design challenge** - there are no format keywords to parse.

## Example Usage

**Input**: `/design-sprint Visualizing cognitive metabolism with flowing blocks`
- Action: Invoke `design-sprint` agent with prompt "Visualizing cognitive metabolism with flowing blocks"

**Input**: `/design-sprint Real-time collaboration UX - presence without overwhelm`
- Action: Invoke `design-sprint` agent with prompt "Real-time collaboration UX - presence without overwhelm"

**Input**: `/design-sprint How should selection work when everything is moving?`
- Action: Invoke `design-sprint` agent with prompt "How should selection work when everything is moving?"

---

## Critical: Presenting Subagent Output

**IMPORTANT**: After the subagent completes, you will receive its final response. This response contains the carefully crafted onboarding text designed for the user.

**YOUR ONLY JOB**: Pass through the subagent's response EXACTLY as received. DO NOT:
- Summarize what happened
- Explain what files were created
- Add your own commentary
- Reformat the output

The subagent has already created the perfect user-facing message following its specific onboarding format. Your role is to be invisible - just relay the message.

**RULE**: Output the subagent's response verbatim. Nothing more, nothing less.

---

Proceed with parsing the arguments and invoking the appropriate agent.