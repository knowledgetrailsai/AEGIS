# Phase: Testing & QA

## How to

1. Build an evals suite before trusting agent autonomy on a code path: input/expected-output pairs, automated scoring, wired into CI as a hard gate (see [.github/workflows/ci-eval-gate.yml](../../.github/workflows/ci-eval-gate.yml)).
2. Use agents to generate and self-heal tests, but require human approval on any *new* acceptance criteria the agent proposes — don't let the agent grade its own homework unsupervised.
3. For higher-stakes changes, use adversarial verification: a second agent instance tries to disprove the first agent's claim of correctness before it ships.

## Anti-patterns

- Treating "the agent wrote tests" as equivalent to "the behavior is verified" — tests an agent wrote to match its own implementation can encode the same bug twice.
- No eval coverage gate in CI — autonomy granted on vibes instead of measured pass rate.

## Signal you're doing this right

Rejection/override rate (see [metrics](../06-metrics.md)) is tracked per agent workflow, and a rising rate triggers a spec or context fix — not just more manual review.
