# Phase: Production Support & Maintenance

> Related deep-dives: [human-in-the-loop gating](../practices/human-in-the-loop-gating.md), [multi-agent orchestration](../practices/multi-agent-orchestration.md), [memory/state persistence](../practices/memory-state-persistence.md)

## How to

1. Let agents triage first: correlate logs/metrics, draft a root-cause hypothesis, propose — not execute — a runbook action.
2. Gate remediation execution by blast radius: restart-a-pod-level actions can be autonomous; anything touching customer data or money needs sign-off.
3. Run periodic agent-assisted tech-debt scans, but let humans set remediation priority against business context the agent doesn't have.
4. Apply the [patch-vs-regenerate rubric](../02-patch-vs-regenerate.md) to legacy modernization work — most legacy systems are patch-territory by default (high history value, incomplete specs).

## Anti-patterns

- An on-call agent with autonomous remediation rights on anything beyond Tier 1–2 actions.
- Tech-debt backlogs generated but never prioritized against real business context — becomes noise instead of a queue.
