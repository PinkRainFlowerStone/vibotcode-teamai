# Source Map

## Team Standard Source

- Document: `金融中台前端组开发规范.md`
- Version: v1.0.0
- Published: 2026-03-25

Mapped areas:

| Skill rules | Source sections |
|---|---|
| Project shape, naming, compatibility | 1-2 |
| JavaScript, ESM, Vue, async and reuse | 3 |
| Component API and responsibilities | 4 |
| State, Pinia, routing and authorization | 5 |
| Performance, build and security | 6 |
| SCSS, UnoCSS, themes and global styles | 7 |
| Git workflow and pre-commit checks | 8 |
| Docs, JSDoc and parameter mapping | 9 |
| Review order and severity | 10 |

The Skill translates normative statements into contextual review rules; it does not preserve every wording or treat every recommendation as a hard violation.

## WeChat Mini Program Official Sources

Reviewed on 2026-11-23:

- `App`, `Page`, `Component` and `setData`: `https://developers.weixin.qq.com/miniprogram/dev/reference/api/` and official `wechat-miniprogram/api-typings` `master`;
- configuration and packages: `https://developers.weixin.qq.com/miniprogram/dev/reference/configuration/app.html`, `https://developers.weixin.qq.com/miniprogram/dev/framework/subpackages.html`, and official `wechat-miniprogram/miniprogram-demo` `master`;
- network, login, storage, privacy and capability detection: the official `wx.request`, `wx.login`, `wx.setStorage`, `wx.getPrivacySetting` and `wx.canIUse` API pages;
- verification tooling: official developer-tool CI documentation, `wechat-miniprogram/miniprogram-ci-dist` and `wechat-miniprogram/miniprogram-simulate`.

These sources establish WeChat-native runtime behavior. They do not establish VibotCode business fields, fixed directories, repository commands, minimum base-library versions or package budgets. The complete source links and retrieval identifiers are recorded in `docs/vibotcode/resource-provenance.md`.

## Mini-Program Supporting Observation

The `mini-template` repository was inspected read-only on 2026-11-23 at branch `dev`, revision `0e3c232550e2fc19fb8820a271940d59f2e660f2`. It is supporting evidence that one WeChat-native shell can host primary H5 business in `<web-view>` while supplying selected native login, phone, payment, location, share and cross-mini-program capabilities.

The sample has no normative authority and does not make WebView the default architecture. Only conditional risk surfaces were retained: trusted H5 origins, entry URL and message schemas, nested encoding, credential handoff, page-stack/redirect behavior and platform verification. Its route names, API response fields, domains, AppID, storage keys, fixed base-library version and incomplete example flows are not review rules. The snapshot has no package manifest or repository lint/test/build scripts, so it does not establish an automated quality gate.

Mini-program review uses four distinct evidence layers: official WeChat constraints and examples define platform behavior; target-repository requirements and code define project choices; community engineering practices fill gaps in security, async control, state ownership, cleanup, maintainability and verification without being presented as official mandates; reference templates only reveal possible risk surfaces.

## Review Method Source

The independent-axis method is adapted from Matt Pocock's `code-review` Skill:

- source: `https://github.com/mattpocock/skills/blob/main/skills/engineering/code-review/SKILL.md`
- retained: fixed review point, separate Standards and Spec reasoning, repository standards overriding generic smells, heuristic smells, evidence-based aggregation;
- changed: Runtime Risk is explicit; issue-tracker setup and mandatory subagents are removed; platform classification and scope attribution are added.

## Empirical Calibration

The Web rules and profiles were calibrated through read-only analysis of representative Vue repositories:

- a PC administration project using Element Plus, VXE, dynamic menu authorization and a shared pagination composable;
- a mobile H5 mall using Vant, mobile identity/qualification flows, a shared refresh-list component and explicit legacy targets.

Repository-specific defects and filenames are not normative rules. Only repeated decision boundaries were retained: dominant abstraction discovery, repository compatibility overriding defaults, authorization-model differences, semantic async-path review, source-to-sink content analysis, and automation/LLM separation. The mini-program profile combines the official WeChat-native platform baseline, target-repository evidence and community engineering practices; the read-only `mini-template` observation only supplies a conditional WebView risk example and never selects architecture or business behavior.
