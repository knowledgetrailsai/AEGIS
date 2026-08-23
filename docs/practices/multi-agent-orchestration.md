# Practice: Multi-Agent Orchestration

Breaking a task into sub-agents (planner, coder, reviewer, verifier) that pass structured output to each other rather than one agent doing everything. Includes adversarial verification: a second agent's job is to try to disprove the first agent's output.

## Why it exists

A single agent grading its own work has a blind spot: whatever mistake it made in generating the output, it's likely to miss on self-review too. Splitting roles — and especially having a dedicated adversarial verifier — catches a different class of error than self-review does.

## How to do it

1. **Split by role, not by arbitrary task chunking.** A planner/executor/verifier split works because each role has a genuinely different objective (propose, do, disprove) — not because splitting itself adds value.
2. **Use adversarial verification for Tier 3+ changes**: a second agent instance, given the first agent's claimed-correct output, is prompted specifically to find why it's wrong — not to confirm it's right. Default to "refuted" on uncertainty rather than "confirmed."
3. **Pass structured output between agents**, not free-text summaries — a verifier agent needs the actual diff/claim/evidence, not a paraphrase that can drop important detail.
4. **Isolate each sub-agent's work** — see [worktree-sandbox-isolation.md](worktree-sandbox-isolation.md) — so orchestration doesn't introduce its own collision risk.

## Common failure modes

- A "verifier" agent that's really just re-running the same prompt and reading its own output back — no genuine independence, no real verification value.
- Orchestration overhead applied to Tier 1 tasks where a single agent pass was already sufficient — added cost with no corresponding risk reduction.
- No clear final arbiter — when the planner, coder, and verifier disagree, someone (human or a designated agent) needs to own the tie-break.

## Signal you're doing this right

Adversarial verification catches a meaningful fraction of otherwise-plausible-looking errors before they reach human review — if the verifier never disagrees with the original agent, it isn't adding independent judgment.
