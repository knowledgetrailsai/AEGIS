# Overview: AEGIS, End to End

**Start here.** This page walks through the whole repo in one read: what it is, how the pieces fit together, and where to go for more depth on each part. Every other page in this repo digs deeper into one piece of the story told here.

## What this repo is

**AEGIS** stands for Agentic Engineering: Governance, Implementation & Scaling. It's a practical reference for running software delivery — from requirements all the way through production support — in a world where agentic coding tools (Claude Code, Cursor, GitHub Copilot, Kiro, and similar) are writing a meaningful share of the code, not just autocompleting a line here and there.

This guide takes clear positions on purpose. Every recommendation here is a starting point you can override for good reason, not one option among many equally good ones.

AEGIS also implements the "Intelligence and Agent Engineering" discipline of the [OASIS](https://github.com/knowledgetrailsai/OASIS) enterprise-AI-transformation framework. It works fine entirely on its own too, for teams that aren't running OASIS — see [09-related-frameworks.md](09-related-frameworks.md) for how the two relate.

This repo isn't about how to prompt a tool well. It's about the decisions that come up once a tool is producing a real volume of change. What can run unattended, and what needs a human explicitly watching? How much of a diff can you trust without checking it yourself line by line? How tight does a spec need to be before you can actually tell whether the tool's output matches it? And how do you tell — with real numbers, not a feeling — whether these tools are making delivery genuinely better, or just making it look faster?

## Who it's for

This repo is for anyone shipping software where an agentic coding tool touches the codebase. That includes individual developers deciding how much to delegate on a given task, tech leads setting review and merge policy, and engineering managers who need to report whether adoption is actually paying off.

The domain mapping in [domains/domains.md](../domains/domains.md) extends this beyond typical application development into data engineering, API/integration platforms, ERP customization, game development, e-commerce, IoT, and operational technology (OT). The practices here work across all of them, with extra notes wherever a domain needs something different.

## The five principles everything else derives from

Full detail: [01-principles.md](01-principles.md).

1. **Verifiability over trust** — tool output gets accepted because it passed a test, an eval (an automated check of the tool's output against what it should do), or a diff review. It never gets accepted just because it "looks right."
2. **Reversibility gates autonomy** — the easier a mistake is to undo, and the smaller the damage it could cause (this is what we mean by "blast radius"), the more autonomy a tool earns. A formatting fix can auto-merge on its own. A production database migration never should, no matter how confident the tool sounds.
3. **Spec is the contract** — what matters is the spec itself, not the conversation that produced it. That's what the tool is graded against, and what a reviewer checks the output against.
4. **Context is engineered, not assumed** — what a tool can see (its "context") is chosen on purpose. It isn't just whatever happens to fit in the context window.
5. **Humans move up the stack** — people spend less time typing code and more time explaining intent, reviewing output, and making the judgment calls a tool shouldn't make on its own.

These build on each other. Verifiability is what makes it *safe* to extend autonomy (principle 2). A spec is what makes verifiability *possible* in the first place (principle 3). Context engineering determines how well a tool can act on that spec (principle 4). Get principles 1 through 4 right, and principle 5 — humans doing more valuable work — happens naturally. It isn't something you have to hope for separately.

## The deployment-model distinction that shapes everything downstream

Full detail: [07-tools-comparison.md](07-tools-comparison.md#deployment-models--the-distinction-this-repos-earlier-docs-glossed-over).

Not all agentic coding tools are the same kind of thing. Which kind you're using changes what it can plug into:

| Model | Where it runs | Examples | Fits best |
|---|---|---|---|
| Standalone IDE | Its own application, replaces your editor | Cursor, Windsurf, Kiro | Deep, interactive coding sessions |
| IDE plugin / extension | Inside an editor you already use | GitHub Copilot, Cline, Roo Code, Continue.dev | Lowest-friction adoption, no workflow change |
| CLI / terminal tool | Shell, CI pipelines, headless | Claude Code, OpenAI Codex CLI, Aider | Anything that must run unattended or scripted |
| Cloud / hosted tool | A remote workspace, not the developer's machine | GitHub Copilot agent sessions | Long-running or parallel work, centralized/auditable execution |

This matters in practice. A CI eval gate (see below) — an automated check that runs in your build pipeline before code can merge — simply cannot run on an IDE-only plugin. It needs a CLI or a cloud tool instead. A team that has only adopted a plugin has no way to run this kind of unattended, tier-gated automation. Most mature teams end up running more than one model at once: a plugin for day-to-day editing, a CLI tool wired into CI, and maybe a cloud tool for long autonomous runs.

## How work actually flows through this repo

```
requirements -> architecture -> backlog -> feature -> refined slice -> spec -> design -> development -> review -> testing -> release -> support
```

That's the same shape as a conventional software development lifecycle (SDLC). The point of this repo isn't to invent a new lifecycle — it's to explain what an agentic coding tool does at each stop, and how much autonomy it gets there. Two pages cover this end to end:

- [08-agile-workflow.md](08-agile-workflow.md) — how requirements, architecture, backlog, and feature slicing work with tool support, plus a per-step table of which tool (and deployment model) fits which stage.
- [03-phases/README.md](03-phases/README.md) — the SDLC phase guide proper: requirements & spec, architecture & design, development, code review, testing & QA, deployment & release, production support & maintenance. Every phase page follows the same pattern — what it's for, how to run it, what tools help, best practices, common mistakes.

Before any of that happens, though, every task starts the same way: as a branch or worktree, gated by its risk tier — a rating of how much a change could go wrong, which decides how much oversight it gets (more on this in the next section).

## Git workflow: how a task actually moves from spec to merged code

Full detail, including a diagram: [00-git-workflow-and-automation.md](00-git-workflow-and-automation.md).

Every task — whether a human or a tool starts it — gets its own short-lived branch or [isolated worktree](practices/worktree-sandbox-isolation.md). It then moves through a plan-then-execute loop: the tool proposes a plan, and a human approves it before any execution happens. The work gets committed in atomic, conventional-format commits, each tagged as tool-authored, tool-assisted, or human-authored. It opens a pull request (PR) that declares its risk tier and links to its spec. It passes a CI eval gate. Then it merges according to its risk tier: auto-merge for Tier 1, human review for Tier 2, named-approver sign-off for Tier 3, and multi-party approval with a staged rollout for Tier 4.

Merging uses squash merge, which keeps `main`'s history at one entry per shipped change. That's also what most of the metrics in this repo — cycle time, deployment frequency, change failure rate — are measured against.

The mechanical, reversible parts of this are safe to automate: branch or worktree setup, commit message drafting, PR description drafting, running the CI gate, Tier 1 merges, and stale-branch cleanup. Anything hard to reverse stays human-gated. So does anything where the tool would be grading its own homework — for example, assigning its own risk tier, merging its own Tier 2-or-higher change, or changing the gates that govern it. The next section spells this same rule out in more detail.

## Governance: how much autonomy an action gets

Full detail: [04-governance-risk-tiers.md](04-governance-risk-tiers.md).

| Tier | Definition | Example | Gate |
|---|---|---|---|
| 1 — Autonomous | Reversible, low blast radius | Formatting fix, doc update, covered unit test | Auto-merge on green CI, spot-audited |
| 2 — Reviewed | Reversible, moderate blast radius | New feature in a well-tested module | Human PR review before merge |
| 3 — Approved | Hard to reverse or shared blast radius | Schema change, API contract change | Named approver sign-off + rollback plan |
| 4 — Restricted | Irreversible or safety/financial/regulatory critical | Production DB migration, payment logic, OT actuation | Multi-party approval, staged rollout, audit trail |

Tier the action itself, not the tool or the project as a whole — the same tool can take a Tier 1 action in the morning and a Tier 4 action in the afternoon. Wire each gate into your actual tooling — branch protection, CODEOWNERS, PR templates — rather than writing it into a policy document nobody reads. When you're unsure which tier applies, pick the higher one; under-gating is the expensive mistake to make. Some things automatically bump up at least one tier: anything touching customer personal data (PII) or payment data, anything without test coverage, anything without a rollback path, and anything that crosses a system-of-record boundary such as an ERP, a ledger, a clinical record, or an OT (operational technology) controller.

## Patch vs. regenerate: the other axis of every change

Full detail: [02-patch-vs-regenerate.md](02-patch-vs-regenerate.md).

Separately from risk tier, every change to a component is either a **patch** or a **regeneration**. A patch is an incremental diff — git history and blame stay intact, the same as normal human-driven development. A regeneration treats the component as disposable: you rebuild it from the spec instead of editing it, the way infrastructure-as-code redeploys a whole server instead of patching one file on it.

Apply this choice per component, not per project — most real systems are a mix of both. As a starting point: patch anything stateful, shared, or where a mistake would cause a lot of damage (high blast radius). Only regenerate components that are narrow, bounded, and fully described by their spec. Either way, always re-verify that behavior matches before cutover — a regeneration that compiles isn't necessarily one that works correctly.

## What actually gets deep-dived

Eleven practices each get a full how-to guide here, not just a one-line mention, because these are the mechanics that make the principles above actually work day to day: [spec-driven development](practices/spec-driven-development.md), [context engineering](practices/context-engineering.md), [process scaling](practices/process-scaling.md), [plan-then-execute](practices/plan-then-execute.md), [human-in-the-loop gating](practices/human-in-the-loop-gating.md), [evals](practices/evals.md), [prompt/agentic coding tool versioning](practices/prompt-agent-versioning.md), [worktree/sandbox isolation](practices/worktree-sandbox-isolation.md), [multi-agent orchestration](practices/multi-agent-orchestration.md), [tool/function-calling design](practices/tool-function-calling-design.md), [memory/state persistence](practices/memory-state-persistence.md).

## Does any of this actually work? The evidence, not the pitch

Full detail: [05-effort-savings-evidence.md](05-effort-savings-evidence.md).

The gains are real, but they aren't even across the board, and this repo leads with the caution as much as the upside.

Work that's bounded, well-specified, and easy to verify — boilerplate, test generation, doc generation, migrations with a clear before-and-after — sees the strongest and most consistent gains. Vendor studies report 30–55% in these cases.

But a 2025 METR randomized controlled trial told a more complicated story. It found that experienced open-source developers completed real tasks **19% slower** when using current AI tools. Yet those same developers estimated afterward that the tools had made them **~20% faster**. That gap, between how fast people felt and how fast they actually were, matters as much as the slowdown itself.

Work that's ambiguous, spans a lot of context, or touches an unfamiliar codebase shows the smallest gains — sometimes a net loss — once you count the time spent reviewing and fixing the output.

This is why this repo treats risk-tiering, spec quality, and context engineering as required, not as optional add-ons. They're what closes the gap between the number a vendor advertises and the number you'd actually measure on your own team.

## How to know if it's working: metrics

Full detail: [06-metrics.md](06-metrics.md).

There are two families of metrics here, and mixing them up is the most common measurement mistake:

- **Tool-adoption metrics** (new to this repo) — tool-authored change ratio, override/rejection rate, cycle-time delta segmented by task profile, defect-rate delta by authorship, perceived-vs-measured speed gap. These tell you whether the tooling itself is trustworthy.
- **Standard SDLC/Agile/PM metrics** — velocity, cycle time, lead time, the four DORA metrics, defect density, escaped defect rate, code churn, technical debt ratio, test coverage, sprint predictability, cost per story point, scope creep, review turnaround. These still matter, but several of them change meaning once agentic tools enter the picture. For example, velocity can go up without a matching increase in value delivered, and a shrinking cycle time paired with a growing review queue isn't a real efficiency gain. The metrics page details what changes for each one.

The one rule that matters most: **always pair an efficiency metric with a quality metric.** A velocity or cycle-time win reported by itself is incomplete at best, and misleading at worst.

## Picking a tool

Full detail: [07-tools-comparison.md](07-tools-comparison.md).

The comparison page isn't trying to crown a winner. It maps current tools — Cursor, Windsurf, Kiro, GitHub Copilot, Cline, Roo Code, Continue.dev, Claude Code, OpenAI Codex CLI, Aider, and others — to their deployment model, best fit, strengths, and tradeoffs. Everything there is sourced and dated, because this category moves fast. Pick the tool, and the deployment model, that fits the step you're on — not one tool for the whole lifecycle.

## Putting it to work

- **Templates** — [spec-template.md](../templates/spec-template.md), [adr-template.md](../templates/adr-template.md), [risk-tier-checklist.md](../templates/risk-tier-checklist.md) in [templates/](../templates/adr-template.md).
- **Worked examples** — [examples/README.md](../examples/README.md) follows one feature through all seven SDLC phases, with the actual prompt given to the tool, its output, the human gate applied, and the outcome at each step.
- **CI wiring** — [.github/workflows/ci-eval-gate.yml](../.github/workflows/ci-eval-gate.yml) and [.github/PULL_REQUEST_TEMPLATE.md](../.github/PULL_REQUEST_TEMPLATE.md) actually enforce the risk-tier and spec-link rules above, mechanically. A rule that only lives in a document nobody reads doesn't actually get followed.
- **Domain mapping** — [domains/domains.md](../domains/domains.md) maps this whole framework across roughly 40 engineering domains (data, API/integration, ERP, game dev, e-commerce, IoT, OT, and more), with the kind of dev involved, example work, and what accelerates or runs autonomously in each.
- **Related frameworks** — [09-related-frameworks.md](09-related-frameworks.md) compares this guide with BMAD-METHOD, AWS AI-DLC, and specs.md, and names exactly which ideas were adopted from each and where they landed.

## A ten-minute path through this repo

If you're reading this just once and want the shortest path to the full mental model, read in this order: this page first, then [00-git-workflow-and-automation.md](00-git-workflow-and-automation.md) for how a change actually moves, then [04-governance-risk-tiers.md](04-governance-risk-tiers.md) for how much autonomy it gets, then [06-metrics.md](06-metrics.md) for how you'll know it's working. Everything else is reference material — come back to it as each task needs it.

## Keeping this current

This repo is a living guide. Principles and governance in `docs/` change only through deliberate review — see [CONTRIBUTING.md](../CONTRIBUTING.md). Tool names, vendor claims, and domain tooling references go stale fast. Check the dated caveats on [07-tools-comparison.md](07-tools-comparison.md) and [domains/domains.md](../domains/domains.md) before treating them as current, and verify effort-savings figures against published sources before using them in planning.
