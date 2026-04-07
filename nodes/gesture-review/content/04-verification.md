# 04 — Verification

Walk through common scenarios to verify the simplified system works.

## Why

The previous iterations removed 25 workflows, renamed 2 agents, simplified routing from 10 tables to 2 paths, and changed the protocol. Before this ships as a plugin release, verify that the common interaction patterns still work — or work better.

## Scenarios

### Arrival

**User says**: "where am I" / "what's here" / opens a new session

**Expected**: os agent calls `read_activity`. Shows workspaces, recent nodes, action items. Surfaces 1-2 grounded suggestions. No routing decision needed.

**Verify**: No mention of missing workflow. Agent doesn't try to load `home.md`.

### Exploration

**User says**: "explore qino-world" / "go deeper into ecosystem-design-principles"

**Expected**: os agent calls `search_nodes` to find the node, then `read_node`. Grounds opening in what it found (story, content, tensions, connections). Offers to work in whatever mode fits.

**Verify**: Agent doesn't look for `explore.md`. Working modes (expanding, deepening, restructuring, inhabiting) emerge from persona.

### Capture

**User says**: "hold this: the crossing threshold is really about permission"

**Expected**: os agent distills to essence, calls `create_node(type: "capture", title: "crossing threshold as permission", story: "...")`. Says something like "held." Brief.

**Verify**: No flat file created at `.qino/captures/`. Node appears in graph.

### Deck actualization

**User says**: "read my ecosystem composition deck" / pastes `/qino deck ecosystem-composition` from the OS

**Expected**: os agent calls `read_decks`, matches to deck, calls `read_node` on each member. Produces four-part reading (consulting deck-actualization reference). Saves reading as annotation.

**Verify**: Agent reads the reference. Output has temporal reorientation, delta narrative, candidate articulations, opening question.

### Concept creation

**User says**: "create a concept about tradition-oriented knowledge"

**Expected**: os agent asks about the impulse ("what's the real-world experience this responds to?"), generates ID, checks for duplicates via `search_nodes`, calls `create_node`.

**Verify**: No spawn. No concept-init workflow loaded. Dialogue feels natural, not procedural.

### Dev work — continue building

**User says**: "what's next for qino-drops" / "continue drops" / "work on world"

**Expected**: Skill routes to build agent (spawn). Build agent loads `iteration.md` workflow. Arrives at implementation node, syncs concept, discovers current iteration.

**Verify**: Build agent spawns correctly with `qino:build` subagent_type. Iteration workflow executes.

### Dev work — new app

**User says**: "implement the concept" / "start building qino-frame from the concept"

**Expected**: Skill routes to build agent (spawn). Build agent loads `new-app.md` workflow. Translation exploration begins.

**Verify**: New-app workflow executes. App scaffolding works.

### Bug filing

**User says**: "that's a bug in world" / "file a bug for this"

**Expected**: Build agent creates a finding node with `sparked-by` edge. Gathers context from conversation.

**Verify**: Finding node created in implementation graph. Edge connects to the app.

### Experiment

**User says**: "set up an experiment for drops formation rhythm"

**Expected**: Build agent consults experiment-methodology reference. Sets up in-process simulation, baseline run, parameter overrides, JSONL logging.

**Verify**: Agent references the methodology. Loop structure (measure, compare, decide, record, listen) is followed.

### Annotation

**User says**: (during any exploration) — agent notices a tension or connection

**Expected**: os agent calls `write_annotation` with appropriate signal type. No "lab mode" activation needed.

**Verify**: Annotations are written naturally during exploration, not gated behind a mode.

### Setup / onboarding

**User says**: "/qino setup" / "set up qino here" / arrives with no workspace and wants to start

**Expected**: os agent reads `setup.md` workflow and `references/workspaces.md`. Opens conversationally ("tell me about what you're working on"). Branches based on ideas vs building. Creates workspace files. Transitions to real work.

**Verify**: Setup flow follows the dialogue pattern, not a wizard. Workspace files are created. Handoff to exploration or dev work is natural.

### Edge cases

**No workspace**: os agent calls `read_activity`, sees no workspaces or uninitialized state. Helps orient — suggests workspace setup.

**Ambiguous intent**: "I want to work on something" — could be build or exploration. Skill should ask, not guess.

**MCP server unavailable**: Agent falls back to filesystem. Can still read graph.json, node.json, story.md directly. Can still create files. Degraded but functional.

## What to check after all scenarios

- [ ] No references to deleted workflows in agent output
- [ ] No "workflow not found" errors
- [ ] os agent never tries to spawn (always inject)
- [ ] build agent always spawns (never inject)
- [ ] Routing mismatches: did any scenario go to the wrong agent?
- [ ] Reference documents are consulted when relevant (deck, ecology, experiment)
- [ ] New agent names (`qino:os`, `qino:build`) work in the subagent system
