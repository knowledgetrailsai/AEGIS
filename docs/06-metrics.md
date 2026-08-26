# Metrics to Track Adoption Honestly

Track these from day one so effort-saved claims are measured, not assumed — see [effort-savings-evidence.md](05-effort-savings-evidence.md) for why the perceived-vs-measured gap matters.

| Metric | What it tells you |
|---|---|
| Tool-authored change ratio | % of merged changes originated by an agentic coding tool, by risk tier — shows where autonomy is actually concentrated |
| Override/rejection rate | % of tool output rejected or substantially rewritten in review; a rising trend flags a spec or context problem, not a review-process problem |
| Cycle time delta | Task-start-to-merge time, before vs. after adoption, **segmented by task profile** — don't blend bounded and novel work into one number |
| Defect/incident rate delta | Post-release defects attributable to tool-authored vs. human-authored changes — catches a velocity gain that's really a quality trade |
| Perceived vs. measured speed gap | Periodically survey developer-perceived time savings and compare against measured cycle time — the METR finding suggests this gap is worth watching, not assuming away |

## How to use these

1. Baseline before rollout — you can't show a delta without a "before."
2. Segment everything by risk tier and task profile. An aggregate number hides exactly the variance that matters (see the effort-savings ranges).
3. Review monthly, act on trend not noise — a single bad week from one tool workflow isn't a signal; three consecutive months of rising override rate is.
4. Feed a rising override rate back into [requirements-spec.md](03-phases/requirements-spec.md) and [development.md](03-phases/development.md) — the fix is almost always spec or context quality, not more review headcount.
