# Vue, State And Component Checklist

Load when the diff touches `.vue` files, composables/hooks, shared components, Pinia stores, directives, or component registration.

## Vue Reactivity

- Check derived values use `computed` without side effects.
- Check watchers are necessary effects, have controlled dependencies, and do not form loops or duplicate requests.
- For large objects/arrays, inspect whether deep reactivity is necessary; do not prescribe `shallowRef` without evidence.
- Move repeated or complex template computation into named derivations.
- Treat macro order, same-node `v-if/v-for`, basic prop mutation and syntax as automated concerns when active lint rules cover them.

## Component API

- Verify props are explicit enough to communicate the contract and defaults return valid values.
- Check emits express domain actions and parent-owned state is not changed through hidden channels.
- Trace shared-component API changes to representative consumers.
- Check input/output formats remain stable; transformations belong at a clear boundary.
- Evaluate controlled vs internal state according to caller needs, not a universal preference.

## Responsibility And Reuse

- Use line count only to select files for deeper review.
- Report mixed responsibilities only when independent state machines, scattered changes, testing difficulty or consumer complexity are demonstrated.
- Reuse requires a suitable existing abstraction; do not force abstraction for a single speculative use.
- Avoid props tunnels and wrapper layers that merely delegate without adding a stable contract.

## State

- Identify consumers and lifecycle before moving state into or out of Pinia.
- Check persistence sensitivity, cross-refresh need, cleanup and key semantics.
- Local filters, dialog state and page loading normally remain local; permissions, platform context and genuinely cross-page workflows may be shared.

## Documentation

- New shared composables, complex utilities and public components should document inputs, outputs, side effects and constraints.
- Require JSDoc where it materially preserves a non-obvious contract; do not report missing comments on self-explanatory local code.

## Severity

- MustFix: active prop default causes runtime failure, hidden mutation corrupts parent state, reactive loop or shared API break has demonstrated consumers.
- ShouldFix: material responsibility mixing, unjustified global state, unstable shared API or missing contract documentation.
- NiceToHave: naming and small readability improvements without behavioral risk.
