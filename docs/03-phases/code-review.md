# Phase: Code Review

## How to

1. Classify every agent-generated change into a risk tier ([governance](../04-governance-risk-tiers.md)) and route review effort accordingly — Tier 1 gets lightweight automated review, Tier 3–4 always gets a named human reviewer regardless of agent confidence.
2. Track an override/rejection rate per agent workflow. A persistently high rate means the spec or context feeding that agent needs fixing, not the review process.
3. Require the PR to state the risk tier explicitly (see [PULL_REQUEST_TEMPLATE.md](../../.github/PULL_REQUEST_TEMPLATE.md)) so reviewers aren't guessing how much scrutiny a change needs.

## Anti-patterns

- Uniform review depth regardless of risk — wastes reviewer time on Tier 1 changes, under-reviews Tier 3–4 ones.
- "The agent said it's low risk" accepted without a human classifying the tier independently.
