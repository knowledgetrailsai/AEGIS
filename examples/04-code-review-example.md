# Worked Example: Code Review

Continues from [03-development-example.md](03-development-example.md). The PR is open, at Tier 2, so a human reviewer is required before merge.

## Prompt given to the tool

> Summarize this diff against the spec and ADR-0032. Flag anything outside the stated scope, missing tests, or a mismatch between the declared risk tier and what the diff actually touches.

## Tool output

> **In scope:** `SearchCacheClient`, `SearchController` wiring, price-sync invalidation hook, and tests all match the spec and ADR-0032. Cache-key normalization matches the design.
>
> **Flag:** commit 3 (`feat(search): invalidate cache on price-sync completion`) also renames an unrelated helper function, `formatPriceDelta` → `formatPriceChange`, in a file the spec doesn't mention. This is outside the stated scope.
>
> **Tests:** unit and integration tests present and match the plan. No missing coverage against the acceptance criteria.
>
> **Risk tier:** diff matches a Tier 2 profile — reversible, moderate blast radius, no schema or contract change. No mismatch with the declared tier.

## Human gate

The reviewer agrees with the flag. The rename is harmless, but it has nothing to do with this spec. A tool that reaches beyond what it was asked to do is exactly the kind of drift [08-agile-workflow.md](../docs/08-agile-workflow.md#common-mistakes) warns about, even when the extra change looks helpful. The reviewer asks for the rename to be reverted into its own follow-up commit (or dropped entirely), rather than approving it inside this PR. Everything else is approved as-is. The tool's summary was accurate enough that the reviewer didn't need to re-check the raw diff to confirm scope.

## Outcome

The tool reverts the unrelated rename in a follow-up commit. The PR is approved by the required human reviewer per Tier 2's gate in [04-governance-risk-tiers.md](../docs/04-governance-risk-tiers.md), and squash-merged per the [merge strategy](../docs/00-git-workflow-and-automation.md#merge-strategy). The reverted rename is filed as its own separate Tier 1 cleanup ticket, instead of being silently folded into this change.
