# Practice: Tool / Function-Calling Design

Designing the tools an agent has access to — their names, schemas, error messages — like API design, because bad tool design causes bad agent behavior.

## Why it exists

An agent can only act as well as its tools let it. A tool with an ambiguous name, an underspecified schema, or an unhelpful error message doesn't just fail once — it produces the same class of mistake repeatedly, because the agent has no better information to correct course with.

## How to do it

1. **Name tools for what they do, precisely.** `update_user` vs. `update_user_email` — vague names invite the agent to use the wrong tool or misuse the right one.
2. **Write strict schemas.** Required vs. optional fields, explicit types, enums instead of free text where the valid values are known — this is the same discipline as designing a public API.
3. **Make error messages actionable.** "Invalid input" tells the agent nothing. "email field must be a valid address; received an empty string" tells it exactly what to fix.
4. **Design for least privilege.** A tool that can do more than the task requires is a bigger blast radius than necessary — see [governance-risk-tiers.md](../04-governance-risk-tiers.md); the tool's own permissions should already reflect the risk tier of what it can do.
5. **Load tools lazily/scoped to the task** where possible — a smaller, relevant tool set reduces the chance of an agent picking the wrong tool out of a large, loosely related set.

## Common failure modes

- Exposing an internal API to an agent unchanged, without adapting names/docs for a consumer that can't ask a colleague "what does this actually do."
- Overly generic tools (`run_command`) that give an agent too much surface area for both mistakes and risk classification purposes.
- Error messages copy-pasted from internal logging — written for an engineer debugging a stack trace, not for an agent trying to self-correct.

## Signal you're doing this right

When an agent's first attempt fails, its second attempt — informed only by the error message — succeeds, without a human needing to explain the fix.
