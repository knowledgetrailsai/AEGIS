# Practice: Spec-Driven Development

Write a detailed spec first; the agentic coding tool implements against it and is graded against it — the spec is the source of truth, not the conversation that produced it.

## Why it exists

Agentic coding tools don't share context the way a teammate who sat in every meeting does. A vague request ("improve search") gets interpreted differently every run. A spec that passes the **verifiable done** test — a reviewer could confirm completion from the spec text alone — removes that ambiguity for both the agentic coding tool and the human reviewing its output.

## How to write one

Use [templates/spec-template.md](../../templates/spec-template.md). The sections that matter most:

1. **Goal & context** — one paragraph, no ambiguity about *why*.
2. **Functional requirements** — what must exist, stated as discrete items, not prose.
3. **Explicit constraints** — performance, security, style. These are usually invisible to an agentic coding tool unless stated (a human infers "don't break the public API"; an agentic coding tool won't unless it's written down).
4. **Acceptance criteria — must be testable.** This is the single highest-leverage section. Reject any criterion that requires human judgment to evaluate ("looks good," "feels fast") and replace it with a measurable threshold ("p95 latency < 200ms," "eval score ≥ 0.85 on the labeled set").
5. **Out of scope.** Without this, agentic coding tools "helpfully" touch adjacent code. This section is what keeps a bounded task bounded.

See [examples/spec-before-after.md](../../examples/spec-before-after.md) for a real before/after rewrite.

## Common failure modes

- **The spec is the ticket, unedited.** If the original feature request was ambiguous, copy-pasting it into the spec field just relocates the ambiguity — it doesn't remove it.
- **Untestable acceptance criteria.** "Should be more maintainable" isn't gradable. Ask: what would I actually check to confirm this is true?
- **No out-of-scope section.** The most common cause of an tool's diff touching 30 files when you expected 3.
- **Spec written once, never versioned.** Specs should be reviewable diffs alongside the code they govern — see [Principle 3](../01-principles.md#3-spec-is-the-contract).

## When spec-driven development is worth the overhead

High-value: any Tier 2+ change (see [governance](../04-governance-risk-tiers.md)), anything more than a one-file fix, anything where "what does done mean" is even slightly ambiguous.

Low-value / skip the ceremony: Tier 1 mechanical changes (formatting, dependency bumps) where the diff itself is the spec.

## Relationship to other practices

A good spec is what [evals](evals.md) get written against, what [context engineering](context-engineering.md) curates supporting material for, and what a [plan-then-execute](plan-then-execute.md) review checks the tool's plan against before execution starts.
