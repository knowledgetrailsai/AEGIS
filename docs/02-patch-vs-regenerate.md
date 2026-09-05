# Decision Framework: Patch vs. Regenerate

Two ways an agentic coding tool can change a system:

- **Patch**: make incremental diffs, the same way a human developer would. Git history, blame, and the audit trail all stay intact.
- **Regenerate**: treat a component as disposable, and rebuild it from its spec instead of editing it. This is the same idea as infrastructure-as-code treating a server as disposable: instead of patching it, you redeploy it from scratch.

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

As a starting point: use patch-based maintenance for anything stateful, shared, or where a mistake would cause a lot of damage (what this repo calls high "blast radius"). Only use a full regenerative rebuild for components that are narrow, bounded, and completely described by their spec.

Even then, **re-verify that behavior matches before cutover.** A regeneration that compiles isn't necessarily one that's correct. Run the full test suite, and compare its behavior against the previous version, before you treat a regenerated component as done.

## Worked check

Ask three questions about the component in front of you:

1. If this were deleted and rebuilt from the spec right now, would anything important be lost that isn't written down anywhere? → If yes, patch.
2. Is a bad regeneration reversible within minutes? → If no, patch.
3. Does the spec fully determine correct behavior on its own, with no unwritten "tribal knowledge" needed to fill in the gaps? → If no, patch.

Only regenerate if all three answers point that way.
