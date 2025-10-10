# Claude Config Structure

This directory contains the refactored metaprogramming system for qino-claude with clear separation of concerns.

## Directory Structure

```
src/claude-config/
├── instructions/          # How Claude should behave
│   └── exploration-behavior.md
├── templates/            # What Claude should generate (streamlined)
│   ├── exploration-process.md     # Complete exploration process
│   ├── commands-template.md       # Lightweight command creation
│   ├── intelligence-library.md    # Architectural intelligence library
│   ├── iteration-framework-template.md  # Development roadmap framework
│   └── guide-template.md          # Consolidated project reference
├── examples/             # Sample outputs and demonstrations
│   └── exploration-example.md
└── commands/core/        # Entry point commands
    ├── project-init.md      # Create new project environments
    └── update-commands.md   # Refresh all app commands with latest templates
```

## Content Type Conventions

### Instructions (`/instructions/`)
Files that tell Claude **how to behave** during execution:
- Communication style
- Synthesis techniques  
- Conversation patterns
- Success indicators

**Format:**
```markdown
# Instruction Title
*Instructions for Claude on how to...*

## Behavior Guidelines
- Do this
- Don't do that
```

### Templates (`/templates/`)
Files that define **what Claude should generate**:
- Atomic, self-contained content
- Clear placeholder conventions
- Required inputs documented
- Validation criteria included

**Format:**
```markdown
# Template Title
<!-- TEMPLATE: Description of what this generates -->
<!-- REQUIRES: input1, input2, input3 from previous step -->

Template content with {{PLACEHOLDERS}}

<!-- PLACEHOLDERS:
{{VARIABLE}} - Description of what this represents
-->
```

### Examples (`/examples/`)
Files that show **sample outputs** and usage patterns:
- Demonstrations of good/bad approaches
- Before/after comparisons
- Reference implementations

## Placeholder Conventions

Templates use minimal placeholder format for lightweight commands:
- `{{PROJECT_NAME}}` - Project namespace for file paths and command naming
- Commands read context dynamically from files rather than embedding static content
- Context files: `.claude/concepts/{{PROJECT_NAME}}-guide.md`, `.claude/iterations/{{PROJECT_NAME}}-iterations.md`, `.claude/init-logs/{{PROJECT_NAME}}-init.md`

## Execution Flow

1. **Entry**: `/core:project-init` reads concept files
2. **Instructions**: Loads behavior from `/instructions/exploration-behavior.md`
3. **Templates**: Uses streamlined 5-template system:
   - `exploration-process.md` → Complete 20-30 minute exploration process
   - `commands-template.md` → 5 lightweight commands that read context dynamically
   - `guide-template.md` → Consolidated project reference  
   - `intelligence-library.md` → Architectural intelligence library (used throughout)
   - `iteration-framework-template.md` → Development roadmap framework
4. **Output**: Structured `.claude/` directory with vision-aware commands and living context files

## Benefits of Lightweight Command System

### ✅ Solves Concept Drift
- Commands read current context from living documents instead of static content
- App evolution doesn't create drift from commands
- Vision and roadmap updates are automatically available to all commands
- Natural evolution without command regeneration

### ✅ Solves Template Maintenance
- `/core:update-commands` safely regenerates all app commands with latest templates
- Context files (guides, roadmaps) are preserved during updates
- Template improvements apply to all projects instantly
- Clear separation between command logic and project context

### ✅ Preserves Benefits
- Namespaced commands (`/myapp:start`) maintain personalized feel
- Complete 20-30 minute exploration process preserved
- Vision-aware development with phase tracking
- Contextual intelligence adapts to project state
- Progressive disclosure and natural language fallbacks

## Evolution Notes

**Previous System**: Static commands with embedded content created concept drift and maintenance pain
**Current System**: Lightweight commands that read context dynamically from living documents
**Key Innovation**: Commands reference context files rather than embedding static content
**Maintenance Solution**: `/core:update-commands` provides safe template updates across all projects

The system now enables natural project evolution while maintaining command intelligence and solving the two core problems: concept drift and template maintenance.