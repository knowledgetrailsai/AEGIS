# How Much Effort Can Be Saved — What the Evidence Says

This section leads with the evidence, not the vendor pitch. Treat the figures below as directional ranges by task type — **verify against current published sources before using them in planning**; this field moves fast.

## Where the gains are real and largest

- Bounded, well-specified, verifiable tasks (boilerplate, test generation, doc generation, migrations with clear before/after state, config generation) see the strongest and most consistently reported gains — vendor studies report speedups in the **30–55%** range for these task types.
- QA/test authoring and documentation are the most consistently tool-favorable categories, because success is directly verifiable (tests pass/fail, docs match code).

## Where the evidence is far more cautious

- A 2025 METR randomized controlled trial of experienced open-source developers found they completed real-world coding tasks **19% slower** using current AI tools — despite estimating afterward, on average, that the tools had made them **~20% faster**. The gap between perceived and measured speed is the headline finding, not just the slowdown.
- Industry surveys reporting ~93% AI-tool adoption alongside measured output gains closer to ~10% suggest a large share of adoption isn't yet translating into throughput — often because review overhead, context-setup time, and correcting tool mistakes eat into the raw generation speedup.
- Gains are highly task-dependent: ambiguous, large-context, or unfamiliar-codebase tasks show the smallest (or negative) net effect once review and correction time is counted.

## What explains the gap — and how this framework addresses it

- Unreviewed tool output that turns out wrong costs more than it saved → [risk-tiering](04-governance-risk-tiers.md) keeps review time proportional to actual risk instead of blanket caution or blanket trust.
- Poor spec quality is the single biggest driver of wasted tool cycles → the ["verifiable done" test](03-phases/requirements-spec.md) exists specifically to prevent the rework loop that erases savings.
- Context-setup and review overhead, not generation speed, is usually the real bottleneck → [context engineering](01-principles.md#4-context-is-engineered-not-assumed) and [evals](03-phases/testing-qa.md) are required infrastructure, not optional polish.

## Practical planning estimate

| Task Profile | Realistic Effort Reduction | Confidence |
|---|---|---|
| Bounded, well-tested, familiar code (Tier 1–2) | 30–50% | High — consistent across vendor and independent reports |
| QA/test generation, documentation | 40–60% | High — directly verifiable outputs |
| Novel feature work in unfamiliar/complex codebase | 0–15%, occasionally negative without process | Low — METR RCT found net slowdown here without disciplined review |
| High-risk/regulated changes (Tier 3–4) | 10–20% (review time dominates) | Medium — gate overhead is intentional, not a flaw |

**Bottom line:** plan budgets around the task-profile ranges above, not an org-wide average. Teams seeing 30–55% gains are applying process — spec quality, risk-tiered gating, evals — not just installing a tool.

## Sources to check when refreshing this section

- METR developer productivity studies (metr.org/research)
- Vendor-published productivity studies (treat as upper-bound, not typical case)
- Your own [metrics](06-metrics.md) — the only figures that actually apply to your team
