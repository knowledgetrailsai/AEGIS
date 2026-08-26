# Practice: Evals

Test suites for agentic coding tool *behavior*, written and run the same way you'd write unit tests — verifying the agentic coding tool does the right thing, not just that the code compiles. Evals become part of CI, gating agentic coding tool/prompt changes before they ship.

## Why it exists

A code-level test verifies the output artifact. An eval verifies the tool's *decision-making* on a class of task — which matters because the same tool workflow runs repeatedly on different inputs, and you need confidence it generalizes, not just that it got one instance right.

## How to build a suite

1. **Define the behavior you're testing.** Not "the agentic coding tool writes good code" — something specific: "given a bug report with a stack trace, the tool's proposed fix addresses the actual root cause, not just the symptom."
2. **Write input/expected-output pairs.** Real or realistic examples, with a clear pass/fail or scored outcome — not vibes-based grading.
3. **Automate scoring.** A human-graded eval doesn't scale and doesn't belong in CI. Use programmatic checks (does the output match a schema, pass a test, hit a threshold) or a second model as a grader with an explicit rubric.
4. **Wire into CI as a hard gate** — see [ci-eval-gate.yml](../../.github/workflows/ci-eval-gate.yml). A regression in eval score should block merge the same way a failing unit test does.
5. **Set a coverage bar before granting higher autonomy.** Don't move a workflow to Tier 1 autonomous status until its eval coverage is high enough that a regression would actually get caught.

## Common failure modes

- Tests the agentic coding tool wrote to match its own implementation — this can encode the same bug into both the code and the test. Evals should be authored independently of the specific implementation being graded.
- No regression tracking over time — a single green run doesn't tell you if quality is drifting across prompt/model changes.
- Treating "the agentic coding tool wrote tests" as equivalent to "the behavior is verified" (see [testing-qa.md](../03-phases/testing-qa.md)).

## Signal you're doing this right

Override/rejection rate (see [metrics](../06-metrics.md)) tracks downward as eval coverage goes up for a given workflow — if it doesn't, the evals aren't actually measuring what review is catching.
