# Practice: Evals

Evals are test suites for how an agentic coding tool behaves, written and run the same way you'd write unit tests. An eval checks that the tool does the right thing, not just that the code compiles. Evals run in CI (continuous integration, the automated pipeline that checks changes before they ship) and block a tool or prompt change from shipping if it fails.

## Why it exists

A code-level test checks the output artifact: the file, the function, the result. An eval checks the tool's decision-making across a whole class of task. That distinction matters because the same tool workflow runs over and over on different inputs. You need confidence that it generalizes, not just that it got one particular case right.

## How to build a suite

1. **Define the behavior you're testing.** Don't write "the agentic coding tool writes good code." Write something specific, like: "given a bug report with a stack trace, the tool's proposed fix addresses the actual root cause, not just the symptom."
2. **Write input/expected-output pairs.** Use real or realistic examples, each with a clear pass/fail or scored outcome. Don't grade on vibes.
3. **Automate the scoring.** A human-graded eval doesn't scale and doesn't belong in CI. Use a programmatic check instead: does the output match a schema, pass a test, or hit a numeric threshold. Or use a second model as a grader, with an explicit rubric it follows.
4. **Wire evals into CI as a hard gate.** See [ci-eval-gate.yml](../../.github/workflows/ci-eval-gate.yml). A drop in eval score should block a merge the same way a failing unit test does.
5. **Set a coverage bar before granting a workflow more autonomy.** Don't move a workflow to Tier 1 (the autonomy tier that runs with minimal oversight) until its eval coverage is good enough that a regression would actually get caught.

## Common failure modes

- Writing tests based on what the agentic coding tool actually did, rather than what it should have done. This can bake the same bug into both the code and the test that's supposed to catch it. Write evals independently of the specific implementation you're grading.
- Not tracking regressions over time. A single green run doesn't tell you whether quality is drifting across prompt or model changes.
- Treating "the agentic coding tool wrote tests" as the same thing as "the behavior is verified." It isn't (see [testing-qa.md](../03-phases/testing-qa.md)).

## Signal you're doing this right

The override/rejection rate (see [metrics](../06-metrics.md), how often a human overrides or rejects the tool's output) goes down as eval coverage for a given workflow goes up. If it doesn't, your evals aren't measuring the same things human review is catching.
