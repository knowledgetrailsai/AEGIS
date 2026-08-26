# Decision Framework: Patch vs. Regenerate

Two ways an agentic coding tool can change a system:

- **Patch** — incremental diffs, same model as human-driven development. Git history, blame, and audit trail stay intact.
- **Regenerate** — treat a component as a disposable build artifact and rebuild it from spec, the way infrastructure-as-code treats a server: don't patch it, redeploy it.

Apply this rubric **per component**, not per project. Most real systems are a mix.

| Factor | Favors Patch | Favors Regenerate |
|---|---|---|
| Statefulness | Stateful, holds production data | Stateless or easily reseeded |
| Spec completeness | Spec can't capture all edge cases | Spec fully determines behavior (e.g. CRUD from schema) |
| Blast radius | High — shared/critical system | Low — isolated, easily rolled back |
| History value | Git blame / incremental audit trail matters | History irrelevant; only current spec matters |
| Verification cost | Expensive to re-verify the whole system | Cheap to re-verify (small, bounded, fast tests) |
| Examples | Core monolith, ledger, ERP customizations, control logic | Config generators, boilerplate CRUD, IaC, prototypes, codegen layers |

## Default rule

Patch-based maintenance for anything stateful, shared, or high-blast-radius. Regenerative rebuilds only for narrow, bounded, spec-complete components.

Even then: **re-verify behavior parity before cutover.** A regeneration that compiles is not the same as a regeneration that's correct — run the full test suite and a reconciliation diff against the previous behavior before treating a regenerated component as done.

## Worked check

Ask three questions about the component in front of you:

1. If this were deleted and rebuilt from the spec right now, would anything important be lost that isn't written down anywhere? → If yes, patch.
2. Is a bad regeneration reversible within minutes? → If no, patch.
3. Does the spec already fully determine correct behavior (no implicit tribal knowledge)? → If no, patch.

Regenerate only when all three point that way.
