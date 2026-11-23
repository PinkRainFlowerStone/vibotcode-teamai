# Mobile H5 Profile

## Scope

Apply to mobile web, H5 malls, campaigns, consumer journeys and WebView applications. Typical signals include Vant or similar mobile UI systems, viewport/rem conversion, touch-first layouts, mobile navigation stacks, guest/login flows, order/payment/claim state, sharing, location, media or legacy mobile targets.

This profile adds or narrows common rules. It does not replace them.

## Identification Signals

- mobile UI framework, touch interaction and 375/750 design conversion;
- H5 routes, browser/WebView back behavior, fixed bottom actions;
- login/guest/site/activity qualification rather than menu RBAC;
- browserslist, legacy, Babel or polyfill configuration for mobile targets;
- mobile payment, share, location, clipboard, media or app bridge behavior.

Do not infer mobile solely from one dependency. State the evidence and confidence.

## Authorization And Eligibility

- `OVERRIDE AUTH-001`: evaluate the project's actual model: login state, guest whitelist, activity eligibility, order ownership, payment/claim state and server-side authorization.
- Absence of PC permission directives is not a defect.
- Check that sensitive actions cannot be triggered through stale UI state, repeated taps or route bypass; distinguish UX gating from server enforcement.

## Lists And Interaction State

- `OVERRIDE REUSE-001`: identify the dominant refresh/list-loading component or composable. Do not require a PC pagination hook.
- Check refresh, load-more, empty, error, cancellation, deduplication and end-of-list paths.
- Check repeated submission, weak-network recovery, page resume and navigation-back behavior when relevant.

## Compatibility

- `OVERRIDE COMPAT-001`: explicit browserslist, Vite target, WebView kernel and legacy configuration override team desktop defaults.
- Do not report legacy/polyfill configuration as debt merely because modern browsers do not need it.
- When new APIs are used, verify support or an intentional fallback for actual mobile targets.
- Review safe-area, keyboard, viewport, orientation and fixed-position behavior only when the diff touches relevant UI.

## Commerce And High-Risk Flows

- Prioritize order amount, inventory, coupons, address, payment, refunds, activity qualification and claim-state transitions.
- External-field mappings in checkout and payment flows require strong contract evidence.
- Loading and button locks must terminate correctly without enabling duplicate financial operations.

## Performance And Media

- Inspect route/component lazy loading, image strategy, carousel/video/audio initialization and large campaign assets when touched.
- A heavy dependency is acceptable behind an async module; prove first-screen reachability before reporting bundle risk.
- Check cleanup for media players, observers, timers, listeners and object URLs.

## Rich Content

- CMS, product, article, rule and campaign HTML often reaches `v-html`; trace source and sanitization evidence.
- A backend-cleaning claim must be documented or otherwise verifiable before suppressing SEC-HTML-001.

## Exclusions And False Positives

- `EXCLUDE`: PC menu, table-density, tab-workspace and desktop bulk-operation expectations unless present.
- Do not report missing RBAC directives solely because the project uses identity/qualification rules.
- Do not require `usePagination` or another PC-specific abstraction.
- Do not treat old browser targets, core-js or legacy output as violations without project evidence.
- Do not treat all stores or persisted site/search state as excessive; inspect sensitivity and lifecycle.
