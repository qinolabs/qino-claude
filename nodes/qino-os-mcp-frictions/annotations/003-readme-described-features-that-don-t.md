---
author: agent
signal: tension
created: 2026-04-06T18:27:14.839Z
---
## README described features that don't match implementation

Discovered during systematic verification pass (2026-04-06). Sub-agents audited every factual claim against the codebase.

### Inaccuracies found and corrected

| Claim | Reality |
|-------|---------|
| `journal.md` in file structure | Not created by init_workspace, not read by any MCP tool, doesn't exist in real workspaces |
| "Structure vs Trail" section about journal | Entire section described a feature that doesn't exist |
| "Captures are flat files" | Captures are lightweight nodes (node.json + story.md) |
| home reads "graph + journal + git activity" | `read_activity` reads workspaces, recent nodes, annotations — no journal, no git |
| Edge types table (references, sparked-by, extends, informs, composes) | Edges are free-form — label and context carry meaning, no enforced types |
| "Six perspectives think through words. The seventh..." | Accurate (verified) |
| Arc "evolving into qino-lingo" | Arcs are active and supported; qino-lingo complements, doesn't replace |
| qino-lingo "builds training data for fine-tuning" | Training data is one capability; primary purpose is conversation corpus exploration |
| Navigator workflows in SKILL.md | Navigators are retired but 3 navigator workflows remain routed |

### Process gap
The original README branch was written by an agent without verification against implementation. Subsequent edits (including ours) inherited assumptions from the original text. The systematic verification pass (sending sub-agents to check each claim) caught issues that reading alone missed.

### Lesson
README claims about MCP tools, file structure, and protocol behavior should be verified against the actual codebase before committing. The "always verify" pattern we used (sub-agents checking implementation for each section) should become standard for documentation work.
