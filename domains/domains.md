# Agentic Engineering Domains

This document maps **40 software and engineering domains** to where agentic engineering practices apply. Each entry describes the kind of development involved, example work, the human role being supported or replaced, what agents can accelerate or do autonomously, recommended tools, and practices to pair with them.

## How to Read This Document

- **Domain** — The engineering or operational area.
- **Kind of Dev Involved** — The type of coding, configuration, or scripting work.
- **Example Work** — Concrete tasks an agent might handle.
- **Human Role It Supports/Replaces** — Who traditionally does this work.
- **What It Accelerates or Does Autonomously** — The agent's scope of action.
- **Recommended Agentic Tools/Products** — Tools that currently support this domain.
- **Practices to Pair With Them** — Guardrails and workflows to keep agents safe and effective.

> **Note:** Tool recommendations evolve rapidly. Always validate tool capabilities against your specific stack and compliance requirements before adoption.

---

## Domain Reference Table

| Domain | Kind of Dev Involved | Example Work | Human Role It Supports/Replaces | What It Accelerates or Does Autonomously | Recommended Agentic Tools/Products | Practices to Pair With Them |
|---|---|---|---|---|---|---|
| Software/App Dev | Application code, testing, CI/CD | Features, refactors, tests, PR pipelines | Developer | Writes/tests/PRs bounded features autonomously; reviews diffs like a peer reviewer | Claude Code, GitHub Copilot Workspace, Cursor, Devin, Windsurf | Spec-driven dev, PR-based review, CI gating |
| UI/UX | Frontend code + design systems | Component libraries, design-to-code, accessibility | Frontend developer / designer | Turns specs/designs into working components; runs accessibility checks | v0 (Vercel), Claude Code + design specs, Figma Make | Design-to-code handoff, component libraries |
| Mobile | Platform-specific app code | Native/cross-platform, device APIs, offline sync | Mobile developer | Implements features across iOS/Android; automates release-checklist work | Cursor, Claude Code, GitHub Copilot | Spec-driven dev, device-farm test automation |
| API | Backend code + API platform config | Endpoint code, OpenAPI contracts, auth, gateway config | Backend developer | Generates endpoints from schema; does contract-testing work | Claude Code, GitHub Copilot, Postman AI agent | OpenAPI-first spec-driven dev, contract testing |
| Data/AI | Data pipelines, model/prompt engineering | ETL/ELT, schema validation, embeddings, evals | Data engineer / ML engineer | Builds and monitors pipelines; runs evals like an ML test engineer | Claude Code + dbt, Dagster/Airflow AI copilots, Databricks Assistant | Evals, schema validation, RAG pipelines |
| Integration (iPaaS) | Connector/workflow config | Field mapping, transformation logic, retries | Integration developer | Maps fields, builds transformations | Workato AI agents, Zapier Agents, n8n AI nodes | Human-in-loop approval for live workflow changes |
| ERP (SAP, Oracle) | Configuration + custom modules | Customizations, workflow config, master data rules | ERP functional/technical consultant | Drafts config changes, validates in sandbox | SAP Joule, Oracle Fusion AI agents | Sandbox validation before production config push |
| CRM/Support | Workflow automation + scripting | Business rules, macros, webhook handlers | Support/customer service agent | Resolves tickets end-to-end using account data | Salesforce Agentforce, Intercom Fin, Zendesk AI agents | Escalation gating, memory of prior tickets |
| Infra/DevOps | Infrastructure-as-code, orchestration | Terraform/Ansible, monitoring/alerts | DevOps/SRE engineer | Proposes IaC changes, detects drift, auto-remediates | GitHub Copilot for Infra, Datadog Bits AI, PagerDuty AIOps | IaC review gates, drift-detection alerts |
| IoT/Embedded | Firmware + device/edge code | Sensor handling, edge inference, protocols | Embedded/firmware engineer | Generates and simulates firmware logic | Claude Code (firmware code gen), vendor SDK copilots (nascent) | Simulation-first, hardware-in-loop testing |
| QA/Test Automation | Test scripting + framework config | Test generation, regression/visual/load testing | QA/test engineer | Generates tests, self-heals broken selectors | mabl, Testim, Applitools, Katalon AI, Claude Code (test-gen) | Self-healing selectors, CI-integrated evals |
| Security | Policy-as-code + scanning config | SAST/DAST rules, IAM policy, threat modeling | Security analyst/engineer | Triages scans, drafts fixes, prioritizes by exploitability | GitHub Copilot Autofix, Snyk AI, Checkmarx AI | Human sign-off on exploitable-severity fixes |
| Analytics/BI | Query + dashboard logic | SQL/dbt models, semantic layer, dashboards | Data analyst | Writes/validates SQL from plain-language questions | Claude + dbt/warehouse MCP, ThoughtSpot Sage, Tableau Agent | Query validation against ground truth |
| Finance/RPA | Process scripting + bot config | Reconciliation, invoice parsing, workflow bots | Accounts/finance ops analyst | Handles document-to-ledger reconciliation | UiPath Agents, Automation Anywhere AI, Claude for reconciliation workflows | Audit trail logging, exception review |
| Legal/Compliance tech | Rule/document logic | Contract clause libraries, policy checks | Paralegal/contract analyst | Flags clause deviations, drafts redlines | Harvey AI, Spellbook, Claude for contract review | Playbook-based clause matching, human final review |
| Maintenance/Legacy modernization | Refactoring, dependency upgrades | Framework migrations, dead code removal | Maintenance engineer | Runs upgrades, fixes breaking changes, verifies via tests | Claude Code, GitHub Copilot, Amazon Q Developer (migrations) | Test-suite-gated upgrades, worktree isolation |
| Production Support/Ops | Incident triage, log/metric correlation | On-call diagnosis, runbook execution | L2/L3 support engineer, SRE | Correlates logs/metrics, drafts root cause, runs runbooks | PagerDuty AIOps, Datadog Bits AI, Claude for runbook execution | Human gate on remediation actions |
| Release/Build Engineering | Build pipeline + packaging config | Version bumps, changelogs, artifact publishing | Release manager | Generates changelogs, manages branching | GitHub Copilot Workspace, Claude Code (changelog/versioning) | Automated changelog + branch policy enforcement |
| Migration (platform/data) | Transformation scripting + validation | Cloud/DB migrations, data reconciliation | Migration engineer | Scripts transformations, runs reconciliation diffs | Claude Code, Amazon Q, GitHub Copilot | Reconciliation diffs pre/post migration |
| Localization/i18n | String extraction + translation pipeline | Key extraction, translation sync, locale QA | Localization engineer | Extracts strings, manages translation memory | Lokalise AI, Claude for translation QA | Translation-memory sync, locale-specific evals |
| Game Development | Gameplay code, engine scripting, asset pipelines | Level scripting, NPC behavior, shaders, build automation | Gameplay/tools programmer | Generates NPC behavior trees, automates asset builds, playtests | Unity Muse, Claude Code (gameplay scripting), Scenario.gg (assets) | Playtesting agents, asset-pipeline automation |
| E-commerce Development | Storefront code + platform config | Product catalog logic, checkout flows, payment integration | Platform developer / merchandising ops | Manages catalog sync, tests checkout flows | Shopify Sidekick, Claude Code + platform APIs | Checkout-flow test automation |
| Blockchain/Web3 | Smart contract code + on-chain tooling | Contract development, audits, gas optimization | Smart contract developer | Drafts contracts, runs static analysis | OpenZeppelin AI, Claude Code (contract drafting) | Mandatory human audit before mainnet deploy |
| AR/VR | 3D engine code + spatial interaction design | Scene scripting, spatial UI, performance optimization | 3D/graphics engineer | Scaffolds interaction logic, automates performance profiling | Unity Muse, Claude Code (scene scripting) | Cross-device performance profiling agents |
| Robotics | Control systems + simulation code | Motion planning, sensor fusion, simulation testing | Robotics/controls engineer | Iterates motion planning in simulation | NVIDIA Isaac (simulation AI), Claude Code (control logic) | Simulation-only iteration before physical deploy |
| Fintech/Payments | Transaction logic + compliance-heavy code | Payment gateway integration, fraud rules, ledger systems | Payments engineer | Drafts fraud rules, reconciliation logic | Claude Code + compliance-review agents (mostly custom-built) | Strict human review on money-movement code |
| Healthtech/EHR | Integration code + compliance (HL7/FHIR) | EHR interoperability, clinical data mapping | Interoperability engineer | Maps HL7/FHIR schemas | Custom agents on HL7/FHIR (nascent vendor tooling) | Human-owned clinical logic, compliance review |
| Telecom/Networking | Protocol code + network config | Routing config, protocol implementation, network automation | Network engineer | Detects config drift, validates topology | Cisco AI Assistant, custom network-config agents | Change-control gating on live network pushes |
| Supply Chain/Logistics | Optimization code + system integration | Route optimization, inventory sync, EDI integration | Logistics/supply chain analyst | Monitors inventory sync, drafts optimized routing | o9 Solutions AI agents, Blue Yonder AI, custom pipeline agents | Exception-based human review |
| Content/CMS | Templating + content pipeline code | Headless CMS integration, content modeling, publishing workflows | Content ops / web producer | Manages content sync, auto-tags/categorizes | Contentful AI, Claude Code + CMS APIs | Auto-tagging with human editorial review |
| Martech/AdTech | Tracking/pixel code + campaign automation | Tag management, attribution logic, campaign config | Marketing ops engineer | Manages tag deployment, runs A/B test analysis | Claude Code + tag-management APIs, custom attribution agents | A/B test result validation before rollout |
| SCADA/ICS (Industrial Control Systems) | Ladder logic, control system programming | PLC/RTU programming, HMI screens, alarm logic | Controls engineer | Drafts logic/HMI screens in simulation | Mostly custom-built (safety-critical, few off-the-shelf agentic tools) | Simulation/digital-twin validation, strict human sign-off |
| PLC/DCS Automation | Industrial controller programming | Motion/process control sequences, interlocks | Automation engineer | Validates logic in digital twin before deployment | Mostly custom-built + vendor copilots emerging (Siemens, Rockwell) | Digital-twin validation before controller deploy |
| Manufacturing Execution Systems (MES) | Shop-floor software + system integration | Work order tracking, OEE calculation, machine integration | Plant/process engineer | Monitors OEE/downtime patterns, drafts root-cause analysis | Custom agents on MES data (Siemens Opcenter AI features emerging) | OEE-monitoring agents with human root-cause review |
| Building Management Systems (BMS) | HVAC/facility control logic + integration | Energy optimization rules, sensor integration, alarm config | Facilities/energy engineer | Tunes energy-optimization rules based on usage patterns | Custom agents (vendor AI features emerging: Honeywell, Johnson Controls) | Continuous tuning with override capability |
| Energy/Utility Grid Systems | Grid control software + telemetry integration | SCADA telemetry processing, demand response logic | Grid operations analyst | Analyzes telemetry for anomalies, drafts demand-response recommendations | Custom agents (utility-specific, mostly proprietary/in-house) | Human-controlled grid actuation |
| Industrial IoT (IIoT) | Sensor/edge device code + data pipelines | Predictive maintenance models, edge analytics, telemetry pipelines | Reliability/maintenance engineer | Builds/monitors predictive-maintenance pipelines, flags anomalies | Custom predictive-maintenance agents (PTC ThingWorx AI, Siemens) | Anomaly-flagging with human maintenance review |
| Digital Twin Engineering | Simulation modeling + integration code | Physics-based models, real-time sync with physical assets | Simulation engineer | Runs "what-if" simulations continuously | NVIDIA Omniverse, custom simulation agents | Scenario testing isolated from live assets |
| OT/Industrial Cybersecurity | Network segmentation + monitoring config | Asset inventory, anomaly detection rules, patch management | OT security analyst | Monitors for anomalous OT traffic, drafts patch/segmentation recommendations | Claroty, Dragos AI-assisted monitoring | Human sign-off before live network changes |
| Transportation/Fleet OT | Vehicle telematics + control integration | Fleet tracking, predictive maintenance, route/fuel optimization | Fleet operations analyst | Optimizes routing and predicts maintenance | Samsara AI, custom fleet-optimization agents | Predictive maintenance flagging, human dispatch decisions |

