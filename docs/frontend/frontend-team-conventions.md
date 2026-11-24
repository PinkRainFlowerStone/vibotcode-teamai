# Frontend Team Conventions

## Technology baseline

Current verified PC and mobile Web repositories use Vue 3, Vite, Vue Router, Pinia, Axios and SCSS, but exact UI frameworks, versions and build targets remain repository-owned. The mini-program platform baseline targets native WeChat development; no business repository is used to prescribe a single mini-program architecture.

## Working principles

- Read repository facts before implementing.
- Prefer readable, traceable data flow over clever abstractions.
- Keep interface fields and their sources explicit.
- Reuse existing components, request utilities, stores, hooks, tokens and icon systems.
- Extract only when reuse, readability or ownership boundaries justify it.
- Treat permissions, payment, ordering, points, strategy canvas and rich text as high-risk areas.

## Point-to-point integration

| Concern | Shared decision | Platform/repository decision |
| --- | --- | --- |
| API and state | Existing request layer, explicit field provenance, loading cleanup | PC/mobile reuse local Web abstractions; mini programs reuse local platform adapters |
| Authorization | Reuse the existing permission or identity source | PC actions, mobile guest/login, and mini-program credentials follow different platform chains |
| Components and styles | Controlled components and local ownership | PC, mobile Web and mini-program component/style systems stay isolated |
| Compatibility | Read repository targets before choosing APIs or polyfills | Browser/WebView targets differ from mini-program base-library targets |
| Runtime safety | Trace HTML/content sinks, storage, async resources and heavy dependencies | Platform APIs, payment/share and repository guardrails add conditional checks |

Prettier, ESLint, commitlint, auto-import and exact aliases remain repository-owned configuration. TeamAI directs the agent to those sources instead of duplicating their values as a second configuration system. JSDoc is required when it preserves a non-obvious hook, utility or public contract, not as a blanket comment quota.

## Verification baseline

Use each repository's scripts rather than a generic command list. Platform selection never implies that a lint, test, build, guardrail or device command exists.

## TeamAI CLI Compatibility

- The supported published CLI contract for this resource set is `teamai-cli@0.30.0` (`v0.30.0`, released 2026-11-11). Skills use standard `SKILL.md` frontmatter; agents use the canonical YAML fields `name`, `description`, `instructions`, optional `tools`, `model` and `targets`; rules and docs remain Markdown resources.
- Frontend self-check and review workflows use only the published `v1alpha1` workflow schema: declared string inputs, `defaults.inputs`, `invoke: allow`, prompt-step `workspace: read-only`, named agent references and typed output schemas.
- The published `v0.30.0` contract merges Role and Project namespaces. The `frontend` role supplies PC/mobile Web development, `frontend-mini-program` supplies native mini-program development, and `frontend-review` supplies review; the project supplies only platform context. Do not depend on `sharing.namespaceMerge` or other later `main`-branch behavior.

