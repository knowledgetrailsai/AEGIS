# Worked Example: Testing & QA

Continues from [04-code-review-example.md](04-code-review-example.md). The PR is approved. Now the work is to prove the change actually meets the spec's acceptance criteria before it's allowed to merge.

## Prompt given to the tool

> Generate unit tests for `SearchCacheClient` covering: cache hit, cache miss, eviction at 500 entries under LFU, and TTL expiry. Then update the latency eval to check p95 < 50ms for cached queries only, and re-run the relevance eval (`evals/search_relevance.json`) with caching enabled to confirm the score stays ≥ 0.85, per the spec's acceptance criteria. Wire both evals into the CI eval gate as required checks for this PR.

This follows the tests-vs-evals split described in [testing-qa.md](../docs/03-phases/testing-qa.md): tests check that the code works, and evals check that the tool-assisted workflow still meets the criteria the spec set — not just that the code compiles.

## Tool output

- 12 unit tests covering hit, miss, LFU eviction at the 500-entry boundary, and TTL expiry, matching the plan from the development phase.
- Latency eval updated to separate cached from uncached queries. The spec's acceptance criteria only bound cached-query latency, and the original eval didn't distinguish the two.
- Relevance eval re-run with caching enabled against the labeled test set.
- Diff to [ci-eval-gate.yml](../.github/workflows/ci-eval-gate.yml) adding both evals as required checks on this PR, rather than just informational ones.

## Human gate

The engineer checks that the eval thresholds the tool wired in actually match the spec's numbers (< 50ms p95 cached, ≥ 0.85 relevance), rather than trusting the tool's restatement of them. A five-minute check against the spec text catches any threshold drift before it becomes a CI gate that nobody double-checked. The thresholds match, so it's approved.

## Outcome

CI run: p95 latency for cached queries is **42ms** (spec required < 50ms), and the relevance eval score is **0.87** (spec required ≥ 0.85). The full existing API contract test suite is green. Both new evals pass and are now required checks, so future changes to this code path can't silently regress either number without CI catching it. This is what [05-effort-savings-evidence.md](../docs/05-effort-savings-evidence.md) means by closing the loop: the gain from tool-generated tests is only real once it's checked against the spec's actual numbers, not just "tests were added."
