# Worked Example: Architecture & Design

Continues from [spec-before-after.md](spec-before-after.md). The spec is approved, at Tier 2, for adding a caching layer to the product catalog search endpoint.

## Prompt given to the tool

> Given this spec (`docs/../spec.md`), propose 2–3 architecture options for adding a caching layer to the `/search` endpoint. For each option, note: where the cache lives (app-layer vs. CDN vs. dedicated cache service), the invalidation strategy, and the blast radius if the cache misbehaves. Don't change the public API contract. Per `docs/02-patch-vs-regenerate.md`, flag whether this should be a patch to the existing search service or a regenerated component, and say why.

## Tool output

| Option | Where it lives | Invalidation | Blast radius if it misbehaves |
|---|---|---|---|
| In-process LRU cache | Inside the search service process | TTL only | Low — contained to one service instance, clears on restart |
| Redis-backed cache | Dedicated cache service, shared across search instances | TTL + explicit invalidation hook | Moderate — shared state across instances, but isolated from the search service's own failure modes |
| CDN edge cache | CDN layer in front of the API | TTL, coarse-grained purge only | High — hard to purge selectively, risks caching personalized or near-real-time data by mistake |

**Recommendation:** Redis-backed cache. It is the only option that supports the spec's need for explicit invalidation without the higher blast radius that comes with a CDN.

**Patch, not regenerate.** The search service is stateful, carries production traffic, and has existing git history that the on-call team relies on. The caching layer adds to an existing component. It isn't a bounded, spec-complete piece that would be better rebuilt from scratch.

## Human gate

Design review, with the tool's three options on screen. The engineer picks the Redis-backed option, then pushes back on the invalidation strategy: TTL-only (meaning the cache just expires entries after a fixed time) would violate the "no stale prices for more than N minutes" constraint. That constraint came up in requirements discussion but hadn't yet made it into the written spec. The tool is asked to add an explicit-invalidation hook triggered by the existing price-sync event. The spec is updated to state that constraint explicitly before development starts. This closes a gap the design step surfaced, per [principle 3: spec is the contract](../docs/01-principles.md#3-spec-is-the-contract).

## Outcome

ADR-0032 (`docs/adrs/0032-search-cache-redis.md` in a real repo — see [adr-template.md](../templates/adr-template.md)) records the decision: Redis-backed cache, patch not regenerate, explicit invalidation on price-sync completion. The spec is amended with the invalidation constraint. Both are committed together before any implementation branch is opened. That means development starts from a design that has already been through one round of human correction, not from the tool's first draft.
