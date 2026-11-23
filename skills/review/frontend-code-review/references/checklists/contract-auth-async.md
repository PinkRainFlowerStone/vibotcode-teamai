# Contract, Authorization And Async Checklist

Load when the diff touches API modules, request wrappers, forms, tables, route params, enums, router, authentication, permissions, payment/actions, async composables or list loading.

## Contract

- Map every new or changed external field to its declared source and destination.
- Distinguish business-field fallback from display defaults, boolean logic and intentional initialization.
- Check whether compatibility logic is centralized, documented and time-bounded rather than scattered through pages.
- Check request method, payload/query/form-data encoding and response normalization against the existing request contract.
- For high-risk flows, look for a parameter mapping or equivalent spec evidence.

## Authorization

- Identify the project's authorization model before checking controls.
- Trace navigation/route gating, visible action gating and request/server enforcement separately.
- Verify sensitive actions use established permission, identity, ownership or eligibility semantics.
- Detect newly invented permission keys or duplicated authorization logic.
- Do not infer backend authorization from hidden frontend UI.

## Async Control Flow

- Trace all success, error, early return, cancellation, unmount and retry paths.
- Confirm Promises resolve/reject and pending state terminates on every reachable path.
- Check stale response races, duplicate submissions and dependent requests.
- Verify error paths reset or preserve data intentionally.
- Check that background requests do not create unhandled rejections.

## Lists

- Discover and reuse the repository's dominant list/pagination/refresh abstraction.
- Check page reset when filters change, total/list consistency, empty/end states and request deduplication.
- Apply list, page, lifecycle and identity semantics from the loaded platform profile.

## Mini-Program Conditional Checks

Apply only when the mini-program profile is active.

- Trace page entry parameters, share/scan results and component events to their declared source; do not infer business aliases from similar fields.
- For WeChat-native login, distinguish the temporary `wx.login` credential, server-side identity exchange and resulting application session. Reject client-side secrets or parallel identity stores.
- Include page hide/unload and component `detached` when tracing Promise, callback, request-task, timer and duplicate-action paths.
- Check state ownership across page-private data, component input/output, cross-page state and persistence; do not require a team-wide store abstraction.
- For a WebView shell, map native page queries, H5 redirects/messages, share fields and cross-mini-program parameters to their owner and consumer. Check URL/JSON encoding once per boundary rather than accepting opaque pass-through strings.

## Severity

- MustFix: unknown high-risk payload field, broken Promise settlement, permanently stuck loading, duplicate financial operation, sensitive authorization gap.
- ShouldFix: fragmented compatibility logic, non-critical request with unclear error policy, duplicated list state despite a suitable project abstraction.
