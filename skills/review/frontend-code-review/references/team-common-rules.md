# Team Common Rules

Rules apply across frontend platforms only where the underlying runtime supports them; repository evidence and the selected platform profile narrow them. `Hard` rules may produce MustFix findings when the violation and impact are demonstrated. `Contextual` rules require judgment. `Heuristic` rules only trigger investigation.

## Contracts And Behavior

| ID | Type | Rule |
|---|---|---|
| CONTRACT-001 | Hard | External API, route, form, table, enum and business fields must have an explicit source. Do not invent aliases or guess from similar fields. |
| CONTRACT-002 | Hard | Do not introduce multi-key business-field fallback without a documented compatibility contract or centralized adapter. Ordinary display defaults and boolean logic are not field fallback. |
| CONTRACT-003 | Contextual | High-risk parameter changes require an auditable `field -> source` mapping near the spec, docs, or code contract. |
| SCOPE-001 | Hard | Do not expand a focused change with unrelated refactors, renames, dependency changes, or compatibility behavior. |

## Async And Requests

| ID | Type | Rule |
|---|---|---|
| ASYNC-001 | Hard | Every active success, failure, early-return, cancellation and teardown path must settle Promises and restore user-visible pending state. `finally` is preferred, not the only valid implementation. |
| ASYNC-002 | Contextual | User-blocking operations need recoverable feedback and duplicate-submission protection appropriate to the interaction. Background requests do not automatically require page loading. |
| REQUEST-001 | Hard | Use the repository request abstraction unless the specification explicitly requires otherwise. Preserve interceptors, cancellation, authentication and error contracts. |
| REQUEST-002 | Contextual | Error paths must leave data in an intentional state; do not silently retain stale high-risk business data after failure. |

## Authorization And State

| ID | Type | Rule |
|---|---|---|
| AUTH-001 | Hard | Sensitive operations must align with the project's authorization model and rely on server-side authorization for final enforcement. Frontend gating alone is not proof of security. |
| AUTH-002 | Hard | Route, navigation, button/action and request authorization must use consistent permission or identity semantics. Do not invent a parallel permission key. |
| STATE-001 | Contextual | Keep page-private state local; use the repository's shared-state solution only for demonstrated cross-component, cross-page or cross-refresh needs. |
| STATE-002 | Hard | Persisted values must have justified sensitivity, lifetime, key semantics and cleanup. Do not persist secrets or high-risk business state without an explicit contract. |

## Framework And Components

| ID | Type | Rule |
|---|---|---|
| VUE-001 | Hard | In Vue-based targets, `computed` is derivation-only; effects belong in explicit effects, actions, lifecycle or watch with controlled dependencies. |
| VUE-002 | Contextual | In template-based frameworks, avoid complex transformation and side-effecting expressions in templates; derive testable values in script. |
| COMPONENT-001 | Contextual | Components need a coherent responsibility. File size is only a trigger to inspect mixed state machines, change diffusion and API complexity. |
| COMPONENT-002 | Hard | Shared component inputs and outputs must be stable and explicit. Child components must not mutate parent state outside an established two-way binding contract. |
| COMPONENT-003 | Hard | Prop defaults must return valid values and match the declared API. Determine severity from actual call paths and requiredness. |
| REUSE-001 | Contextual | Reuse the repository's dominant abstraction when it fits; do not hard-code a team-level hook or component name across repositories. |

## Security, Performance And Compatibility

| ID | Type | Rule |
|---|---|---|
| SEC-EXEC-001 | Hard | Do not introduce `eval`, `new Function`, or equivalent dynamic code execution. |
| SEC-HTML-001 | Hard | Untrusted or externally controlled HTML must pass through a documented, effective sanitization or allowlist boundary before an HTML-rendering sink. Trace source to sink. |
| SEC-STORAGE-001 | Hard | Do not store tokens, personal data, payment context or other sensitive values in insecure persistence without an explicit security design. |
| RESOURCE-001 | Hard | Resources such as object URLs, listeners, timers, observers and subscriptions must have reachable cleanup paths. |
| PERF-001 | Contextual | Evaluate heavy dependencies through actual import reachability, loading boundary and chunk impact, not package presence alone. |
| PERF-002 | Contextual | Large lists, charts, editors and visual builders should avoid unnecessary deep reactivity, repeated rendering and uncontrolled watchers. |
| COMPAT-001 | Hard | Verify new runtime APIs and style features against the repository's explicit browser, WebView or mini-program targets. Repository targets override team defaults when documented. |

## Styles, Documentation And Delivery

| ID | Type | Rule |
|---|---|---|
| STYLE-001 | Contextual | Local styles should not leak globally or break existing theme, UI-framework and shared-component boundaries. |
| STYLE-002 | Contextual | Prefer existing theme tokens and shared visual primitives when introducing colors, spacing, radius or shadows. |
| DOC-001 | Contextual | Update documentation for new shared components, routing/state organization, parameter mappings, upload/authorization/rich-text behavior and other high-risk public contracts. |
| DOC-002 | Contextual | Comments and JSDoc should explain non-obvious constraints, sources, edge cases and intent; do not demand narration of obvious code. |
| VALIDATE-001 | Hard | Claim only checks actually run. Match validation to risk and disclose unavailable scripts, environments, specifications and external services. |

## Mini-Program Conditional Rules

Apply these rules only after loading the mini-program profile. WeChat-specific wording applies only to a confirmed WeChat-native target.

| ID | Type | Rule |
|---|---|---|
| MP-CONFIG-001 | Hard | Application, page, component, package, permission and privacy configuration must match the files, entry paths and platform capabilities actually used. |
| MP-LIFE-001 | Hard | Page/component teardown must prevent reachable timers, listeners, tasks and stale async callbacks from continuing unsafe work or state writes. |
| MP-DATA-001 | Contextual | View synchronization must use the target runtime contract; for WeChat-native code, review `setData` path precision, frequency and payload rather than relying on direct `this.data` mutation. |
| MP-COMPONENT-001 | Hard | Native component properties, private data, methods and emitted events must preserve explicit ownership; observers, behaviors and relations must not create update loops or implicit parent mutation. |
| MP-IDENTITY-001 | Hard | Temporary platform login credentials must not be treated as durable identity or persisted/reused outside the established server exchange. Client code must not contain server secrets or final authorization logic. |
| MP-PRIVACY-001 | Hard | Sensitive platform APIs must align declarations, actual calls, user consent/refusal, fallback behavior and client/server responsibility. |
| MP-COMPAT-001 | Hard | Platform API/component use must match the repository runtime or base-library target and provide a supported detection/fallback path when required. |
| MP-WEBVIEW-001 | Hard | In a WebView-shell mini program, H5 entry URLs, messages, share/navigation fields and credential handoffs must stay within the repository's trusted origin and explicit cross-runtime contract. |
| MP-VALIDATE-001 | Hard | Platform-specific behavior must report developer-tool and real-device gaps explicitly; repository commands or simulators alone do not prove those paths. |

## Severity Defaults

- **MustFix**: demonstrated functional error, security exposure, missing sensitive authorization, unknown high-risk contract, broken Promise/loading path, destructive shared-contract change, or incompatible runtime behavior.
- **ShouldFix**: material maintainability, performance, architecture, documentation or validation gap with a plausible cost but no demonstrated critical failure.
- **NiceToHave**: non-blocking readability, naming or light simplification. Keep separate from formal blocking findings.

Severity is determined by impact and reachability, not rule wording alone.
