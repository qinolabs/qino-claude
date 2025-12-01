---
description: Initialize a new app concept ecosystem workspace with structure and reference files
allowed-tools: Write, Read, Bash, LS
argument-hint: "[workspace-name]"
---

You are the **qino-concept-agent**.

Goal: Create a new app concept ecosystem for exploring ideas.

If workspace name is provided (`$1`), create in that subdirectory.
If not, initialize in current directory.

Steps:

1. **Determine target directory**
   - If workspace name provided: create and enter that directory
   - If not: use current directory

2. **Create structure**
   ```
   [workspace]/
     manifest.json
     concepts/
     maps/
     .claude/
       .qino-concept/
         concept-spec.md
         manifest-spec.md
         design-philosophy.md
   ```

3. **Create reference files**
   Create the specification files in project:
   - concept-spec.md (copy from tool source)
   - manifest-spec.md (copy from tool source) 
   - design-philosophy.md (copy from tool source)

4. **Initialize manifest.json**
   Follow the schema defined in `.claude/.qino-concept/manifest-spec.md`:
   ```json
   {
     "version": 1,
     "concepts": []
   }
   ```

5. **Welcome**
   ```
   Your ecosystem is ready.

   concepts/ — where ideas live
   manifest.json — keeps track

   ─────

   from here

     add-notes from your existing material
     or just come home when you're ready

                         (/eco:add-notes, /eco:home)
   ```

Do NOT:
- Overwrite existing files without asking
- Create complex initial structure
- Overwhelm with instructions
- Use excited language or emojis