# Practice: Memory / State Persistence

Agents maintaining durable memory across sessions — not just within one conversation — so they don't relearn the same facts every time. Raises new questions around what's safe to persist vs. what should stay ephemeral.

## Why it exists

Re-establishing context from scratch every session is wasted effort for anything that's genuinely durable (team conventions, prior architectural decisions, recurring task patterns). But not everything belongs in persistent memory — some context is task-specific and should expire.

## How to do it

1. **Separate durable facts from task-scoped context.** Team conventions, repo architecture, and standing preferences belong in persistent memory or the [context-engineering](context-engineering.md) instructions file. A specific bug's stack trace does not.
2. **Write to memory deliberately, not by default.** Persisting everything an agent sees creates noise that degrades future retrieval quality — curate the same way you'd curate any other context.
3. **Apply the same governance lens to what gets persisted as to any other agent action** — memory that includes sensitive data (credentials, customer PII) needs the same escalation handling as any Tier 3+ action (see [governance-risk-tiers.md](../04-governance-risk-tiers.md)).
4. **Version or timestamp persisted facts** so stale ones can be identified and pruned — a memory system with no decay mechanism accumulates the same staleness problem as an unmaintained context file.
5. **Make persisted memory auditable.** For any regulated or sensitive workflow, be able to answer "what does the agent remember about X, and where did that come from."

## Common failure modes

- Persisting raw conversation logs indiscriminately instead of extracted, curated facts — this bloats retrieval and can leak sensitive data forward into contexts where it doesn't belong.
- No mechanism to correct or delete a wrong memory once written — a bad fact persists and quietly corrupts every future task that retrieves it.
- Treating memory as a substitute for a proper spec or context file, rather than a complement to them.

## Signal you're doing this right

An agent picking up a task days or weeks later behaves as if briefed by a colleague who remembers the relevant history — without carrying forward stale or sensitive detail it shouldn't have kept.
