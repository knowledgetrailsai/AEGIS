# Worked Example: Architecture & Design

Continues from [spec-before-after.md](spec-before-after.md) — spec is approved, Tier 2, for adding a caching layer to the product catalog search endpoint.

## Prompt given to the tool

> Given this spec (`docs/../spec.md`), propose 2–3 architecture options for adding a caching layer to the `/search` endpoint. For each option, note: where the cache lives (app-layer vs. CDN vs. dedicated cache service), the invalidation strategy, and the blast radius if the cache misbehaves. Don't change the public API contract. Per `docs/02-patch-vs-regenerate.md`, flag whether this should be a patch to the existing search service or a regenerated component, and say why.

## Tool output

| Option | Where it lives | Invalidation | Blast radius if it misbehaves |
|---|---|---|---|
| In-process LRU cache | Inside the search service process | TTL only | Low — contained to one service instance, clears on restart |
| Redis-backed cache | Dedicated cache service, shared across search instances | TTL + explicit invalidation hook | Moderate — shared state across instances, but isolated from the search service's own failure modes |
| CDN edge cache | CDN layer in front of the API | TTL, coarse-grained purge only | High — hard to purge selectively, risks caching personalized or near-real-time data by mistake |

**Recommendation:** Redis-backed cache. It's the only option that supports the spec's explicit-invalidation need without CDN-level blast radius. **Patch, not regenerate** — the search service is stateful, carries production traffic, and has existing git history/blame that matters for the on-call team; the caching layer is additive to an existing component, not a bounded, spec-complete rebuild candidate.

## Human gate

Design review with the tool's three options on screen. The engineer picks the Redis-backed option, and pushes back on the invalidation strategy: TTL-only would violate the "no stale prices for more than N minutes" constraint that came up in requirements discussion but wasn't yet in the written spec. The tool is asked to add an explicit-invalidation hook triggered by the existing price-sync event, and the spec is updated to state that constraint explicitly before development starts — closing a gap the design step surfaced, per [principle 3: spec is the contract](../docs/01-principles.md#3-spec-is-the-contract).

## Outcome

ADR-0032 (`docs/adrs/0032-search-cache-redis.md` in a real repo — see [adr-template.md](../templates/adr-template.md)) records the decision: Redis-backed cache, patch not regenerate, explicit invalidation on price-sync completion. The spec is amended with the invalidation constraint. Both are committed together before any implementation branch is opened, so development starts from a design that's already been through one round of human correction — not from the tool's first draft.
