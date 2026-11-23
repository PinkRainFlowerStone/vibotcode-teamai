# Styles, Documentation And Delivery Checklist

Load when the diff touches Web or mini-program styles, themes, shared UI wrappers, global/app styles, visual implementation, docs, commits, branches, CI or release configuration.

## Styles

- Determine the intended boundary: local scoped style, global reset/layout/theme, or UI-framework override.
- Check new selectors, deep overrides and specificity against the actual consumer scope.
- Prefer existing platform-supported variables, tokens and shared primitives for theme-sensitive values.
- Review duplicated style only when it creates drift or maintenance cost.
- Do not report every literal color, unscoped block or deep selector without impact evidence.
- With the mini-program profile, review WXML/WXSS application, page and component ownership plus actual style isolation. Do not impose browser selectors, global override behavior or Web unit assumptions on native mini-program code.

## Visual Fidelity

- Only review high-fidelity alignment when a design reference or explicit visual requirement is available.
- Check hierarchy, spacing rhythm, interaction state and responsive behavior before pixel-level preference.
- State when screenshots, assets or runtime rendering were unavailable.

## Documentation

- Check documentation updates for shared components, routing organization, Store responsibility, parameter mapping, upload, authorization, rich text and other high-risk public behavior.
- Keep comments near external constraints and edge cases; avoid demanding comments that restate code.

## Git And Delivery

- Apply branch-flow and commit-message rules only when reviewing commits/PR metadata, not as source-code defects.
- Distinguish development commits from permitted merge, release and automated version commits.
- Check unrelated files, formatting noise, debug code and accidental case-only renames in the diff.
- Inspect whether lint, build and test commands are actually available and enforced.
- Do not claim checks passed unless they ran successfully.
- For mini programs, separate repository commands from developer-tool compile/preview/upload, trial/real-device verification and unavailable platform checks.

## Severity

- MustFix: global style causes demonstrated application-wide breakage, release/config change violates an explicit protected workflow, or debug output exposes sensitive data.
- ShouldFix: theme drift, uncontrolled shared override, required public-contract docs missing, or absent validation for a high-risk change.
- NiceToHave: non-blocking token reuse, naming and small visual consistency improvements.
