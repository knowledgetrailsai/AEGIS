# Practice: Human-in-the-Loop Gating

A gate is an explicit checkpoint: before an irreversible action happens, a human has to confirm it, even if the agentic coding tool is otherwise working autonomously. Gating is what separates a tool that recommends an action from a tool that executes one.

## Why it exists

Autonomy and risk should scale together. A gate isn't there because you distrust the tool's judgment. It exists because some mistakes are cheap to make and others aren't, and how much you review should match that difference.

## How to do it

1. **Classify every action the tool can take into a risk tier** before deciding whether it needs a gate. See [governance-risk-tiers.md](../04-governance-risk-tiers.md) for the full rubric.
2. **Put the gate at the point where the action becomes irreversible, not earlier.** Gating too early, like requiring approval on every intermediate tool step, causes review fatigue, and tired reviewers start rubber-stamping. Gating too late means the damage already happened by the time anyone looks.
3. **Name a specific approver for Tier 3 and Tier 4 actions.** "Someone will review it," with no name attached, usually means no one does.
4. **Make the gate mechanical, not just a written policy.** Build it into CI required-reviewers settings, deploy pipeline approval steps, or PR merge rules. A policy doc that just says "get approval," with no tooling behind it, gets skipped the first time there's a deadline.

## Common failure modes

- Standing credentials that let an agentic coding tool skip the gate entirely for actions labeled "routine" that are actually Tier 3 or Tier 4. An example: a scheduled tool with production deploy rights and no per-action check.
- Approval fatigue from gating too many Tier 1 (low-risk) actions, which trains reviewers to click approve without reading. This is exactly the failure a good gate is supposed to prevent.
- No escalation path for when a gated action is genuinely time-sensitive. Teams end up routing around the gate instead of fixing the underlying process, which defeats the point of having it.

## Signal you're doing this right

Gates are rare enough that each one gets real scrutiny. And the escalation-trigger list (see [governance-risk-tiers.md](../04-governance-risk-tiers.md)) — personally identifiable information (PII), no test coverage, no rollback plan, or crossing a system-of-record boundary — reliably catches the cases that actually matter.
