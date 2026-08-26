# Practice: Human-in-the-Loop Gating

Explicit checkpoints where irreversible actions require human confirmation even if the agentic coding tool is otherwise autonomous. Distinguishes "tool recommends" from "tool executes."

## Why it exists

Autonomy and risk should scale together. A gate isn't a statement of distrust in the tool's judgment — it's an acknowledgment that some mistakes are cheap to make and others aren't, and the review investment should match that asymmetry.

## How to do it

1. **Classify every tool-capable action into a risk tier** before deciding whether it needs a gate — see [governance-risk-tiers.md](../04-governance-risk-tiers.md) for the full rubric.
2. **Put the gate at the point of irreversibility, not earlier.** Gating too early (e.g., requiring approval on every intermediate tool step) creates review fatigue that leads to rubber-stamping; gating too late means the damage is already done.
3. **Name a specific approver for Tier 3–4 actions** — "someone will review it" without an owner means no one does.
4. **Make the gate mechanical, not procedural.** Wire it into CI required-reviewers, deploy pipeline approval steps, or PR merge rules — a policy doc that says "get approval" without tooling enforcement gets skipped under deadline pressure.

## Common failure modes

- Standing credentials that let an agentic coding tool bypass the gate entirely for "routine" actions of a type that's actually Tier 3–4 (e.g., a scheduled agentic coding tool with prod deploy rights and no per-action check).
- Approval fatigue from over-gating Tier 1 actions, which trains reviewers to click approve without reading — the exact failure mode a good gate is supposed to prevent.
- No escalation path when a gated action is genuinely time-sensitive — teams route around the gate instead of fixing the process, which defeats it.

## Signal you're doing this right

Gates are rare enough that each one gets real scrutiny, and the escalation-trigger list (see [governance-risk-tiers.md](../04-governance-risk-tiers.md)) — PII, no test coverage, no rollback, crosses a system-of-record boundary — reliably catches the cases that matter.
