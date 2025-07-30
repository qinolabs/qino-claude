# Project Genesis: Story-Driven Development System

Transform a concept into a living world through immersive onboarding, generating story-embedded commands that keep developers connected to the user experience they're creating.

## Usage
Provide your concept document as argument: $ARGUMENTS

## Process

### Phase 1: Initial World Interpretation (5 minutes)

I will quietly analyze your concept and prepare for our conversation:

1. **Quiet Understanding**
   - Read and absorb the concept
   - Note key themes and experiences
   - Prepare simple opening question
   - Keep initial interpretation brief

2. **Background Preparation**
   - Map potential technical approaches
   - Think about command possibilities
   - But don't present these yet
   - Let conversation guide revelation

3. **Trust-First Approach**
   - Start with validation, not interpretation
   - Show I've read carefully
   - But don't overwhelm with analysis
   - One simple question to begin

### Phase 2: Gentle Conversational Onboarding (30-40 minutes)

Using the onboarding structure template as my guide, I'll have a natural conversation with you about your product:

1. **Conversational Approach**
   - Start with one simple question
   - Let your answer guide the next question
   - Build understanding step by step
   - Never overwhelm with options

2. **Natural Chapter Flow**
   We'll explore these areas conversationally:
   - Chapter 1: First Contact → "What happens when someone first arrives?"
   - Chapter 2: Core Loop → "Walk me through the main experience"
   - Chapter 3: Social Fabric → "How do users connect?"
   - Chapter 4: Evolution & Growth → "How does this grow over time?"
   - Chapter 5: Technical Philosophy → "What technical choices feel right?"

3. **Trust Through Simplicity**
   For each topic:
   - Ask one focused question
   - Show one clear example
   - Wait for your feedback
   - Adjust based on your comfort level

4. **Organic Command Discovery**
   As we talk:
   - Command ideas emerge naturally
   - Names come from your own words
   - Nothing forced or overwhelming
   - Your pace sets our rhythm

### Phase 3: Artifact Generation Using Templates

Transform our onboarding insights into a complete development environment:

1. **World Bible Creation**
   Using `.claude/templates/world-bible-template.md`:
   ```
   .claude/world-bible/
   ├── [project]-bible.md      # Core vision document
   ├── experience-map.md       # User journey narrative
   ├── command-stories.md      # All commands with their stories
   ├── tech-philosophy.md      # Architecture serving experience
   └── evolution-log.md        # Living record of growth
   ```

2. **Command Library Generation**
   Using `.claude/templates/command-story-template.md` for each command:
   ```
   .claude/commands/[project]/
   ├── journey/               # Commands that trace user arc
   │   ├── first-moment.md    # Entry into your world
   │   ├── core-loop.md       # Repeatable value experience
   │   └── crescendo.md       # Culmination moments
   ├── moments/               # Micro-experience commands
   │   ├── delights.md        # Small joy creators
   │   ├── transitions.md     # Flow between states
   │   └── celebrations.md    # Success acknowledgments
   └── world/                 # System-building commands
       ├── foundation.md      # Core architecture
       ├── community.md       # Social systems
       └── evolution.md       # Growth mechanisms
   ```

3. **Workflow Integration**
   Generate development flow commands:
   - Morning ritual command for vision alignment
   - Vision check command for drift detection
   - Moment creation command for new experiences

### Phase 4: Template Integration Details

This command leverages three core templates:

1. **Onboarding Structure Template** (`onboarding-structure.md`)
   - Provides proven chapter flow for concept exploration
   - Each chapter has refinement questions and exploration prompts
   - I fill this structure with your concept-specific content

2. **Command Story Template** (`command-story-template.md`)
   - Ensures every command includes:
     * The Moment: User experience description
     * The Feeling: Emotional goals
     * The Story: Connection to larger journey
     * Implementation Guide: Technical serving emotional
     * Vision Protection: Drift warnings and reinforcements
   - Each generated command follows this structure

3. **World Bible Template** (`world-bible-template.md`)
   - Structures your living documentation:
     * Core Concept: Heart of your vision
     * Experience Architecture: Journey design
     * Technical Philosophy: Architecture as story
     * Command Narrative: All commands organized
     * Vision Guards: Protection mechanisms

### Phase 5: Synthesis and First Steps

1. **Command Calibration**
   Based on onboarding insights:
   - Refine command names for maximum story impact
   - Add specific implementation notes from discussions
   - Include warnings about discovered edge cases
   - Embed excitement from breakthrough moments

2. **Vision Crystallization**
   Create clear artifacts:
   - One-line truth about your product
   - Transformation promise for users
   - Technical principles serving experience
   - Red flags for vision drift

3. **Your First Command**
   End with concrete next step:
   ```bash
   /[project]:[first-moment] "parameters from our discussion"
   
   # This command will:
   # - Create the experience we just designed together
   # - Use the technical approach we chose
   # - Include the polish level you indicated
   # - Set up patterns for everything that follows
   ```

### Phase 6: Living System Setup

Configure ongoing evolution:

1. **Vision Protection Commands**
   - `/[project]:vision-check` - Regular alignment verification
   - `/[project]:drift-alert` - Automatic warning system
   - `/[project]:evolution-log` - Track natural growth

2. **Expansion Commands**
   - `/[project]:craft-moment` - Create new story commands
   - `/[project]:explore-feature` - Test new ideas safely
   - `/[project]:community-wisdom` - Learn from user behavior

3. **Rhythm Commands**
   - `/[project]:morning-ritual` - Start each day aligned
   - `/[project]:milestone-reflection` - Major checkpoint reviews
   - `/[project]:season-planning` - Long-term vision work

## Output Structure

Complete development environment with:

```
.claude/
├── world-bible/
│   ├── [project]-bible.md         # Living vision document
│   ├── experience-map.md          # User journey as narrative
│   ├── command-stories.md         # Every command's purpose
│   ├── tech-philosophy.md         # Architecture decisions
│   └── evolution-log.md           # How understanding grows
├── commands/
│   └── [project]/
│       ├── journey/               # User arc commands
│       ├── moments/               # Micro-experiences
│       ├── world/                 # System building
│       └── vision/                # Protection & evolution
├── onboarding/
│   └── [project]-genesis-log.md   # Record of our journey
└── workflows/
    └── [project]-flow.md          # Daily development rhythm
```

## Usage Example

```bash
# First run
claude
/core:project-genesis my-concept.md

# Claude guides through immersive onboarding
# ~40 minutes of exploration and refinement
# Generates complete story-driven environment

# Begin development
/[project]:first-moment

# Daily flow
/[project]:morning-ritual
/[project]:implement-moment "user-delight-x"
/[project]:vision-check
```

## Success Metrics

The Genesis process succeeds when:
- Every command name makes you smile
- Technical work feels purposeful
- You can't wait to build the first moment
- The vision lives in the tools, not just docs
- Getting lost in details becomes impossible

## Template Philosophy

Templates provide structure without constraining creativity:
- They ensure nothing important is missed
- They accelerate without limiting
- They create consistency while allowing uniqueness
- They're scaffolding, not cages

The templates are your co-pilot's training - ensuring I ask the right questions, explore the right territories, and generate artifacts that truly serve your vision.