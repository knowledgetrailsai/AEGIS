# Metrics: Adoption, Efficiency, and Quality

Two different families of metrics matter here. Mixing them up is the most common measurement mistake teams make when adopting agentic tooling.

1. **Tool-adoption metrics** — is the agentic tooling itself working well (Section 1)? These are new to this repo, specific to agent-assisted delivery.
2. **Standard SDLC (software development life cycle) / Agile / PM metrics** — the efficiency and quality metrics your org already tracks: velocity, cycle time, DORA, defect density, and so on. You still need these once you adopt agentic tools. But several of them **change meaning or become misleading** once a large share of your changes are tool-generated (Section 2).

Track both. Section 1 tells you whether the tooling can be trusted. Section 2 tells you whether the *organization* is actually delivering better outcomes. The two can move in different directions: tool-adoption metrics can look great while delivery outcomes don't improve, or the other way around.

## Section 1: Tool-adoption metrics

Track these from day one, so that any claim about effort saved is measured, not just assumed. See [effort-savings-evidence.md](05-effort-savings-evidence.md) for why the gap between what people feel and what's actually measured matters.

| Metric | What it tells you |
|---|---|
| Tool-authored change ratio | The percentage of merged changes that an agentic coding tool originated, broken out by risk tier. Shows you where the tool's autonomy is actually concentrated. |
| Override/rejection rate | The percentage of tool output that gets rejected or substantially rewritten during review. A rising trend points to a problem with specs or context, not a problem with the review process. |
| Cycle time delta | The time from task start to merge, before adoption compared with after, **broken out by task profile**. Don't blend bounded and novel work into one number — they behave very differently. |
| Defect/incident rate delta | Post-release defects, split by whether the change was tool-authored or human-authored. This catches a case where velocity looks like it improved but quality actually got worse. |
| Perceived vs. measured speed gap | Periodically ask developers how much time they feel the tools are saving them, and compare that against the time you actually measured. The METR finding suggests this gap is worth watching closely, not assuming away. |

## Section 2: Standard SDLC / Agile / PM metrics in an agentic context

These are the metrics most engineering orgs already track: DORA (a well-known set of four delivery metrics), agile velocity, defect and code-quality metrics, and PM-level delivery metrics. This section explains what each one still tells you once agentic tools are writing a meaningful share of the code, and where each one can mislead you if you don't adjust how you read it.

### Efficiency metrics

| Metric | Traditional meaning | What changes with agentic tooling |
|---|---|---|
| **Velocity** (story points per sprint) | Team throughput over time, used for sprint planning | Becomes unreliable on its own. A tool can inflate the number of story points completed without a matching increase in delivered value or quality. Pair it with a quality metric (below) before trusting a velocity increase. Re-baseline (reset your starting comparison point) after adoption, rather than comparing pre- and post-adoption velocity directly. |
| **Cycle time** (start to done) | How long work takes once it starts | Still genuinely useful, but you must **segment it by task profile** (see [effort-savings-evidence.md](05-effort-savings-evidence.md)). A single blended number can hide the fact that bounded tasks sped up while novel work stayed the same, or got slower. |
| **Lead time** (request to delivery) | End-to-end time, including time spent waiting in a queue | Less affected by tool adoption than cycle time, since queueing and prioritization delay is usually the bigger part of it. Useful as a cross-check when cycle time looks better than lead time does. |
| **DORA: Deployment frequency** | How often you ship to production | A strong metric to keep using as-is. It's an outcome metric, not an effort metric, so it isn't distorted by who — or what — wrote the code. If deployment frequency rises alongside a flat or rising change failure rate (below), that's a warning sign, not a win. |
| **DORA: Lead time for changes** | Time from commit to production | Same caveat as cycle time above: segment by whether the change was tool-authored, and by risk tier. Otherwise a real slowdown on complex changes can get hidden by a bunch of fast, mechanical ones. |
| **PR/review turnaround time** | How long changes sit waiting for review | Watch this closely. If the volume of tool-authored changes jumps without a matching increase in review capacity, the bottleneck simply moves from "writing code" to "reviewing code." A shrinking cycle time paired with a growing review queue is not a real efficiency gain. |
| **WIP (work in progress)** | Concurrent work items per person or team | Agentic tools let one person run more parallel workstreams (see [worktree/sandbox isolation](practices/worktree-sandbox-isolation.md)). Expect WIP per person to rise — that's normal — but watch out for the cost of switching between tasks eating into the gain if WIP rises faster than actual throughput does. |

