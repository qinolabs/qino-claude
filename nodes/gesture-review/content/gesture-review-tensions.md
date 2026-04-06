# Gesture Review — Tensions and Opportunities

A document for spawning a deep session to revisit the qino gesture system.

## Context

During the README rewrite (April 6, 2026), we discovered that the gesture system as documented doesn't match how the practice actually works. The practitioner (Philip) never explicitly invokes gestures by name — "capture," "explore," "home," "dev-work" are internal routing labels, not user interface. The skill routes from natural language invisibly.

This creates a tension: **27 workflows exist, but only a handful shape daily practice — and even those are experienced as natural conversation, not named operations.**

## The Audit

A full audit of all 27 workflows revealed:

### What's actively used (daily practice)
- **Orientation** (home) — arrival, what's here
- **Exploration** (explore) — working inside a node
- **Capture** — holding a thought as a lightweight node
- **Development** (dev-work) — implementation with concept edge awareness, drift detection
- **Actualization** (deck) — returning to composed attention, reading what evolved

### What's active but specialized
- **Arc** (4 workflows) — emergence tracking across sessions. Recently refreshed (April 4-5). Sophisticated. Requires explicit invocation.
- **Bug** — finding nodes in the implementation graph. Uses MCP tools. Modern.
- **Lab** — graph-mediated terminal work. MCP-based.
- **Research** (init, setup) — creating inquiries. Working.

### What's stale but has strong design
- **Attune** — last touched January 14. Five-phase calibration: find candidates, calibrate through feedback, build inspiration index, transform iteratively, extract principles. The interpretive loop (facilitator interprets → you push back → refinement emerges from wrongness) is a genuinely powerful pattern.
- **Compare** — last touched January 14. Parallel mirror pattern: find structural equivalents across two versions, ask why they land differently. Framework-as-scaffold lends expertise you don't have.

### What's setup-only (one-time)
- workspace-init, concept-init, concept-setup, research-init, research-setup, dev-setup, dev-init, import

### What references retired concepts
- **Navigate** (3 modes: activate, create, update navigator) — navigators are retired, superseded by decks. This workflow is orphaned in spirit.

## Tensions

### 1. The gesture abstraction may be unnecessary

The skill's routing already handles intent → behavior. Do we need named gestures at all? The practitioner doesn't use them. The internal routing labels could just be implementation detail.

**Counter-argument:** Named patterns help agents (and new users) understand what behaviors are available. They create a shared vocabulary for the system's capabilities. The question is whether that vocabulary should be user-facing or agent-facing.

### 2. Legacy vs protocol dual-track

Many workflows exist in two versions: a legacy manifest-based version and a protocol graph-based version. The SKILL.md routes between them based on whether `protocol: "qino"` is in the config. This works but doubles the surface area.

**Question:** Should the legacy versions be retired? All active workspaces now use the protocol. Or do they serve non-qino workspaces?

### 3. Attune and compare are powerful but disconnected

Both were designed for text artifacts (comparing two chapters, calibrating prose quality). Neither uses MCP tools or graph structure. They work in a vacuum.

**Potential:** Imagine these modernized:
- **Attune against the graph** — pull candidates from across workspaces, calibrate a quality that lives in the protocol (like "what makes a good edge context sentence?" or "what distinguishes a living node from a dead one?")
- **Compare nodes** — place two nodes' neighborhoods side by side. Not just their content, but their edges, annotations, recent activity. The parallel mirror pattern applied to graph topology.
- **Compare workspace grammars** — two workspaces side by side. How do their type vocabularies differ? What does that reveal about the practice?
- **Attune signal quality** — calibrate what makes a good tension vs a noisy one. Build distinctions that improve agent annotation quality.

### 4. The arc system is sophisticated but isolated

Four workflows, recently refreshed, with genuine sophistication (pre-articulate knowing, charge scanning, transcript awareness). But arcs live in manifest-based research workspaces, not in the graph.

**Question:** Should arcs become graph nodes? They already have the structure for it (sessions, pointers, beginning/closing). An arc-as-node would be navigable, edge-connectable, and visible in the viewer.

### 5. Navigate is orphaned

The navigate workflow creates and manages navigators — which are retired. The workflow itself is well-designed (terrain mapping, reading order, session logs) but its concept is superseded by decks.

**Question:** Is there something in navigate's design that decks should absorb? Terrain mapping (systematic coverage of a domain) is different from deck composition (felt resonance). Both are valuable.

### 6. Test (ecology tests) exists but may not need to be a gesture

The test workflow applies ecology tests to concepts. It's well-documented and uses all 8 ecologies. But ecology tests might be better as something the agent applies naturally during exploration — not as a separate mode you enter.

**Question:** Should ecology awareness be woven into the explore and dev-work patterns rather than being a standalone gesture?

### 7. Lab mode's relationship to the default experience

The README now describes a practice where signals surface naturally — the agent writes annotations, the viewer shows them. Lab mode claims to make this explicit ("lab mode active, annotations will appear"). But if the default experience already includes graph awareness, what does lab mode add?

**Possible answer:** Lab mode's value may be in the _commitment_ — telling the agent "I'm watching the graph right now, so annotate more aggressively." It changes the agent's annotation threshold, not its capabilities.

## Proposed Focused Set

Based on actual practice:

### Core (invisible, always active)
- Orientation, exploration, capture, development — these aren't gestures to invoke; they're behaviors the skill embodies

### Explicit (you'd say the name)
- **Deck** — "what evolved in my deck?" / "actualize [deck]"
- **Arc** — "capture an arc" (explicitly required per SKILL.md)
- **Bug** — "/qino bug"

### Deep work (to be modernized)
- **Attune** — calibrate a tacit quality. Needs graph integration.
- **Compare** — perceive through contrast. Needs graph integration.

### Candidates for absorption
- **Test** → fold ecology awareness into explore/dev-work
- **Navigate** → absorbed by decks; check if terrain mapping transfers
- **Lab** → clarify what it adds beyond the default graph awareness
- **Research** → setup workflow, not a gesture

## Questions for the Deep Session

1. What would attune look like if it could pull candidates from the graph? What would you attune — node qualities, edge qualities, annotation qualities, prompt composition qualities?

2. What would compare look like if it could compare two nodes' neighborhoods? Two workspaces? Two iterations of the same app?

3. Should ecology tests become ambient (woven into exploration) rather than a standalone gesture?

4. Should arcs become protocol nodes? What would that enable?

5. Is there a gesture missing — something the practice needs that none of the 27 workflows provide?

6. What's the right relationship between the "core invisible" behaviors and the "explicit invocation" gestures? Should the README even describe the invisible ones, or just the ones you'd actually say?
