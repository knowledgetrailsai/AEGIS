# Phase: Requirements & Spec

> Deep dive: [spec-driven development](../practices/spec-driven-development.md)

## What this phase does

This phase turns a request into a clear contract (a spec, short for specification: a written description of what needs to be built and how to know it works). A good spec removes guesswork for both the agentic coding tool and the reviewer.

## Before you start: is the request actually ready for a spec?

Sometimes a request is genuinely ambiguous, or it's a greenfield project (brand new work with no existing code to build on), or it's still exploratory. If that's the case, and the request isn't just under-written, don't jump straight to method step 1 below. Instead, run the exploratory/ideation flow from [process-scaling.md](../practices/process-scaling.md) first. That flow has the agentic coding tool propose a few distinct approaches, evaluate them, and converge on one direction. It is worth spending ten minutes diverging first, because a confident, well-formed spec written for the wrong approach still leads you to the wrong place. Most requests are bounded and well understood already, so most of the time you can skip this and start at step 1 directly.

## Method

1. Write the goal in plain language.
2. List the functional requirements.
3. Add explicit constraints for performance, security, style, and compatibility.
4. Define acceptance criteria that can be checked.
5. State what is out of scope.
6. Assign a risk tier.

## Tool support

- Use Claude Code, Cursor, Kiro, or OpenAI Codex CLI to turn a rough request into a first-pass spec.
- Use the agentic coding tool to find missing constraints and edge cases.
- Use a human reviewer to approve the final scope and acceptance criteria.

## Best practices

- Start from [templates/spec-template.md](../../templates/spec-template.md).
- Make acceptance criteria measurable.
- Include examples when they reduce ambiguity.
- Keep the spec close to the code so changes stay reviewable.
- Treat the spec as the source of truth for the work.
- Ask the agentic coding tool to rewrite vague language into measurable criteria.

## Common mistakes

- Copying the original request without clarifying it
- Using subjective criteria like “make it better”
- Leaving out non-goals
- Writing a spec that only the original requester can interpret
- Writing a confident, well-formed spec before the underlying approach has actually been decided

## Done means

A reviewer who did not write the request can read the spec and know exactly what success looks like.
