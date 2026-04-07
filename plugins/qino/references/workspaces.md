# Workspaces — Agent Reference

This reference helps the agent guide workspace decisions during setup and answer workspace questions during ongoing work.

---

## What a Workspace Is

A workspace is a directory with a qino protocol graph. It contains:
- `graph.json` — the registry of nodes and edges
- `nodes/` — where node directories live (the directory name is configurable via `nodesDir` in graph.json; defaults to `"nodes"`)
- `.claude/qino-config.json` — declares workspace type and vocabulary

That's it. Everything else emerges through use.

**On `nodesDir`**: when an implementation workspace lives inside an existing codebase that already has a conventional directory for the work (e.g., `implementations/` in qinolabs-repo), set `nodesDir: "implementations"` in graph.json so the MCP server looks in the right place. Concepts and research workspaces normally use the default `nodes/`. Custom `nodesDir` must be a single directory name — no path separators. Setting this at creation time avoids silent "graph looks empty because the server is looking in the wrong directory" failures.

---

## Workspace Types

| Type | `repoType` | What it holds | When to create |
|------|------------|---------------|----------------|
| Concepts | `"concepts"` | Ideas developing, visions, design thinking | When you want a space for thinking that isn't code |
| Research | `"research"` | Inquiries, investigations, experiments | When you have questions to go deep on |
| Implementation | `"implementation"` | Iteration plans, technical docs, app implementations | When you're building software |

These aren't rigid categories — they're orientations. A concepts workspace might contain some research. An implementation workspace might contain design thinking. The type sets the default routing and vocabulary, not a boundary.

---

## The Key Decision: Together or Separate

The most common decision a new user faces:

**"I'm building software and I have ideas about it. Do they live in the same repo?"**

### Same repo (concepts alongside code)

**Good when:**
- The ideas are tightly coupled to the implementation
- One person is doing both the thinking and building
- The project is small or focused

**Tradeoff:** Concepts and code share git history, branching, and deployment concerns. Design thinking gets interleaved with pull requests.

### Separate repos (concepts in their own workspace)

**Good when:**
- Ideas develop on a different rhythm than code
- Multiple projects share conceptual territory
- You want to think freely without implementation pressure
- Concepts might outlive or span multiple codebases

**Tradeoff:** Two places to maintain. But qino protocol supports cross-workspace connections — edges can reference nodes across repositories, and the graph viewer shows the full topology.

### The cross-workspace insight

This is often the moment where users learn something fundamental about qino: **graphs aren't confined to a single directory**. Workspaces can connect to each other. A concept node can have edges pointing to implementation nodes in another repo. The MCP tools (`search_nodes`, `read_node`) work across all workspaces.

Separating doesn't mean isolating. It means each space gets its own rhythm while the connections stay alive.

---

## Starting Points by Situation

### "I have ideas, no code"
→ One concepts workspace. Simple.

### "I have a codebase and want to organize my thinking about it"
→ Present the together-or-separate decision. Most users building one app start with concepts in the same repo. Users with broader thinking tend toward separate.

### "I have files and notes scattered around"
→ One concepts workspace first. Import can pull material from anywhere. Don't try to organize everything upfront.

### "I'm not sure what I need"
→ One concepts workspace. It's the most open container. Everything can be restructured later.

### "I have multiple projects"
→ Each project that's a codebase gets its own implementation workspace (it probably already has a repo). One shared concepts workspace can hold thinking that spans them. Or separate concepts per project — depends on whether the thinking overlaps.

---

## What Can Always Change Later

- Workspace type (edit `qino-config.json`)
- Node types and vocabulary (edit `qino-config.json`)
- Graph structure (add/remove nodes and edges)
- Cross-workspace connections (add edges anytime)
- Directory structure (move workspaces, update paths)

The only thing that takes effort to change: splitting a large workspace into two. But even this is a graph operation — move nodes, update edges.

---

## For the Setup Agent

During setup, don't present the type table. Instead:

1. **Listen** to what the user describes — their situation, what they have, what they want
2. **Sense** which starting point fits (see above)
3. **If they're building software**, surface the together-or-separate decision with honest tradeoffs — this is where the cross-workspace insight naturally appears
4. **If they're exploring ideas**, suggest a concepts workspace — don't complicate the start
5. **Recommend** with reasoning, confirm, then create

The user doesn't need to learn workspace taxonomy. They need one good starting structure they can grow from.
