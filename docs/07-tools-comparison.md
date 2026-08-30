# Tools Comparison Guide

This page compares current agentic coding tools and shows where each one fits best. The goal isn't to crown one universal winner — it's to help you choose the right tool for the job. It's based on the official product docs, checked on 2026-08-25 (the deployment-model section was added 2026-08-26). This category moves fast, so verify against vendor docs before relying on any specific detail.

## Deployment models — the distinction this repo's earlier docs glossed over

Most of this repo's guidance talks about "agentic coding tools" as if they're all one kind of thing. In practice, the tools that actually do the work fall into four distinct deployment models (a deployment model is simply where and how the tool runs). The model matters as much as the vendor when you're deciding what to adopt.

| Model | What it means | Where it lives | Examples |
|---|---|---|---|
| **Standalone IDE** | A dedicated code editor, usually a VS Code fork, built tool-first from the ground up | Its own application, replaces your editor | Cursor, Windsurf, Kiro |
| **IDE plugin / extension** | Installs into an editor you already use (VS Code, JetBrains) and adds agentic coding tool capability without replacing the editor | An extension inside your existing IDE | GitHub Copilot, Cline, Roo Code, Continue.dev, Amazon Q Developer, Tabnine, Sourcegraph Cody/Amp |
| **CLI / terminal tool** | Runs in the terminal, needs no graphical interface, and can be scripted | Shell, CI pipelines, headless automation | Claude Code, OpenAI Codex CLI, Aider |
| **Cloud / hosted tool** | Runs in a remote workspace, not on the developer's own machine at all | GitHub-hosted sessions, cloud sandboxes | GitHub Copilot agent sessions, Copilot Workspace-style cloud agentic coding tools |

Why this matters for adoption, not just for picking a tool:

- **Plugin-based tools are the easiest to adopt.** A developer keeps their existing IDE, workflow, keybindings, and extensions — the agentic coding tool is just an addition. This is usually the right first step for a team that hasn't standardized on agentic tooling yet.
- **Standalone IDEs ask for more commitment.** Switching editors is a real cost, but these tools tend to have the deepest, most integrated experience, since the whole product is built around it.
- **CLI agentic coding tools are what you use for anything that isn't interactive** — CI gates, scheduled maintenance runs, scripted work across multiple repos (see [ci-eval-gate.yml](../.github/workflows/ci-eval-gate.yml)). A tool that only has a graphical interface can't fill this role.
- **Cloud/hosted agentic coding tools separate execution from any single developer's machine.** That's useful for long-running or parallel work, and for keeping execution auditable and centralized, but it adds a dependency on the hosting platform.

A mature team typically ends up running more than one model at once: a plugin for day-to-day editing, a CLI tool wired into CI, and possibly a cloud agentic coding tool for longer autonomous runs. Most teams don't pick just one.

## How to read the tables below

- `IDE-native tool` means the tool lives inside your editor and is best for day-to-day coding.
- `CLI tool` means the tool runs in the terminal and is best for scripted or repo-local workflows.
- `Cloud tool` means the tool can work from a hosted workspace or a GitHub-side session.
- `Plan mode` means the tool can draft a plan and wait for your approval before it starts executing.

## Quick comparison

