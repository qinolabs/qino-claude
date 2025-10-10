# Getting Started with qino-claude

Transform any project idea into a vision-aware development environment in 30 minutes.

## Quick Start (5 minutes to first command)

### 1. Copy This System
```bash
# Copy the entire src/claude-config/ folder to your new project
cp -r src/claude-config/ /path/to/your-project/
```

### 2. Write Your Concept
Create a simple markdown file describing your project:

**Example: `my-idea.md`**
```markdown
# Task Management for Busy Parents

A simple task app that understands parents don't have time for complex productivity systems.

Features:
- Quick voice notes while doing dishes
- Tasks that adapt to school pickup times  
- Shared family lists that actually work
- Works offline because wifi is unreliable

The goal: Make task management feel supportive, not overwhelming.
Target: Parents who've tried every productivity app and given up.
```

### 3. Run Init
```bash
claude
/core:project-init my-idea.md
```

### 4. Experience the Magic
- Claude immediately starts a 20-30 minute guided exploration
- No setup required - just respond naturally to questions
- Your concept transforms into actionable development guidance
- Get 5 custom commands that understand your specific project

### 5. Start Building
```bash
# Your new commands are ready:
/myidea:start          # Contextual guidance for where you are
/myidea:build "auth"   # Build features with vision alignment  
/myidea:review         # Check alignment after changes
/myidea:evolve         # Update vision as you learn
/myidea:help           # Natural language support
```

## What Makes This Different?

**Vision-Aware Commands**: Your development commands understand and protect your original project vision

**Intelligent Context**: Commands read git status, recent changes, and development patterns to provide relevant guidance

**Creative Catalyst**: When ready, the system can challenge assumptions and push creative boundaries (always permission-based)

**Grows With You**: Seamlessly scales from single project to complex monorepo

## Examples of What Gets Generated

### Your Project Guide (`myidea-guide.md`)
- One-line vision: "Task management that supports rather than overwhelms busy parents"
- Technical philosophy: How architecture serves user experience  
- Guiding principles: Decision-making criteria aligned with your vision
- Vision protection: Green/red flags to stay on track

### Your Commands (`/myidea:*`)
**Context-Aware**: Commands understand if you're starting fresh, in active development, or scaling up

**Vision-Aligned**: Every technical suggestion connects back to "supportive, not overwhelming" goal  

**Personally Adapted**: Communication style matches how you prefer to work (established during onboarding)

## Real Developer Experience

```bash
# Monday morning
/myidea:start
→ "I see you added voice notes over the weekend. Ready to tackle the offline sync challenge, or want to polish the voice UI first?"

# Building a feature  
/myidea:build "notification system"
→ "Notifications for busy parents... Let's ensure these feel supportive rather than demanding. Based on your 'adapts to school pickup' vision, I'm thinking context-aware timing..."

# When something feels off
/myidea:review
→ "Recent changes look solid technically, but I notice the complexity is creeping up. Remember your core users have given up on complex systems before..."

# Ready for creative challenge
/myidea:evolve "challenge my assumptions"  
→ "What if 'task management' is the wrong frame entirely? What if you're actually building 'parenting support software'?"
```

## Next Steps

1. **Try it**: Copy the system and run init with your own concept
2. **Experience**: Go through the full 20-30 minute onboarding
3. **Build**: Use your generated commands for a few development sessions
4. **Evolve**: Let the system grow with your understanding

The onboarding conversation will feel unlike any development tool you've used - it connects technical decisions to human experiences and generates insights you wouldn't have reached alone.

## Need Help?

- **During onboarding**: Just respond naturally - the system guides you
- **With commands**: `/yourproject:help "what you're wondering"`  
- **Understanding the system**: Read `/src/claude-config/README.md`
- **Examples**: Check `/src/claude-config/examples/`

Start with any project idea - the system is designed to meet you where you are and guide you forward.