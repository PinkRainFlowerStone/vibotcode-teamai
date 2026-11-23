# Frontend Team Conventions

## Technology baseline

Current verified PC and mobile Web repositories use Vue 3, Vite, Vue Router, Pinia, Axios and SCSS, but exact UI frameworks, versions and build targets remain repository-owned. Mini-program frameworks are not yet standardized or evidenced by a business repository.

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

