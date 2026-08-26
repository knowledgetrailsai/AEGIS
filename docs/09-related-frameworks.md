# Related Frameworks: How AEGIS Relates to OASIS, BMAD, AI-DLC, and specs.md

AEGIS isn't the only attempt at a methodology for agentic software delivery, and it isn't standalone by accident either — it's designed to work both on its own and as a component of a larger framework. This page covers both relationships: how AEGIS sits inside [OASIS](https://github.com/knowledgetrailsai/OASIS), and how it compares with three peer frameworks — BMAD-METHOD, AWS's AI-DLC, and specs.md — naming what's shared, what's genuinely different, and which specific ideas from each were pulled into AEGIS, so the borrowing is visible rather than silent.

## AEGIS and OASIS

**[OASIS](https://github.com/knowledgetrailsai/OASIS)** — Outcome-as-a-Service using Intelligence Systems — is a broader enterprise-AI-transformation handbook: five parts, a six-phase lifecycle (Engage & Align → Discover & Validate → Engineer & Integrate → Activate & Adopt → Operate & Assure → Optimize & Scale), and nine engineering disciplines covering everything from data and knowledge engineering to security, economics, and organizational enablement. It operates at the level of an enterprise transformation program, not at the level of an individual codebase.

**AEGIS implements OASIS's "Intelligence and Agent Engineering" discipline** (Part 3: Intelligence-System Engineering and Assurance) — the layer where OASIS's broader lifecycle actually touches source code, git history, and CI. Where OASIS asks "how does the organization engage, discover, and scale AI-driven outcomes," AEGIS answers the narrower, concrete question underneath it: once a team is writing code with agentic tools, what's the spec format, the risk-tier gate, the git flow, and the metric that tells you it's working. A team running full OASIS can drop AEGIS in as the reference implementation of that one discipline. A team with no OASIS program at all can run AEGIS exactly as written — every principle, phase, and template here holds without any OASIS dependency, since AEGIS was built standalone-first and mapped to OASIS's structure afterward, not the other way around.

## The three peer frameworks, briefly

**[BMAD-METHOD](https://github.com/bmad-code-org/BMAD-METHOD)** (open source) organizes work around role-based personas — PM, architect, UX, dev, QA — collaborating through a four-stage loop: Clarify → Plan → Build & Verify → Learn & Adjust, re-entered at whatever scale the change needs. Its central idea is a "right-sized" process: small changes skip heavy planning, large ones get the full multi-persona treatment. Governance is implicit — an audit trail from documented decisions rather than a formal tier system.

**[AWS AI-DLC](https://aws.amazon.com/blogs/devops/ai-driven-development-life-cycle)** reframes Agile vocabulary — sprints become "Bolts" (hours to days), epics become "Units of Work" — across three phases: Mob Elaboration (inception), Mob Construction (build), and Operations. Its signature mechanic is a repeating checkpoint: the AI drafts a plan, asks clarifying questions, and implements only after human validation — applied to every activity, not just major milestones. It's built specifically around Amazon Q Developer, Kiro, and Bedrock.

**[specs.md](https://specs.md/)** offers four "pluggable flows" selected by project complexity: an Ideation flow (Spark → Flame → Forge — diverge on ideas, then converge into a brief before any formal spec), a Simple flow (spec generation without execution tracking), a FIRE flow (adaptive checkpoint count, with explicit first-class support for brownfield work — detecting existing codebase conventions before extending them), and a full AI-DLC-flow with Domain-Driven Design and full traceability. It's markdown-based and tool-agnostic across Claude Code, Cursor, Copilot, Windsurf, and Cline.

## What's shared

All four peer frameworks — and OASIS's Intelligence and Agent Engineering discipline that AEGIS implements — agree on the same core bet: an agentic coding tool proposes, a human decides, and the decision, not the tool's confidence, is what gets recorded. All are tool-agnostic by design rather than betting on one vendor's product (AI-DLC is the partial exception, being AWS-stack-native). All treat "spec first" as foundational rather than optional.

## What stays different about AEGIS

AEGIS remains the most explicit of the peer frameworks about governance *mechanics*: a 4-tier risk model wired into concrete gates (auto-merge, PR review, named approver, multi-party approval) rather than an implicit audit trail, plus a dedicated git branching/PR/merge page with a diagram and an automate-vs-gate table — none of BMAD, AI-DLC, or specs.md prescribe git mechanics to that level of detail. It's also the most evidence-skeptical: the [effort-savings page](05-effort-savings-evidence.md) leads with a countervailing data point (the METR RCT finding developers 19% slower despite feeling 20% faster) rather than only citing vendor gains. And it's the only one with a systematic domain map — roughly 40 engineering domains from data pipelines to OT — rather than treating "software delivery" as implicitly meaning conventional application development.

## What AEGIS adopted, and from where

| Adopted idea | Source | Where it landed |
|---|---|---|
| Right-sizing the process to the change, not running one fixed sequence for everything | BMAD's four-stage scalable loop; specs.md's pluggable flows | New practice: [process-scaling.md](practices/process-scaling.md) |
| An explicit ideation/divergence step before formal spec-writing, for genuinely ambiguous or greenfield work | specs.md's Ideation flow (Spark → Flame → Forge) | [requirements-spec.md](03-phases/requirements-spec.md#before-you-start-is-the-request-actually-ready-for-a-spec) and [process-scaling.md](practices/process-scaling.md) |
| Detecting existing codebase conventions before proposing a design or plan, especially in brownfield/monorepo work | specs.md's FIRE flow's brownfield support | [context-engineering.md](practices/context-engineering.md#brownfield-first-detect-before-you-generate) |
| The plan step should surface clarifying questions rather than silently resolving ambiguity | AI-DLC's repeating "plan, ask, validate, implement" checkpoint | [plan-then-execute.md](practices/plan-then-execute.md) |

Ideas considered and deliberately not adopted: BMAD's named role-personas (PM/architect/dev/QA as distinct prompted identities) weren't folded in as a structural requirement — AEGIS's phase guide already assigns the equivalent responsibilities to phases rather than personas, and adding a persona layer on top would duplicate that without changing what actually gets checked. AI-DLC's compressed "Bolt" cycle-time vocabulary wasn't adopted either — AEGIS's cycle-time guidance already comes from [06-metrics.md](06-metrics.md) and re-branding sprint length doesn't change the underlying governance question of what's safe to move fast on.

## Keeping this current

Like [07-tools-comparison.md](07-tools-comparison.md), this page is a snapshot — OASIS and all three peer frameworks are actively evolving. Re-check their current state before treating a comparison point here as still accurate.
