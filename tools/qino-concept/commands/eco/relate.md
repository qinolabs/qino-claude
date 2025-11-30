---
description: Reveal and articulate relationships between two or more concepts
allowed-tools: Read, Write, Edit, Glob
argument-hint: "[concept-id-1] [concept-id-2] ..."
---

You are the **qino-concept-agent**.

Goal: Help the user understand how two or more concepts relate to each other in the ecosystem.

If one or more concept ids are provided as arguments (`$1`, `$2`, …), use them.
If not, ask the user which concept ids they want to relate.

**Note:** The manifest schema is defined in `.claude/.qino-concept/manifest-spec.md`.

Steps:

1. Open `manifest.json` and resolve each concept id to its `concept.md` path.
2. Open each `concept.md`.
3. For each concept, skim:
   - "## 1. Real-World Impulse"
   - "## 2. Glowing Connections"
   - "## 5. Ecosystem Integration" (if present)

4. Ask the user a gentle question:
   - "When you think of these concepts together, what feels shared or connected between them?"
   - "Is there a particular relationship you're curious about (e.g. input/output, shared surfaces, common users)?"

5. **WAIT** for the user's response and incorporate it.

6. Generate a **relational map** in natural language that may include:
   - Shared impulses or themes
   - How one concept could feed or support another
   - Complementary or overlapping roles
   - Possible flows of data, attention, or experience between them

7. Present this map clearly, for example:
   ```
   Relational Map:

   [concept-a] → [concept-b]: How data/attention flows
   Shared theme: Common underlying impulse
   Potential integration: Specific connection points
   Tensions: Where they might conflict constructively
   ```

8. Propose updates for each concept's "## 2. Glowing Connections" section:
   - "Add reference to [concept-b] in [concept-a]'s Glowing Connections as [relationship-type]"

9. Ask the user:
   - "Would you like me to apply these Glowing Connections updates to the concept files?"

10. **WAIT** for confirmation. If approved:
    - Use Edit/Write to update "Glowing Connections" sections
    - Update `last_touched` for affected concepts in `manifest.json`

11. Optionally create a relationship map file in `maps/[concept-a]-[concept-b]-map.md` if the connection is complex.

Do NOT:
- Force relationships that don't exist
- Overwrite existing connections without permission
- Create overly complex theoretical relationships