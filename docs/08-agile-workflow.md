# Agile Work Loop

This guide uses a simple agile flow to organize end-to-end agent-supported work:

- requirements are drafted with agent help to capture the need and scope
- architecture is outlined with agent help to set the overall shape and boundaries
- backlog items are created and ordered with agent help
- features group related backlog items with agent help
- each feature is refined into a small, testable slice with agent help
- the slice moves through spec, design, build, review, test, release, and support with agent help

## Tool support

Use the tools in this repo to support the workflow end to end. The workflow stays the same; the agent helps carry it out.

| Workflow step | Useful tools | Agent output |
|---|---|---|
| Requirements | Claude Code, Cursor, Kiro, OpenAI Codex CLI | Draft requirement notes, constraints, and acceptance criteria |
| Architecture | Cursor, Claude Code, Kiro, Windsurf | Compare options, boundaries, and risk before the ADR |
| Backlog and feature slicing | GitHub Copilot app / agents, Kiro, Cursor | Split epics into ordered backlog items and slices |
| Spec writing | Claude Code, Cursor, Kiro | Turn the slice into a testable contract |
| Development | Claude Code, Cursor, OpenAI Codex CLI, Windsurf | Produce implementation, tests, and supporting diffs |
| Review | GitHub Copilot app / agents, Cursor | Summarize diff risk, scope mismatch, missing checks |
| Testing and QA | Claude Code, Cursor, GitHub Copilot app / agents | Generate tests, evals, and coverage gaps |
| Deployment and release | GitHub Copilot app / agents, Claude Code, Kiro | Draft release notes, rollback steps, release checklists |
| Production support | Claude Code, Cursor, GitHub Copilot app / agents, Kiro | Summarize incidents, propose root cause, draft runbook steps |

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

1. Write the requirements first, with the agent helping capture scope, constraints, and non-goals.
2. Set the overall architecture before breaking the work into tasks, with the agent helping draft boundaries and options.
3. Put the work into the backlog, with the agent helping organize and label items.
4. Group related backlog items into a feature or epic, with the agent helping identify the slice.
5. Refine the item until it is small enough to finish in one pass, with the agent helping break it down.
6. Write the spec before implementation, with the agent helping draft the testable contract.
7. Use the phase guide for design, development, review, testing, release, and support, with the agent helping in each phase.
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
- Use the comparison page to pick the right agent tool for the current step.
- Keep the tool choice aligned with the workflow step and the risk tier.
- Treat the agent as part of the delivery team throughout the lifecycle, not as a one-off code generator.

## Common mistakes

- Skipping requirements and jumping straight to tasks
- Skipping architecture and letting the backlog define the system shape
- Treating the backlog as a dumping ground
- Starting implementation before the item is refined
- Making feature items too large to verify
- Using sprint language without actually selecting a finite set of work
- Using one tool for every step just because it is familiar
- Letting the tool choice override the workflow sequence
- Dropping the agent after implementation and only using it for code generation

## Simple flow

`requirements -> architecture -> backlog -> feature -> refined slice -> spec -> design -> development -> review -> testing -> release -> done`
