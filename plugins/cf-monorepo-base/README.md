# cf-monorepo-base plugin

Tooling for Cloudflare Workers pnpm monorepos that follow the `cf-monorepo-base` template pattern — the template set this plugin is named after covers a TanStack Start frontend + Hono/tRPC backend + D1 + Drizzle + Vitest workers pool stack, shared via `pnpm-workspace.yaml` `catalog:`.

The plugin exists because maintaining a shared template across downstream repos over time is a different kind of work from writing app code. Version drift accumulates silently across dozens of packages; breaking changes in `@cloudflare/*` packages and their ecosystem peers need careful reading before bumping; and `^0.x.y` caret ranges turn passive `pnpm update` into a trap (see DEBT-004 in the consuming repo's tech-debt for the canonical example). That work wants a consultative, methodical companion, not a "run `pnpm update` and pray" script.

## Agents

| Agent | Purpose |
|-------|---------|
| `dependency-steward` | Interactive, consultative scan and update of shared dependencies in the pnpm catalog. Surveys drift, groups by ecosystem (namespace scope + shared `repository.url`), fetches changelogs per package, consults the user on each bump, edits the catalog, runs `pnpm install` + `pnpm typecheck`, commits only with explicit approval. Writes `DEBT-NNN` entries in `.claude/tech-debt.md` for deferred cross-major or breaking-minor upgrades. **One group per session** to keep commits bounded. |

## When to use

Invoke via Claude Code's Agent tool with `subagent_type: "dependency-steward"` and one of:

- "what's drifting?" — full drift survey, grouped, awaits group choice
- "check the TanStack packages" — jump straight to a named group
- "update the Cloudflare packages, safe ones only" — survey + auto-approve same-major-additive bumps, consult per `cross-minor-0.x`
- "just survey, no updates" — read-only drift report

## Assumptions about the consuming repo

The agent reads these files at startup to calibrate its relevance judgment:

- `CLAUDE.md` at workspace and monorepo roots — stack patterns, app list, conventions
- `.claude/rules/dependencies.md` — catalog hygiene policy and the `^0.x.y` gotcha
- `.claude/rules/git-workflow.md` — commit staging rules (explicit paths, never `-A` / `.`, never `--no-verify`)
- `.claude/rules/testing.md` — testing tool conventions (to flag high-risk upgrades)
- `.claude/tech-debt.md` — known deferred upgrades, so the agent doesn't re-propose them

If these files don't exist in the consuming repo, the agent runs but with reduced relevance filtering. The `.claude/rules/dependencies.md` rule file is the most important — without it, the agent can't cite the catalog policy authoritatively when proposing catalog edits.

## Safety invariants

The agent's system prompt hard-codes these invariants and will refuse actions that violate them:

1. Never `pnpm update`, `pnpm upgrade`, or `pnpm add` — all updates go through `pnpm-workspace.yaml` catalog edits.
2. Never bump a `^0.x.y` across a minor boundary without showing the user the full CHANGELOG diff.
3. Never bump across a major boundary in-session — always propose as a DEBT entry.
4. Never commit without explicit user approval.
5. Never use `git add -A`, `git add .`, or `git commit -a` — stage by explicit path.
6. Never skip hooks (`--no-verify`).

## Planned additions

- `template-sync-steward` — consultative sync of cf-monorepo-base template changes into downstream repos (currently manual, see iteration 01 item #11 about splitting sync and triage commits)
- `test-triage-assistant` — loader → mock → assertion dependency-order triage when a sync exposes pre-existing test failures (iteration 01 item #3)
- Reference docs for the catalog hygiene rule and `^0.x.y` semver gotcha, inlinable by consuming repos into their own `.claude/rules/`

Not yet shipped — file an annotation on the `cf-monorepo-base` node in a consuming repo if you want one of these prioritized.
