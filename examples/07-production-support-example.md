# Worked Example: Production Support & Maintenance

Continues from [06-deployment-example.md](06-deployment-example.md) — two weeks after release, the search cache is at 100% traffic. An incident comes in: customers report stale prices in search results after that morning's price sync.

## Prompt given to the tool

> Incident: customers report stale prices in search results after this morning's price-sync job. Here are the relevant logs, the price-sync completion trace, and the diff from PR #4821 (attached). Propose a root-cause hypothesis and a remediation runbook. Don't execute anything — output the plan only.

Per [production-support.md](../docs/03-phases/production-support.md), the tool proposes; it doesn't act until a human decides.

## Tool output

> **Hypothesis:** the price-sync completion event is firing per-SKU, but the cache's `invalidate(query_prefix)` hook was wired to a batch-level completion signal that only fires once per sync run, not per SKU. For SKUs updated early in a sync run, cached search results can be stale for up to the full 10-minute TTL before the batch-level invalidation catches up — worse right after a sync starts, when many SKUs have changed but the batch hasn't completed.
>
> **Remediation options:**
> 1. **Tier 1, immediate mitigation:** reduce cache TTL from 10 minutes to 2 minutes. Config-only change, fully reversible, bounds worst-case staleness without touching invalidation logic.
> 2. **Tier 2, proper fix:** rewire invalidation to the per-SKU price-update event instead of the batch-completion event. Requires a code change and re-test of the invalidation path.

## Human gate

Given this is a customer-facing incident, the on-call engineer runs the hypothesis past a second tool pass before acting on it — the "second opinion" pattern from [multi-agent orchestration](../docs/practices/multi-agent-orchestration.md) and [human-in-the-loop gating](../docs/practices/human-in-the-loop-gating.md), used here specifically because a wrong root-cause guess acted on during an active incident is expensive to unwind. The second pass confirms the batch-vs-per-SKU event mismatch by checking the actual event payloads in the trace. Hypothesis confirmed.

The engineer approves remediation option 1 (Tier 1, TTL reduction) as the immediate mitigation — it's config-only, reversible, and doesn't require a code review cycle during an active incident. Option 2 is filed as a proper Tier 2 follow-up rather than being rushed through under incident pressure.

## Outcome

TTL reduced from 10 minutes to 2 minutes, auto-merged per Tier 1's gate (green CI, spot-audited afterward). Incident resolved within the hour. The Tier 2 follow-up — wiring invalidation to the per-SKU event — is tracked as its own ticket with the incident as context, so the real fix goes through the normal design → development → review cycle instead of being skipped once the immediate pain stops. This is the [technical debt ratio](../docs/06-metrics.md#quality-metrics) metric in practice: the quick mitigation didn't get treated as done.
