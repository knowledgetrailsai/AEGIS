# Worked Example: Making a Spec Agent-Actionable

## Before (not agent-actionable)

> "Improve search so it feels faster and gives better results."

Problems: no measurable threshold, "feels" and "better" aren't testable, no out-of-scope boundary, no acceptance criteria an agent (or a reviewer) can check against.

## After (agent-actionable)

**Goal:** Reduce perceived search latency and improve result relevance for the product catalog search endpoint.

**Functional requirements:**
- Add result caching for the top 500 most frequent queries (rolling 7-day window)
- Re-rank results using existing relevance-score field before returning

**Constraints:**
- p95 response latency must not increase for uncached queries
- No change to the public API contract (request/response shape unchanged)

**Acceptance criteria:**
- [ ] p95 latency for cached queries < 50ms (measured via existing latency eval harness)
- [ ] Relevance eval score ≥ 0.85 on the labeled test set (`evals/search_relevance.json`)
- [ ] No regression on existing API contract tests

**Out of scope:**
- Changing the relevance-scoring algorithm itself
- Any change to the search UI

**Risk tier:** 2 — reversible, moderate blast radius (shared search endpoint), full test coverage exists.

This is the level of specificity Section [requirements-spec.md](../docs/03-phases/requirements-spec.md) asks for — a reviewer or an agent can independently verify "done" from this text alone.
