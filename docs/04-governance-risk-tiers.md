# Governance: Risk Tiers & Gates

Every action a tool takes maps to a tier. Tiers turn "how much autonomy should this have" into a repeatable decision, instead of an argument you have to have every time.

| Tier | Definition | Example | Gate |
|---|---|---|---|
| 1 — Autonomous | Reversible, low blast radius (how much could go wrong, and how far it could spread), high test coverage | Formatting fix, doc update, adding a covered unit test | Auto-merge on green CI, spot-audited |
| 2 — Reviewed | Reversible, moderate blast radius | New feature in a well-tested module, refactor with full test coverage | Human PR review before merge |
| 3 — Approved | Hard to reverse, or the blast radius is shared with other teams/systems | Schema change, API contract change, infra config | Named approver sign-off + rollback plan required |
| 4 — Restricted | Irreversible, or critical to safety, finances, or regulation | Production DB migration, payment logic, OT/physical actuation, mainnet deploy | Multi-party approval, staged rollout, audit trail mandatory |

## How to apply this

1. Tier the *action*, not the tool or the project. The same agentic coding tool can take a Tier 1 action and a Tier 4 action on the same day.
2. Wire the gate into your tooling, not into a policy doc nobody reads. PR templates ([.github/PULL_REQUEST_TEMPLATE.md](../.github/PULL_REQUEST_TEMPLATE.md)), CI required-reviewers, and deploy pipelines should enforce each tier's gate automatically.
3. Re-tier when the blast radius changes. If a module used to be isolated but now has three downstream consumers, it has moved tiers, even if nothing else about it changed.
4. When you're unsure which tier applies, pick the higher one. Under-gating is the expensive mistake. Over-gating only costs review time.

## Escalation triggers

Any of the following bumps an action up at least one tier, no matter what its default tier would be: it touches customer PII (personally identifiable information, like names or account numbers) or payment data; it has no automated test coverage; it has no rollback path; or it crosses a system-of-record boundary (a system that holds the official version of important data, like an ERP, a ledger, a clinical record, or an OT/operational-technology controller).
