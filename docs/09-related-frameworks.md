# Related Frameworks: What This Repo Shares, Differs On, and Adopted

This repo isn't the only attempt at a methodology for agentic software delivery. Three others worth knowing about — BMAD-METHOD, AWS's AI-DLC, and specs.md — overlap with this guide in places and diverge in others. This page names what's shared, what's genuinely different, and which specific ideas from each one were pulled into this repo, so the borrowing is visible rather than silent.

## The three frameworks, briefly

**[BMAD-METHOD](https://github.com/bmad-code-org/BMAD-METHOD)** (open source) organizes work around role-based personas — PM, architect, UX, dev, QA — collaborating through a four-stage loop: Clarify → Plan → Build & Verify → Learn & Adjust, re-entered at whatever scale the change needs. Its central idea is a "right-sized" process: small changes skip heavy planning, large ones get the full multi-persona treatment. Governance is implicit — an audit trail from documented decisions rather than a formal tier system.

**[AWS AI-DLC](https://aws.amazon.com/blogs/devops/ai-driven-development-life-cycle)** reframes Agile vocabulary — sprints become "Bolts" (hours to days), epics become "Units of Work" — across three phases: Mob Elaboration (inception), Mob Construction (build), and Operations. Its signature mechanic is a repeating checkpoint: the AI drafts a plan, asks clarifying questions, and implements only after human validation — applied to every activity, not just major milestones. It's built specifically around Amazon Q Developer, Kiro, and Bedrock.

**[specs.md](https://specs.md/)** offers four "pluggable flows" selected by project complexity: an Ideation flow (Spark → Flame → Forge — diverge on ideas, then converge into a brief before any formal spec), a Simple flow (spec generation without execution tracking), a FIRE flow (adaptive checkpoint count, with explicit first-class support for brownfield work — detecting existing codebase conventions before extending them), and a full AI-DLC-flow with Domain-Driven Design and full traceability. It's markdown-based and tool-agnostic across Claude Code, Cursor, Copilot, Windsurf, and Cline.

## What's shared with this repo

All four frameworks agree on the same core bet: an agentic coding tool proposes, a human decides, and the decision — not the tool's confidence — is what gets recorded. All four are tool-agnostic by design rather than betting on one vendor's product (AI-DLC is the partial exception, being AWS-stack-native). All four treat "spec first" as foundational rather than optional.

## What stays different here

This repo remains the most explicit of the four about governance *mechanics*: a 4-tier risk model wired into concrete gates (auto-merge, PR review, named approver, multi-party approval) rather than an implicit audit trail, plus a dedicated git branching/PR/merge page with a diagram and an automate-vs-gate table — none of the three above prescribe git mechanics to that level of detail. It's also the most evidence-skeptical: the [effort-savings page](05-effort-savings-evidence.md) leads with a countervailing data point (the METR RCT finding developers 19% slower despite feeling 20% faster) rather than only citing vendor gains. And it's the only one of the four with a systematic domain map — roughly 40 engineering domains from data pipelines to OT — rather than treating "software delivery" as implicitly meaning conventional application development.

## What this repo adopted, and from where

| Adopted idea | Source | Where it landed |
|---|---|---|
| Right-sizing the process to the change, not running one fixed sequence for everything | BMAD's four-stage scalable loop; specs.md's pluggable flows | New practice: [process-scaling.md](practices/process-scaling.md) |
| An explicit ideation/divergence step before formal spec-writing, for genuinely ambiguous or greenfield work | specs.md's Ideation flow (Spark → Flame → Forge) | [requirements-spec.md](03-phases/requirements-spec.md#before-you-start-is-the-request-actually-ready-for-a-spec) and [process-scaling.md](practices/process-scaling.md) |
| Detecting existing codebase conventions before proposing a design or plan, especially in brownfield/monorepo work | specs.md's FIRE flow's brownfield support | [context-engineering.md](practices/context-engineering.md#brownfield-first-detect-before-you-generate) |
| The plan step should surface clarifying questions rather than silently resolving ambiguity | AI-DLC's repeating "plan, ask, validate, implement" checkpoint | [plan-then-execute.md](practices/plan-then-execute.md) |

Ideas considered and deliberately not adopted: BMAD's named role-personas (PM/architect/dev/QA as distinct prompted identities) weren't folded in as a structural requirement — this repo's phase guide already assigns the equivalent responsibilities to phases rather than personas, and adding a persona layer on top would duplicate that without changing what actually gets checked. AI-DLC's compressed "Bolt" cycle-time vocabulary wasn't adopted either — this repo's cycle-time guidance already comes from [06-metrics.md](06-metrics.md) and re-branding sprint length doesn't change the underlying governance question of what's safe to move fast on.

## Keeping this current

Like [07-tools-comparison.md](07-tools-comparison.md), this page is a snapshot — all three frameworks are actively evolving. Re-check their current state before treating a comparison point here as still accurate.
