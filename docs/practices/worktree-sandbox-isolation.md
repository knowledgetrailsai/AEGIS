# Practice: Worktree / Sandbox Isolation

Agentic coding tools do their work in isolated git worktrees (separate working copies of a repo) or containers, so that parallel tools don't clobber each other or the main branch. This lets you run several agentic coding tools on the same codebase at the same time without them conflicting.

## Why it exists

Two agentic coding tools, or a tool and a human, editing the same branch at the same time produces exactly the conflicts you'd expect from two humans doing the same thing without coordinating. Except it happens faster and is harder to notice, because a tool's edits can span many files in a single pass.

## How to do it

1. **Give each tool task its own worktree or sandboxed branch.** Don't give it shared write access to the main working branch.
2. **Merge through the normal PR path.** Isolation doesn't replace review. It just prevents an accidental collision before review gets a chance to happen.
3. **Use isolation for exploration too.** Let an agentic coding tool try a regenerative rebuild (see [patch-vs-regenerate.md](../02-patch-vs-regenerate.md)) in a sandbox, compare it against current behavior, and only merge it if it actually passes reconciliation.
4. **Clean up worktrees you're not using anymore.** A pile of stale branches left over from abandoned tool attempts becomes its own maintenance burden.

## Common failure modes

- Multiple agentic coding tools, or tools and humans, sharing one working branch "to save setup time." The collisions this causes end up costing more than setting up isolation would have.
- Sandboxes that carry production-equivalent credentials. Isolation from code conflicts is not the same as isolation from blast radius. A sandboxed tool with real production access can still do real damage (see [governance-risk-tiers.md](../04-governance-risk-tiers.md)).

## Signal you're doing this right

Parallel tool workstreams never produce a merge conflict caused by simultaneous editing. When conflicts do happen, they come from genuinely overlapping feature work, the same as they would between two human contributors.
