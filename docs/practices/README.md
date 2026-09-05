# Practices: The Eleven Deep Dives

Eleven short, focused pages, each covering one practice you can adopt independently — pick what your team needs, skip the rest. Grouped below by when each one matters most.

## Before you start a change

| Practice | What it is |
|---|---|
| [Spec-Driven Development](spec-driven-development.md) | Write the spec first; the tool implements and is graded against it, not the conversation that produced it |
| [Plan-Then-Execute](plan-then-execute.md) | The tool proposes a plan before touching anything; a human approves or edits it first |
| [Process Scaling](process-scaling.md) | Match how much ceremony a change gets to how much it actually needs |

## While the tool is working

| Practice | What it is |
|---|---|
| [Context Engineering](context-engineering.md) | Deliberately curate what the tool can see, instead of leaving it to chance |
| [Tool / Function-Calling Design](tool-function-calling-design.md) | Design the tool's own tools — names, schemas, error messages — like API design |
| [Multi-Agent Orchestration](multi-agent-orchestration.md) | Split a task across sub-agents (planner, coder, reviewer, verifier) instead of one tool doing everything |
| [Worktree / Sandbox Isolation](worktree-sandbox-isolation.md) | Run each tool in its own git worktree or container so parallel runs don't collide |
| [Memory / State Persistence](memory-state-persistence.md) | Persist only the facts the tool will actually need again |

## Keeping it safe and improving it over time

| Practice | What it is |
|---|---|
| [Human-in-the-Loop Gating](human-in-the-loop-gating.md) | Require human confirmation at explicit checkpoints before irreversible actions |
| [Evals](evals.md) | Test suites for tool *behavior*, run in CI, gating changes before they ship |
| [Prompt & Agentic Coding Tool Versioning](prompt-agent-versioning.md) | Version, diff, and review prompts and tool configs the same way you review code |

## How to use this

You don't need all eleven on day one. Start with Spec-Driven Development and Human-in-the-Loop Gating (they carry most of the risk reduction) then add the rest as your usage grows. Each page is self-contained: what it is, why it exists, when to use it, and how to apply it.
