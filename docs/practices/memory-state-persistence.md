# Practice: Memory / State Persistence

Store only the facts the agentic coding tool will actually need again later. Not everything from a task is worth keeping.

## When to use it

- recurring team conventions
- stable architecture decisions
- repeated workflow preferences
- long-lived project memory

## What to store

- repo conventions
- architecture decisions
- stable tool preferences
- recurring task patterns

## What not to store

- raw conversation logs
- one-off bug traces
- secrets
- customer PII
- temporary troubleshooting detail

## How to do it

1. Pull out the specific facts worth keeping, instead of storing everything that happened.
2. Version or timestamp each fact, so you know when it was true and whether it might be outdated.
3. Set a review or decay policy: a point where a fact gets checked again or expires.
4. Make memory auditable, so anyone can see what's stored and where it came from.
5. Apply the same risk tiering you'd apply to any other sensitive action.

## Good memory example

- `use spec template v2 for all Tier 2+ changes`
- `service X requires ADR before contract changes`

## Bad memory example

- entire chat history
- copied logs
- old assumptions with no date

## Review checklist

- Is this fact durable, or will it stop being true soon?
- Is it safe to keep?
- Can it expire?
- Can it be traced back to where it came from?
- Can it be corrected or removed later?

## Output artifact

A small, curated memory store that helps with the next task, instead of burying it in noise.
