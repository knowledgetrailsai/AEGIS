# Practice: Tool / Function-Calling Design

Design the tools an agentic coding tool has access to (their names, schemas, error messages) the same careful way you'd design a public API. Bad tool design causes bad tool behavior.

## Why it exists

An agentic coding tool can only act as well as its tools let it. A tool with an ambiguous name, an underspecified schema (the definition of what inputs a tool expects), or an unhelpful error message doesn't just fail once. It produces the same kind of mistake over and over, because the tool has no better information available to correct itself with.

## How to do it

1. **Name tools for exactly what they do.** Compare `update_user` to `update_user_email`. A vague name invites the agentic coding tool to pick the wrong tool, or to misuse the right one.
2. **Write strict schemas.** Mark fields as required or optional, use explicit types, and use enums (a fixed list of allowed values) instead of free text wherever the valid values are already known. This is the same discipline you'd use designing a public API.
3. **Make error messages actionable.** "Invalid input" tells the agentic coding tool nothing useful. "email field must be a valid address; received an empty string" tells it exactly what to fix.
4. **Design for least privilege.** A tool that can do more than the task requires creates a bigger blast radius than necessary. See [governance-risk-tiers.md](../04-governance-risk-tiers.md) — a tool's own permissions should already match the risk tier of what it's capable of doing.
5. **Load tools lazily, scoped to the task, where you can.** A smaller, more relevant tool set reduces the chance the agentic coding tool picks the wrong tool out of a large, loosely related set.

## Common failure modes

- Exposing an internal API to an agentic coding tool unchanged, without adapting its names and docs for a consumer that can't just ask a colleague "what does this actually do?"
- Overly generic tools, like a single `run_command` tool, that give the agentic coding tool too much surface area both for making mistakes and for classifying risk.
- Error messages copy-pasted straight from internal logging: written for an engineer debugging a stack trace, not for a tool trying to correct itself.

## Signal you're doing this right

When a tool's first attempt fails, its second attempt, informed only by the error message, succeeds, with no human needing to explain the fix.
