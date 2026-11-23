# Platform APIs, Identity And Privacy

Apply the `wx.*` details only to WeChat mini programs.

## Network And Async Work

- Reuse the repository request, authentication, error and environment layers for request, upload, download and Socket operations.
- Verify platform domain/HTTPS requirements and repository timeout, concurrency and retry policy. Do not rely on developer-tool validation bypasses.
- Settle success, failure, cancellation and timeout paths. Protect against duplicate actions, stale responses and callbacks after page/component teardown.

## Identity And Storage

- Treat the value from `wx.login` as a temporary credential to exchange through the existing server-side login flow, not as durable identity or an application session.
- Never place `appSecret`, server credentials, signing keys or final authorization decisions in the client.
- Persist only data with a justified purpose, sensitivity, lifetime and cleanup strategy. Reuse the repository storage wrapper and key contract.

## Privacy And High-Risk APIs

- Align application declarations, actual API calls, user notice/consent, denial handling and fallback behavior.
- Inspect phone number, location, album, camera, microphone and other sensitive capabilities for a complete refusal path.
- For payment, subscription messages, sharing, scanning, location, media, files and uploads, establish client/server ownership, duplicate-action protection, cancellation/failure behavior and required real-device coverage.
- Check target base-library support and use `wx.canIUse` or the repository compatibility layer where a supported fallback is needed.
