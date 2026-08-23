# Contributing to This Framework

## Changing principles or governance (`docs/01`–`docs/04`)

These require deliberate human review regardless of who drafted the change — including if an agent drafted it. Open a PR, tag it Tier 3 in spirit (even though this repo isn't shipping code), and get at least one maintainer sign-off before merging. Silent drift in these sections is the failure mode this framework exists to prevent elsewhere — don't reintroduce it here.

## Refreshing evidence and tooling references (`docs/05`, `domains/domains.csv`)

These go stale fast by nature. When refreshing:
1. Re-verify figures against current primary sources — don't carry forward a number because it was here before.
2. Note the refresh date in the file or commit message.
3. Prefer ranges and sourced claims over point estimates you can't back up.

## Adding a new domain to `domains/domains.csv`

Follow the existing columns exactly. If a domain's tooling landscape is still immature (few or no dedicated agentic products), say so explicitly rather than naming a product that doesn't really fit — see the OT-domain rows for the pattern.

## Adding a new phase doc or template

Match the existing structure: How to (numbered, actionable) → Anti-patterns → Signal you're doing this right (where applicable). Keep each phase doc under ~400 words — this is a reference, not an essay.

## Style

- No marketing language, no unverified superlatives.
- Prefer tables for anything naturally tabular.
- Cross-link related docs with relative markdown links.
