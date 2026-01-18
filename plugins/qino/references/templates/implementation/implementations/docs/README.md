# Technical Documentation

This directory contains settled technical architecture and implementation patterns for your ecosystem.

## Purpose

**For humans:** Deep technical reference for understanding system design and architectural decisions.

**For AI agents:** Starting point for technical exploration—context that enables accurate reasoning about system behavior.

## What Belongs Here

✅ Cross-app patterns (seeding, RPC, type sharing)
✅ Infrastructure patterns (service bindings, migrations)
✅ Integration contracts (how components communicate)
✅ Settled architecture (implemented and proven designs)

❌ App-specific implementation (belongs in `implementations/{app}/`)
❌ Ephemeral notes (belongs in `docs/generated/`)

## Getting Started

As your ecosystem grows, document patterns here:

- `seeding-architecture.md` — How seeding works across apps
- `service-bindings.md` — RPC contracts between services
- `integration-patterns.md` — How modalities integrate

These become the technical foundation other apps build on.

## Relationship to Other Docs

- `implementations/{app}/` — App-specific context
- `implementations/docs/` — Cross-app architecture (you are here)
- Concept repos — The "why" and vision
- Research repos — Investigations and experiments
