# Principles

Five rules that everything else in this repo derives from.

## 1. Verifiability over trust

Tool output gets accepted because it passed a test, an eval (an automated check that grades the tool's output against expected behavior), or a diff review. It never gets accepted just because it "looks right." If you can't check a claim of correctness by some mechanical means, treat the tool's confidence in itself as meaningless. This is why testing and evals (see [testing-qa.md](03-phases/testing-qa.md)) have to be in place before you expand what a tool is allowed to do on its own — not added afterward.

## 2. Reversibility gates autonomy

The easier an action is to undo, and the smaller the damage it could do if it goes wrong (its "blast radius"), the more autonomy an agentic coding tool earns for that kind of action. A formatting fix can auto-merge with no human involved. A production database migration cannot, no matter how confident the tool sounds. See [04-governance-risk-tiers.md](04-governance-risk-tiers.md) for the actual tiers this maps to.

## 3. Spec is the contract

What the agentic coding tool gets graded against is the spec itself — not the conversation that led to it. That's also what a reviewer checks the output against. A spec has to pass what we call the "verifiable done" test: if a human reviewer couldn't tell from the spec alone whether the work is done, an agentic coding tool can't tell either. See [templates/spec-template.md](../templates/spec-template.md) for a template.

## 4. Context is engineered, not assumed

What an agentic coding tool can see — which files, docs, and prior decisions — should be chosen on purpose, not left to whatever happens to fit in its context window (the information it has available while it works). Repo-level instruction files, like CLAUDE.md or AGENTS.md, need an owner and a regular review schedule. Setting one up once and forgetting about it isn't enough.

## 5. Humans move up the stack

The goal is a shift in what engineers spend time on. Less time producing text by hand. More time explaining intent, reviewing output, and making the judgment calls a tool shouldn't make by itself — things like architecture tradeoffs, deciding what risk is acceptable, and anything that can't be undone.

## How these principles interact

These principles build on each other. Principle 1 (verifiability) is what makes principle 2 (reversibility-gated autonomy) safe to grant: you can only extend a tool's autonomy on a type of action once you have a way to check that it went right. Principle 3 (spec is the contract) is what makes principle 1 possible in the first place: you can't verify anything against a spec that doesn't exist, or one too vague to test against. Principle 4 (context engineering) decides how well an agentic coding tool can act on that spec. Principle 5 is simply what happens organizationally once you get principles 1 through 4 right.
