# Worked Example: Deployment & Release

Continues from [05-testing-qa-example.md](05-testing-qa-example.md) — tests and evals are green, PR is merged to `main`. Tier 2, so release still needs human approval before it goes out, even though no reviewer sign-off is required a second time.

## Prompt given to the tool

> Draft release notes and a rollback plan for the search-caching change (Tier 2). Include what changed, the feature flag name if we're using one, rollback steps if the cache causes stale-result complaints, and what to monitor for the first 48 hours after release.

## Tool output

**Release notes (draft):**
> Added Redis-backed caching for the top 500 most frequent product-search queries, with cache invalidation on price-sync completion. No change to the public search API. Expected impact: lower p95 latency for cached queries; no relevance regression (evals attached to PR #4821).

**Rollback plan:**
- Ship behind feature flag `search_cache_enabled`, default off in production until a canary window closes.
- If stale-result complaints appear: first response is to disable the flag (seconds, no redeploy needed) — this reverts to the pre-cache code path immediately.
- If the flag mechanism itself is implicated: redeploy the previous search-service revision as a full rollback.

**Monitoring, first 48 hours:**
- Cache hit rate (expect it to climb toward a steady state over the first few hours as the cache warms)
- p95 latency, cached vs. uncached queries
- Nightly relevance eval run, watching for any drift from the 0.87 baseline

## Human gate

The release manager reviews the draft, edits the release notes to add the JIRA ticket reference and a customer-facing summary line, and — this is the part that stays human regardless of how good the draft is — is the one who actually flips the deploy trigger. The tool prepared everything; it didn't and structurally couldn't execute the release itself, per [human-in-the-loop gating](../docs/practices/human-in-the-loop-gating.md).

## Outcome

Released behind `search_cache_enabled`, off by default, enabled for 5% of traffic as a canary. Rollback plan is attached to the release ticket, not just left in a chat transcript, so on-call has it without needing to reconstruct it during an actual incident — which is exactly what the next example needs.
