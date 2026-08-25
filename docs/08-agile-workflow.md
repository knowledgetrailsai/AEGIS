# Agile Work Loop

This guide uses a simple agile flow to organize agent-assisted work:

- requirements capture the need and scope
- architecture sets the overall shape and boundaries
- backlog items capture the ordered work
- features group related backlog items
- each feature is refined into a small, testable slice
- the slice moves through spec, design, build, review, test, and release

## Tool support

Use the tools in this repo as helpers for the workflow, not as a replacement for the workflow itself.

| Workflow step | Useful tools |
|---|---|
| Requirements | Claude Code, Cursor, Kiro, OpenAI Codex CLI |
| Architecture | Cursor, Claude Code, Kiro, Windsurf |
| Backlog and feature slicing | GitHub Copilot app / agents, Kiro, Cursor |
| Spec writing | Claude Code, Cursor, Kiro |
| Development | Claude Code, Cursor, OpenAI Codex CLI, Windsurf |
| Review | GitHub Copilot app / agents, Cursor |
| Testing and QA | Claude Code, Cursor, GitHub Copilot app / agents |
| Deployment and release | GitHub Copilot app / agents, Claude Code, Kiro |
| Production support | Claude Code, Cursor, GitHub Copilot app / agents, Kiro |

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

1. Write the requirements first.
2. Set the overall architecture before breaking the work into tasks.
3. Put the work into the backlog.
4. Group related backlog items into a feature or epic.
5. Refine the item until it is small enough to finish in one pass.
6. Write the spec before implementation.
7. Use the phase guide for design, development, review, testing, and release.
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

## Common mistakes

- Skipping requirements and jumping straight to tasks
- Skipping architecture and letting the backlog define the system shape
- Treating the backlog as a dumping ground
- Starting implementation before the item is refined
- Making feature items too large to verify
- Using sprint language without actually selecting a finite set of work
- Using one tool for every step just because it is familiar
- Letting the tool choice override the workflow sequence

## Simple flow

`requirements -> architecture -> backlog -> feature -> refined slice -> spec -> design -> development -> review -> testing -> release -> done`
