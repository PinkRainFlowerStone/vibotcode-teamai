# PC Administration Profile

## Scope

Apply to desktop administration, operations, data, risk-control, marketing, configuration and internal-platform interfaces. Typical signals include Element Plus or similar desktop UI systems, dense tables/forms, persistent side navigation, dynamic menus, role permissions, bulk operations, import/export, charts or visual editors.

This profile adds or narrows common rules. It does not replace them.

## Identification Signals

- desktop-oriented UI framework, table and form system;
- menu-derived routes, tabs, keep-alive or workspace layout;
- RBAC or permission-key based actions;
- dense search/table/detail/dialog workflows;
- desktop browser targets and large viewport assumptions.

Do not infer PC solely from one dependency. State the evidence and confidence.

## Authorization

- `ADD AUTH-PC-001`: menu, route and sensitive action permission keys should derive from the same authorization source.
- `NARROW AUTH-001`: not every visible button is sensitive. Prioritize create/update/delete, approval, export, financial adjustment, configuration and privileged queries.
- Check frontend gating for UX and server enforcement separately. Missing server evidence is an unverified boundary, not proof of safety.

## Lists, Tables And Forms

- `OVERRIDE REUSE-001`: identify the repository's dominant pagination/table/search abstractions. Use their actual names; never require a cross-project hook name.
- Check page reset, selection persistence, bulk-action eligibility, total/list synchronization, request race handling and export scope.
- Check explicit field sources for columns, filters, payloads, enum labels and detail views.
- Treat a large form/table SFC as a responsibility-review trigger, not an automatic violation.

## State And Navigation

- Check whether dynamic-route, menu, tab and keep-alive state use coherent keys and cleanup.
- Global platform, permission and workspace state may legitimately live in Pinia; transient dialogs, filters and loading generally remain local.
- Avoid proposing route or authentication rewrites in an unrelated business diff.

## Performance

- Inspect editors, charts, graph/flow builders, large tables and visualization modules for lazy-loading and chunk boundaries.
- Check large reactive collections, repeated column/config creation, uncontrolled deep watchers and expensive template transforms.
- Dependency presence alone is not a finding; prove entry or chunk impact.

## Compatibility

- `NARROW COMPAT-001`: use repository targets. Desktop team defaults apply only when no stronger project evidence exists.
- File preview, download, clipboard, media and export behavior require target-browser validation when touched.

## Styles And Shared UI

- Check Element Plus/VXE/shared-wrapper overrides for global impact and theme consistency.
- Unscoped styles are allowed in documented global reset, layout, theme and framework override layers.
- Deep selectors require an actual encapsulation need and a controlled scope.

## Exclusions And False Positives

- `EXCLUDE`: mobile viewport conversion, safe-area, touch and mobile browser-navigation rules unless the PC app explicitly embeds mobile surfaces.
- Do not report a missing permission directive solely from button text.
- Do not demand a particular pagination hook.
- Do not split a complex editor or canvas merely because it exceeds a line threshold.
- Do not treat every display fallback such as `value || '--'` as a contract violation.
