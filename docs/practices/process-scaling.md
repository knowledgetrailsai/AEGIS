# Practice: Process Scaling (Right-Sizing the Flow)

Process scaling means matching how much ceremony a task gets to how much it actually needs, instead of running every change through the same full sequence of spec, design, plan-review, and multi-stage sign-off no matter how small it is.

## Why it exists

Under-processing risky work is the obvious failure mode, and it's already what this repo's [risk tiers](../04-governance-risk-tiers.md) guard against. The less obvious failure mode is over-processing work that's small and low-risk. Running a full design review and multi-stage approval on a Tier 1 formatting fix doesn't make it any safer. It just adds ceremony with no matching reduction in risk, and erodes the effort savings this repo exists to capture (see [effort-savings-evidence.md](../05-effort-savings-evidence.md)). The fix isn't one single fixed process. It's four recognizable process shapes, chosen by risk tier and task profile rather than by habit.

## The four flow shapes

| Flow | When to use it | What it looks like |
|---|---|---|
| **Quick-fix flow** | Tier 1: reversible, small blast radius, high test coverage | The spec can be a single one-line acceptance criterion. No ADR needed. [Plan-then-execute](plan-then-execute.md) still runs, but the plan itself is short. One merge, spot-audited, with no named reviewer required. |
| **Standard flow** | Tier 2: the default for most feature work | The full sequence as written in [03-phases/README.md](../03-phases/README.md): spec, then design (an ADR only if it changes contracts or boundaries), then plan-then-execute, then review, test, and release. |
| **Exploratory / ideation flow** | Work that's genuinely ambiguous, greenfield, or where the request itself is still fuzzy, regardless of its eventual risk tier | Add a divergence step **before** [requirements-spec.md](../03-phases/requirements-spec.md): have the agentic coding tool propose several distinct approaches, weigh them against constraints and cost, and converge on one brief. Only after that does the standard spec-writing method start. Skipping this step on genuinely ambiguous work is where the METR-style slowdown (see [effort-savings-evidence.md](../05-effort-savings-evidence.md)) tends to show up: that document notes that ambiguous, unfamiliar-codebase work shows the smallest, or even negative, net effect. Jumping straight to a confident plan on fuzzy input gets you a plan that's fast but wrong, not one that's fast and right. |
| **Full-lifecycle flow** | Tier 3–4: hard to reverse, irreversible, or safety-, financial-, or regulatory-critical | Everything in Standard, plus a named approver's sign-off, a documented rollback plan, a staged rollout, and explicit traceability. The PR's spec link, the plan artifact, the commit trailers, and the deploy ticket should all trace back to each other end to end, not just each exist somewhere on their own. |

## How to pick

Base the flow on the [risk tier](../04-governance-risk-tiers.md) of the action, the same way you choose the tier itself. Don't base it on team habit, on "how we always do it," or on how senior the person requesting the change is. The exploratory/ideation flow is the one exception that isn't purely driven by tier: a Tier 1 change can still be exploratory (for example, "try a few approaches to speeding up this one function") and it still deserves the divergence step, even though it will merge with minimal ceremony once a direction is picked.

When you're extending an existing codebase rather than starting from a blank slate, the ideation and design steps should start by detecting the codebase's existing conventions and patterns, not by proposing something from scratch. See the brownfield-first note in [context-engineering.md](context-engineering.md#brownfield-first-detect-before-you-generate).

## Common failure modes

- Running the full-lifecycle flow on Tier 1 work "to be safe." This is over-gating, and it's expensive: review time is a real cost, not a free safety margin.
- Skipping the ideation/divergence step on ambiguous work and letting the agentic coding tool jump straight to a plan. It will produce something that looks confident regardless of whether the underlying framing is actually right, and discovering that later costs more than a short divergence step up front would have.
- Treating the choice of flow as a one-time, project-level decision instead of something you decide per task. A mature team runs a mix of all four flows at once, not one flow applied uniformly across everything.

## Signal you're doing this right

Cycle time for Tier 1 work is visibly and consistently shorter than cycle time for Tier 3–4 work. If the two are roughly the same regardless of risk, that's the tell that process is being applied out of habit rather than by tier.
