# Agentic Engineering Guide

A practical guide for using agentic coding tools across software delivery end to end — from requirements and architecture through backlog, development, review, testing, deployment, and support.

## Start here

**[docs/00-overview.md](docs/00-overview.md)** is the one detailed walkthrough of this repo — what it covers, the core principles, deployment models, how work flows end to end, git workflow, governance/risk tiers, patch-vs-regenerate, metrics, tool comparison, and a ten-minute path through everything else. Read that first; this README is just the index.

## Index

| If you want to... | Go here |
|---|---|
| Get the full picture in one read | [docs/00-overview.md](docs/00-overview.md) |
| See the git branching/PR/merge flow and what's automatable | [docs/00-git-workflow-and-automation.md](docs/00-git-workflow-and-automation.md) |
| Understand the core principles | [docs/01-principles.md](docs/01-principles.md) |
| Start with requirements and architecture | [docs/08-agile-workflow.md](docs/08-agile-workflow.md) |
| Decide patch vs. regenerate | [docs/02-patch-vs-regenerate.md](docs/02-patch-vs-regenerate.md) |
| Follow the SDLC flow | [docs/03-phases/README.md](docs/03-phases/README.md) |
| Set up risk gates | [docs/04-governance-risk-tiers.md](docs/04-governance-risk-tiers.md) |
| Check effort-savings evidence | [docs/05-effort-savings-evidence.md](docs/05-effort-savings-evidence.md) |
| Track whether the process works | [docs/06-metrics.md](docs/06-metrics.md) |
| Use agile backlog and feature flow | [docs/08-agile-workflow.md](docs/08-agile-workflow.md) |
| Read a tool comparison | [docs/07-tools-comparison.md](docs/07-tools-comparison.md) |
| Read the eleven practice deep dives | [docs/practices/](docs/practices/) |
| See prompts and outcomes for every phase, worked end to end | [examples/README.md](examples/README.md) |
| Use a template | [templates/](templates/) |
| See domain mapping | [domains/domains.md](domains/domains.md) |
| Compare with BMAD, AI-DLC, and specs.md | [docs/09-related-frameworks.md](docs/09-related-frameworks.md) |
| Wire this into your repo's CI | [.github/](.github/) |

## Status

Living guide. Principles and governance in `docs/` should change only through deliberate review (see [CONTRIBUTING.md](CONTRIBUTING.md)). Tooling references in `docs/07-tools-comparison.md` and `domains/domains.md` go stale fast, so check the dated caveats before trusting them and refresh on a schedule.

## License

Internal methodology — adapt freely within your org. No warranty on effort-savings figures; verify against current published sources before using them in planning (see [docs/05-effort-savings-evidence.md](docs/05-effort-savings-evidence.md)).
