# Practice: Prompt & Agent Versioning

Treating prompts, system instructions, and agent configs like code — versioned, diffed, reviewed, rolled back — since a prompt change can be as impactful as a code change.

## Why it exists

A prompt edit can silently change agent behavior across every task that workflow touches. Without versioning, there's no way to know what changed, when, or how to revert if a change degrades output quality.

## How to do it

1. **Store prompts/configs in version control alongside the code they operate on**, not in a separate untracked tool UI.
2. **Treat every change as a reviewable diff** — same PR process as a code change, including a stated reason for the change.
3. **Tag or version releases** of a given agent workflow's prompt/config so you can correlate a metrics shift (see [metrics.md](../06-metrics.md)) with a specific change.
4. **Keep a rollback path.** If override/rejection rate spikes after a prompt change, you need to revert quickly, not reconstruct the previous version from memory.
5. **Run the [evals suite](evals.md) against any prompt/config change before it ships** — a prompt change is a behavior change, and behavior changes get evaluated like any other.

## Common failure modes

- Prompt edits made directly in a tool's live config with no history — "it got worse sometime last month" and no way to find out why.
- No eval run before shipping a prompt change, so regressions are discovered by users/reviewers instead of caught pre-merge.
- Treating prompt tuning as a one-person, undocumented craft rather than a reviewed engineering change.

## Signal you're doing this right

Any regression in agent behavior can be traced to a specific, dated change in version control — and reverted in minutes, not hours.
