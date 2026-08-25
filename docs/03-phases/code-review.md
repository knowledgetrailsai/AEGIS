# Phase: Code Review

## What this phase does

Code review decides whether the change should merge. For agent-assisted work, the review should match the risk, not the habit.

## Method

1. Classify the change into a risk tier.
2. Review the spec, implementation, and tests together.
3. Check whether the change matches the stated scope.
4. Confirm the rollback path if the change is risky.
5. Record the result clearly in the PR.

## Tool support

- Use GitHub Copilot app / agents or Cursor to summarize diffs, flag risky changes, and restate the spec.
- Use the agent to surface review notes and missing checks.
- Use a human reviewer for the final decision on Tier 2+ work.

## Best practices

- Use [governance](../04-governance-risk-tiers.md) to set review depth.
- Require the PR to state the risk tier explicitly.
- Use a named human reviewer for Tier 3 and Tier 4 work.
- Track override or rejection rate by workflow.
- Treat a high override rate as a spec or context problem first.
- Let the agent pre-review the change, then have the human confirm the result.

## Common mistakes

- Reviewing every change the same way
- Trusting the agent’s self-assessment of risk
- Accepting a change because it “looks fine”
- Ignoring repeated review churn
