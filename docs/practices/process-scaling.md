# Practice: Process Scaling (Right-Sizing the Flow)

Matching how much ceremony a task gets to how much the task actually needs — instead of running every change through the same full sequence of spec, design, plan-review, and multi-stage sign-off regardless of size.

## Why it exists

Under-processing risky work is the obvious failure mode this repo's [risk tiers](../04-governance-risk-tiers.md) already guard against. The less obvious failure mode is over-processing bounded, low-risk work: running a full design review and multi-stage approval on a Tier 1 formatting fix doesn't make it safer, it just erodes the effort savings this repo exists to capture (see [effort-savings-evidence.md](../05-effort-savings-evidence.md)) by adding ceremony with no corresponding risk reduction. The fix isn't a single fixed process — it's four recognizable process shapes, picked by risk tier and task profile rather than habit.

## The four flow shapes

| Flow | When to use it | What it looks like |
|---|---|---|
| **Quick-fix flow** | Tier 1 — reversible, low blast radius, high test coverage | Spec can be a one-line acceptance criterion. No ADR. [Plan-then-execute](plan-then-execute.md) still runs, but the plan is short. Single spot-audited merge, no named reviewer required. |
| **Standard flow** | Tier 2 — the default for most feature work | The full sequence as written in [03-phases/README.md](../03-phases/README.md): spec → design (ADR only if it changes contracts/boundaries) → plan-then-execute → review → test → release. |
| **Exploratory / ideation flow** | Work that's genuinely ambiguous, greenfield, or where the request itself is still fuzzy — regardless of eventual risk tier | Adds a divergence step **before** [requirements-spec.md](../03-phases/requirements-spec.md): have the agentic coding tool propose multiple distinct approaches or framings, evaluate them against constraints and cost, and converge on one brief. Only then does the standard spec-writing method start. Skipping this on genuinely ambiguous work is where the METR-style slowdown concentrates — see [effort-savings-evidence.md](../05-effort-savings-evidence.md)'s note that ambiguous, unfamiliar-codebase work shows the smallest or negative net effect; jumping straight to a confident plan on fuzzy input produces a fast, wrong plan, not a fast, right one. |
| **Full-lifecycle flow** | Tier 3–4 — hard to reverse, irreversible, or safety/financial/regulatory critical | Everything in Standard, plus a named-approver sign-off, a documented rollback plan, staged rollout, and explicit traceability: the PR's spec link, the plan artifact, the commit trailers, and the deploy ticket should all be traceable to each other end to end, not just present individually. |

## How to pick

Base the flow on the [risk tier](../04-governance-risk-tiers.md) of the action, the same way tier itself is chosen — not on team habit, not on "how we always do it," and not on how senior the requester is. The exploratory/ideation flow is the one exception that isn't purely tier-driven: a Tier 1 change can still be exploratory (e.g., "try a few approaches to speeding up this one function") and deserves the divergence step even though it'll merge with minimal ceremony once a direction is picked.

When extending an existing codebase rather than starting greenfield, the ideation and design steps should start from detecting the codebase's existing conventions and patterns, not from a blank-slate proposal — see the brownfield-first note in [context-engineering.md](context-engineering.md#brownfield-first-detect-before-you-generate).

## Common failure modes

- Running the full-lifecycle flow on Tier 1 work "to be safe" — this is over-gating, and it's expensive: review time is a real cost, not a free safety margin.
- Skipping the ideation/divergence step on ambiguous work and letting the agentic coding tool go straight to a plan — it will produce something confident-looking regardless of whether the underlying framing is right, and the cost of discovering that later is higher than the cost of a short divergence step up front.
- Treating flow choice as a one-time project-level decision instead of a per-task one — a mature team's tasks are a mix of all four flows running concurrently, not one flow applied uniformly.

## Signal you're doing this right

Cycle time for Tier 1 work is visibly and consistently shorter than cycle time for Tier 3–4 work — not roughly the same regardless of risk, which is the tell that process is being applied by habit rather than by tier.
