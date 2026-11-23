# Review Protocol

## Evidence Precedence

Resolve conflicts in this order:

1. explicit requirements, acceptance criteria, and business/security constraints;
2. nearest repository instructions and documented project contracts;
3. executable repository configuration and established shared abstractions;
4. team common rules;
5. the confirmed platform profile;
6. recurring project practice supported by multiple representative samples;
7. general Vue/frontend heuristics;
8. reviewer preference.

Do not treat frequency as correctness. When written rules and current code conflict, report the conflict and its scope instead of silently choosing either side.

## Review Axes

### Spec & Behavior

Check missing or partial requirements, incorrect implementation, unrequested scope, boundary behavior, and UI behavior against available specifications. Quote or cite the requirement when possible. If no spec exists, state that behavioral completeness cannot be fully verified.

### Team Standards

Check documented repository rules first, then applicable team rules. A repository may intentionally override a team default, such as browser targets or the dominant pagination abstraction. Cite the actual source for every hard-standard finding.

### Runtime Risk

Trace authorization, external field contracts, async state, data transformations, rich text, persistence, browser APIs, shared components, import boundaries, and regression paths. Prefer behavior and reachability over syntax matching.

## Scope Attribution

Classify each candidate as:

- `introduced`: newly added by the diff;
- `modified`: existing behavior changed by the diff;
- `made-reachable`: old code becomes newly reachable through the diff;
- `worsened`: the diff materially increases an existing risk;
- `historical`: untouched and unaffected by the diff.

Formal findings require one of the first four classifications and a direct causal link to the diff. Use unchanged surrounding code only as evidence for the changed behavior; do not turn it into a separate finding. Exclude `historical` issues entirely unless the user explicitly requests a historical or whole-repository audit.

For lint and static-analysis diagnostics, intersect tool output with changed lines. Report only diagnostics introduced on, or directly caused by, added or modified lines. Ignore pre-existing ESLint or Stylelint findings on untouched lines, including findings elsewhere in a changed file; do not require the author to clear the file's historical lint baseline.

## Context Discovery

Inspect enough surrounding code to understand behavior, but do not turn review into an unbounded repository audit. Follow imports and consumers when needed to verify:

- field source and payload destination;
- authorization source and enforcement point;
- Promise settlement, loading and cleanup paths;
- shared component API impact;
- route and state reachability;
- HTML source, transformations and sink;
- dependency location in the import graph;
- browser target and fallback behavior.

## Confirmation Policy

Treat a value as confirmed when it is explicitly supplied, resolved by a documented default, or supported by unambiguous repository evidence. Do not turn every review into a questionnaire.

### Blocking Confirmation

Ask the user before proceeding only when an unresolved choice would materially change the diff, applicable platform rules, or authorized action. Blocking cases include:

- no repository or review object can be identified, or several candidates are equally plausible;
- an explicit scope is invalid, empty, or conflicts with another explicit instruction;
- a default branch review cannot resolve either `origin/pre` or local `pre`;
- the default diff is unexpectedly empty while the request indicates that changes should exist;
- platform evidence conflicts, or the change crosses runtimes and one platform profile cannot represent the intended review.

Combine all known blocking questions into one short message. Ask only for unresolved values and offer a recommended choice when one is safe. Do not require host-specific question tools; the policy must work in any agent host.

### Safe Defaults

- No explicit range: review committed `origin/pre...HEAD`, falling back to local `pre...HEAD`.
- No explicit mutation request: review only and do not edit files.
- Uncommitted changes: exclude them from the default branch review and disclose the exclusion.
- Clear platform evidence: infer the platform and report the evidence and confidence instead of asking.
- Platform-neutral changes: apply common rules without blocking on platform classification.

### Non-Blocking Supplements

Requirements, issue or PR descriptions, designs, API mappings, acceptance criteria, high-risk business notes, and requests for historical auditing are useful but normally optional. Briefly state what the review will assume and invite the user to provide them, then continue without waiting.

If missing context affects only one conclusion, continue the rest of the review. Ask a targeted question when an answer could turn a material uncertainty into or out of a `MustFix`; otherwise place it under `待确认事项` and describe the limitation.

Do not expand from incremental review to historical or whole-repository auditing unless the user explicitly requests it.

## Missing Context

- Missing spec: continue Standards and Runtime Risk; report the Spec gap.
- Missing API contract: do not invent field meaning; raise a targeted question when the diff depends on it.
- Missing design reference: do not report visual fidelity as a defect.
- Missing backend/security evidence: distinguish frontend behavior from unverified server enforcement.
- No runnable lint/test/build command: report validation limits, not success.

## Parallel Review

When independent subagents are available, the three axes may run separately with the same diff metadata and only the context needed for that axis. The coordinator deduplicates exact overlaps but does not let one axis suppress another. Do not require subagents for correctness.
