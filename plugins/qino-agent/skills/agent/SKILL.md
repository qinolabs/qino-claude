---
name: agent
description: |
  Delegate to the qino-agent SDK for ecosystem awareness, compositional reading, and narrative work.
  Runs a custom Anthropic Agent SDK agent that connects to qinolabs-mcp and owns its system prompt — free from Claude Code's coding-task bias.

  ACTIVATE:
  - "what calls?", "what wants to evolve?", "morning arrival"
  - "what's the relationship between X and Y?"
  - "compose a session deck", "what should I work on?"
  - "read the ecosystem", "where is energy gathering?"

  FUTURE (not yet implemented):
  - "write a chapter", "scribe [topic]"
  - "transmit this arc", "relay [research]"

  PREREQUISITES:
  - qinolabs-mcp server running at :4020 (via pnpm dev:community)
  - qino-agent package built (qinolabs-repo/packages/qino-agent/)
  - Auth token in packages/qino-agent/.env.local
---

# qino-agent Skill

Delegates to the SDK-based qino-agent for work where compositional quality matters more than coding capability. The agent reads the ecosystem through MCP tools with practitioner sensitivity — annotation clustering, temporal momentum, cross-workspace resonance, graph topology.

---

## Why delegate?

Claude Code is optimized for coding tasks. This produces biases in compositional work: operational urgency as first instinct, git state as temperature, engineering instructions as default action items. The SDK agent owns its system prompt and starts from the right register — compositional, story-driven, design-question-oriented.

Four iterations of testing documented the bias profile: `.claude/agents/logs/ecosystem-awareness-iterations.md`

---

## Subcommands

### scan (implemented)

Ecosystem awareness scan — heat map + session deck proposals.

```bash
cd /Users/picard/Code/qinolabs/qinolabs-repo && pnpm agent:read "<user's question>"
```

**When to invoke**: "what calls?", "morning arrival", "what wants to evolve?", "where is energy?", "compose session decks"

**Output**: Heat map of the ecosystem + 2-3 multi-thread deck proposals as story with action items.

**What to do with the output**: Present it directly to the user. Do NOT reinterpret, summarize, or add your own analysis — the SDK agent's compositional register is the point. The user will choose a deck or ask follow-up questions, which you handle in your native Claude Code register.

### query (implemented via scan)

Cross-thread questions — "what's the relationship between X and Y?"

```bash
cd /Users/picard/Code/qinolabs/qinolabs-repo && pnpm agent:read "<user's question>"
```

**When to invoke**: "what's the relationship between...", "how does X connect to Y?", "what do these threads share?"

**Output**: A reading of the relationship through multiple signals — not just graph edges but annotation resonance, temporal co-occurrence, structural analogies.

### scribe (planned)

Chronicle chapter writing — SDK agent as narrative voice.

```bash
cd /Users/picard/Code/qinolabs/qinolabs-repo && pnpm agent:scribe "<prompt>"
```

*Not yet implemented. Currently handled by qino-prose plugin's scribe agents.*

### relay (planned)

Research transmission — voicing research arcs through the Student persona.

```bash
cd /Users/picard/Code/qinolabs/qinolabs-repo && pnpm agent:relay "<prompt>"
```

*Not yet implemented. Currently handled by qino-prose plugin's relay agents.*

---

## Execution

When this skill is invoked:

### Step 1: Determine subcommand

Map the user's intent to a subcommand:
- Ecosystem awareness, session decks, morning arrival → `scan`
- Cross-thread questions → `scan` (with the question as prompt)
- Chapter writing → `scribe` (if implemented, else inform user it's planned)
- Research transmission → `relay` (if implemented, else inform user it's planned)

### Step 2: Run the SDK agent

Execute via Bash. Always run from the monorepo root. Pass the user's natural language as the prompt argument.

```bash
cd /Users/picard/Code/qinolabs/qinolabs-repo && pnpm agent:read "<user's intent, natural language>"
```

The command may take 30-120 seconds as the agent reads multiple graph nodes via MCP.

### Step 3: Present output

Present the SDK agent's output directly to the user. Do not:
- Summarize it (the composition IS the value)
- Add engineering instructions (the agent deliberately avoids these)
- Reframe deck proposals as task lists
- Append your own analysis unless the user asks

### Step 4: Continue in Claude Code

After the user reads the output and responds, you handle the follow-up in your native Claude Code register. If they choose a deck and want to enter it, you help with the crossing — reading relevant files, orienting to the material. If they want to build, you build. The SDK agent composed; you act.

---

## Troubleshooting

**"command not found" or build error**: The qino-agent package needs to be built. Run `cd qinolabs-repo && pnpm install` first.

**MCP connection error**: qinolabs-mcp server must be running. Start with `pnpm dev:community` from the community repo.

**Auth error**: Check `packages/qino-agent/.env.local` for ANTHROPIC_API_KEY.

**Timeout**: The agent makes multiple MCP calls. Allow up to 120 seconds. Use the Bash tool's timeout parameter if needed.
