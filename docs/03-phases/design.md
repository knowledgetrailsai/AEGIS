# Phase: Architecture & Design

## How to

1. Produce an ADR ([templates/adr-template.md](../../templates/adr-template.md)) for any agent-impacting design choice — module boundaries, data contracts, tool/API surface — so agents and humans share the same reasoning trail.
2. Design for "agent legibility": strong typing, descriptive errors, small well-named modules. The same properties that help a new hire onboard help an agent reason correctly.
3. Apply the [patch-vs-regenerate rubric](../02-patch-vs-regenerate.md) per component during design, not after — it changes how you draw module boundaries (isolate the regenerate-friendly pieces behind a clean interface).
4. Design the tool/function-calling surface an agent will use like an API: clear names, strict schemas, error messages that tell the agent what to do differently — not just that it failed.

## Anti-patterns

- Monolithic modules with implicit cross-cutting state — agents (and humans) can't reason locally about them.
- Tool interfaces with vague error messages ("something went wrong") that give an agent nothing to act on.
- Skipping the ADR because "it's obvious" — it's obvious to you today, not to the agent six months from now with no memory of this conversation.
