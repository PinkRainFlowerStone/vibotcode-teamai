# Security, Performance And Compatibility Checklist

Load when the diff touches rich content, DOM or platform content sinks, storage, authentication data, runtime APIs, uploads/downloads, clipboard/media, timers/listeners, dependencies, build configuration, large lists, charts, editors, or compatibility settings.

## HTML And Dynamic Execution

- For `v-html`, `innerHTML`, Markdown renderers and rich-text previews, trace source, transformations, sanitizer/allowlist and sink.
- Treat API, CMS, user and AI-produced content as untrusted unless a documented boundary proves otherwise.
- Verify sanitizer configuration, not just library presence.
- Reject dynamic code execution such as `eval` and `new Function`.

## Sensitive State And External Resources

- Check tokens, personal information, payment context and privileged data before persistence or logging.
- Review unknown CDN/domain assets and personal third-party keys.
- Check object URLs, event listeners, observers, media, timers and subscriptions have reachable cleanup.
- Distinguish diagnostic `console.error` from debug logs or sensitive-data leakage.

## Performance

- Trace new dependencies through import boundaries and route/component reachability.
- Check whether heavy modules enter the main entry or remain behind async boundaries.
- Inspect large reactive collections, repeated computation, deep watchers and list rendering.
- Review manual chunk changes only when build configuration or dependency topology changes.
- Do not infer bundle regression from `package.json` alone.

## Compatibility

- Determine targets from requirements, repository docs, Web build targets or mini-program manifests/base-library configuration.
- Check new language, style and runtime APIs against those targets.
- Evaluate polyfills and fallback cost only when changed or newly needed.
- For file preview/download, clipboard, media, share, payment, WebView bridges and mini-program platform APIs, identify target-specific behavior and validation gaps.

## Mini-Program Conditional Checks

Apply only when the mini-program profile is active.

- For WeChat-native code, inspect `setData` path precision, frequency and payload, especially in scroll/input handlers, long lists and callbacks after teardown.
- Review main-package/subpackage ownership, independent-subpackage dependencies, preload and lazy-loading changes against current manifests and current official limits; do not enforce a stale copied number.
- Check storage and logs for temporary login credentials, tokens, personal information, payment context, server keys and other sensitive values.
- Verify privacy/permission declarations, consent/refusal and fallback behavior for the sensitive APIs actually called.
- Match APIs and components to the repository base-library target and existing feature detection or compatibility layer.
- For a WebView shell, validate approved protocols/origins/paths before loading or navigating, validate `bindmessage` schemas, and minimize temporary credentials or business tokens in URLs, globals, storage and logs.
- Treat rich-text agreement or CMS content as externally controlled until an effective allowlist/sanitizer boundary is demonstrated; removing selected tags with regular expressions is not by itself proof of sanitization.

## Severity

- MustFix: demonstrated untrusted HTML sink, dynamic execution, sensitive-data exposure, missing required cleanup, or API incompatible with stated core targets.
- ShouldFix: plausible first-load regression, excessive reactivity, unjustified polyfill/dependency cost, or incomplete compatibility validation.