| Tool | Deployment model | Best fit | Strengths | Tradeoffs | Source |
|---|---|---|---|---|---|
| Cursor | Standalone IDE | Active coding sessions | Strong codebase orientation, plan mode, inline edits, background work, MCP support | Editor lock-in; another tool to standardize on | [Cursor docs](https://cursor.com/docs) |
| Windsurf | Standalone IDE | Editor-native agentic workflow | Cascade chat, context awareness, terminal integration, MCP, memories/rules | Opinionated environment choice, not just an assistant | [Windsurf docs](https://docs.windsurf.com/) |
| Kiro | Standalone IDE + CLI + web + mobile | Unified agentic coding tool platform, AWS-native teams | Specs, steering, hooks, MCP, custom agentic coding tools, shared config across surfaces, Bedrock-backed | Newer product, broad opinionated surface area | [Kiro docs](https://kiro.dev/docs/) |
| GitHub Copilot (editor extension) | IDE plugin | Teams that want to keep their existing editor | Inline suggestions plus agentic coding tool mode inside VS Code/JetBrains, no editor switch | Feature depth varies by host IDE | [Copilot features](https://docs.github.com/en/copilot/get-started/features) |
| Cline | IDE plugin (VS Code) | Teams wanting an open-source, model-agnostic agentic coding tool inside VS Code | Autonomous multi-step edits, terminal command execution, MCP support, works with multiple model providers | Younger ecosystem than Copilot; more setup/config choices to make | Vendor docs — verify current at time of adoption |
| Roo Code | IDE plugin (VS Code, Cline fork) | Teams wanting configurable "modes" (architect, coder, reviewer) in-editor | Mode-based workflows, MCP, model-agnostic | Smaller community than Cline/Copilot; forked-project governance to be aware of | Vendor docs — verify current at time of adoption |
| Continue.dev | IDE plugin (VS Code, JetBrains) | Teams wanting full control over model/provider choice | Open-source, highly customizable, self-hostable, model-agnostic | More assembly required than a turnkey product | Vendor docs — verify current at time of adoption |
| Amazon Q Developer | IDE plugin (VS Code, JetBrains, others) | AWS-native teams wanting agentic coding tool support without leaving their IDE | Deep AWS service awareness, security scanning, transformation agentic coding tools | Strongest value is AWS-specific; less general-purpose elsewhere | Vendor docs — verify current at time of adoption |
| Tabnine | IDE plugin (broad IDE support) | Regulated/enterprise teams needing on-prem or private-cloud deployment | Strong privacy/compliance posture, self-hosting options | Historically stronger at completion than deep multi-step agentic tasks — verify current agentic coding tool capability before relying on it | Vendor docs — verify current at time of adoption |
| Sourcegraph Cody / Amp | IDE plugin + enterprise code search | Large codebases needing agentic coding tool grounded in enterprise-wide code search | Deep cross-repo context via Sourcegraph's search/indexing | Most valuable when Sourcegraph is already part of the stack | Vendor docs — verify current at time of adoption |
| Claude Code | CLI tool | Local repository work, terminal-first engineers, CI/scripted use | Strong terminal workflow, MCP support, approval modes, scriptable | Less visual structure than an IDE-native assistant | [Claude Code docs](https://docs.anthropic.com/en/docs/claude-code/getting-started) |
| OpenAI Codex CLI | CLI tool | Local agentic coding tool harness, approval-mode-sensitive workflows | Local code reading/editing/running, multimodal input, configurable approval | Not a full editor replacement | [OpenAI Codex CLI help](https://help.openai.com/en/articles/11096431) |
| Aider | CLI tool | Git-native pair programming from the terminal | Lightweight, git-commit-centric workflow, model-agnostic | Narrower feature surface than a full IDE or platform | Vendor docs — verify current at time of adoption |
| GitHub Copilot agent sessions / cloud agentic coding tools | Cloud / hosted tool | GitHub-centered teams, parallel isolated runs | Isolated sessions, plan/interactive/autopilot modes, PR-native review loop | Strongest when your workflow already lives in GitHub | [Copilot agent sessions](https://docs.github.com/en/copilot/how-tos/github-copilot-app/agent-sessions) |

## Choosing by deployment model, then by tool

1. **Decide the deployment model first.** Do you need something editor-additive (a plugin), editor-replacing (a standalone IDE), scriptable and headless (CLI), or centrally run (cloud)? Answering this eliminates most of the list before you even compare individual tools.
2. **Within a model, compare by workflow fit.** GitHub-centric teams tend to lean toward Copilot; AWS-centric teams toward Kiro or Amazon Q; teams that want maximum control lean toward Continue.dev or Aider.
3. **Expect to run more than one model.** A CLI tool wired into CI ([ci-eval-gate.yml](../.github/workflows/ci-eval-gate.yml)) and a plugin for interactive editing aren't competing choices — most real engineering orgs run both.
4. **Re-test after a quarter.** This category changes faster than almost any other tooling decision you'll make. See [effort-savings-evidence.md](05-effort-savings-evidence.md) for why relying on stale claims — vendor or otherwise — is a real risk here.

## Recommendation by team shape

| Team shape | Best default | Why |
|---|---|---|
| Team not yet standardized on agentic tooling | An IDE plugin (Copilot, Cline, or Continue.dev) | Lowest-friction entry point — no editor switch, incremental adoption |
| Terminal-first engineering team | Claude Code, OpenAI Codex CLI, or Aider | Minimal friction, local repo control, easy to script |
| GitHub-centered team | GitHub Copilot (extension + agent sessions) | Fits issues, branches, PRs, and review loops end to end |
| Editor-centric team ready to commit | Cursor or Windsurf | Deepest integrated experience once the editor switch is accepted |
| AWS-centered team or multi-surface workflow | Kiro or Amazon Q Developer | AWS-aligned, Bedrock-backed or AWS-service-aware |
| Regulated/enterprise team with data residency constraints | Tabnine or a self-hosted Continue.dev setup | Privacy/compliance posture built in |
| Any team needing CI-integrated, non-interactive agentic coding tool runs | A CLI tool regardless of what else is adopted | Only CLI agentic coding tools fill this role — see [ci-eval-gate.yml](../.github/workflows/ci-eval-gate.yml) |

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
- Entries marked "vendor docs — verify current at time of adoption" (Cline, Roo Code, Continue.dev, Amazon Q Developer, Tabnine, Sourcegraph Cody/Amp, Aider) were not individually re-checked against primary sources on the date this section was added. Confirm current capabilities directly with each vendor before relying on the specifics in an adoption decision.
