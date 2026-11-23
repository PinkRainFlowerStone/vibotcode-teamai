# Frontend Smells

These are labelled heuristics, never hard violations. Investigate them only when the diff provides evidence of impact.

- **Mysterious Domain Name**: names such as `data`, `info`, `temp`, `step1`, or `getList` hide business meaning. Suggest renaming only when comprehension or debugging is materially impaired.
- **Scattered Contract Knowledge**: the same external-field mapping or status interpretation appears in multiple pages. Prefer a documented adapter or domain utility.
- **Page God Component**: one SFC coordinates several independent forms, tables, dialogs, requests or state machines. File length alone is insufficient.
- **Props Tunnel**: multiple layers forward props/events without owning behavior. Consider composition, scoped slots, or a narrowly scoped shared context.
- **Hidden State Ownership**: a reusable component keeps state callers need to control or silently mutates parent-owned data.
- **Watch Cascade**: chained or deep watchers reproduce derivation, cause loops, or trigger duplicate requests.
- **Template Computation**: expensive transforms or business decisions are embedded in templates and repeated per render.
- **Global Store Creep**: local UI state moves into Pinia without cross-page or lifecycle need.
- **Speculative Abstraction**: a hook, wrapper, option or generic component exists for hypothetical reuse rather than a present requirement.
- **Duplicated Flow**: pagination, request state, permission checks, normalization or error handling are copied despite a suitable project abstraction.
- **Change Diffusion**: one business change requires scattered edits because related rules are not colocated.
- **Style Escape**: global selectors, deep overrides or magic values bypass the theme/shared-component boundary.
- **Compatibility Fog**: fallbacks and polyfills exist without a documented runtime target or removal condition.
- **Unreachable Legacy Capability**: broken old helpers are not currently called. Report reachability separately; do not claim an active production failure.

Repository standards override a smell. Do not recommend abstraction or component splitting when it would increase coupling, prop tunnelling or regression surface.
