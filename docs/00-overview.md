# Overview: The Agentic Engineering Guide, End to End

**Start here.** This page is the single detailed walkthrough of the whole repo — what it is, how the pieces fit together, and where to go next for depth. Every other page in this repo is a deep dive into one part of the story told here.

## What this repo is

A practical reference for running software delivery — requirements through production support — when agentic coding tools (Claude Code, Cursor, GitHub Copilot, Kiro, and similar) are doing a meaningful share of the writing, not just autocompleting lines. It is opinionated on purpose: every recommendation here is a default you can override, not a menu of equally-valid options.

The problem this repo solves isn't "how do I prompt a tool." It's the set of decisions that only come up once tools are producing a real volume of change: what can run unattended versus what needs a human explicitly in the loop, how much of a diff to trust without re-deriving it yourself, how to keep a spec tight enough that a tool's output is actually checkable, and how to tell — with numbers, not vibes — whether adopting these tools is making delivery better or just faster-looking.

## Who it's for

Anyone shipping software where an agentic coding tool touches the codebase: individual developers deciding how much to delegate on a given task, tech leads setting review and merge policy, and engineering managers who need to report whether adoption is actually paying off. The domain mapping in [domains/domains.md](../domains/domains.md) extends this beyond conventional application development into data engineering, API/integration platforms, ERP customization, game development, e-commerce, IoT, and operational technology (OT) — the practices here generalize across all of them, with domain-specific notes where they don't.

## The five principles everything else derives from

Full detail: [01-principles.md](01-principles.md).

1. **Verifiability over trust** — tool output is accepted because it passed a test, an eval, or a diff review, never because it "looks right."
2. **Reversibility gates autonomy** — the more reversible and low-blast-radius an action, the more autonomy a tool earns; a formatting fix can auto-merge, a production migration never does.
3. **Spec is the contract** — the spec, not the conversation that produced it, is what the tool is graded against and what a reviewer checks output against.
4. **Context is engineered, not assumed** — what a tool can see is curated deliberately, not left to whatever fits in a context window by accident.
5. **Humans move up the stack** — less time typing, more time specifying intent, reviewing output, and making the judgment calls a tool shouldn't make alone.

These aren't independent. Verifiability is what makes it *safe* to extend autonomy (principle 2). A spec is what makes verifiability *possible* in the first place (principle 3). Context engineering determines how well a tool can act on that spec (principle 4). Get 1–4 right and principle 5 — humans doing higher-leverage work — follows as a consequence, not a hope.

## The deployment-model distinction that shapes everything downstream

