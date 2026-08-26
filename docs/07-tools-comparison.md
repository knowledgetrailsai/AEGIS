# Tools Comparison Guide

This page compares current agentic coding tools and where each one fits best. The goal is not to crown a universal winner. It is to help you choose the right tool for the job, based on the current official product docs that were checked on 2026-08-25 (deployment-model section added 2026-08-26 — verify vendor docs before relying on specifics, this category moves fast).

## Deployment models — the distinction this repo's earlier docs glossed over

Most of this repo's guidance talks about "agents" as if they're one kind of thing. In practice, the tools that actually do the work fall into four distinct deployment models, and the model matters as much as the vendor when deciding what to adopt:

| Model | What it means | Where it lives | Examples |
|---|---|---|---|
| **Standalone IDE** | A dedicated editor, usually a VS Code fork, built agent-first from the ground up | Its own application, replaces your editor | Cursor, Windsurf, Kiro |
| **IDE plugin / extension** | Installs into an editor you already use (VS Code, JetBrains) — adds agent capability without replacing the editor | Extension inside your existing IDE | GitHub Copilot, Cline, Roo Code, Continue.dev, Amazon Q Developer, Tabnine, Sourcegraph Cody/Amp |
| **CLI / terminal agent** | Runs in the terminal, no GUI required, scriptable | Shell, CI pipelines, headless automation | Claude Code, OpenAI Codex CLI, Aider |
| **Cloud / hosted agent** | Runs in a remote workspace, not on the developer's machine at all | GitHub-hosted sessions, cloud sandboxes | GitHub Copilot agent sessions, Copilot Workspace-style cloud agents |

Why this matters for adoption, not just tool choice:

- **Plugin-based tools have the lowest adoption friction** — a developer keeps their existing IDE, workflow, keybindings, and extensions; the agent is additive. This is usually the right first step for a team that hasn't standardized on agentic tooling yet.
- **Standalone IDEs ask for more commitment** — switching editors is a real cost, but they tend to have the deepest, most integrated agent experience because the whole product is built around it.
- **CLI agents are what you use for anything that isn't interactive** — CI gates, scheduled maintenance runs, scripted multi-repo work (see [ci-eval-gate.yml](../.github/workflows/ci-eval-gate.yml)). A GUI-only tool can't fill this role.
- **Cloud/hosted agents decouple execution from any single developer's machine** — useful for long-running or parallel work, and for keeping agent execution auditable/centralized, but adds a dependency on the hosting platform.

A mature team typically ends up running more than one model at once — a plugin for day-to-day editing, a CLI agent wired into CI, and possibly a cloud agent for longer autonomous runs — rather than picking exactly one.

## How to read the tables below

- `IDE-native agent` means the tool lives inside your editor and is best for day-to-day coding.
- `CLI agent` means the tool runs in the terminal and is best for scripted or repo-local workflows.
- `Cloud agent` means the tool can work from a hosted workspace or GitHub-side session.
- `Plan mode` means the tool can draft a plan and wait for approval before execution.

## Quick comparison

