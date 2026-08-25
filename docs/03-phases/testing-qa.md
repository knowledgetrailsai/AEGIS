# Phase: Testing & QA

> Deep dive: [evals](../practices/evals.md)

## What this phase does

This phase proves the change works. Tests verify the code. Evals verify the agent behavior. Both matter.

## Method

1. Add tests for the changed behavior.
2. Add or update evals for the agent workflow when the work is agent-assisted.
3. Put the checks into CI.
4. Review any new acceptance criteria before they become official.
5. Use a second pass or second agent for higher-risk changes.

## Best practices

- Build the eval suite before increasing autonomy on a code path.
- Use input and expected-output pairs when the behavior can be described clearly.
- Automate scoring where possible.
- Require human approval for new acceptance criteria.
- Add adversarial verification when the change is high stakes.

## Common mistakes

- Treating “the agent wrote tests” as proof of correctness
- Letting evals stay manual when they should be automated
- Moving autonomy ahead of coverage
- Ignoring repeated review or QA failures
