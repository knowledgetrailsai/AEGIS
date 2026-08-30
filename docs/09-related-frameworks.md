# Related Frameworks: How AEGIS Relates to OASIS, BMAD, AI-DLC, and specs.md

AEGIS isn't the only attempt at a methodology for agentic software delivery. It also isn't standalone by accident — it's designed to work both on its own and as a piece of a larger framework. This page covers both relationships: how AEGIS fits inside [OASIS](https://github.com/knowledgetrailsai/OASIS), and how it compares with three peer frameworks — BMAD-METHOD, AWS's AI-DLC, and specs.md. It names what's shared, what's genuinely different, and which specific ideas were pulled in from each one, so you can see where the borrowing happened instead of having it hidden.

## AEGIS and OASIS

**[OASIS](https://github.com/knowledgetrailsai/OASIS)** stands for Outcome-as-a-Service using Intelligence Systems. It's a broader handbook for enterprise AI transformation: five parts, a six-phase lifecycle (Engage & Align → Discover & Validate → Engineer & Integrate → Activate & Adopt → Operate & Assure → Optimize & Scale), and nine engineering disciplines covering everything from data and knowledge engineering to security, economics, and organizational enablement. It operates at the level of an enterprise transformation program, not at the level of a single codebase.

**AEGIS implements one piece of OASIS**, specifically its "Intelligence and Agent Engineering" discipline (Part 3: Intelligence-System Engineering and Assurance). This is the layer where OASIS's broader lifecycle actually touches source code, git history, and CI. OASIS asks "how does the organization engage, discover, and scale AI-driven outcomes?" AEGIS answers the narrower, concrete question underneath that: once a team is writing code with agentic tools, what's the spec format, what's the risk-tier gate, what's the git flow, and what metric tells you it's working? A team already running full OASIS can drop AEGIS in as the reference implementation of that one discipline. A team with no OASIS program at all can still run AEGIS exactly as written — every principle, phase, and template here works without any OASIS dependency, because AEGIS was built to stand alone first and was mapped onto OASIS's structure afterward, not the other way around.

## The three peer frameworks, briefly

**[BMAD-METHOD](https://github.com/bmad-code-org/BMAD-METHOD)** (open source) organizes work around role-based personas — PM, architect, UX, dev, QA — who collaborate through a four-stage loop: Clarify → Plan → Build & Verify → Learn & Adjust. That loop can be re-entered at whatever scale the change needs. Its central idea is a "right-sized" process: small changes skip heavy planning, and large ones get the full multi-persona treatment. Governance here is implicit — it comes from an audit trail of documented decisions, rather than from a formal tier system.

**[AWS AI-DLC](https://aws.amazon.com/blogs/devops/ai-driven-development-life-cycle)** renames familiar Agile terms — sprints become "Bolts" (which run hours to days), and epics become "Units of Work" — and organizes work into three phases: Mob Elaboration (inception), Mob Construction (build), and Operations. Its signature mechanic is a checkpoint that repeats throughout the process: the AI drafts a plan, asks clarifying questions, and only implements after a human validates it. This applies to every activity, not just major milestones. It's built specifically around Amazon Q Developer, Kiro, and Bedrock.

**[specs.md](https://specs.md/)** offers four "pluggable flows," chosen based on how complex the project is: an Ideation flow (Spark → Flame → Forge — diverge on ideas first, then converge into a brief before writing any formal spec); a Simple flow (spec generation without execution tracking); a FIRE flow (a flexible number of checkpoints, with explicit support for brownfield work — meaning it detects existing codebase conventions before extending them); and a full AI-DLC-flow with Domain-Driven Design and full traceability. It's markdown-based and works across Claude Code, Cursor, Copilot, Windsurf, and Cline.

## What's shared

All four peer frameworks — including the Intelligence and Agent Engineering discipline of OASIS that AEGIS implements — agree on the same core idea: an agentic coding tool proposes, a human decides, and what gets recorded is the decision, not how confident the tool sounded. All of them are tool-agnostic by design, rather than betting on one vendor's product (AI-DLC is a partial exception, since it's built specifically for the AWS stack). All of them also treat "spec first" as a foundation, not an optional extra.

## What stays different about AEGIS

AEGIS is the most explicit of the peer frameworks about how governance actually works mechanically: it uses a 4-tier risk model wired into concrete gates (auto-merge, PR review, named approver, multi-party approval), rather than relying on an implicit audit trail. It also has a dedicated page on git branching, PRs, and merging, with a diagram and a table of what to automate versus what to gate — none of BMAD, AI-DLC, or specs.md go into that level of detail on git mechanics. AEGIS is also more skeptical of the evidence than most: the [effort-savings page](05-effort-savings-evidence.md) leads with a data point that cuts against the usual optimism (the METR study found developers were 19% slower despite feeling 20% faster), instead of only citing gains from vendors. And AEGIS is the only one of the four with a systematic map of engineering domains — roughly 40 of them, from data pipelines to OT (operational technology) — rather than assuming "software delivery" just means conventional application development.

## What AEGIS adopted, and from where

| Adopted idea | Source | Where it landed |
|---|---|---|
| Right-sizing the process to the change, not running one fixed sequence for everything | BMAD's four-stage scalable loop; specs.md's pluggable flows | New practice: [process-scaling.md](practices/process-scaling.md) |
| An explicit ideation/divergence step before formal spec-writing, for genuinely ambiguous or greenfield work | specs.md's Ideation flow (Spark → Flame → Forge) | [requirements-spec.md](03-phases/requirements-spec.md#before-you-start-is-the-request-actually-ready-for-a-spec) and [process-scaling.md](practices/process-scaling.md) |
| Detecting existing codebase conventions before proposing a design or plan, especially in brownfield/monorepo work | specs.md's FIRE flow's brownfield support | [context-engineering.md](practices/context-engineering.md#brownfield-first-detect-before-you-generate) |
| The plan step should surface clarifying questions rather than silently resolving ambiguity | AI-DLC's repeating "plan, ask, validate, implement" checkpoint | [plan-then-execute.md](practices/plan-then-execute.md) |

A couple of ideas were considered and deliberately left out. BMAD's named role-personas (treating PM/architect/dev/QA as separate prompted identities) weren't added as a structural requirement — AEGIS's phase guide already assigns those same responsibilities to phases instead of personas, and adding a persona layer on top would just duplicate that without changing what actually gets checked. AI-DLC's compressed "Bolt" cycle-time vocabulary wasn't adopted either — AEGIS's cycle-time guidance already comes from [06-metrics.md](06-metrics.md), and renaming "sprint" doesn't change the underlying governance question of what's actually safe to move fast on.

## Keeping this current

Like [07-tools-comparison.md](07-tools-comparison.md), this page is a snapshot in time. OASIS and all three peer frameworks are actively evolving, so re-check their current state before treating anything compared here as still accurate.
