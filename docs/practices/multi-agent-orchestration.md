# Practice: Multi-Agent Orchestration

Multi-agent orchestration means breaking a task into separate sub-agents, such as a planner, a coder, a reviewer, and a verifier, that each do their part and pass structured output to the next one. This is different from having one agentic coding tool do everything itself. One key piece is adversarial verification: a second tool whose whole job is to try to disprove the first tool's output, not to rubber-stamp it.

## Why it exists

A single agentic coding tool grading its own work has a blind spot. Whatever mistake it made while generating the output, it's likely to make the same mistake again while reviewing that output. Splitting the work across roles, and especially having a dedicated adversarial verifier, catches a different class of error than self-review can.

## How to do it

1. **Split by role, not by chopping the task into arbitrary chunks.** A planner/executor/verifier split works because each role genuinely has a different objective: propose, do, or disprove. Splitting for its own sake doesn't add anything.
2. **Use adversarial verification for Tier 3 and higher changes.** Give a second tool instance the first tool's claimed-correct output, and prompt it specifically to find why the output is wrong, not to confirm that it's right. When it's unsure, it should default to "refuted" rather than "confirmed."
3. **Pass structured output between tools, not a free-text summary.** A verifier tool needs the actual diff, claim, and evidence. A paraphrase can drop exactly the detail that mattered.
4. **Isolate each sub-agent's work.** See [worktree-sandbox-isolation.md](worktree-sandbox-isolation.md), so that running several tools at once doesn't introduce its own risk of them clobbering each other.

## Common failure modes

- A "verifier" tool that's really just re-running the same prompt and reading back its own output. That gives you no genuine independence and no real verification value.
- Applying orchestration overhead to Tier 1 tasks, where a single tool pass was already enough. This adds cost without reducing any real risk.
- No clear final arbiter. When the planner, coder, and verifier disagree, someone, whether a human or a designated tool, needs to own the tie-break decision.

## Signal you're doing this right

Adversarial verification catches a meaningful share of errors that would otherwise have looked plausible and made it past human review. If the verifier never disagrees with the original tool, it isn't contributing independent judgment.
