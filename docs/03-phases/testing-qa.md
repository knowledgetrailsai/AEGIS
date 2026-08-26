# Phase: Testing & QA

> Deep dive: [evals](../practices/evals.md)

## What this phase does

This phase proves the change works. Tests verify the code. Evals verify the tool behavior. Both matter.

## Method

1. Add tests for the changed behavior.
2. Add or update evals for the tool workflow when the work is tool-assisted.
3. Put the checks into CI.
4. Review any new acceptance criteria before they become official.
5. Use a second pass or second tool for higher-risk changes.

## Tool support

- Use Claude Code, Cursor, or GitHub Copilot app / agents to generate tests from the spec.
- Use eval tooling or a second tool to check repeatable tool behavior.
- Use CI to make the checks run the same way every time.

## Best practices

- Build the eval suite before increasing autonomy on a code path.
- Use input and expected-output pairs when the behavior can be described clearly.
- Automate scoring where possible.
- Require human approval for new acceptance criteria.
- Add adversarial verification when the change is high stakes.
- Ask the agentic coding tool to propose missing coverage, then verify it with the test harness.

## Common mistakes

- Treating “the agentic coding tool wrote tests” as proof of correctness
- Letting evals stay manual when they should be automated
- Moving autonomy ahead of coverage
- Ignoring repeated review or QA failures
