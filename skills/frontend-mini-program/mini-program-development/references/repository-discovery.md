# Repository Discovery

## Confirm Before Editing

- Read repository instructions and the nearest implementation before choosing structure.
- Locate the actual mini-program root from `project.config.json`, build configuration or existing scripts; do not assume a fixed folder.
- Inspect `app.json`, touched page/component JSON, subpackage declarations, privacy/permission declarations and target base-library settings where present.
- Inspect `package.json` and lockfile before naming any lint, typecheck, test, build, preview or upload command.
- Identify JavaScript versus TypeScript from existing source and build configuration. Preserve the existing choice.

## Classify The Platform

Use the WeChat-native baseline only when evidence shows WXML/WXSS, native JSON registration, `App`/`Page`/`Component`, `wx.*`, WeChat developer-tool configuration or an explicit requirement.

For any existing cross-platform framework, follow its current repository configuration and selected target. Do not rewrite native rules as framework APIs or introduce a new cross-platform dependency.

## Repository-Owned Contract

Keep these decisions repository-owned unless explicit requirements say otherwise: page paths, directory layout, business fields, API payloads, component library, state model, request wrapper, storage keys, environments, minimum base library, package budgets, automation and release flow.
