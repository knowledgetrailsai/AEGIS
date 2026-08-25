# Phase: Requirements & Spec

> Deep dive: [spec-driven development](../practices/spec-driven-development.md)

## What this phase does

This phase turns a request into a clear contract. A good spec removes guesswork for both the agent and the reviewer.

## Method

1. Write the goal in plain language.
2. List the functional requirements.
3. Add explicit constraints for performance, security, style, and compatibility.
4. Define acceptance criteria that can be checked.
5. State what is out of scope.
6. Assign a risk tier.

## Best practices

- Start from [templates/spec-template.md](../../templates/spec-template.md).
- Make acceptance criteria measurable.
- Include examples when they reduce ambiguity.
- Keep the spec close to the code so changes stay reviewable.
- Treat the spec as the source of truth for the work.

## Common mistakes

- Copying the original request without clarifying it
- Using subjective criteria like “make it better”
- Leaving out non-goals
- Writing a spec that only the original requester can interpret

## Done means

A reviewer who did not write the request can read the spec and know exactly what success looks like.
