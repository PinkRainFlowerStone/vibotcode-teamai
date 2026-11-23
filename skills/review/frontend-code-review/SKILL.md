---
name: frontend-code-review
description: Review PC Web, mobile Web, and mini-program frontend changes against requirements, repository conventions, and financial middleware standards. Use for 前端代码审查、PR review、权限审查、参数契约检查、性能安全检查和上线前自检；先识别运行端再应用平台规则。Do not use for implementation unless the user also asks to fix findings.
---

# Finance Frontend Code Review

Review incremental frontend changes along three independent axes:

- **Spec & Behavior**: does the change implement the requested behavior completely and correctly?
- **Team Standards**: does it follow applicable repository and team rules?
- **Runtime Risk**: does it introduce authorization, contract, async, security, compatibility, performance, or regression risk?

Keep the axes separate so success in one cannot hide failure in another. Findings lead; summaries are secondary. Review only; do not modify code unless the user explicitly requests fixes.

## 1. Establish The Review Target

Resolve the review scope in this order:

1. an explicit scope in the user's prompt, including selected files or a patch, staged or working-tree changes, a commit or interval, or a named base branch or tag;
2. the actual PR target branch when reviewing a PR;
3. otherwise, committed changes on the current branch relative to the logical `pre` baseline.

An explicit scope always overrides the default. Examples include `review HEAD^..HEAD`, `review abc123..def456`, `review relative to origin/release`, `review staged changes`, and `review these files only`.

For the default branch review:

- resolve `origin/pre` first because it represents the shared branch when available; otherwise use local `pre`;
- run the equivalent of `git diff <resolved-pre>...HEAD` so the diff starts at the merge-base;
- record the equivalent of `git log <resolved-pre>..HEAD --oneline` as the commit scope;
- review committed changes only; report uncommitted changes as excluded unless the user explicitly includes them;
- state the scope source and resolved range in the report; disclose an unverified or stale base ref only when it materially limits confidence.

Do not run `git merge`, rebase, checkout, pull, or otherwise mutate the repository to establish review scope. Do not fetch unless the user authorizes network access or asks for the latest remote state. A remote-tracking ref may be stale, so disclose that freshness was not verified when applicable.

Confirmation may come from the user's prompt, a deterministic default, or repository evidence; it does not require asking the user every time. Ask one consolidated blocking question only when the repository or target cannot be resolved, an explicit scope is invalid or conflicting, neither `pre` ref exists, the resulting diff is unexpectedly empty, or another unresolved choice would materially change the review. Never choose a base from commit recency alone.

Read [references/review-protocol.md](references/review-protocol.md) for the complete blocking-confirmation and non-blocking-supplement policy.

## 2. Build The Project Context

Before judging the diff, read the nearest applicable instructions and repository evidence:

1. `AGENTS.md`, repository instructions, `README.md`, and contribution documents;
2. `package.json` scripts and dependencies;
3. lint/format/test configuration plus the actual Web or mini-program build/runtime manifests;
4. request wrapper, router/authorization entry points, state exports, global styles, and dominant reusable abstractions relevant to the diff;
5. the originating issue, specification, PR description, design reference, API mapping, or acceptance criteria.

Repository instructions and explicit runtime configuration override team defaults when they intentionally differ. A historical code pattern alone does not override a documented rule.

Requirements, designs, API mappings, risk notes, and acceptance criteria improve confidence but are not mandatory startup inputs. Briefly invite the user to provide missing optional context without waiting; continue the Standards and Runtime Risk axes and disclose any resulting limits.

## 3. Confirm The Platform

Classify the runtime before applying platform-specific rules:

- `pc-admin`: desktop administration or operational system;
- `mobile-h5`: mobile web, H5 mall, campaign, or WebView application;
- `mini-program`: native or cross-platform build targeting a mini-program runtime;
- `ambiguous`: mixed, responsive, embedded, or insufficient evidence.

Use evidence in this order:

1. explicit user statement;
2. repository instructions or README;
3. UI framework and layout model;
4. Web targets, browserslist, viewport/legacy/WebView configuration, or mini-program manifests, page/subpackage configuration and base-library target;
5. routing, authorization, list-loading, navigation, and interaction patterns.

If evidence remains ambiguous and the choice would change findings, or the changed scope crosses platforms, ask the user. If the changed code is platform-neutral, continue with common rules and state that no platform-specific conclusion was made. Otherwise state the inferred type, evidence, and confidence in the report.

Load profiles according to the confirmed target:

- PC: [references/platform-profiles/pc-admin.md](references/platform-profiles/pc-admin.md)
- Mobile: [references/platform-profiles/mobile-h5.md](references/platform-profiles/mobile-h5.md)
- Mini program: [references/platform-profiles/mini-program.md](references/platform-profiles/mini-program.md)

Load exactly one profile for a single-platform review, no platform profile for neutral code, or multiple profiles only for an explicitly cross-platform scope. Keep cross-platform findings labeled by target. Profiles contain only differences and cannot weaken functional correctness, security, evidence, or scope-attribution requirements.

## 4. Select Applicable Rules

Read [references/team-common-rules.md](references/team-common-rules.md), then load only checklists relevant to changed files:

- contracts, requests, authorization, routing, async flows: [contract-auth-async.md](references/checklists/contract-auth-async.md)
- Vue SFCs, composables or Pinia in a Vue-based target: [vue-state-components.md](references/checklists/vue-state-components.md)
- content sinks, storage, runtime APIs, dependencies, build and compatibility: [security-performance-compat.md](references/checklists/security-performance-compat.md)
- platform styles, shared UI, docs, Git and delivery metadata: [styles-docs-delivery.md](references/checklists/styles-docs-delivery.md)

Read [references/automation-boundary.md](references/automation-boundary.md) before reporting style or static-analysis findings. Do not use LLM review to duplicate reliable formatter or linter output.

Limit findings to the selected diff. A finding must be introduced, modified, made reachable, or materially worsened by the changed lines. Use surrounding and historical code only to establish context and impact. For ESLint and similar tool output, report only diagnostics attributable to changed lines; exclude untouched historical diagnostics even when they are in a changed file.

## 5. Review With Evidence

Trace changed behavior through the minimum necessary context. For each candidate:

1. confirm it is introduced, modified, made reachable, or materially worsened by the change;
2. identify the concrete execution or data path;
3. cite the applicable rule and exact file/line evidence;
4. explain user, business, security, or maintenance impact;
5. assign severity and confidence;
6. propose a focused correction without expanding scope.

Use frontend smells only as investigation prompts. Read [references/frontend-smells.md](references/frontend-smells.md) when maintainability or architecture is in scope. Smells are never hard violations by themselves.

If subagents are available and useful, Spec, Standards, and Runtime Risk may be reviewed independently in parallel. Parallelism is optional; preserve the separation even in a single-agent host.

## 6. Report

Use [references/finding-format.md](references/finding-format.md).

- Order formal findings by severity, then confidence and impact.
- Use the three review axes internally to guide coverage; do not display the axis or normative source in the finding title.
- Put uncertain but material questions under `待确认事项`, not formal findings.
- Compress the review object, mode, scope source and range, platform, validation, and context gaps into the single opening sentence required by the finding format.
- Do not add a metadata table, finding index, counts, coverage recap, or repeated validation section.
- If there are no findings, say so clearly and identify remaining test or context gaps.
- Do not report untouched historical debt or historical lint failures unless the user explicitly requests a broader audit.

For provenance of team rules and empirical calibration, see [references/source-map.md](references/source-map.md).
