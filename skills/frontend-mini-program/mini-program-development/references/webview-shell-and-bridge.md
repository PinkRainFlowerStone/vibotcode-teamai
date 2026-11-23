# WebView Shell And Bridge

Read this reference only when the target repository itself shows that native mini-program pages host H5 business through `<web-view>`. This is an optional runtime profile, not a default or preferred architecture. Do not introduce, retain or migrate to WebView merely because a reference template uses it.

## Establish The Contract

- Identify the configured business domains, server domains, environment selection and default H5 entry from repository and platform evidence.
- Map every native page entry, H5 redirect, message type, share field and cross-mini-program parameter to its owner and consumer.
- Keep template-specific route names, API fields, authorization parameters and storage keys local to the target repository.

## Validate Cross-Runtime Input

- Treat page query values, scan/share entry data and H5 messages as external input.
- Before loading or navigating, validate the repository-approved protocol, origin, path and parameter shape. Platform domain configuration is a necessary boundary, not a complete application contract.
- Decode URL or JSON data at the owning boundary and encode it once for the next boundary. Trace nested URLs explicitly.
- Validate `bindmessage` data against allowed message types and field schemas before using it for sharing, navigation, identity or payment behavior.

## Protect Identity And Navigation

- Send temporary login credentials and application tokens only to the established trusted server/H5 flow. Minimize URL, global-state, storage and log exposure.
- Define native page-stack, WebView return, H5 redirect, re-entry and cross-mini-program failure behavior. Clear temporary handshake state after success, cancellation or failure.
- Preserve duplicate-action protection and teardown guards while an H5 page, login exchange or target mini program is opening.

## Verify Both Sides

Check the native page, H5 receiver and platform configuration together. Developer-tool compilation alone cannot prove production business-domain configuration, real-device message timing, login, payment, share, location or cross-mini-program return behavior.
