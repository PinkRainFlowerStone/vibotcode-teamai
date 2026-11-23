# Automation Boundary

Use repository tooling before model judgment. Configuration presence is not evidence that a check runs: inspect package scripts, hooks and CI.

## Prefer Automated Tools

Do not generate LLM findings for issues reliably handled by an active formatter or linter, including:

- indentation, quotes, semicolons, trailing commas and line wrapping;
- import ordering when configured;
- Vue macro order and basic SFC syntax;
- same-node `v-if`/`v-for` when the Vue rule is active;
- detectable unused imports, variables and unreachable syntax;
- deprecated deep-selector spelling when Stylelint/AST rules cover it;
- commit message shape when commitlint is active.

Report the tool output or the missing quality-gate integration, not a manually duplicated list of formatting problems.

When a linter reports the whole file or repository, map diagnostics back to the diff. Include only diagnostics on changed lines or diagnostics whose failure is directly caused by the changed lines. Treat all other ESLint, Stylelint, formatter, and type-check diagnostics as historical baseline and omit them from the review. Do not ask the author to fix unrelated historical diagnostics merely because the diff touches the same file.

## Model Review Is Required

Use semantic review for:

- whether a field source is contractually valid;
- whether fallback is compatibility logic or display behavior;
- Promise settlement and loading across reachable paths;
- whether an operation is sensitive under the project's authorization model;
- state scope and persistence rationale;
- shared component consumer impact;
- HTML trust boundary and sanitization quality;
- actual import/chunk reachability;
- project-specific browser targets and degradation;
- theme/global-style impact;
- whether docs/tests are warranted by risk.

## Quality-Gate Assessment

Classify tool status explicitly:

- `configured-and-enforced`: runs through scripts, hooks or CI;
- `configured-not-enforced`: config exists but no reliable invocation was found;
- `not-configured`;
- `unknown`: external CI or environment not available.

Missing enforcement is normally an engineering observation or ShouldFix, not a reason for the reviewer to become a formatter.

## Mini-Program Tooling

When the mini-program profile is active, treat developer-tool CLI/CI, automation packages and component simulators as repository capabilities only when dependencies, configuration and scripts prove they are used. Report their actual result without upgrading it to real-device proof.

Static analysis and component simulation cannot establish payment, privacy, authorization, sharing, location, media, file, Socket, package-performance or base-library behavior in the target user environment. Record the missing developer-tool, preview/trial or real-device validation instead of assuming success.
