# Phase: Production Support & Maintenance

> Related deep dives: [human-in-the-loop gating](../practices/human-in-the-loop-gating.md), [multi-agent orchestration](../practices/multi-agent-orchestration.md), [memory/state persistence](../practices/memory-state-persistence.md)

## What this phase does

This phase keeps the system healthy after release. The agent can help with triage and proposals, but risky actions should stay gated.

## Method

1. Triage the issue using logs, metrics, traces, and recent changes.
2. Ask the agent for a root-cause hypothesis.
3. Have the agent propose a runbook action before it executes anything.
4. Gate remediation by blast radius.
5. Prioritize technical debt with human business context.

## Tool support

- Use Claude Code, Cursor, GitHub Copilot app / agents, or Kiro to summarize incidents and propose root causes.
- Use a second agent or human reviewer to challenge the first hypothesis when the incident is high risk.
- Use the agent to draft runbook steps, then let the human choose the action.

## Best practices

- Let agents handle the first pass on incident triage.
- Keep remediation autonomy limited to low-risk actions.
- Use the patch-vs-regenerate rule for modernization work.
- Review recurring incidents for patterns, not just individual fixes.
- Keep ownership clear for maintenance decisions.
- Keep the agent in the triage loop, not the final authority loop.

## Common mistakes

- Giving on-call agents broad remediation rights
- Letting tech-debt reports pile up without prioritization
- Executing a runbook step automatically when the blast radius is unclear
- Treating one incident as proof the system is healthy
