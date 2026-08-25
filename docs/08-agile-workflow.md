# Agile Work Loop

This guide uses a simple agile flow to organize agent-assisted work:

- backlog items capture all requested work
- features group related backlog items
- each feature is refined into a small, testable slice
- the slice moves through spec, design, build, review, test, and release

## Core terms

| Term | Meaning in this guide |
|---|---|
| Backlog | The ordered list of work that may be done next |
| Feature | A user- or system-visible outcome made up of one or more backlog items |
| Epic | A larger body of work that contains multiple features |
| Slice | A small unit of work that can be specified, built, tested, and reviewed cleanly |
| Sprint | A short planning window used to select and finish a slice of backlog work |
| Definition of Done | The checks required before work is considered complete |

## How to run it

1. Put every request into the backlog first.
2. Group related backlog items into a feature or epic.
3. Refine the item until it is small enough to finish in one pass.
4. Write the spec before implementation.
5. Use the phase guide for design, development, review, testing, and release.
6. Mark the item done only when the definition of done is met.

## Backlog rules

- The backlog should be ordered.
- Higher items should be clearer and more ready to work on.
- Each item should state the goal, scope, acceptance criteria, and risk.
- Items that are too large should be split before implementation starts.

## Feature rules

- A feature should represent a visible outcome, not a vague wish.
- Each feature should have one owner and a clear status.
- A feature can contain multiple backlog items, but each item still needs its own spec.
- Features should be reviewable in small slices.

## Best practices

- Keep the backlog small enough to review regularly.
- Use feature names that describe outcomes, not implementation detail.
- Break work into slices that fit one clear review cycle.
- Use the spec template for each slice.
- Track status with simple states such as `backlog`, `ready`, `in progress`, `review`, `done`.

## Common mistakes

- Treating the backlog as a dumping ground
- Starting implementation before the item is refined
- Making feature items too large to verify
- Using sprint language without actually selecting a finite set of work

## Simple flow

`backlog -> feature -> refined slice -> spec -> design -> development -> review -> testing -> release -> done`
