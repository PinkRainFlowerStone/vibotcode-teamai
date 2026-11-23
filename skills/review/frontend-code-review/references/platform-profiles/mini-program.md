# Mini Program Profile

## Apply When

Apply to native mini programs and cross-platform projects whose selected build targets a mini-program runtime. Confirm using app/page/component/subpackage manifests, build dependencies, developer-tool configuration or an explicit user statement. Do not classify by repository name.

## Platform Evidence

- target platform and framework;
- application/page/component registration, package ownership and entry paths;
- base-library or runtime version;
- platform permissions, privacy declarations and environment configuration;
- request, login credential, storage and platform-adapter layers;
- developer-tool, preview, upload and real-device verification paths.

## WeChat-Native Checks

Apply this section only when the evidence confirms a WeChat-native target.

### Runtime And Rendering

- Verify `app.json`, page JSON and component JSON against actual files, routes, components, subpackages and capabilities used.
- Trace `App`, `Page` and `Component` lifecycle acquisition and cleanup, including page hide/show, unload, component `detached` and callbacks that may finish after teardown.
- Treat `onLoad` query and share/scan/navigation entry data as external input. Require repository contract evidence for business fields.
- Check `setData` path precision, frequency and payload. Direct `this.data` mutation is not evidence of view synchronization.
- Review WXML list identity, conditional/event behavior and expression complexity; review WXSS application/page/component ownership and actual style isolation.

### Native Components

- Check `properties`, `data`, `methods` and emitted events as explicit inputs, private state, behavior and outputs.
- Inspect `observers`, `behaviors` and `relations` only where used; look for update loops, ordering assumptions, implicit parent mutation and teardown leaks.

### Platform APIs And Trust Boundaries

- Verify request/upload/download/Socket calls preserve the repository network, authentication, timeout, error and environment layers plus platform domain/HTTPS constraints.
- Treat `wx.login` output as a temporary server-exchange credential, not durable identity. Any client-side `appSecret`, server key, signing key or final authorization decision is a MustFix candidate.
- Review storage necessity, sensitivity, lifetime, key contract and cleanup; do not assume storage is secret.
- Align privacy/permission declarations, actual API calls, user consent/refusal and fallback behavior.
- Treat payment, subscription messages, sharing, scanning, location, media, files and uploads as high-risk client/server integrations requiring duplicate-action, cancellation/failure and real-device analysis.

### WebView Shell

Apply only when the target repository itself uses native `<web-view>` pages to host H5 business. This is one optional architecture profile, not the default for mini-program review. Never select it merely because a team reference template uses WebView.

- Trace platform business-domain configuration, repository environments and the approved H5 origins together.
- Treat page query URLs and `bindmessage` data as external input. Validate message types and share/navigation fields before use.
- Trace nested URL/JSON encoding and every native-to-H5 login token or authorization-code handoff.
- Verify native page-stack, H5 redirect, re-entry and cross-mini-program return/failure behavior as one contract.

### Compatibility, Packages And Validation

- Check new APIs/components against the repository base-library target and existing compatibility layer; use `wx.canIUse` reasoning only where a supported fallback is needed.
- Review main-package, subpackage, independent-subpackage, preload and lazy-loading changes against current manifests and current official limits. Do not enforce copied numeric limits.
- Check `setData`, long lists, images/media and resources with actual reachability or measurement evidence.
- Separate repository command results, developer-tool results, preview/trial or real-device results and unverified gaps.

## Overrides

- Do not require browser DOM, Web routing, localStorage, viewport/rem, Element Plus or Vant H5 patterns.
- Do not apply the WeChat-native section to another mini-program platform or cross-platform source unless its selected build has equivalent verified semantics.
- Treat login credentials, user identity, payment, subscription messages, sharing, location, media, upload/download and privacy declarations as high-risk when touched.
- Apply Vue-specific component rules only when the actual cross-platform framework uses Vue semantics in the reviewed source.

## Validation

Repository lint, typecheck, tests, builds and component simulation do not replace target developer-tool or real-device checks for platform behavior. Report unavailable platform validation as a gap rather than assuming success.

The `mini-template` initialization repository is only a supporting observation of one WebView-shell implementation. It has no authority to select architecture or define business rules. Do not turn its routes, fields, domains, storage keys, commands or unfinished examples into team policy.
