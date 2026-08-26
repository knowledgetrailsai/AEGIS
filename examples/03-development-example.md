# Worked Example: Development

Continues from [02-design-example.md](02-design-example.md) — ADR-0032 is recorded, spec now includes the invalidation constraint.

## Prompt given to the tool

> Implement the caching layer described in ADR-0032 and the spec, in an isolated worktree on branch `tier2/feat/search-caching-JIRA-4821`. Before writing any code, give me a step-by-step plan: files touched, new files, cache-key design, the invalidation hook, and the tests you'll add. Wait for my approval before executing anything.

This follows [plan-then-execute](../docs/practices/plan-then-execute.md): the tool proposes before it acts, and [worktree/sandbox isolation](../docs/practices/worktree-sandbox-isolation.md): the work happens in its own worktree so it can't collide with other in-flight branches.

## Tool's plan (before execution)

1. New file `search/cache/SearchCacheClient` — thin wrapper around the Redis client, normalized-query cache key (lowercased, whitespace-collapsed, sorted filter params).
2. Wire `SearchCacheClient` into `SearchController` ahead of the existing relevance-ranking call — cache hit returns immediately, cache miss falls through to existing logic and writes the result before returning.
3. TTL 10 minutes, plus explicit `invalidate(query_prefix)` called from the existing price-sync completion handler.
4. Eviction: LFU at 500 entries (rolling 7-day window per spec), not simple TTL-only expiry.
5. Tests: unit tests for cache hit/miss/eviction/invalidation; integration test asserting the public API contract (request/response shape) is unchanged with caching enabled.

## Human gate

The engineer reviews the plan and makes one change before approving: step 4 originally proposed TTL-only eviction with no LFU tracking — cheaper to implement but doesn't satisfy the spec's "top 500 most frequent queries" requirement, which needs frequency tracking, not just recency. The engineer edits the plan to require LFU eviction and approves.

## Tool executes

Four atomic, conventional-format commits in the worktree branch, each tagged with a `Tool-Assisted: Claude Code` trailer per the [commit conventions](../docs/00-git-workflow-and-automation.md#commits):

```
feat(search): add SearchCacheClient with LFU eviction
feat(search): wire cache into SearchController ahead of ranking
feat(search): invalidate cache on price-sync completion
test(search): add cache hit/miss/eviction/invalidation tests
```

## Outcome

Branch is ready for review with a clean, atomic commit history that maps directly back to the approved plan — a reviewer can check each commit against one plan step instead of reconstructing intent from a single large diff. PR opened per the [git workflow](../docs/00-git-workflow-and-automation.md), risk tier and spec link filled in from the PR template.
