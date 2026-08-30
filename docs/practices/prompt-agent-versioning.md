# Practice: Prompt & Agentic coding tool Versioning

Treat prompts, system instructions, and tool configs like code: versioned, diffed, reviewed, and able to be rolled back. A prompt change can affect behavior just as much as a code change can.

## Why it exists

A single prompt edit can silently change tool behavior across every task that workflow touches. Without versioning, there's no way to know what changed, when it changed, or how to revert it if a change makes output quality worse.

## How to do it

1. **Store prompts and configs in version control alongside the code they operate on**, not in a separate tool UI that doesn't track history.
2. **Treat every change as a reviewable diff.** Run it through the same PR process as a code change, and include a stated reason for the change.
3. **Tag or version each release** of a given tool workflow's prompt or config, so you can connect a shift in metrics (see [metrics.md](../06-metrics.md)) to the specific change that caused it.
4. **Keep a rollback path.** If the override/rejection rate spikes after a prompt change, you need to revert quickly. You shouldn't have to reconstruct the previous version from memory.
5. **Run the [evals suite](evals.md) against any prompt or config change before it ships.** A prompt change is a behavior change, and behavior changes get evaluated the same as any other kind.

## Common failure modes

- Editing prompts directly in a tool's live config, with no history kept. The result is "it got worse sometime last month," with no way to find out why.
- Shipping a prompt change with no eval run first, so regressions get discovered by users or reviewers instead of caught before merge.
- Treating prompt tuning as one person's undocumented craft, rather than as a reviewed engineering change like any other.

## Signal you're doing this right

Any regression in tool behavior can be traced to a specific, dated change in version control, and reverted in minutes rather than hours.
