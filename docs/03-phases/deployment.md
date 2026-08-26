# Phase: Deployment & Release

> Deep dive: [human-in-the-loop gating](../practices/human-in-the-loop-gating.md)

## What this phase does

This phase moves the change into production. The job is to make safe releases repeatable and risky releases gated.

## Method

1. Confirm tests and evals are green.
2. Check migration safety and rollback options.
3. Decide whether the release is Tier 1, 2, 3, or 4.
4. Require human approval for irreversible or high-blast-radius actions.
5. Release only after the gate is satisfied.

## Tool support

- Use GitHub Copilot app / agents, Claude Code, or Kiro to draft release notes, version bumps, and rollback steps.
- Use the agentic coding tool to prepare the deploy checklist.
- Use human approval to trigger the actual release when the action is irreversible or high risk.

## Best practices

- Keep deploy triggers behind an approval gate.
- Let agentic coding tools draft changelogs, version bumps, and branch updates.
- Test rollback as part of the release process.
- Treat schema, financial, and physical control changes as high risk.
- Use the governance doc to set the approval level.
- Let the agentic coding tool prepare the release, but do not let it bypass the gate.

## Common mistakes

- Letting an agentic coding tool deploy with standing production access
- Assuming a previous successful deploy proves this one is safe
- Skipping rollback validation
- Treating release automation as a substitute for review
