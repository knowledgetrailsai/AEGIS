# SDLC Phases Guide

Use this section as the working guide for tool-supported delivery. Each phase page now follows the same pattern:

- what the phase is for
- how to run it
- what agentic coding tools help
- best practices
- common mistakes

## Phase Index

| Phase | Purpose | Page |
|---|---|---|
| Requirements & Spec | Turn a request into a testable contract | [requirements-spec.md](requirements-spec.md) |
| Architecture & Design | Decide structure, interfaces, and risk | [design.md](design.md) |
| Development | Implement with context, planning, and isolation | [development.md](development.md) |
| Code Review | Review by risk level, not by habit | [code-review.md](code-review.md) |
| Testing & QA | Prove the behavior with tests and evals | [testing-qa.md](testing-qa.md) |
| Deployment & Release | Ship with approval gates and rollback | [deployment.md](deployment.md) |
| Production Support & Maintenance | Triage and remediate safely | [production-support.md](production-support.md) |

## How to use it

1. Start with requirements and spec, using an agentic coding tool to draft and tighten the request.
2. Move to design when the work changes boundaries or contracts, using an agentic coding tool to compare options.
3. Use development, review, and testing as one loop, with the agentic coding tool helping produce code, tests, and diffs.
4. Keep deployment and support gated by blast radius, with the agentic coding tool helping prepare but not bypassing approvals.

## Rule of thumb

If a phase feels vague, make the work more specific before handing it to an agentic coding tool.
