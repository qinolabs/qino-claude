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
     notes/
     maps/
     .claude/
       references/
         qino-concept/
           concept-spec.md
           manifest-project-spec.md
           design-philosophy.md
   ```

3. **Create reference files**
   Create the specification files in project:
   - concept-spec.md (copy from tool source)
   - manifest-project-spec.md (copy from tool source) 
   - design-philosophy.md (copy from tool source)

4. **Initialize manifest.json**
   Follow the schema defined in `.claude/references/qino-concept/manifest-project-spec.md`:
   ```json
   {
     "version": 2,
     "concepts": [],
     "notes": []
   }
   ```

5. **Welcome**
   ```
   Your ecosystem is ready.

   concepts/ — where ideas live
   notes/ — where observations accumulate
   manifest.json — keeps track

   ─────

   from here

     bring in some material, capture a thought, or just settle in

                         (/qino:import <path>, /qino:note, /qino:home)
   ```

Do NOT:
- Overwrite existing files without asking
- Create complex initial structure
- Overwhelm with instructions
- Use excited language or emojis