# Governance: Risk Tiers & Gates

Every agent-initiated action maps to a tier. This is what turns "how much autonomy" into a repeatable decision instead of a case-by-case argument.

| Tier | Definition | Example | Gate |
|---|---|---|---|
| 1 — Autonomous | Reversible, low blast radius, high test coverage | Formatting fix, doc update, adding a covered unit test | Auto-merge on green CI, spot-audited |
| 2 — Reviewed | Reversible, moderate blast radius | New feature in a well-tested module, refactor with full test coverage | Human PR review before merge |
| 3 — Approved | Hard to reverse or shared blast radius | Schema change, API contract change, infra config | Named approver sign-off + rollback plan required |
| 4 — Restricted | Irreversible or safety/financial/regulatory critical | Production DB migration, payment logic, OT/physical actuation, mainnet deploy | Multi-party approval, staged rollout, audit trail mandatory |

## How to apply this

1. Tier the *action*, not the agent or the project. The same agent can take Tier 1 and Tier 4 actions in the same day.
2. Wire the gate into tooling, not into a policy doc nobody checks — PR templates ([.github/PULL_REQUEST_TEMPLATE.md](../.github/PULL_REQUEST_TEMPLATE.md)), CI required-reviewers, and deploy pipelines should enforce the tier's gate mechanically.
3. Re-tier when blast radius changes — a module that used to be isolated but now has three downstream consumers has moved tiers even if nothing else changed.
4. Default to the higher tier when uncertain. Under-gating is the expensive mistake; over-gating just costs review time.

## Escalation triggers

Any of the following bumps an action at least one tier regardless of its default classification: touches customer PII or payment data, has no automated test coverage, has no rollback path, or crosses a system-of-record boundary (ERP, ledger, clinical record, OT controller).
