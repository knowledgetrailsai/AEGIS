# Practice: Plan-Then-Execute

The agentic coding tool proposes a plan before it touches anything. A human approves or edits that plan before execution starts. This separates "thinking" from "doing," so mistakes get caught before they turn into actual file changes.

## Why it exists

Reviewing a diff (a set of changed code) after the fact means the agentic coding tool has already committed to one interpretation of the task. Undoing a wrong approach costs more than redirecting it before it starts. Reviewing the plan is cheaper than reviewing, and then unwinding, the output.

## How to do it

1. **Require a plan artifact for anything above Tier 1** (see [governance](../04-governance-risk-tiers.md)). This should be a short, concrete list of the files and modules the tool intends to touch and the approach it will take, not just a restatement of the spec.
2. **Let the plan surface clarifying questions instead of silent assumptions.** If the spec leaves a choice undetermined that the tool has to make in order to produce a plan at all, the plan should say so explicitly and ask, rather than picking an answer silently and hoping it matches what the requester meant. A plan with an open question in it is more useful than a confident plan built on a guess. Answer the question, then re-approve.
3. **Review the plan against the spec's acceptance criteria and its out-of-scope list**, not against your own mental picture of the task. The spec is the shared contract both sides are working from (see [spec-driven-development.md](spec-driven-development.md)).
4. **Approve, edit, or reject the plan before execution starts.** If you edit it, send the edited version back to the tool as the new instruction. Don't quietly override it mid-execution instead.
5. **Reserve unreviewed autonomous execution for Tier 1 actions only:** well-covered by tests, reversible, and with a small blast radius if something goes wrong.

## Common failure modes

- Treating the plan step as a formality and rubber-stamping it. This defeats the purpose. The review has to actually catch misinterpretations, or it isn't doing anything.
- Approving a plan that's vague enough to hide several possible implementations. Push back and ask for specifics before you approve it.
- A plan that quietly resolves an ambiguous point instead of flagging it. This looks exactly like a correct plan right up until it isn't, and by then you're unwinding a diff instead of just answering a question.
- Letting execution start on a Tier 2 or higher action with no plan step at all, because "the tool is usually right." This is exactly the pattern that erodes the effort savings (see [effort-savings-evidence.md](../05-effort-savings-evidence.md)) on the occasions it's wrong.

## Signal you're doing this right

Rejected or heavily-edited plans happen often and cost little, a few minutes each, while rejected diffs after execution are rare. Most of the correction work happens at the cheap stage, not the expensive one. Plans that come back with a genuine clarifying question in them are a good sign, not a stall. It means the tool is surfacing ambiguity instead of quietly absorbing it.
