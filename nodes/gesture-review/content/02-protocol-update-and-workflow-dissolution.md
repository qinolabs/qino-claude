# 02 — Protocol Update and Workflow Dissolution

Captures become nodes. Remaining workflows dissolve into agent behavior.

## Why

The protocol still describes captures as flat files — a pre-graph convention. And 10 workflow files describe behavior that the os agent handles naturally through MCP tools. This iteration aligns the protocol with the graph-native reality and removes the workflow files that reimplemented what qino-os provides as structural features.

## Changes

### Protocol: captures become nodes

**`agents/protocol-structure.md`**:
- Remove the "Captures" section describing flat files and path resolution
- Replace with: captures are nodes with `type: "capture"`, created via `create_node` in the current workspace's graph
- Remove the "Pull-based composting" description — captures are already in the graph

**`references/protocol/protocol-spec.md`**:
- Remove the flat-file capture description from the "Structure Mapping" table
- Remove `origins/` references (no protocol equivalent, no longer needed)
- Keep `capture` in the Node Types table — it's a valid node type
- Remove the `.qino/captures/` convention entirely

**No fallback**: Remove `.qino/captures/` completely. No legacy path.

### Dissolve concept-init and research-init

Both are now just "dialogue → `create_node`". The os agent handles this naturally.

**`workflows/concept-init.md`** — delete. The os agent's persona covers:
- When someone says "create a concept about X," ask about the impulse before creating
- Generate a kebab-case ID, check for duplicates via `search_nodes`
- `create_node` with appropriate type from workspace vocabulary

**`workflows/research-init.md`** — delete. The os agent's persona covers:
- When someone says "start research on X," ask what draws the inquiry
- `create_node(type: "inquiry")` in the research workspace

### Delete dissolved workflow files

All of these dissolve into the os agent persona (iteration 03 writes the actual persona):

| File | What the os agent does instead |
|------|-------------------------------|
| `workflows/home.md` | `read_activity` → respond to what's there |
| `workflows/capture.md` | `create_node(type: "capture")` |
| `workflows/orientation.md` | `read_activity` with no workspaces → help orient |
| `workflows/lab.md` | `write_annotation` is always available |
| `workflows/bug.md` | `create_node(type: "finding")` — moves to build agent |
| `workflows/test.md` | Ecology lenses become a reference doc (iteration 03) |
| `workflows/explore.md` | `read_node` + working modes in persona |
| `workflows/concept-init.md` | `create_node` with brief dialogue |
| `workflows/research-init.md` | `create_node` with brief dialogue |

### What remains after this iteration

```
workflows/
  iteration.md        # continue building (from iter 01 rename)
  new-app.md          # new app from concept (from iter 01 rename)
  setup.md            # onboarding/workspace setup (from parallel session)
  deck.md             # still here — converted to reference in iter 03
```

## Verification

- `ls workflows/` — should show only iteration.md, new-app.md, deck.md
- `git grep ".qino/captures"` — should find zero references
- Protocol spec and protocol-structure have no flat-file capture descriptions
- SKILL.md references only the remaining workflows (update routing tables)
