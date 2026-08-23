# Practice: Plan-Then-Execute

The agent proposes a plan before touching anything; a human approves or edits it before execution starts. Separates "thinking" from "doing" so mistakes are caught before they become file changes.

## Why it exists

Reviewing a diff after the fact means the agent already committed to an interpretation of the task — undoing a wrong approach costs more than redirecting it before execution. Reviewing the plan is cheaper than reviewing (and unwinding) the output.

## How to do it

1. **Require a plan artifact for anything above Tier 1** (see [governance](../04-governance-risk-tiers.md)): a short, concrete list of the files/modules the agent intends to touch and the approach it will take — not a restatement of the spec.
2. **Review the plan against the spec's acceptance criteria and out-of-scope list**, not against your own mental model of the task — the spec is the shared contract (see [spec-driven-development.md](spec-driven-development.md)).
3. **Approve, edit, or reject before execution.** An edited plan should go back to the agent as the new instruction, not be silently overridden mid-execution.
4. **Reserve unreviewed autonomous execution for Tier 1 actions only** — well-covered, reversible, low blast radius.

## Common failure modes

- Treating the plan step as a formality and rubber-stamping it — this defeats the purpose; the review has to actually catch misinterpretations.
- Approving a plan that's vague enough to hide multiple possible implementations — push back and ask for specifics before approving.
- Letting execution start on a Tier 2+ action with no plan step at all "because the agent is usually right" — this is exactly the pattern that erodes the effort savings (see [effort-savings-evidence.md](../05-effort-savings-evidence.md)) when it's occasionally wrong.

## Signal you're doing this right

Rejected or heavily-edited plans are common and inexpensive (a few minutes), while rejected diffs after execution are rare — most of the correction work is happening at the cheap stage, not the expensive one.
