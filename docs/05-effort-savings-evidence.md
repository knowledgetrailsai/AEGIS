# How Much Effort Can Be Saved — What the Evidence Says

This section starts with the evidence, not a sales pitch. Treat the figures below as rough, directional ranges by task type. **Verify them against current published sources before using them in planning** — this field moves fast.

## Where the gains are real and largest

- Tasks that are bounded, well-specified, and easy to verify (boilerplate, test generation, doc generation, migrations with a clear before/after state, config generation) show the strongest and most consistently reported gains. Vendor studies report speedups in the **30–55%** range for these task types.
- QA/test authoring and documentation are the categories tools help with most consistently. That's because success is easy to check: tests pass or fail, and docs either match the code or they don't.

## Where the evidence is far more cautious

- A 2025 METR (a nonprofit that studies AI model capabilities and risk) randomized controlled trial of experienced open-source developers found they completed real-world coding tasks **19% slower** using current AI tools. Afterward, those same developers estimated, on average, that the tools had made them **~20% faster**. The gap between what they felt and what was actually measured is the main finding here, not just the slowdown itself.
- Industry surveys report about 93% adoption of AI tools, but measured output gains closer to only about 10%. This suggests a lot of that adoption isn't yet turning into more work getting done. A likely reason: time spent reviewing tool output, setting up context, and fixing tool mistakes eats into the raw speed of generating code.
- How much a tool helps depends heavily on the task. Work that's ambiguous, involves a large amount of context, or touches an unfamiliar codebase shows the smallest gains, sometimes even a net loss, once you count time spent reviewing and correcting the output.

## What explains the gap — and how this framework addresses it

- Tool output that goes unreviewed and turns out to be wrong costs more than it saved. That's why [risk-tiering](04-governance-risk-tiers.md) exists: it keeps review effort proportional to actual risk, instead of applying blanket caution everywhere or blanket trust everywhere.
- Poor spec quality (a spec is the written description of what needs to be built) is the single biggest cause of wasted tool cycles. The ["verifiable done" test](03-phases/requirements-spec.md) exists specifically to stop the rework loop that erases any savings.
- The real bottleneck is usually context setup and review time, not how fast the tool generates code. That's why [context engineering](01-principles.md#4-context-is-engineered-not-assumed) and [evals](03-phases/testing-qa.md) (evals are structured tests that check whether a tool's output is actually correct) are treated as required infrastructure here, not optional extras.

## Practical planning estimate

| Task Profile | Realistic Effort Reduction | Confidence |
|---|---|---|
| Bounded, well-tested, familiar code (Tier 1–2) | 30–50% | High — consistent across vendor and independent reports |
| QA/test generation, documentation | 40–60% | High — directly verifiable outputs |
| Novel feature work in unfamiliar/complex codebase | 0–15%, occasionally negative without process | Low — METR RCT found net slowdown here without disciplined review |
| High-risk/regulated changes (Tier 3–4) | 10–20% (review time dominates) | Medium — gate overhead is intentional, not a flaw |

**Bottom line:** plan your budgets around the task-profile ranges above, not a single org-wide average number. Teams that see 30–55% gains are usually doing more than installing a tool — they're also applying good process: clear specs, risk-tiered gating, and evals.

## Sources to check when refreshing this section

- METR developer productivity studies (metr.org/research)
- Vendor-published productivity studies (treat these as an upper bound, not the typical case)
- Your own [metrics](06-metrics.md) — these are the only figures that actually apply to your team
