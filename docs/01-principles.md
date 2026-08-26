# Principles

Five rules that everything else in this repo derives from.

## 1. Verifiability over trust

Tool output is accepted because it passed a test, an eval, or a diff review — never because it "looks right." If you can't verify a claim of correctness mechanically, treat the tool's confidence as noise. This is why [testing-qa.md](03-phases/testing-qa.md) and evals come before autonomy expansion, not after.

## 2. Reversibility gates autonomy

The more reversible and low-blast-radius an action is, the more autonomy an agentic coding tool earns. A formatting fix can auto-merge. A production database migration cannot, no matter how confident the agentic coding tool is. See [04-governance-risk-tiers.md](04-governance-risk-tiers.md) for the concrete tiering.

## 3. Spec is the contract

The spec — not the conversation history that produced it — is what the agentic coding tool is graded against, and what a reviewer checks output against. A spec an agentic coding tool can act on must pass the "verifiable done" test: if a human reviewer couldn't confirm "done" from the spec alone, an agentic coding tool can't either. See [templates/spec-template.md](../templates/spec-template.md).

## 4. Context is engineered, not assumed

What an agentic coding tool can see — files, docs, prior decisions — is deliberately curated, not left to whatever fits in a context window by accident. Repo-level instruction files (CLAUDE.md / AGENTS.md-style) are maintained artifacts with an owner and a review cadence, not a one-time setup task.

## 5. Humans move up the stack

The goal is not the same job done faster by fewer people typing. It's engineers spending less time producing text and more time specifying intent, reviewing output, and making the judgment calls agentic coding tools shouldn't make alone — architecture tradeoffs, risk acceptance, and anything irreversible.

## How these principles interact

Principle 1 (verifiability) is what makes Principle 2 (reversibility-gated autonomy) safe to grant — you can only extend autonomy on a class of action once you have a way to verify it went right. Principle 3 (spec is the contract) is what makes Principle 1 possible at all — you can't verify against a spec that doesn't exist or is too vague to test against. Principle 4 (context engineering) determines how *well* an agentic coding tool can act on that spec. Principle 5 is the organizational consequence of getting 1–4 right.
