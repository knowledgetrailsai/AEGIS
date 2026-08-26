# Phase: Development

> Deep dives: [plan-then-execute](../practices/plan-then-execute.md), [context engineering](../practices/context-engineering.md), [worktree/sandbox isolation](../practices/worktree-sandbox-isolation.md), [prompt/agentic coding tool versioning](../practices/prompt-agent-versioning.md), [tool/function-calling design](../practices/tool-function-calling-design.md)

## What this phase does

This phase is where the change gets built. The main goal is to keep the agentic coding tool productive without letting it drift outside the agreed scope.

## Method

1. Start from the spec and design.
2. Have the agentic coding tool propose a plan before execution.
3. Give the agentic coding tool only the context it needs.
4. Work in an isolated branch, worktree, or sandbox.
5. Keep prompts and tool configs versioned like code.

## Tool support

- Use Claude Code, Cursor, OpenAI Codex CLI, or Windsurf for local implementation work.
- Use GitHub Copilot app / agents when the work is best orchestrated through branches and PRs.
- Use the agentic coding tool to draft the plan, edit the files, and generate supporting tests.
- Use worktree isolation so parallel tool tasks do not collide.

## Best practices

- Use plan-then-execute for anything beyond simple Tier 1 work.
- Keep a repo context file with conventions, architecture notes, and do's and don'ts.
- Give that context file an owner and a review cadence.
- Keep tool work isolated so parallel tasks do not collide.
- Treat prompt and config changes like reviewed code changes.
- Ask the agentic coding tool to summarize the diff before review.

## Common mistakes

- Starting implementation before the plan is reviewed
- Giving the agentic coding tool too much repo context
- Letting context files drift out of date
- Changing prompts without review or rollback
