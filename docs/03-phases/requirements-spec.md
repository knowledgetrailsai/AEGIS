# Phase: Requirements & Spec

> Full deep-dive: [docs/practices/spec-driven-development.md](../practices/spec-driven-development.md)

## How to

1. Write the spec agents will act on, not just what humans will read: goal/context, functional requirements, explicit constraints (performance, security, style), testable acceptance criteria, and an explicit out-of-scope list.
2. Apply the **verifiable done** test — rewrite vague criteria ("improve search") into measurable ones ("p95 query latency < 200ms; relevance eval score ≥ 0.85 on the labeled test set").
3. Version the spec alongside the code. Spec changes are reviewable diffs, since the spec is what future agent tasks and regenerations are graded against.
4. Use [templates/spec-template.md](../../templates/spec-template.md) as the starting structure; don't skip the out-of-scope section — it's what stops agent scope creep.

## Anti-patterns

- A spec that's really just the original feature request, unedited — ambiguity in the request becomes ambiguity in the output.
- Acceptance criteria that require human judgment to evaluate ("looks good", "feels fast") instead of a measurable threshold.
- No out-of-scope section — the agent will "helpfully" touch adjacent code you didn't ask it to.

## Signal you're doing this right

A reviewer unfamiliar with the request can read the spec alone and know exactly what "done" looks like — same bar the agent is held to.