### Quality metrics

| Metric | Traditional meaning | What changes with agentic tooling |
|---|---|---|
| **Defect density** (defects per thousand lines of code, or per change) | A proxy for code quality | Still a valid metric, but split it by tool-authored vs. human-authored work (see Section 1). An aggregate number that looks flat can hide a real quality gap between the two, especially as tool-authored volume grows. |
| **Escaped defect rate** (bugs found in production instead of before release) | How well your pre-release QA is catching issues | The most important quality metric to watch during agentic adoption. See [testing-qa.md](03-phases/testing-qa.md) and [evals](practices/evals.md). If this rate rises while your internal test-pass rate stays flat, it usually means your eval/test coverage hasn't kept up with the kinds of mistakes tools make — which are often different from the kinds humans make. |
| **DORA: Change failure rate** | The percentage of deploys that cause a production incident | Directly answers the question "is our speed coming at the cost of stability?" This is the single best metric to pair against deployment frequency and cycle time when judging whether agentic adoption is a net win. |
| **DORA: Mean time to restore (MTTR)** | How fast you recover from an incident | Can improve with agentic tools (see [production-support.md](03-phases/production-support.md) for triage and root-cause drafting), even if change failure rate doesn't. Track both — a tool that helps you recover quickly can hide the fact that a different tool is causing more failures in the first place. |
| **Code churn** (the percentage of code that gets rewritten shortly after it was written) | A signal of unstable or poorly understood requirements | Watch tool-authored code specifically. High churn there usually traces back to a spec that wasn't [verifiable-done](practices/spec-driven-development.md) — not to any lack of skill on the tool's part. |
| **Technical debt ratio** | The cost of fixing shortcuts later, compared with the cost of building it right the first time | Agentic tools can pay this down faster (see [production-support.md](03-phases/production-support.md)), but they can also build it up faster if their output goes unreviewed. The risk-tier gate (see [04-governance-risk-tiers.md](04-governance-risk-tiers.md)) is what keeps this from silently growing as throughput increases. |
| **Test coverage %** | How much of the code is covered by automated tests | Necessary, but not enough on its own. Pair it with eval coverage (see [evals](practices/evals.md)) — coverage from human-style tests doesn't guarantee you've covered the specific failure modes agentic tools tend to produce. |

### Project management / delivery metrics

| Metric | Traditional meaning | What changes with agentic tooling |
|---|---|---|
| **Sprint predictability** (planned work vs. completed work) | How accurate your planning is | Can improve for bounded, well-specified work, since agentic tools reduce estimation variance on Tier 1–2 tasks. Stays roughly the same for novel or ambiguous work. Don't let an improvement on easy tickets hide continued unpredictability on the hard ones. |
| **Cost per story point / per feature** | How cost-efficient delivery is | The metric most directly tied to the [effort-savings evidence](05-effort-savings-evidence.md). Compute this **per task profile**, and include tool compute/token cost and review overhead in the cost side, not just headcount time. |
| **Scope creep rate** | How often delivered work goes beyond the original scope | Watch specifically for scope creep driven by the tool itself. An agentic tool without a clear out-of-scope boundary in its spec (see [spec-driven-development.md](practices/spec-driven-development.md)) tends to "helpfully" touch more than it was asked to. |
| **Time-to-first-review / time-to-merge** | How fast the delivery pipeline moves | Same caution as PR turnaround above. Track it alongside reviewer headcount — this is the metric most likely to look good on paper while quietly building a review bottleneck underneath. |

## How to use all of this

1. Baseline before rollout. You can't show a change without a "before" measurement, for either metric family.
2. Segment everything by risk tier and task profile. A single aggregate number hides exactly the variance that matters — see the effort-savings ranges.
3. **Always pair an efficiency metric with a quality metric.** A velocity or cycle-time win, reported by itself, is an incomplete result — and can be misleading. Report it alongside change failure rate or escaped-defect rate.
4. Review monthly, and act on a trend, not on noise. One bad week from a single tool workflow isn't a signal. Three consecutive months of rising override rate or change failure rate is.
5. Feed a rising override rate or escaped-defect rate back into [requirements-spec.md](03-phases/requirements-spec.md) and [development.md](03-phases/development.md). The fix is almost always spec or context quality — rarely more review headcount.
6. Re-baseline traditional metrics after adoption, rather than comparing them directly to pre-adoption history. The composition of "who — or what — did the work" has changed, so a raw before/after comparison mixes together two different things.
