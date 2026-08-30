# Worked Examples: One Feature, Every Phase

These seven pages follow a single feature through every phase in [docs/03-phases/](../docs/03-phases/README.md), in order. The feature is a caching layer for the product catalog search endpoint. Each page shows the actual prompt given to the agentic coding tool, what the tool produced, the human check that was applied (or wasn't needed), and the outcome. Read them in order to see how the risk-tier and human-in-the-loop rules from the rest of this repo play out on one real change, start to finish. This is not just abstract policy — it's the policy in action.

The scenario stays at Tier 2 for most of its life (that means the change is reversible and has a moderate blast radius, or scope of impact, if something goes wrong). There is one Tier 1 moment in production support. This mix is intentional: most real work lives at Tier 1–2, and that's where this repo's governance model earns its keep.

| Phase | Example | What it shows |
|---|---|---|
| Requirements & Spec | [spec-before-after.md](spec-before-after.md) | Turning a vague request into a spec that passes the "verifiable done" test |
| Architecture & Design | [02-design-example.md](02-design-example.md) | Prompting for design options, the patch-vs-regenerate call, and the resulting ADR (architecture decision record) |
| Development | [03-development-example.md](03-development-example.md) | Plan-then-execute, with a human approving the plan before any code is written |
| Code Review | [04-code-review-example.md](04-code-review-example.md) | Tool-assisted diff review catching out-of-scope drift before a human approves |
| Testing & QA | [05-testing-qa-example.md](05-testing-qa-example.md) | Generating tests and evals directly from the spec's acceptance criteria |
| Deployment & Release | [06-deployment-example.md](06-deployment-example.md) | Tool-drafted release notes and rollback plan, with a human triggering the release |
| Production Support | [07-production-support-example.md](07-production-support-example.md) | Incident triage, a second-pass check on the tool's hypothesis, and a Tier 1 mitigation |

## How to use these

Don't copy the prompts word for word. Copy the shape instead: state the constraint (scope, contract, risk tier), ask for a plan or options before execution, and say what "done" looks like in the same message. Every example ties back to the spec and ADR established in the first two pages. That's what makes the later prompts short: the tool doesn't need scope re-explained every time, because it's already written down.
