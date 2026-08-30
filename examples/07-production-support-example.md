# Worked Example: Production Support & Maintenance

Continues from [06-deployment-example.md](06-deployment-example.md). Two weeks after release, the search cache is at 100% of traffic. An incident comes in: customers report stale prices in search results after that morning's price sync.

## Prompt given to the tool

> Incident: customers report stale prices in search results after this morning's price-sync job. Here are the relevant logs, the price-sync completion trace, and the diff from PR #4821 (attached). Propose a root-cause hypothesis and a remediation runbook. Don't execute anything — output the plan only.

Per [production-support.md](../docs/03-phases/production-support.md), the tool proposes a plan; it doesn't act until a human decides.

## Tool output

> **Hypothesis:** the price-sync completion event fires per SKU (stock-keeping unit, meaning per individual product), but the cache's `invalidate(query_prefix)` hook was wired to a batch-level completion signal that only fires once per sync run. For SKUs updated early in a sync run, cached search results can stay stale for up to the full 10-minute TTL before the batch-level invalidation catches up. This is worse right after a sync starts, when many SKUs have changed but the batch hasn't completed.
>
> **Remediation options:**
> 1. **Tier 1, immediate mitigation:** reduce cache TTL from 10 minutes to 2 minutes. This is a config-only change, fully reversible, and it bounds the worst-case staleness without touching the invalidation logic.
> 2. **Tier 2, proper fix:** rewire invalidation to the per-SKU price-update event instead of the batch-completion event. This requires a code change and a re-test of the invalidation path.

## Human gate

Because this is a customer-facing incident, the on-call engineer runs the hypothesis past a second tool pass before acting on it. This is the "second opinion" pattern described in [multi-agent orchestration](../docs/practices/multi-agent-orchestration.md) and [human-in-the-loop gating](../docs/practices/human-in-the-loop-gating.md), used here because a wrong root-cause guess acted on during an active incident is expensive to undo. The second pass confirms the batch-vs-per-SKU event mismatch by checking the actual event payloads in the trace. The hypothesis is confirmed.

The engineer approves remediation option 1 (Tier 1, TTL reduction) as the immediate mitigation. It's config-only, reversible, and doesn't require a code review cycle during an active incident. Option 2 is filed as a proper Tier 2 follow-up, rather than being rushed through under incident pressure.

## Outcome

TTL is reduced from 10 minutes to 2 minutes, auto-merged per Tier 1's gate (green CI, spot-audited afterward). The incident is resolved within the hour. The Tier 2 follow-up — wiring invalidation to the per-SKU event — is tracked as its own ticket with the incident as context, so the real fix goes through the normal design-development-review cycle instead of being skipped once the immediate pain stops. This is the [technical debt ratio](../docs/06-metrics.md#quality-metrics) metric in practice: the quick mitigation isn't treated as done.
