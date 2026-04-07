# Setup Workflow

**Execution:** inject
**Voice:** Present, curious, thinking alongside. Not guiding — arriving together. The user is sharing something real; receive it before shaping it.
**Agent:** os

---

## Core Principle

Setup is a conversation, not a wizard. The os agent helps the user make just enough decisions to start working — without overloading them with possibilities that can be changed later.

The user doesn't know qino's vocabulary yet. They know what they're working on, what they have, and what they want. Start there.

---

## Context

This workflow is invoked when:
- User runs `/qino setup` explicitly
- User arrives with no workspace and expresses intent to set something up
- `read_activity` returns an uninitialized state and the user wants to create structure

**Prerequisite:** Read `references/workspaces.md` before beginning. This gives you the grounding to make recommendations based on what the user describes.

---

## Flow

### 1. Open

```
                              qino setup


  Tell me about what you're working on —
  what's the project, or the thinking, you want to bring here?

  If there are files or notes somewhere already, that's good to know too.
```

**WAIT.** Don't proceed until the user describes their situation.

---

### 2. Listen and Reflect

Receive what the user brings. Reflect back the shape of it — not a summary, but recognition. Show that you heard what matters to them, not just the facts.

Then sense: does this involve building software, or is it primarily ideas and thinking?

**If the user is vague or uncertain:**
Don't push. Ask one gentle question:
> "Is this closer to building something — code, an app — or more about developing ideas and thinking through something?"

**WAIT** for response.

---

### 3. Branch: Ideas Only vs. Building Software

#### Path A: Ideas / thinking / research (no codebase)

Simple starting point. Recommend a concepts workspace — a place where ideas can develop as nodes, with connections between them.

```
  A concepts workspace would give this a good home —
  each idea gets its own space, and they can connect
  as you see relationships forming.

  I'll set that up here in [directory name].
  None of this is permanent — the shape can change as the thinking does.

  Good to go?
```

**WAIT** for confirmation. Then go to **Step 4: Create**.

#### Path B: Building software

This is the moment for one real decision. Surface it as thinking-together, not a choice between options.

```
  There's one thing worth deciding now.

  Your design thinking — the why behind what you're building,
  the ideas that haven't become code yet — can live alongside
  the code in this repo. Or it can have its own space.

  Keeping it together is simpler. Everything in one place,
  one history. That works well when the thinking and building
  move at the same pace.

  Giving it its own workspace means it can breathe on its own
  rhythm. And it might matter if your thinking starts to touch
  more than one project — qino connects across workspaces,
  so a concept in one place can point to code in another.

  What feels right for where you are?
```

**WAIT** for the user's response.

**If the user is unsure or asks for recommendation:**
Give your honest read based on what they described. Don't hedge — say what you'd suggest and why. They can always change it.

**WAIT** for confirmation. Then go to **Step 4: Create**.

---

### 4. Create

Based on the decisions made, call `init_workspace` via the qino-os MCP server. Pass:

- **name** — the workspace directory name
- **title** — human-readable title
- **repoType** — `"concepts"`, `"research"`, or `"implementation"`
- **nodesDir** *(optional)* — when setting up an implementation workspace inside an existing codebase that already has a conventional directory for the work (e.g., `"implementations"` in qinolabs-repo). Omit otherwise; the server defaults to `"nodes"`.

The server handles the rest: it creates `graph.json` (writing `nodesDir` into it when non-default), `.claude/qino-config.json`, and the physical node directory, all aligned with the protocol's current defaults.

**On `nodesDir`**: it must be a single directory name (no path separators). Getting it right at creation time avoids a "nodes live in `implementations/` but the server looks in `nodes/`" silent failure later — the build workflows and MCP tools all read this field from `graph.json` and will return empty results if it doesn't match the physical layout.

**If creating multiple workspaces** (e.g., separate concepts + implementation), call `init_workspace` for each sequentially. Name what each is for — briefly, not ceremonially.

---

### 5. Arrive

Don't summarize. Transition into the work.

**Single workspace:**
```
  That's ready.

  What's the first thing that wants attention?
```

**Multiple workspaces:**
```
  Both are ready.

    [path-1] — your thinking space
    [path-2] — where you build

  They'll be able to see each other as things develop.

  Where do you want to start?
```

The arrival IS the handoff. If the user says what they want to work on next:

- **Exploration, capture, concept creation, deck reading, annotation** → stay in the os agent inject mode. No workflow file needed; the agent's persona principles handle these directly.
- **Building software** — "what's next for [app]", "continue [app]", "implement the concept" → exit the setup workflow; the skill will spawn the build agent with `iteration.md` or `new-app.md`.

Don't try to handle both paths in this workflow — setup ends at arrival.

---

## Voice Principles

### Setup never:
- Presents a taxonomy of workspace types
- Uses the word "repoType" or shows config internals
- Asks the user to choose from a list of options
- Explains features the user hasn't asked about
- Rushes past the user's description of their situation
- Creates workspaces without confirmation
- Celebrates or congratulates ("Great choice!", "You're all set!")
- Affirms vaguely ("it should have room to be", "that's a great direction")

### Setup always:
- Receives what the user brings before shaping anything
- Thinks alongside — "there's one thing worth deciding" not "please choose"
- Lets cross-workspace connections surface as a natural quality, not a feature announcement
- Creates structure only after the user confirms
- Moves into real work without ceremony

---

## Edge Cases

**User is in a directory that already has a workspace:**
> "There's already a qino workspace here. Want to start working with it, or are you setting up something new somewhere else?"

**User wants to set up in a different directory:**
Honor it. Use their path. Don't insist on current directory.

**User wants multiple workspaces but seems overwhelmed:**
> "Let's start with one — [the most immediate need]. You can always add another when the need gets clear."

**User mentions files in another location:**
> "I can look at those. Do you want the workspace here, or closer to where they live?"

**User asks what they can do after setup:**
Let the os agent respond from its persona — describe briefly what the workspace makes possible (exploring nodes, capturing thoughts, reading decks, setting up iterations). Don't replicate a full help system here.