Full detail: [07-tools-comparison.md](07-tools-comparison.md#deployment-models--the-distinction-this-repos-earlier-docs-glossed-over).

Not all agentic coding tools are the same *kind* of thing, and which kind you're using changes what it can plug into:

| Model | Where it runs | Examples | Fits best |
|---|---|---|---|
| Standalone IDE | Its own application, replaces your editor | Cursor, Windsurf, Kiro | Deep, interactive coding sessions |
| IDE plugin / extension | Inside an editor you already use | GitHub Copilot, Cline, Roo Code, Continue.dev | Lowest-friction adoption, no workflow change |
| CLI / terminal tool | Shell, CI pipelines, headless | Claude Code, OpenAI Codex CLI, Aider | Anything that must run unattended or scripted |
| Cloud / hosted tool | A remote workspace, not the developer's machine | GitHub Copilot agent sessions | Long-running or parallel work, centralized/auditable execution |

This matters because a CI eval gate (see below) *structurally cannot* run on an IDE-only plugin — it needs a CLI or cloud tool. A team that has only adopted a plugin has no way to run unattended, tier-gated automation. Most mature teams end up running more than one model at once: a plugin for day-to-day editing, a CLI tool wired into CI, possibly a cloud tool for long autonomous runs.

## How work actually flows through this repo

```
requirements -> architecture -> backlog -> feature -> refined slice -> spec -> design -> development -> review -> testing -> release -> support
```

That's the same shape as a conventional SDLC — the point isn't a new lifecycle, it's what an agentic coding tool does at each stop and how much autonomy it's given there. Two pages cover this end to end:

- [08-agile-workflow.md](08-agile-workflow.md) — how requirements, architecture, backlog, and feature slicing work with tool support, plus a per-step table of which tool (and deployment model) fits which stage.
- [03-phases/README.md](03-phases/README.md) — the SDLC phase guide proper: requirements & spec, architecture & design, development, code review, testing & QA, deployment & release, production support & maintenance. Every phase page follows the same pattern — what it's for, how to run it, what tools help, best practices, common mistakes.

Before any of that, though, every task starts the same way described in the next section — as a branch or worktree, gated by risk tier.

## Git workflow: how a task actually moves from spec to merged code

Full detail, including a diagram: [00-git-workflow-and-automation.md](00-git-workflow-and-automation.md).

Every task — human- or tool-initiated — gets its own short-lived branch or [isolated worktree](practices/worktree-sandbox-isolation.md), moves through a plan-then-execute loop with a human approving the plan before execution, gets committed with atomic, conventional-format commits (tagged tool-authored vs. tool-assisted vs. human-authored), opens a PR that declares its risk tier and links its spec, passes a CI eval gate, and merges according to that risk tier — auto-merge for Tier 1, human review for Tier 2, named-approver sign-off for Tier 3, multi-party approval and staged rollout for Tier 4. Squash merge keeps `main`'s history at one entry per shipped change, which is also what most of the metrics in this repo (cycle time, deployment frequency, change failure rate) are measured against.

The mechanical, reversible parts of this — branch/worktree setup, commit message drafting, PR description drafting, running the CI gate, Tier 1 merges, stale-branch cleanup — are safe to automate. Anything that's hard to reverse, or where the tool would be grading its own homework (self-assigning its own risk tier, merging its own Tier 2+ change, changing the gates that govern it), stays human-gated. That line is the same one the next section formalizes.

## Governance: how much autonomy an action gets

Full detail: [04-governance-risk-tiers.md](04-governance-risk-tiers.md).

| Tier | Definition | Example | Gate |
|---|---|---|---|
| 1 — Autonomous | Reversible, low blast radius, high test coverage | Formatting fix, doc update, covered unit test | Auto-merge on green CI, spot-audited |
| 2 — Reviewed | Reversible, moderate blast radius | New feature in a well-tested module | Human PR review before merge |
| 3 — Approved | Hard to reverse or shared blast radius | Schema change, API contract change | Named approver sign-off + rollback plan |
| 4 — Restricted | Irreversible or safety/financial/regulatory critical | Production DB migration, payment logic, OT actuation | Multi-party approval, staged rollout, audit trail |

Tier the *action*, not the tool or the project — the same tool takes Tier 1 and Tier 4 actions in the same day. Wire the gate into tooling (branch protection, CODEOWNERS, PR templates), not into a policy doc nobody checks. Default to the higher tier when uncertain — under-gating is the expensive mistake. Anything touching customer PII or payment data, lacking test coverage, lacking a rollback path, or crossing a system-of-record boundary (ERP, ledger, clinical record, OT controller) escalates at least one tier automatically.

## Patch vs. regenerate: the other axis of every change

Full detail: [02-patch-vs-regenerate.md](02-patch-vs-regenerate.md).

Separately from risk tier, every component-level change is either a **patch** (incremental diff, git history and blame stay intact) or a **regeneration** (treat the component as a disposable build artifact and rebuild it from spec, like infrastructure-as-code redeploying a server instead of patching it). Apply this per component, not per project — most real systems are a mix. Default: patch anything stateful, shared, or high-blast-radius; regenerate only narrow, bounded, spec-complete components — and always re-verify behavior parity before cutover, since a regeneration that compiles is not the same as one that's correct.

## What actually gets deep-dived

Ten practices get a full how-to each, not a one-line mention, because these are the mechanics that make the principles above actually work day to day: [spec-driven development](practices/spec-driven-development.md), [context engineering](practices/context-engineering.md), [plan-then-execute](practices/plan-then-execute.md), [human-in-the-loop gating](practices/human-in-the-loop-gating.md), [evals](practices/evals.md), [prompt/agentic coding tool versioning](practices/prompt-agent-versioning.md), [worktree/sandbox isolation](practices/worktree-sandbox-isolation.md), [multi-agent orchestration](practices/multi-agent-orchestration.md), [tool/function-calling design](practices/tool-function-calling-design.md), [memory/state persistence](practices/memory-state-persistence.md).

## Does any of this actually work? The evidence, not the pitch

Full detail: [05-effort-savings-evidence.md](05-effort-savings-evidence.md).

The gains are real but uneven, and this repo deliberately leads with the caution alongside the upside. Bounded, well-specified, verifiable work — boilerplate, test generation, doc generation, migrations with a clear before/after — sees the strongest and most consistent reported gains (vendor studies: 30–55%). But a 2025 METR randomized controlled trial of experienced open-source developers found they completed real tasks **19% slower** using current AI tools, despite estimating afterward that the tools had made them **~20% faster** — the gap between perceived and measured speed is the finding to take seriously, not just the slowdown itself. Ambiguous, large-context, or unfamiliar-codebase work shows the smallest — or negative — net effect once review and correction time is counted. This is why risk-tiering, spec quality, and context engineering aren't polish; they're what closes the gap between the vendor number and the number you'd actually measure.

## How to know if it's working: metrics

Full detail: [06-metrics.md](06-metrics.md).

Two metric families, and conflating them is the most common measurement mistake:

- **Tool-adoption metrics** (new to this repo) — tool-authored change ratio, override/rejection rate, cycle-time delta segmented by task profile, defect-rate delta by authorship, perceived-vs-measured speed gap. These tell you whether the tooling itself is trustworthy.
- **Standard SDLC/Agile/PM metrics** — velocity, cycle time, lead time, the four DORA metrics, defect density, escaped defect rate, code churn, technical debt ratio, test coverage, sprint predictability, cost per story point, scope creep, review turnaround. These still matter, but several change meaning under agentic adoption (velocity can inflate without proportional value delivered; a shrinking cycle time paired with a growing review queue isn't a real efficiency gain) — the metrics page details what changes for each one.

The one rule that matters most: **always pair an efficiency metric with a quality metric.** A velocity or cycle-time win reported alone is incomplete at best, misleading at worst.

## Picking a tool

Full detail: [07-tools-comparison.md](07-tools-comparison.md).

The comparison page is not trying to crown a winner — it maps current tools (Cursor, Windsurf, Kiro, GitHub Copilot, Cline, Roo Code, Continue.dev, Claude Code, OpenAI Codex CLI, Aider, and others) to deployment model, best fit, strengths, and tradeoffs, sourced and dated because this category moves fast. Pick the tool — and deployment model — for the step you're in, not once for the whole lifecycle.

## Putting it to work

- **Templates** — [spec-template.md](../templates/spec-template.md), [adr-template.md](../templates/adr-template.md), [risk-tier-checklist.md](../templates/risk-tier-checklist.md) in [templates/](../templates/).
- **A worked example** — [examples/spec-before-after.md](../examples/spec-before-after.md) shows a spec that fails the "verifiable done" test next to one that passes it.
- **CI wiring** — [.github/workflows/ci-eval-gate.yml](../.github/workflows/ci-eval-gate.yml) and [.github/PULL_REQUEST_TEMPLATE.md](../.github/PULL_REQUEST_TEMPLATE.md) are the mechanical enforcement of the risk-tier and spec-link rules above — policy that lives in a doc nobody checks isn't policy.
- **Domain mapping** — [domains/domains.md](../domains/domains.md) maps this whole framework across roughly 40 engineering domains (data, API/integration, ERP, game dev, e-commerce, IoT, OT, and more), with the kind of dev involved, example work, and what accelerates or runs autonomously in each.

## A ten-minute path through this repo

If you're reading this once and want the shortest path to the full mental model: this page, then [00-git-workflow-and-automation.md](00-git-workflow-and-automation.md) for how a change actually moves, then [04-governance-risk-tiers.md](04-governance-risk-tiers.md) for how much autonomy it gets, then [06-metrics.md](06-metrics.md) for how you'll know it's working. Everything else is reference material you come back to per task.

## Keeping this current

This repo is a living guide. Principles and governance in `docs/` change only through deliberate review (see [CONTRIBUTING.md](../CONTRIBUTING.md)). Tool names, vendor claims, and domain tooling references go stale fast — check the dated caveats on [07-tools-comparison.md](07-tools-comparison.md) and [domains/domains.md](../domains/domains.md) before treating them as current, and verify effort-savings figures against published sources before using them in planning.
