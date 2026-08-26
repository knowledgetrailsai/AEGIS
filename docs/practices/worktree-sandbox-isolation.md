# Practice: Worktree / Sandbox Isolation

Agentic coding tools work in isolated git worktrees or containers so parallel agentic coding tools don't clobber each other or the main branch. Enables running multiple agentic coding tools on the same codebase simultaneously without conflict.

## Why it exists

Two agentic coding tools (or an agentic coding tool and a human) editing the same branch concurrently produces exactly the conflicts you'd expect from two humans doing the same thing without coordination — except faster and less visibly, since tool edits can span many files in one pass.

## How to do it

1. **Give each tool task its own worktree or sandboxed branch**, not shared write access to the main working branch.
2. **Merge through the normal PR path** — isolation doesn't replace review, it just prevents accidental collision before review happens.
3. **Use isolation for exploration too** — letting an agentic coding tool try a regenerative rebuild (see [patch-vs-regenerate.md](../02-patch-vs-regenerate.md)) in a sandbox, compare against the current behavior, and only merge if it actually passes reconciliation.
4. **Clean up unused worktrees** — an accumulation of stale branches from abandoned tool attempts is its own maintenance burden.

## Common failure modes

- Multiple agentic coding tools (or agentic coding tools and humans) sharing a single working branch "to save setup time" — the collisions this causes cost more than the isolation would have.
- Sandboxes with production-equivalent credentials — isolation for code conflicts doesn't mean isolation for blast radius; a sandboxed agentic coding tool with real prod access can still cause real damage (see [governance-risk-tiers.md](../04-governance-risk-tiers.md)).

## Signal you're doing this right

Parallel agentic coding tool workstreams never produce a merge conflict from simultaneous editing — conflicts, when they happen, come from legitimately overlapping feature work, the same as they would between two human contributors.
