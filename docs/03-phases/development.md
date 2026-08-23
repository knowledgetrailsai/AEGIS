# Phase: Development

> Deep-dives: [plan-then-execute](../practices/plan-then-execute.md), [context engineering](../practices/context-engineering.md), [worktree/sandbox isolation](../practices/worktree-sandbox-isolation.md), [prompt/agent versioning](../practices/prompt-agent-versioning.md), [tool/function-calling design](../practices/tool-function-calling-design.md)

## How to

1. Use plan-then-execute: the agent proposes a plan, a human approves it, only then does execution start. Reserve unreviewed autonomous execution for Tier 1 code paths (see [governance](../04-governance-risk-tiers.md)).
2. Isolate agent work in worktrees/sandboxes so parallel agents — or an agent and a human — never collide on the same branch.
3. Maintain a repo-level context file (CLAUDE.md / AGENTS.md-style) with conventions, an architecture map, and do's/don'ts. Assign an owner and a review cadence — a stale context file actively misleads agents.
4. Version prompts and agent configs like code: diffed, reviewed, rollback-able.

## Anti-patterns

- Letting an agent execute a multi-file, cross-module change with no plan review step, "because it's usually right."
- A context file nobody owns, written once at project kickoff and never updated as the architecture drifts.
- Treating a prompt/config change as a "just try it" edit instead of a reviewed change with a rollback path.
