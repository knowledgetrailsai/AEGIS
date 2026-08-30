# Phase: Production Support & Maintenance

> Related deep dives: [human-in-the-loop gating](../practices/human-in-the-loop-gating.md), [multi-agent orchestration](../practices/multi-agent-orchestration.md), [memory/state persistence](../practices/memory-state-persistence.md)

## What this phase does

This phase keeps the system healthy after release. The agentic coding tool can help with triage (sorting and prioritizing issues) and with proposing fixes. But risky actions should stay gated, meaning a human needs to approve them first.

## Method

1. Triage the issue using logs, metrics, traces, and recent changes.
2. Ask the agentic coding tool for a root-cause hypothesis.
3. Have the agentic coding tool propose a runbook (a documented set of response steps) action before it executes anything.
4. Gate remediation (the fix itself) by blast radius (how much damage a mistake could cause).
5. Prioritize technical debt with human business context.

## Tool support

- Use Claude Code, Cursor, GitHub Copilot app / agents, or Kiro to summarize incidents and propose root causes.
- Use a second tool or human reviewer to challenge the first hypothesis when the incident is high risk.
- Use the agentic coding tool to draft runbook steps, then let the human choose the action.

## Best practices

- Let agentic coding tools handle the first pass on incident triage.
- Keep remediation autonomy limited to low-risk actions.
- Use the patch-vs-regenerate rule for modernization work.
- Review recurring incidents for patterns, not just individual fixes.
- Keep ownership clear for maintenance decisions.
- Keep the agentic coding tool in the triage loop. It should help sort and assess issues, but it should not have the final say.

## Common mistakes

- Giving on-call tools broad remediation rights
- Letting tech-debt reports pile up without prioritization
- Executing a runbook step automatically when the blast radius is unclear
- Treating one incident as proof the system is healthy
