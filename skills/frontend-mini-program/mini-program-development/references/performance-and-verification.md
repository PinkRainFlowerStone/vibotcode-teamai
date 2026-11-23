# Performance And Verification

## Performance Review

- Inspect `setData` path precision, frequency and payload size; pay special attention to page scroll, input, long lists and callbacks that may outlive the page.
- Check image/media loading, failure, release and reuse against the actual interaction.
- Review main-package, subpackage, independent-subpackage, preload and lazy-loading changes against current manifests, base-library support and the release path.
- Look up current official numeric limits when a change approaches a platform boundary. Do not rely on a copied team-level constant.

## Compatibility And Release

- Determine the repository's target base library and environment model before adding an API or component.
- Preserve existing development, trial and production environment selection, `envVersion`, gray-release and rollback conventions.

## Evidence Levels

1. Repository commands: only scripts that exist and actually ran.
2. Developer tools: compile, preview, upload or quality analysis that actually ran.
3. Trial/real device: platform behavior that actually ran on the required environment.
4. Gaps: every unavailable tool, account, service, requirement or device check.

`miniprogram-ci`, automation packages and component simulators are optional repository capabilities, not defaults. Component simulation does not prove real-device payment, privacy, authorization, media, file, Socket, performance or compatibility behavior.
