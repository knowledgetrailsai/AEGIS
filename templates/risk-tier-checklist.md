# Risk Tier Checklist

Use before merging or deploying an agent-initiated change. Full definitions: [docs/04-governance-risk-tiers.md](../docs/04-governance-risk-tiers.md).

- [ ] Tier assigned: 1 / 2 / 3 / 4
- [ ] Reversible? (if no → minimum Tier 3)
- [ ] Touches customer PII or payment data? (if yes → minimum Tier 3, escalation trigger)
- [ ] Automated test/eval coverage exists for this change? (if no → escalation trigger, raise one tier)
- [ ] Rollback path documented and tested? (if no → escalation trigger, raise one tier)
- [ ] Crosses a system-of-record boundary (ERP, ledger, clinical record, OT controller)? (if yes → escalation trigger, raise one tier)
- [ ] Named human approver assigned (required for Tier 3–4)
- [ ] Audit trail / change log entry created (required for Tier 4)
