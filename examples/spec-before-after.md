# Worked Example: Making a Spec Tool-Actionable

## Before (not tool-actionable)

> "Improve search so it feels faster and gives better results."

The problem with this spec: it has no measurable threshold. Words like "feels" and "better" can't be tested. It doesn't say what's out of scope. And it gives no acceptance criteria that an agentic coding tool (or a human reviewer) can check against.

## After (tool-actionable)

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

This is the level of detail Section [requirements-spec.md](../docs/03-phases/requirements-spec.md) asks for. From this text alone, a reviewer or an agentic coding tool can independently check whether the work is "done."
