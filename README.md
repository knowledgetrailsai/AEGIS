# AEGIS

**A**gentic **E**ngineering: **G**overnance, **I**mplementation & **S**caling. This is a practical guide for using agentic coding tools across the whole software delivery process — from requirements and architecture, through backlog, development, review, and testing, to deployment and support.

AEGIS also implements the "Intelligence and Agent Engineering" discipline of [OASIS](https://github.com/knowledgetrailsai/OASIS). It works fine on its own too, for teams that aren't running OASIS at all. See [docs/09-related-frameworks.md](docs/09-related-frameworks.md).

## Start here

**[docs/00-overview.md](docs/00-overview.md)** is the one detailed walkthrough of this repo. It covers what the repo is for, the core principles, deployment models, how work flows from start to finish, the git workflow, governance and risk tiers, patch-vs-regenerate, metrics, and a tool comparison. It also gives you a ten-minute path through everything else. Read that page first: this README is just an index.

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
| Read the eleven practice deep dives | [docs/practices/README.md](docs/practices/README.md) |
| See prompts and outcomes for every phase, worked end to end | [examples/README.md](examples/README.md) |
| Use a template | [templates/README.md](templates/README.md) |
| See domain mapping | [domains/domains.md](domains/domains.md) |
| Compare with BMAD, AI-DLC, specs.md, and OASIS | [docs/09-related-frameworks.md](docs/09-related-frameworks.md) |
| Wire this into your repo's CI | [.github/](.github/PULL_REQUEST_TEMPLATE.md) |

## Relationship to companion repositories

AEGIS is the [OASIS](https://github.com/knowledgetrailsai/OASIS) companion for Chapter 14, Intelligence and Agent Engineering, scoped specifically to agentic *coding* delivery. The other eight Part III chapters have their own companions; see the [Companion Repository Index](https://github.com/knowledgetrailsai/OASIS/blob/main/References/companion-repository-index.md) for the full map: [Forge](https://github.com/knowledgetrailsai/Forge) (data and knowledge engineering), [Loom](https://github.com/knowledgetrailsai/Loom) (human-AI workflow), [Helm](https://github.com/knowledgetrailsai/HELM) (deployment, operations, and AgentOps), [Verity](https://github.com/knowledgetrailsai/Verity) (evaluation and reliability), [Compass](https://github.com/knowledgetrailsai/responsible-ai) (responsible AI, security, and governance), and [Fulcrum](https://github.com/knowledgetrailsai/oasis-fulcrum) (FinOps and economics).

A note on terminology: in this repo, "deployment models" (see [docs/00-overview.md](docs/00-overview.md)) means how agentic coding tools get rolled out to a delivery team. It does not mean model *architecture*. If you're looking for that sense of "model" (transformer variants, attention mechanisms, embeddings, and the rest of the deep-learning landscape that Chapter 14's model-selection guidance draws on), see [Axiom](https://github.com/knowledgetrailsai/Axiom). Axiom is a background reference, not a chapter companion in its own right.

## Status

Living guide. Principles and governance in `docs/` should change only through deliberate review — see [CONTRIBUTING.md](CONTRIBUTING.md). Tooling references in `docs/07-tools-comparison.md` and `domains/domains.md` go stale fast, so check the dated caveats before trusting them and refresh on a schedule.

## License

Licensed under [CC BY-SA 4.0](https://github.com/knowledgetrailsai/OASIS/blob/main/LICENSE.md). Reuse and adaptation are welcome with credit to KnowledgeTrails-OASIS, a link to the license, an indication of changes, and release of adaptations under the same license. No warranty on effort-savings figures; verify against current published sources before using them in planning (see [docs/05-effort-savings-evidence.md](docs/05-effort-savings-evidence.md)).

## About Us

**Shripadraj Mujumdar** is an Agentic AI & Automation Strategist, Advisor, and Responsible AI Expert with 28+ years of experience in enterprise architecture and AI-driven transformation, including deep hands-on work in Agentic AI, Generative AI, and enterprise data and knowledge platforms. His practice spans designing multi-agent systems, knowledge-graph and RAG architectures, accelerated delivery capabilities, and Responsible AI governance frameworks aligned to global regulatory standards. This methodology ecosystem distills that practitioner experience — architecture, delivery, evaluation, governance, and economics — into a single, reusable body of work.

**Ankit Mirajkar** is a Data & AI Architect and technology consultant specializing in modern data platforms, enterprise data architecture, and Agentic AI. His expertise spans scalable data engineering, AI-ready data platforms, Generative AI, and cloud technologies, with a strong focus on turning complex data challenges into practical, production-ready solutions. He also works at the intersection of architecture, technology strategy, and innovation to help organizations build intelligent, scalable data ecosystems.
