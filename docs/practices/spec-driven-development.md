# Practice: Spec-Driven Development

Write a detailed spec first. The agentic coding tool implements against it and gets graded against it. The spec is the source of truth, not the conversation that led to it.

## Why it exists

Agentic coding tools don't share context the way a teammate who sat in every meeting does. A vague request, like "improve search," gets interpreted differently every time you run it. A spec that passes the **verifiable done** test, meaning a reviewer could confirm the work is complete from the spec text alone, removes that ambiguity for both the tool and the human reviewing its output.

## How to write one

Use [templates/spec-template.md](../../templates/spec-template.md). These are the sections that matter most:

1. **Goal & context** — one paragraph, with no ambiguity about *why* the work is happening.
2. **Functional requirements** — what must exist, written as discrete items, not as prose.
3. **Explicit constraints** — performance, security, style. A human will usually infer something like "don't break the public API" without being told. An agentic coding tool won't, unless it's written down.
4. **Acceptance criteria, and they must be testable.** This is the single highest-leverage section. Reject any criterion that needs human judgment to check, like "looks good" or "feels fast," and replace it with a measurable threshold instead, like "p95 latency under 200ms" or "eval score at or above 0.85 on the labeled set."
5. **Out of scope.** Without this section, agentic coding tools will "helpfully" touch adjacent code you didn't ask them to touch. This section is what keeps a bounded task actually bounded.

See [examples/spec-before-after.md](../../examples/spec-before-after.md) for a real before-and-after rewrite.

## Common failure modes

- **The spec is just the ticket, unedited.** If the original feature request was ambiguous, pasting it straight into the spec field only relocates the ambiguity. It doesn't remove it.
- **Untestable acceptance criteria.** "Should be more maintainable" isn't something you can grade. Ask yourself: what would I actually go check to confirm this is true?
- **No out-of-scope section.** This is the most common reason a tool's diff touches 30 files when you expected 3.
- **A spec written once and never versioned.** Specs should be reviewable diffs, the same as the code they govern. See [Principle 3](../01-principles.md#3-spec-is-the-contract).

## When spec-driven development is worth the overhead

High-value: any Tier 2 or higher change (see [governance](../04-governance-risk-tiers.md)), anything bigger than a one-file fix, and anything where "what does done mean" is even slightly unclear.

Low-value, skip the ceremony: Tier 1 mechanical changes, like formatting or dependency bumps, where the diff itself already is the spec.

## Relationship to other practices

A good spec is what [evals](evals.md) get written against. It's what [context engineering](context-engineering.md) curates supporting material for. And it's what a [plan-then-execute](plan-then-execute.md) review checks the tool's plan against before execution starts.
