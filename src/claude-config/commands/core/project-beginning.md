# Project Beginning: Story-Driven Development System

Transform a concept into a living world through immersive onboarding, generating story-embedded commands that keep developers connected to the user experience they're creating.

## Usage
Provide your concept document as argument: $ARGUMENTS

## Process

### Phase 1: Pattern Recognition & Synthesis Preparation (5 minutes)

I will analyze your concept and prepare bold but digestible insights:

1. **Core Transformation Mapping**
   - Identify the user evolution you're creating
   - Recognize the technical-emotional architecture
   - Map system dynamics and interaction patterns
   - See the command structure emerging

2. **Synthesis Preparation**
   - Connect patterns across domains
   - Generate architectural possibilities
   - Prepare creative leaps and insights
   - Plan digestible presentation of big ideas

3. **Bold Opening Design**
   - Present compelling synthesis immediately
   - Show unexpected connections
   - Focus on one energizing aspect
   - Make them excited about possibilities

### Phase 2: Bold Synthesis Through Focused Exploration (30-40 minutes)

Using the onboarding structure template, I'll synthesize your concept through architectural insights:

1. **Synthesis-Driven Approach**
   - Present bold pattern recognition
   - Generate unexpected connections
   - Build architectural understanding incrementally
   - Focus on one insight at a time

2. **Chapter-Based System Building**
   We'll synthesize these architectural layers:
   - Chapter 1: First Contact → Identity formation & entry transformation
   - Chapter 2: Core Loop → Repeatable value & system dynamics  
   - Chapter 3: Social Fabric → Community architecture & behavioral patterns
   - Chapter 4: Evolution & Growth → Scaling challenges & growth vectors
   - Chapter 5: Technical Philosophy → Architecture serving experience goals

3. **Creative Synthesis Method**
   For each area:
   - Map the transformation happening
   - Connect technical & emotional architecture
   - Generate possibilities they haven't seen
   - Present one compelling insight per exchange

4. **Command Structure Emergence**
   Through synthesis:
   - Story-driven command patterns emerge from insights
   - Names capture the essence of transformations
   - Commands connect to architectural understanding
   - Development flow serves the vision

### Phase 3: Artifact Generation Using Templates

Transform our onboarding insights into a complete development environment:

1. **Project Guide Creation**
   Using `.claude/templates/project-guide-template.md`:
   ```
   .claude/project-guide/
   ├── [project]-guide.md      # Core vision document
   ├── experience-map.md       # User journey narrative
   ├── command-stories.md      # All commands with their stories
   ├── tech-philosophy.md      # Architecture serving experience
   └── evolution-log.md        # Living record of growth
   ```

2. **Command Library Generation**
   Generate two types of commands using different templates:
   
   **Feature Commands** (using `command-story-template.md`):
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
   
   **Workflow Commands** (using `workflow-template.md`):
   ```
   .claude/commands/[project]/workflow/
   ├── morning-practice.md    # Daily vision alignment
   ├── vision-check.md        # Drift detection
   ├── evolution-log.md       # Growth documentation
   ├── craft-moment.md        # New command creation
   └── session-close.md       # Reflective closure
   ```

3. **Workflow Integration**
   Generate development flow commands:
   - Morning practice command for vision alignment
   - Vision check command for drift detection
   - Moment creation command for new experiences

### Phase 4: Template Integration Details

This command leverages four core templates:

1. **Onboarding Structure Template** (`onboarding-structure.md`)
   - Provides proven chapter flow for concept exploration
   - Each chapter has refinement questions and exploration prompts
   - I fill this structure with your concept-specific content

2. **Command Story Template** (`command-story-template.md`)
   - For FEATURE commands that build specific user experiences
   - Ensures every feature command includes:
     * The Moment: User experience description
     * The Feeling: Emotional goals
     * The Story: Connection to larger journey
     * Implementation Guide: Technical serving emotional
     * Vision Protection: Drift warnings and reinforcements

3. **Workflow Template** (`workflow-template.md`)
   - For WORKFLOW commands that provide reflection and guidance
   - These are conversation prompts, not executable instructions
   - Include morning-practice, vision-check, evolution-log, etc.
   - Help developers stay aligned with vision through reflection

4. **Project Guide Template** (`project-guide-template.md`)
   - Structures your living documentation:
     * Core Concept: Heart of your vision
     * Experience Architecture: Journey design
     * Technical Philosophy: Architecture as story
     * Command Narrative: All commands organized
     * Vision Guards: Protection mechanisms

**CRITICAL DISTINCTION**: 
- Feature commands build things
- Workflow commands guide thinking and reflection

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
   - `/[project]:morning-practice` - Start each day aligned
   - `/[project]:milestone-reflection` - Major checkpoint reviews
   - `/[project]:season-planning` - Long-term vision work

## Output Structure

Complete development environment with:

```
.claude/
├── project-guide/
│   ├── [project]-guide.md         # Living vision document
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
│   └── [project]-beginning-log.md   # Record of our journey
└── workflows/
    └── [project]-flow.md          # Daily development rhythm
```

## Usage Example

```bash
# First run
claude
/core:project-beginning my-concept.md

# Claude guides through immersive onboarding
# ~40 minutes of exploration and refinement
# Generates complete story-driven environment

# Begin development
/[project]:first-moment

# Daily flow
/[project]:morning-practice
/[project]:implement-moment "user-delight-x"
/[project]:vision-check
```

## Success Metrics

The beginning process succeeds when:
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