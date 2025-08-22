# Smart Build Command Template

*This template shows how the build command integrates vision protection naturally.*

## Build Command Behavior

The `/[project]:build` command adapts based on context:

### 1. First Feature Build
```bash
/[project]:build "user onboarding flow"

# Response:
"Building user onboarding for [project]. Let me help you create this.

Since this is your first feature, I'll:
1. Set up the foundation architecture
2. Create patterns you'll reuse
3. Ensure it captures the [core feeling] we discussed

Here's how we'll build it..."
```bash

### 2. Aligned Feature Build
```bash
/[project]:build "notification system"

# Response:
"Adding notifications to [project]. 

This aligns with your vision of [relevant aspect].
Using your established patterns from [previous work].

Let's build it..."
```bash

### 3. Potential Drift Detection
```bash
/[project]:build "marketplace features"

# Response:
"I notice 'marketplace' might shift [project] in a new direction.

Your original vision focused on [core value].
A marketplace could [enhance/conflict] with this.

How do you see this fitting? 
a) It's a natural evolution because...
b) Let's find a different approach
c) Tell me more about your thinking"
```bash

### 4. Technical Guidance
```bash
/[project]:build "optimize performance"

# Response:
"Optimizing [project] performance.

Based on your architecture, focusing on:
- [Specific bottleneck identified]
- [Relevant optimization for this project type]

Your [core user experience] requires [specific performance characteristic].
Let's ensure optimization serves this..."
```bash

## Context Awareness

Build command checks:

### Git Context
- Recent commits reveal focus area
- Uncommitted changes show work in progress
- Branch names indicate feature scope

### Code Context
- Existing patterns to follow
- Architecture decisions to respect
- Dependencies to consider

### Vision Context
- Original project goals
- Previously built features
- Evolution history

### Architecture Context
- Core architectural decisions from init
- Current complexity baseline
- Technology boundaries already established
- Performance constraints identified

## Embedded Guidance Levels

### Level 1: Light Touch (Default)
- Build what user asks
- Follow existing patterns
- Mention vision only if relevant

### Level 2: Gentle Steering
- When detecting minor drift
- Suggest alternatives
- Explain vision connection

### Level 3: Active Protection
- When major drift detected
- Require confirmation
- Offer vision-aligned alternatives

## Integration Examples

### Pattern Recognition
```
User: /[project]:build "dark mode"
Claude: [Recognizes UI enhancement pattern]
"Adding dark mode to [project]. I'll follow your existing theme system
and ensure it maintains the [aesthetic quality] central to your vision."
```

### Architecture Guidance
```
User: /[project]:build "real-time updates"
Claude: [Detects architectural impact]
"Real-time updates for [project]. This is a significant architecture decision.
Given your focus on [core value], I recommend [specific approach] because..."
```

### Natural Evolution
```
User: /[project]:build "api for mobile app"
Claude: [Recognizes platform expansion]
"Expanding [project] to mobile. Your core experience of [value] translates to mobile through...
Let's build the API with mobile-specific considerations..."
```

## No Interruptions

Vision protection happens through:
- Natural conversation flow
- Contextual suggestions
- Building-while-guiding
- No separate reflection steps

The philosophy lives in the assistance, not in ceremonies.