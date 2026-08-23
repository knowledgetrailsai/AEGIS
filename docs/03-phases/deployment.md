# Phase: Deployment & Release

> Full deep-dive: [docs/practices/human-in-the-loop-gating.md](../practices/human-in-the-loop-gating.md)

## How to

1. Run a deploy checklist gate before any agent-initiated release: CI status green, migration safety reviewed, rollback plan documented and tested.
2. Irreversible production actions (schema migrations, force-pushes, financial postings, physical/OT actuation) require an explicit human approval step — no exceptions, regardless of how routine the agent judges the action to be. This is Tier 3–4 by definition; see [governance](../04-governance-risk-tiers.md).
3. Let agents draft changelogs and manage version bumps/branching (low risk, high mechanical value) — but keep the actual deploy trigger behind the same gate as any other Tier 3–4 action.

## Anti-patterns

- An agent with standing credentials to push to production without a per-action approval step.
- Treating "the agent has done this deploy type before successfully" as a substitute for verifying rollback still works.
