# Worked Example: Development

Continues from [02-design-example.md](02-design-example.md). ADR-0032 is recorded, and the spec now includes the invalidation constraint.

## Prompt given to the tool

> Implement the caching layer described in ADR-0032 and the spec, in an isolated worktree on branch `tier2/feat/search-caching-JIRA-4821`. Before writing any code, give me a step-by-step plan: files touched, new files, cache-key design, the invalidation hook, and the tests you'll add. Wait for my approval before executing anything.

This follows two practices from the docs. [Plan-then-execute](../docs/practices/plan-then-execute.md) means the tool proposes a plan before it acts. [Worktree/sandbox isolation](../docs/practices/worktree-sandbox-isolation.md) means the work happens in its own copy of the repo, so it can't collide with other branches in progress.

## Tool's plan (before execution)

1. New file `search/cache/SearchCacheClient` — a thin wrapper around the Redis client, with a normalized-query cache key (lowercased, whitespace-collapsed, sorted filter params).
2. Wire `SearchCacheClient` into `SearchController` ahead of the existing relevance-ranking call. A cache hit returns immediately; a cache miss falls through to the existing logic and writes the result before returning.
3. TTL (time-to-live, how long an entry stays cached) of 10 minutes, plus an explicit `invalidate(query_prefix)` call from the existing price-sync completion handler.
4. Eviction (removing old entries to make room): LFU (least-frequently-used) at 500 entries, per the spec's rolling 7-day window, not simple TTL-only expiry.
5. Tests: unit tests for cache hit, miss, eviction, and invalidation, plus an integration test confirming the public API contract (request/response shape) is unchanged with caching enabled.

## Human gate

The engineer reviews the plan and makes one change before approving. Step 4 originally proposed TTL-only eviction with no frequency tracking. That would be cheaper to build, but it doesn't satisfy the spec's "top 500 most frequent queries" requirement, which needs frequency tracking, not just recency. The engineer edits the plan to require LFU eviction and approves it.

## Tool executes

Four atomic commits in the worktree branch, each in conventional-commit format and tagged with a `Tool-Assisted: Claude Code` trailer per the [commit conventions](../docs/00-git-workflow-and-automation.md#commits):

```
feat(search): add SearchCacheClient with LFU eviction
feat(search): wire cache into SearchController ahead of ranking
feat(search): invalidate cache on price-sync completion
test(search): add cache hit/miss/eviction/invalidation tests
```

## Outcome

The branch is ready for review with a clean, atomic commit history that maps directly back to the approved plan. A reviewer can check each commit against one plan step, instead of reconstructing intent from a single large diff. A PR (pull request) is opened per the [git workflow](../docs/00-git-workflow-and-automation.md), with the risk tier and spec link filled in from the PR template.
