# Agentic Engineering SDLC

A prescriptive framework for running software delivery — dev, data, API, integration, ERP, QA, ops, and OT — when AI agents are active participants in the lifecycle, not just autocomplete.

## Why this exists

Agentic tools (Claude Code, Copilot, Cursor, Kiro, and similar) can now plan, write, test, and ship changes with real autonomy. The gap most teams hit isn't the tooling — it's the absence of a method: what to let an agent do unsupervised, how to spec work so an agent can act on it, how to gate risk, and how to tell if it's actually saving effort or just moving the work into review.

This repo is that method, in docs, templates, and CI scaffolding you can adopt directly.

## How to use this repo

| If you want to... | Start here |
|---|---|
| Understand the core ideas | [docs/01-principles.md](docs/01-principles.md) |
| Decide patch vs. full regeneration for a component | [docs/02-patch-vs-regenerate.md](docs/02-patch-vs-regenerate.md) |
| Run a specific SDLC phase with agents | [docs/03-phases/](docs/03-phases/) |
| Set up risk gating / approvals | [docs/04-governance-risk-tiers.md](docs/04-governance-risk-tiers.md) |
| Know what to actually expect in time saved | [docs/05-effort-savings-evidence.md](docs/05-effort-savings-evidence.md) |
| Track whether it's working | [docs/06-metrics.md](docs/06-metrics.md) |
| Write a spec, ADR, or PR an agent can act on | [templates/](templates/) |
| See tooling/role mapping across 40 domains | [domains/domains.csv](domains/domains.csv) |
| Wire this into your repo's CI | [.github/](.github/) |

## Core principles (detail in [docs/01-principles.md](docs/01-principles.md))

1. **Verifiability over trust** — accept agent output because it passed a test/eval/diff review, never because it "looks right."
2. **Reversibility gates autonomy** — the more reversible and low-blast-radius an action, the more autonomy it gets.
3. **Spec is the contract** — the spec is what the agent is graded against, not the conversation that produced it.
4. **Context is engineered, not assumed** — what an agent can see is curated deliberately.
5. **Humans move up the stack** — less typing, more specifying, reviewing, and deciding.

## Status

Living document. Principles and governance in `docs/` are meant to change only through deliberate review (see [CONTRIBUTING.md](CONTRIBUTING.md)). The tooling references in `domains/domains.csv` go stale fast — check dates before trusting them and refresh on a schedule.

## License

Internal methodology — adapt freely within your org. No warranty on effort-savings figures; verify against current published sources before using them in planning (see [docs/05-effort-savings-evidence.md](docs/05-effort-savings-evidence.md)).