| Tool | Deployment model | Best fit | Strengths | Tradeoffs | Source |
|---|---|---|---|---|---|
| Cursor | Standalone IDE | Active coding sessions | Strong codebase orientation, plan mode, inline edits, background work, MCP support | Editor lock-in; another tool to standardize on | [Cursor docs](https://cursor.com/docs) |
| Windsurf | Standalone IDE | Editor-native agentic workflow | Cascade chat, context awareness, terminal integration, MCP, memories/rules | Opinionated environment choice, not just an assistant | [Windsurf docs](https://docs.windsurf.com/) |
| Kiro | Standalone IDE + CLI + web + mobile | Unified agent platform, AWS-native teams | Specs, steering, hooks, MCP, custom agents, shared config across surfaces, Bedrock-backed | Newer product, broad opinionated surface area | [Kiro docs](https://kiro.dev/docs/) |
| GitHub Copilot (editor extension) | IDE plugin | Teams that want to keep their existing editor | Inline suggestions plus agent mode inside VS Code/JetBrains, no editor switch | Feature depth varies by host IDE | [Copilot features](https://docs.github.com/en/copilot/get-started/features) |
| Cline | IDE plugin (VS Code) | Teams wanting an open-source, model-agnostic agent inside VS Code | Autonomous multi-step edits, terminal command execution, MCP support, works with multiple model providers | Younger ecosystem than Copilot; more setup/config choices to make | Vendor docs — verify current at time of adoption |
| Roo Code | IDE plugin (VS Code, Cline fork) | Teams wanting configurable "modes" (architect, coder, reviewer) in-editor | Mode-based workflows, MCP, model-agnostic | Smaller community than Cline/Copilot; forked-project governance to be aware of | Vendor docs — verify current at time of adoption |
| Continue.dev | IDE plugin (VS Code, JetBrains) | Teams wanting full control over model/provider choice | Open-source, highly customizable, self-hostable, model-agnostic | More assembly required than a turnkey product | Vendor docs — verify current at time of adoption |
| Amazon Q Developer | IDE plugin (VS Code, JetBrains, others) | AWS-native teams wanting agent support without leaving their IDE | Deep AWS service awareness, security scanning, transformation agents | Strongest value is AWS-specific; less general-purpose elsewhere | Vendor docs — verify current at time of adoption |
| Tabnine | IDE plugin (broad IDE support) | Regulated/enterprise teams needing on-prem or private-cloud deployment | Strong privacy/compliance posture, self-hosting options | Historically stronger at completion than deep multi-step agentic tasks — verify current agent capability before relying on it | Vendor docs — verify current at time of adoption |
| Sourcegraph Cody / Amp | IDE plugin + enterprise code search | Large codebases needing agent grounded in enterprise-wide code search | Deep cross-repo context via Sourcegraph's search/indexing | Most valuable when Sourcegraph is already part of the stack | Vendor docs — verify current at time of adoption |
| Claude Code | CLI agent | Local repository work, terminal-first engineers, CI/scripted use | Strong terminal workflow, MCP support, approval modes, scriptable | Less visual structure than an IDE-native assistant | [Claude Code docs](https://docs.anthropic.com/en/docs/claude-code/getting-started) |
| OpenAI Codex CLI | CLI agent | Local agent harness, approval-mode-sensitive workflows | Local code reading/editing/running, multimodal input, configurable approval | Not a full editor replacement | [OpenAI Codex CLI help](https://help.openai.com/en/articles/11096431) |
| Aider | CLI agent | Git-native pair programming from the terminal | Lightweight, git-commit-centric workflow, model-agnostic | Narrower feature surface than a full IDE or platform | Vendor docs — verify current at time of adoption |
| GitHub Copilot agent sessions / cloud agents | Cloud / hosted agent | GitHub-centered teams, parallel isolated runs | Isolated sessions, plan/interactive/autopilot modes, PR-native review loop | Strongest when your workflow already lives in GitHub | [Copilot agent sessions](https://docs.github.com/en/copilot/how-tos/github-copilot-app/agent-sessions) |

## Choosing by deployment model, then by tool

1. **Decide the deployment model first.** Do you need editor-additive (plugin), editor-replacing (standalone IDE), scriptable/headless (CLI), or centrally-run (cloud)? This eliminates most of the list before you compare individual tools.
2. **Within a model, compare by workflow fit** — GitHub-centric teams lean Copilot; AWS-centric teams lean Kiro or Amazon Q; teams wanting maximum control lean Continue.dev or Aider.
3. **Expect to run more than one model.** A CLI agent wired into CI ([ci-eval-gate.yml](../.github/workflows/ci-eval-gate.yml)) and a plugin for interactive editing are not competing choices — most real engineering orgs run both.
4. **Re-test after a quarter.** This category moves faster than almost any other tooling decision you'll make — see [effort-savings-evidence.md](05-effort-savings-evidence.md) for why relying on stale claims (vendor or otherwise) is a real risk here.

## Recommendation by team shape

| Team shape | Best default | Why |
|---|---|---|
| Team not yet standardized on agentic tooling | An IDE plugin (Copilot, Cline, or Continue.dev) | Lowest-friction entry point — no editor switch, incremental adoption |
| Terminal-first engineering team | Claude Code, OpenAI Codex CLI, or Aider | Minimal friction, local repo control, easy to script |
| GitHub-centered team | GitHub Copilot (extension + agent sessions) | Fits issues, branches, PRs, and review loops end to end |
| Editor-centric team ready to commit | Cursor or Windsurf | Deepest integrated experience once the editor switch is accepted |
| AWS-centered team or multi-surface workflow | Kiro or Amazon Q Developer | AWS-aligned, Bedrock-backed or AWS-service-aware |
| Regulated/enterprise team with data residency constraints | Tabnine or a self-hosted Continue.dev setup | Privacy/compliance posture built in |
| Any team needing CI-integrated, non-interactive agent runs | A CLI agent regardless of what else is adopted | Only CLI agents fill this role — see [ci-eval-gate.yml](../.github/workflows/ci-eval-gate.yml) |

## Sources checked

- [Cursor docs](https://cursor.com/docs)
- [Cursor quickstart](https://docs.cursor.com/en/get-started/quickstart)
- [GitHub Copilot app getting started](https://docs.github.com/en/copilot/how-tos/github-copilot-app/getting-started)
- [GitHub Copilot agent sessions](https://docs.github.com/en/copilot/how-tos/github-copilot-app/agent-sessions)
- [GitHub Copilot features](https://docs.github.com/en/copilot/get-started/features)
- [Claude Code getting started](https://docs.anthropic.com/en/docs/claude-code/getting-started)
- [Claude Code CLI reference](https://docs.anthropic.com/en/docs/claude-code/cli-usage)
- [OpenAI Codex CLI help](https://help.openai.com/en/articles/11096431)
- [Kiro documentation](https://kiro.dev/docs/)
- [Windsurf docs](https://docs.windsurf.com/)
- Entries marked "vendor docs — verify current at time of adoption" (Cline, Roo Code, Continue.dev, Amazon Q Developer, Tabnine, Sourcegraph Cody/Amp, Aider) were not individually re-verified against primary sources on the date this section was added — confirm current capabilities directly with each vendor before relying on the specifics in an adoption decision.