---

## Domain Groupings

For easier navigation, the 40 domains can be grouped into broader categories:

### Software & Application Development
- Software/App Dev, UI/UX, Mobile, API, Game Development, E-commerce Development, AR/VR, Blockchain/Web3

### Data, AI & Analytics
- Data/AI, Analytics/BI, Localization/i18n

### Infrastructure & Operations
- Infra/DevOps, Production Support/Ops, Release/Build Engineering, Maintenance/Legacy modernization

### Integration & Automation
- Integration (iPaaS), Finance/RPA, Content/CMS, Martech/AdTech

### Enterprise Systems
- ERP (SAP, Oracle), CRM/Support

### Security & Compliance
- Security, Legal/Compliance tech, OT/Industrial Cybersecurity

### Industry-Specific / OT & Embedded
- IoT/Embedded, Robotics, Fintech/Payments, Healthtech/EHR, Telecom/Networking, Supply Chain/Logistics, SCADA/ICS, PLC/DCS Automation, MES, BMS, Energy/Utility Grid Systems, IIoT, Digital Twin Engineering, Transportation/Fleet OT

### Quality & Migration
- QA/Test Automation, Migration (platform/data)

---

## Key Patterns Across Domains

1. **Simulation-first is dominant in safety-critical domains.** Robotics, SCADA/ICS, PLC/DCS, and Digital Twin Engineering all require validation in simulation or digital twins before any physical deployment.

2. **Human-in-the-loop gating is non-negotiable for money and safety.** Fintech/Payments, OT/Industrial Cybersecurity, and SCADA/ICS mandate human sign-off before production or live-network changes.

3. **Spec-driven development is the most common pairing practice.** Domains from Software/App Dev to API to Mobile all benefit from writing specifications before agents generate code.

4. **Tooling is nascent in safety-critical and regulated industries.** Industrial control, healthcare, and utilities rely heavily on custom-built agents because off-the-shelf tooling does not yet meet compliance or safety requirements.

5. **Evals and validation are universal.** Whether it's SQL validation in Analytics/BI, contract testing in APIs, or OEE monitoring in MES, every domain needs a way to verify agent output before it reaches production.

---

## Source

This reference is derived from [`domains/domains.csv`](domains/domains.csv).
