# Agile Work Loop

This guide uses a simple agile flow to organize end-to-end tool-supported work:

- requirements are drafted with tool assistance to capture the need and scope
- architecture is outlined with tool assistance to set the overall shape and boundaries
- backlog items are created and ordered with tool assistance
- features group related backlog items with tool assistance
- each feature is refined into a small, testable slice with tool assistance
- the slice moves through spec, design, build, review, test, release, and support with tool assistance

## Tool support

Use the tools in this repo to support the workflow end to end. The workflow itself stays the same; the agentic coding tool just helps carry it out. Each tool below is labeled with its deployment model (standalone IDE / IDE plugin / CLI / cloud — see [docs/07-tools-comparison.md](07-tools-comparison.md#deployment-models--the-distinction-this-repos-earlier-docs-glossed-over)), because the model changes *how* the tool fits into a given step, not just which brand you're using.

| Workflow step | Useful tools (deployment model) | Tool output |
|---|---|---|
| Requirements | Claude Code (CLI), Cursor (standalone IDE), Kiro (standalone IDE/CLI/web), OpenAI Codex CLI (CLI), GitHub Copilot / Cline / Continue.dev (IDE plugin) | Draft requirement notes, constraints, and acceptance criteria |
| Architecture | Cursor (standalone IDE), Claude Code (CLI), Kiro (standalone IDE), Windsurf (standalone IDE) | Compare options, boundaries, and risk before the ADR |
| Backlog and feature slicing | GitHub Copilot app / agents (cloud), Kiro (standalone IDE), Cursor (standalone IDE) | Split epics into ordered backlog items and slices |
| Spec writing | Claude Code (CLI), Cursor (standalone IDE), Kiro (standalone IDE) | Turn the slice into a testable contract |
| Development | Claude Code (CLI), Cursor (standalone IDE), OpenAI Codex CLI (CLI), Windsurf (standalone IDE), GitHub Copilot / Cline / Roo Code / Continue.dev (IDE plugin) | Produce implementation, tests, and supporting diffs |
| Review | GitHub Copilot app / agents (cloud), Cursor (standalone IDE) | Summarize diff risk, scope mismatch, missing checks |
| Testing and QA | Claude Code (CLI), Cursor (standalone IDE), GitHub Copilot app / agents (cloud) | Generate tests, evals, and coverage gaps |
| Deployment and release | GitHub Copilot app / agents (cloud), Claude Code (CLI, CI-wired), Kiro (standalone IDE) | Draft release notes, rollback steps, release checklists |
| Production support | Claude Code (CLI), Cursor (standalone IDE), GitHub Copilot app / agents (cloud), Kiro (standalone IDE) | Summarize incidents, propose root cause, draft runbook steps |

**Verification note:** Cline, Roo Code, Continue.dev, and Amazon Q Developer appear in this table as IDE-plugin options. As noted in [07-tools-comparison.md](07-tools-comparison.md#sources-checked), these four (along with Tabnine, Sourcegraph Cody/Amp, and Aider) were **not individually re-checked** against primary vendor sources. Confirm current capabilities directly with each vendor before relying on their inclusion here for an adoption decision. Claude Code, Cursor, Kiro, Windsurf, and GitHub Copilot were checked directly against vendor docs — see that page's sources list for dates.

**Why the deployment model matters for each step:** interactive, exploratory steps (requirements, architecture, development) tend to work best with standalone IDEs and IDE plugins, where a person is driving alongside the agentic coding tool in real time. Steps that need to run unattended or as part of a pipeline (CI-gated testing, scheduled release-checklist generation, scheduled production-support triage) need a CLI or cloud agentic coding tool that doesn't require someone sitting at an editor. A team relying only on an IDE plugin has no way to run the CI-gated eval step in [ci-eval-gate.yml](../.github/workflows/ci-eval-gate.yml); that step needs a CLI or cloud-executable agentic coding tool to work at all.

## Core terms

| Term | Meaning in this guide |
|---|---|
| Requirements | The problem, goals, constraints, and non-goals that define the need |
| Architecture | The high-level system shape, boundaries, and key decisions |
| Backlog | The ordered list of work that may be done next |
| Feature | A user- or system-visible outcome made up of one or more backlog items |
| Epic | A larger body of work that contains multiple features |
| Slice | A small unit of work that can be specified, built, tested, and reviewed cleanly |
| Sprint | A short planning window used to select and finish a slice of backlog work |
| Definition of Done | The checks required before work is considered complete |

## How to run it

1. Write the requirements first, with the agentic coding tool helping capture scope, constraints, and non-goals.
2. Set the overall architecture before breaking the work into tasks, with the agentic coding tool helping draft boundaries and options.
3. Put the work into the backlog, with the agentic coding tool helping organize and label items.
4. Group related backlog items into a feature or epic, with the agentic coding tool helping identify the slice.
5. Refine the item until it is small enough to finish in one pass, with the agentic coding tool helping break it down.
6. Write the spec before implementation, with the agentic coding tool helping draft the testable contract.
7. Use the phase guide for design, development, review, testing, release, and support, with the agentic coding tool helping in each phase.
8. Mark the item done only when the definition of done is met.

## Backlog rules

- The backlog should be ordered.
- Higher items should be clearer and more ready to work on.
- Each item should state the goal, scope, acceptance criteria, and risk.
- Items that are too large should be split before implementation starts.
- Backlog items should trace back to requirements and architecture decisions.

## Feature rules

- A feature should represent a visible outcome, not a vague wish.
- Each feature should have one owner and a clear status.
- A feature can contain multiple backlog items, but each item still needs its own spec.
- Features should be reviewable in small slices.
- Features should fit the current architecture or justify an architecture change first.

## Best practices

- Start with requirements and architecture before backlog refinement.
- Keep the backlog small enough to review regularly.
- Use feature names that describe outcomes, not implementation detail.
- Break work into slices that fit one clear review cycle.
- Use the spec template for each slice.
- Track status with simple states such as `backlog`, `ready`, `in progress`, `review`, `done`.
- Use the comparison page to pick the right agentic coding tool (and deployment model) for the current step.
- Keep the tool choice aligned with the workflow step, the risk tier, and whether the step needs to run unattended (favor CLI/cloud) or interactively (favor standalone IDE/plugin).
- Treat the agentic coding tool as part of the delivery team throughout the lifecycle, not as a one-off code generator.
- Don't assume one deployment model covers the whole lifecycle. Most real teams mix an IDE plugin or standalone IDE for interactive work with a CLI tool for anything CI-gated or scheduled.

## Common mistakes

- Skipping requirements and jumping straight to tasks
- Skipping architecture and letting the backlog define the system shape
- Treating the backlog as a dumping ground
- Starting implementation before the item is refined
- Making feature items too large to verify
- Using sprint language without actually selecting a finite set of work
- Using one tool for every step just because it is familiar
- Letting the tool choice override the workflow sequence
- Dropping the agentic coding tool after implementation and only using it for code generation
- Assuming an IDE plugin or standalone IDE can fill a CI-gated or headless automation role it structurally can't

## Simple flow

`requirements -> architecture -> backlog -> feature -> refined slice -> spec -> design -> development -> review -> testing -> release -> done`
