# Practice: Context Engineering

Context engineering means choosing on purpose what an agentic coding tool gets to see: files, docs, prior decisions. The alternative is letting whatever happens to fit in the context window (the chunk of text the tool can actually read at once) decide by accident.

## Why it exists

An agentic coding tool can only act on what is actually in its context. It cannot act on what merely exists somewhere in the repo. If the tool never saw the correct answer, the result is the same as if the answer were wrong. Context engineering treats "what does the agentic coding tool see" as something you design on purpose, not something that just happens.

## How to do it

1. **Maintain a repo-level instructions file** (a CLAUDE.md- or AGENTS.md-style file). Put conventions in it, a map of the architecture, explicit dos and don'ts, and pointers to where deeper docs live. Keep it short. A file the tool has to wade through causes almost as much trouble as a missing one.
2. **Assign an owner and a review schedule.** A context file that gets written once at kickoff and never touched again will start misleading the tool as the codebase changes. Treat that staleness as a bug to fix, not a documentation nicety to get to eventually.
3. **Scope context to the task, not to the whole repo.** Loading the entire repo's history into every request wastes your context budget and buries the parts that actually matter. Point the tool at the specific modules, specs, and architecture decision records (ADRs) that this particular task needs.
4. **Prune aggressively.** Keep generated files, large data files, and stale docs out of what the tool can pull into context by default. They crowd out what actually matters.
5. **Version the context file like code.** Changes to it should go through reviewable diffs, the same way a prompt change does (see [prompt-agent-versioning.md](prompt-agent-versioning.md)).

## Brownfield-first: detect before you generate

Most real tasks are not greenfield (starting from a blank slate). They involve changing a system that already exists. Before asking an agentic coding tool to propose a design or write a plan for such a change, have it first figure out the codebase's actual conventions: naming patterns, module boundaries, error-handling style, existing abstractions for this kind of problem, and, in a monorepo, which local conventions override the repo-wide ones in the module being touched. A design or plan built on those detected conventions is one the tool can extend consistently. A design built without that step tends to introduce a second, parallel way of doing something the codebase already does one way. That is its own form of unreviewed drift, even when each individual change looks fine on its own.

This detection step is a pass you repeat, not a one-time setup task. Run it again for each new task, because the "actual conventions" of a fast-moving module can drift away from what the repo-level instructions file says. This is what makes principle 4 ([context is engineered, not assumed](../01-principles.md#4-context-is-engineered-not-assumed)) work correctly when the tool is extending existing code rather than writing something new.

## Common failure modes

- Treating context setup as a one-time task done at project kickoff, instead of something you maintain on an ongoing basis.
- Dumping the entire codebase into context "to be safe." This makes everything less relevant and burns your token budget without improving output quality.
- Having no single owner for the context file, so it drifts silently until someone notices the tool is working from outdated assumptions.
- Skipping convention detection on work against an existing codebase, and getting back a design that looks reasonable on its own but doesn't match how the rest of the codebase solves the same problem.

## Signal you're doing this right

An agentic coding tool working in an unfamiliar part of the codebase produces output with the same orientation a competent new hire would have after a good onboarding. That is, in effect, what the context file gives it.
