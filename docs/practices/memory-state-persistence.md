# Practice: Memory / State Persistence

Persist only the facts the agent will actually need again.

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

1. Extract facts instead of storing everything.
2. Version or timestamp facts.
3. Set a review or decay policy.
4. Make memory auditable.
5. Apply the same risk tiering as any other sensitive action.

## Good memory example

- `use spec template v2 for all Tier 2+ changes`
- `service X requires ADR before contract changes`

## Bad memory example

- entire chat history
- copied logs
- old assumptions with no date

## Review checklist

- Is this fact durable?
- Is it safe to keep?
- Can it expire?
- Can it be traced back to a source?
- Can it be corrected or removed?

## Output artifact

A small, curated memory store that helps the next task without polluting it.
