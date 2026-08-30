# Phase: Architecture & Design

## What this phase does

This phase decides how the system should be shaped before implementation (the actual coding) starts. The goal is to make the change easy to build. It should also be easy to review, and safe to change further later on.

## Method

1. Identify the boundary of the change.
2. Decide what belongs together and what should be isolated.
3. Record major decisions in an ADR (architecture decision record: a short document explaining a decision and why you made it).
4. Define interfaces, contracts, and failure modes.
5. Decide which pieces should be patched and which can be regenerated.

## Tool support

- Use Claude Code, Cursor, Kiro, or Windsurf to sketch design options and summarize existing modules.
- Use the agentic coding tool to compare tradeoffs, coupling, and contract risk.
- Use a human reviewer to choose the final architecture and record it in an ADR.

## Best practices

- Write an ADR for any decision that changes behavior, ownership, contracts, or risk.
- Favor small modules with clear names and clear inputs and outputs.
- Use strong typing and descriptive errors when possible.
- Design tool and API surfaces so an agentic coding tool can recover from a failed call.
- Apply [patch-vs-regenerate](../02-patch-vs-regenerate.md) early, not after implementation starts.
- Ask the agentic coding tool to list failure modes before the design is frozen.

## Common mistakes

- Large modules with hidden shared state
- Interfaces that humans can easily improvise around, but that are hard for agentic coding tools to use safely
- Treating design notes as optional
- Designing for implementation speed only, not long-term maintenance
