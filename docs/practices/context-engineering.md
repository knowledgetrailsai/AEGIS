# Practice: Context Engineering

Deliberately curating what an agentic coding tool can see — files, docs, prior decisions — instead of leaving it to whatever fits in a context window by accident.

## Why it exists

Agentic coding tools perform based on what's actually in context, not what exists somewhere in the repo. A correct answer the agentic coding tool never saw is functionally the same as a wrong answer. Context engineering treats "what does the agentic coding tool see" as a designed input, not an afterthought.

## How to do it

1. **Maintain a repo-level instructions file** (CLAUDE.md / AGENTS.md-style): conventions, an architecture map, explicit do's and don'ts, and pointers to where deeper docs live. Keep it short — a file the agentic coding tool has to wade through is as bad as one that's missing.
2. **Assign an owner and a review cadence.** A context file written once at kickoff and never touched again actively misleads agentic coding tools as the codebase evolves — treat staleness here as a bug, not a documentation nice-to-have.
3. **Scope context per task, not globally.** Loading the whole repo's history into every request wastes budget and dilutes relevance. Point the agentic coding tool at the specific modules, specs, and ADRs a given task actually needs.
4. **Prune aggressively.** Remove generated files, huge data files, and stale docs from what an agentic coding tool can pull into context by default — they crowd out what actually matters.
5. **Version the context file like code.** Changes to it are reviewable diffs, same as a prompt change (see [prompt-agent-versioning.md](prompt-agent-versioning.md)).

## Common failure modes

- Treating context setup as a one-time project-kickoff task instead of ongoing maintenance.
- Dumping the entire codebase into context "to be safe" — this degrades relevance and burns token budget without improving output quality.
- No single owner for the context file, so it drifts silently until someone notices the agentic coding tool is working from outdated assumptions.

## Signal you're doing this right

An agentic coding tool working on a task in an unfamiliar part of the codebase produces output as if it had the same orientation a competent new hire would get from a good onboarding doc — because functionally, that's what the context file is.
