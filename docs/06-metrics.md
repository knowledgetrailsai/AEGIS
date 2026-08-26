# Metrics: Adoption, Efficiency, and Quality

Two different metric families matter here, and conflating them is the most common measurement mistake teams make when adopting agentic tooling:

1. **Tool-adoption metrics** — is the agentic tooling itself working (Section 1). New to this repo, specific to agent-assisted delivery.
2. **Standard SDLC / Agile / PM metrics** — the efficiency and quality metrics your org already tracks (velocity, cycle time, DORA, defect density, and so on). These don't go away with agentic adoption — but several of them **change meaning or become misleading** once a large share of change volume is tool-generated (Section 2).

Track both. Section 1 tells you whether the tooling is trustworthy; Section 2 tells you whether the *organization* is actually delivering better outcomes — and the two can diverge (tooling adoption metrics can look great while delivery outcomes don't move, or vice versa).

## Section 1: Tool-adoption metrics

Track these from day one so effort-saved claims are measured, not assumed — see [effort-savings-evidence.md](05-effort-savings-evidence.md) for why the perceived-vs-measured gap matters.

| Metric | What it tells you |
|---|---|
| Tool-authored change ratio | % of merged changes originated by an agentic coding tool, by risk tier — shows where autonomy is actually concentrated |
| Override/rejection rate | % of tool output rejected or substantially rewritten in review; a rising trend flags a spec or context problem, not a review-process problem |
| Cycle time delta | Task-start-to-merge time, before vs. after adoption, **segmented by task profile** — don't blend bounded and novel work into one number |
| Defect/incident rate delta | Post-release defects attributable to tool-authored vs. human-authored changes — catches a velocity gain that's really a quality trade |
| Perceived vs. measured speed gap | Periodically survey developer-perceived time savings and compare against measured cycle time — the METR finding suggests this gap is worth watching, not assuming away |

## Section 2: Standard SDLC / Agile / PM metrics in an agentic context

These are the metrics most engineering orgs already run — DORA, agile velocity, defect and code-quality metrics, PM-level delivery metrics. This section covers what each one still tells you once agentic tools are writing a meaningful share of the code, and where each one gets distorted if you don't adjust how you read it.

### Efficiency metrics

| Metric | Traditional meaning | What changes with agentic tooling |
|---|---|---|
| **Velocity** (story points/sprint) | Team throughput over time, used for sprint planning | Becomes unreliable as a standalone signal — a tool can inflate story points completed without a proportional increase in delivered value or quality. Pair with a quality metric (below) before trusting a velocity increase. Re-baseline after adoption; don't compare pre- and post-adoption velocity directly. |
| **Cycle time** (start to done) | How long work takes once started | Genuinely useful, but must be **segmented by task profile** (see [effort-savings-evidence.md](05-effort-savings-evidence.md)) — a blended number hides that bounded tasks sped up while novel work didn't, or got slower. |
| **Lead time** (request to delivery) | End-to-end time including queueing | Less affected by tool adoption than cycle time, since queueing/prioritization delay is usually the dominant component — a useful cross-check when cycle time looks better than lead time does. |
| **DORA: Deployment frequency** | How often you ship to production | A strong metric to keep as-is — it's an outcome metric, not an effort metric, so it isn't distorted by who (or what) wrote the code. Rising deployment frequency alongside a flat or rising change failure rate (below) is a warning sign, not a win. |
| **DORA: Lead time for changes** | Commit to production time | Same as cycle time above — segment by whether the change was tool-authored, and by risk tier, or a real slowdown on complex changes gets hidden by fast mechanical ones. |
| **PR/review turnaround time** | How long changes sit in review | Watch this closely — a jump in tool-authored change *volume* without a matching increase in review capacity just relocates the bottleneck from "writing code" to "reviewing code." A shrinking cycle time with a growing review queue is not a real efficiency gain. |
| **WIP (work in progress)** | Concurrent work items per person/team | Agentic tools let one person run more parallel workstreams (see [worktree/sandbox isolation](practices/worktree-sandbox-isolation.md)) — track WIP per person going up as expected, but watch for context-switching cost eating the gain if it rises faster than throughput does. |

### Quality metrics

| Metric | Traditional meaning | What changes with agentic tooling |
|---|---|---|
| **Defect density** (defects / KLOC or per change) | Code quality proxy | Still valid, but split by tool-authored vs. human-authored (Section 1) — an aggregate number that stays flat can hide a real quality gap between the two if tool-authored volume is growing. |
| **Escaped defect rate** (bugs found in prod vs. pre-release) | How well pre-release QA is catching issues | The most important quality metric to watch during agentic adoption — see [testing-qa.md](03-phases/testing-qa.md) and [evals](practices/evals.md). A rising escaped-defect rate alongside a flat internal-test-pass rate usually means eval/test coverage hasn't kept pace with the kind of mistakes tools make, which differ from the kind humans make. |
| **DORA: Change failure rate** | % of deploys causing a production incident | Directly answers "is speed coming at the cost of stability" — the single best metric to pair against deployment frequency and cycle time when evaluating whether agentic adoption is a net win. |
| **DORA: Mean time to restore (MTTR)** | How fast you recover from an incident | Can improve with agentic tools (see [production-support.md](03-phases/production-support.md) — triage/root-cause drafting) even if change failure rate doesn't — track both, since a tool that helps you recover fast can mask a tool that's causing more failures in the first place. |
| **Code churn** (% of code rewritten shortly after being written) | Signals unstable or poorly understood requirements | Watch tool-authored code specifically — high churn on tool-authored changes often traces back to a spec that wasn't [verifiable-done](practices/spec-driven-development.md), not to the tool's competence. |
| **Technical debt ratio** | Remediation cost vs. development cost | Agentic tools can pay this down faster (see [production-support.md](03-phases/production-support.md)) but can also accumulate it faster if unreviewed — the risk-tier gate (see [04-governance-risk-tiers.md](04-governance-risk-tiers.md)) is what keeps this from silently growing under increased throughput. |
| **Test coverage %** | Breadth of automated verification | A necessary but not sufficient metric here — pair it with eval coverage (see [evals](practices/evals.md)), since coverage on human-style tests doesn't guarantee coverage of the failure modes agentic tools actually produce. |

### Project management / delivery metrics

| Metric | Traditional meaning | What changes with agentic tooling |
|---|---|---|
| **Sprint predictability** (planned vs. completed) | Planning accuracy | Can improve for bounded, well-specified work (agentic tools reduce estimation variance on Tier 1–2 tasks) but stays roughly the same for novel/ambiguous work — don't let a predictability improvement on easy tickets mask continued unpredictability on hard ones. |
| **Cost per story point / per feature** | Delivery cost efficiency | The metric most directly tied to the [effort-savings evidence](05-effort-savings-evidence.md) — compute this **per task profile**, and include tool compute/token cost and review overhead in the cost side, not just headcount time. |
| **Scope creep rate** | How often delivered work exceeds original scope | Watch specifically for tool-driven scope creep — an agentic tool without a clear out-of-scope boundary in its spec (see [spec-driven-development.md](practices/spec-driven-development.md)) tends to "helpfully" touch more than asked. |
| **Time-to-first-review / time-to-merge** | Delivery pipeline speed | Same caution as PR turnaround above — track alongside reviewer headcount, since this is the metric most likely to look good on paper while quietly building a review bottleneck. |

## How to use all of this

1. Baseline before rollout — you can't show a delta without a "before," for either metric family.
2. Segment everything by risk tier and task profile. An aggregate number hides exactly the variance that matters (see the effort-savings ranges).
3. **Always pair an efficiency metric with a quality metric.** A velocity or cycle-time win reported alone is an incomplete — and potentially misleading — result; report it next to change failure rate or escaped-defect rate.
4. Review monthly, act on trend not noise — a single bad week from one tool workflow isn't a signal; three consecutive months of rising override rate or change failure rate is.
5. Feed a rising override rate or escaped-defect rate back into [requirements-spec.md](03-phases/requirements-spec.md) and [development.md](03-phases/development.md) — the fix is almost always spec or context quality, not more review headcount.
6. Re-baseline traditional metrics after adoption rather than comparing directly to pre-adoption history — the composition of "who/what did the work" has changed, so a raw before/after comparison conflates two different things.
