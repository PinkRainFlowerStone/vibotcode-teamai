# Runtime, Components And Data

## Configuration And Lifecycle

- Keep `app.json`, page JSON and component JSON aligned with files, routes, components, subpackages and platform capabilities actually used.
- Pair acquisition and cleanup across `App`, `Page` and `Component` lifecycle boundaries. Account for page hide/show, unload, component `detached` and page-stack navigation.
- Treat `onLoad` query and entry data from share, scan or navigation as external input governed by the repository contract.

## Rendering

- Use `setData` for view synchronization. Direct `this.data` mutation is not a view update contract.
- Prefer precise paths and bounded payloads. Avoid repeated large-object updates in scroll, input or other high-frequency handlers.
- Give list items stable identifiers when the data provides them; do not invent business keys.
- Keep complex transformations and side effects out of WXML expressions.

## Native Components

- Model inputs with `properties`, private state with `data`, callable behavior with `methods`, and outward communication with documented events.
- Use `observers`, `behaviors` and `relations` only when the existing design needs them; check update loops, ordering assumptions and teardown.
- Do not mutate parent-owned state through implicit references or shared mutable objects.

## Styles

Confirm application, page and component WXSS ownership plus the actual style-isolation setting. Browser selectors, global override behavior, CSS features and units are not automatically portable to the target base library.
