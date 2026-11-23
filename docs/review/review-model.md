# Review Model

VibotCode frontend reviews use the `frontend-code-review` Skill as the process and output contract. Reviews separate specification and behavior, team standards, and runtime risk so evidence from one axis cannot hide a failure in another.

## Scope

- A non-empty workflow `scope` input or explicit user scope always wins and overrides the default baseline.
- Without an explicit scope, review committed changes from the merge base of `origin/pre...HEAD`, falling back to local `pre`.
- Uncommitted changes are excluded from that default and disclosed.
- Findings must be introduced, modified, made reachable, or materially worsened by the selected diff. Historical debt is excluded unless the user requests an audit.

## Workflow Inputs

- `scope` defaults to an empty string. A non-empty value is the explicit review target; an empty value preserves the standard origin/pre behavior.
- `requirements` defaults to an empty string and carries requirements, acceptance criteria, API mappings, or PR descriptions.
- `context` defaults to an empty string and carries additional task background or risk notes.
- Missing requirements and context do not block startup. Continue the Team Standards and Runtime Risk axes, and disclose which Spec & Behavior conclusions remain unverified.
- `vibotcode-self-check` accepts an optional `task` string with an empty default so implementation intent can flow into verification without breaking input-free starts.

## Platform

Classify the runtime before applying platform rules: PC Web, mobile Web, or mini program. Repository rules, manifests and runtime configuration override team defaults. Desktop, mobile Web and mini-program expectations must remain isolated; repository names do not determine the profile.

## Severity And Evidence

- `MustFix`: demonstrated functional, security, sensitive authorization, high-risk contract, async settlement, destructive shared-contract, or runtime compatibility failure.
- `ShouldFix`: material maintainability, performance, architecture, documentation, or validation risk without a demonstrated blocking failure.
- `NiceToHave`: optional readability, naming, or light simplification.

Each formal finding includes confidence, an exact file location, incremental attribution, rule ID, concrete evidence, impact, and a focused correction. Low-confidence questions are reported separately under pending confirmation. A review with no findings still states remaining test and context gaps.

