# Agentic Engineering Guide

A practical guide for using AI agents across software delivery — from requirements and design through development, review, testing, deployment, and support.

## What this guide covers

Modern agent tools can plan, write, test, and review work. The hard part is deciding what to delegate, what to gate, and how to prove the work is actually correct.

This repo gives you:

- a requirements-first and architecture-first planning flow
- a simple SDLC flow for agent-assisted work
- a workflow that shows where agent tools help at each step
- templates for specs, ADRs, and risk checks
- governance rules for autonomy and approval
- a comparison page for current tools

## Start here

| If you want to... | Start here |
|---|---|
| Understand the core ideas | [docs/01-principles.md](docs/01-principles.md) |
| Start with requirements and architecture | [docs/08-agile-workflow.md](docs/08-agile-workflow.md) |
| Decide patch vs. regenerate | [docs/02-patch-vs-regenerate.md](docs/02-patch-vs-regenerate.md) |
| Follow the SDLC flow | [docs/03-phases/README.md](docs/03-phases/README.md) |
| Set up risk gates | [docs/04-governance-risk-tiers.md](docs/04-governance-risk-tiers.md) |
| Check effort-savings evidence | [docs/05-effort-savings-evidence.md](docs/05-effort-savings-evidence.md) |
| Track whether the process works | [docs/06-metrics.md](docs/06-metrics.md) |
| Use agile backlog and feature flow | [docs/08-agile-workflow.md](docs/08-agile-workflow.md) |
| Read a tool comparison | [docs/07-tools-comparison.md](docs/07-tools-comparison.md) |
| Use a template | [templates/](templates/) |
| See domain mapping | [domains/domains.csv](domains/domains.csv) |
| Wire this into your repo's CI | [.github/](.github/) |

## Core principles

1. **Verifiability over trust** — accept agent output because it passed a test/eval/diff review, never because it "looks right."
2. **Reversibility gates autonomy** — the more reversible and low-blast-radius an action, the more autonomy it gets.
3. **Spec is the contract** — the spec is what the agent is graded against, not the conversation that produced it.
4. **Context is engineered, not assumed** — what an agent can see is curated deliberately.
5. **Humans move up the stack** — less typing, more specifying, reviewing, and deciding.

## Deep dives

Each of these gets a full how-to, not just a mention: [spec-driven development](docs/practices/spec-driven-development.md), [context engineering](docs/practices/context-engineering.md), [plan-then-execute](docs/practices/plan-then-execute.md), [human-in-the-loop gating](docs/practices/human-in-the-loop-gating.md), [evals](docs/practices/evals.md), [prompt/agent versioning](docs/practices/prompt-agent-versioning.md), [worktree/sandbox isolation](docs/practices/worktree-sandbox-isolation.md), [multi-agent orchestration](docs/practices/multi-agent-orchestration.md), [tool/function-calling design](docs/practices/tool-function-calling-design.md), [memory/state persistence](docs/practices/memory-state-persistence.md).

## Status

Living guide. Principles and governance in `docs/` should change only through deliberate review (see [CONTRIBUTING.md](CONTRIBUTING.md)). Tooling references in `domains/domains.csv` go stale fast, so check dates before trusting them and refresh on a schedule.

## License

Internal methodology — adapt freely within your org. No warranty on effort-savings figures; verify against current published sources before using them in planning (see [docs/05-effort-savings-evidence.md](docs/05-effort-savings-evidence.md)).
