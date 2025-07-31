# Architecture-Aware Build Template

*How the build command maintains architectural coherence while allowing contextual decisions.*

## Architecture Decision Flow

### 1. Initial Architecture (from init)
During init exploration, we establish:
```
Core Architecture:
- Primary stack: [e.g., Next.js + Postgres]
- State management: [e.g., Server-centric with React Query]
- Deployment target: [e.g., Vercel Edge]
- Complexity budget: [e.g., "Stay simple until 10k users"]
```

### 2. Feature-Specific Decisions

When building features, the command recognizes architectural crossroads:

```bash
/project:build "real-time collaboration"

# Response:
"Real-time collaboration for [project]. This is an architectural decision point.

Your current architecture uses [server-centric state]. For real-time, we have options:

**Option A: WebSocket Layer** (Adds complexity: +3)
- New dependency: Socket.io or similar
- Requires stateful server (changes deployment strategy)
- Best for: Full real-time experience

**Option B: Polling + Optimistic UI** (Adds complexity: +1)
- Works with current architecture
- Some latency but simpler
- Best for: Good-enough real-time

**Option C: Server-Sent Events** (Adds complexity: +2)
- One-way real-time (server to client)
- Works with edge deployment
- Best for: Notifications/updates

Given your complexity budget and [core value], I recommend [option] because...

**Option D: Evolve existing architecture** (Adds complexity: 0-1)
- Refactor current design to naturally support this feature
- Example: Make your REST API event-driven to enable real-time
- Often the most elegant solution
- Strengthens architecture rather than adding to it"
```

### 3. Complexity Tracking

The build command maintains awareness of system complexity:

```bash
/project:build "add GraphQL API"

# Response:
"⚠️ Architecture Alert: GraphQL would be your 3rd API paradigm
(REST + tRPC + GraphQL)

Current complexity score: 7/10
After GraphQL: 9/10

This suggests architectural inconsistency. Alternatives:
1. Extend existing tRPC setup for this use case
2. Migrate everything to GraphQL (big refactor)
3. Accept complexity for specific benefit (what benefit?)
4. Evolve tRPC setup to support GraphQL-like features

What's driving the GraphQL need? Let's understand the requirement
and find the most elegant solution."
```

### 4. Contextual Technology Choices

Different features get different recommendations:

```bash
/project:build "image editing feature"

# Response:
"Image editing for [project]. For this specific feature:

Given your [use case specifics], I recommend:
- Client-side: Canvas API for simple edits
- Library: Fabric.js for medium complexity  
- Service: Photopea API for full features

This is feature-isolated complexity - won't affect core architecture.
The choice depends on: [specific requirements]"
```

### 5. Architectural Evolution Patterns

When features need architectural changes:

```bash
/project:build "offline support"

# Response:
"Offline support requires architectural evolution. Let's explore options:

**Option A: Add offline layer** (Complexity +3)
- Service workers, IndexedDB, sync logic
- Significant complexity increase

**Option B: Evolve to local-first** (Complexity +1)
- Refactor current architecture around local state
- Server becomes sync target, not source of truth
- More elegant but requires rethinking data flow

**Option C: Progressive enhancement** (Complexity +2)
- Start with read-only offline
- Gradually add write capabilities
- Learn as you go

The elegant path might be Option B - want to explore how your
current architecture could evolve rather than just adding layers?"
```

## Complexity Scoring System

Each architectural decision carries weight:

```
Complexity Points:
+1: New library that follows existing patterns
+2: New service/API that requires integration
+3: New infrastructure requirement
+4: Fundamental pattern change
+5: Platform/deployment change

Thresholds:
0-3:   Simple, maintainable
4-6:   Moderate, requires discipline  
7-8:   Complex, needs justification
9-10:  Reconsider approach
```

## Architecture Documentation

Build command maintains a running log:

```
.claude/architecture-decisions.md

## Decision Log

### 2024-01-15: Real-time Features
- Chose: SSE over WebSockets
- Reason: Edge deployment compatibility
- Complexity: +2 (total: 5/10)
- Tradeoff: Some features limited but maintains simplicity

### 2024-01-20: File Upload
- Chose: Evolve existing API to handle uploads
- Reason: Discovered our streaming setup already supports it
- Complexity: +0 (total: 5/10)
- Note: Architecture evolution, not addition

### 2024-01-25: Offline Support
- Chose: Refactor to local-first architecture
- Reason: More elegant than adding offline layer
- Complexity: +1 (total: 6/10)
- Note: Strengthened architecture while adding capability
```

## Progressive Architecture

The system recognizes natural complexity progression:

```
Early Stage (MVP):
- Monolithic choices
- Proven patterns
- Minimal dependencies

Growth Stage:
- Targeted complexity
- Service boundaries  
- Performance optimization

Scale Stage:
- Distributed architecture
- Specialized services
- Complexity justified by need
```

## Integration with Other Commands

### With Start Command
```
/project:start

"I notice you're approaching complexity threshold (8/10).
Before adding features, consider:
- Refactoring opportunity in [area]
- Simplification of [feature]
- Architecture review might help"
```

### With Evolve Command
```
/project:evolve "considering microservices"

"This architectural evolution would shift from simplicity-first
to scale-first. Let's explore what's driving this..."
```

### With Check Command
```
/project:check

"Architecture drift detected:
- 3 different state management patterns
- Inconsistent API styles
- Complexity creep in [area]"
```

## The Balance

This approach maintains:
- **Coherence**: Core architecture stays consistent
- **Flexibility**: Features can use best tools
- **Awareness**: Complexity is always visible
- **Intentionality**: Big changes require conscious choice
- **Evolution**: Architecture can grow rather than just accumulate