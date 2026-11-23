# Resource Provenance

This file maps source evidence to atomic TeamAI resources. Paths are relative to the parent VibotCode workspace at extraction time; no local absolute path is stored.

| Source evidence | Extracted decision | TeamAI resource |
| --- | --- | --- |
| `金融中台前端组开发规范.md` sections 1-10 | JavaScript-first Vue 3 style, component boundaries, API field provenance, loading cleanup, CSS scope, Git/review checklist | `rules/frontend/*`, `rules/review/frontend-review.md`, `docs/frontend/frontend-team-conventions.md` |
| All three project `AGENTS.md` | Read local conventions first, smallest complete change, verification honesty, Git safety | `rules/common/engineering-safety.md`, `agentsmd/common/team-working-agreement.md` |
| `eshop-admin-management-page/skills/YBT_B_VUE3/**` | Project discovery, API/constant/icon/style/validation workflow | `skills/frontend/vue3-feature-development/**`, `skills/vibotcode/project-onboarding/SKILL.md` |
| Two PC repository README/package/config/source snapshots | Desktop interaction, authorization, auto-import and conditional repository guardrails | `rules/frontend-pc/*`, `docs/frontend-pc/*`, `learnings/frontend-pc/*`, Web development Skill references |
| Mobile H5 repository README/package/config/source snapshot | Mobile identity, list refresh, compatibility, WeChat/payment/share and real-environment verification | `rules/frontend-mobile/*`, `docs/frontend-mobile/*`, `learnings/frontend-mobile/*`, Web development Skill references |
| WeChat Mini Program official documentation, official examples and official `wechat-miniprogram` repositories, reviewed 2026-11-23 | Primary platform evidence for native runtime/configuration/API behavior, lifecycle/data/component boundaries, privacy/security, compatibility and verification; framework, commands, fields and business rules remain repository-owned | `rules/frontend-mini-program/*`, `docs/frontend-mini-program/*`, `skills/frontend-mini-program/**`, `agents/frontend-mini-program/**`, `workflows/frontend-mini-program/**`, mini-program review profile/checklists |
| Community-standard engineering practices, separated from official platform mandates | Fill gaps in security boundaries, async settlement, state ownership, lifecycle cleanup, maintainability and evidence-based verification; repository contracts may specialize these practices within official constraints | Mini-program rules, development references, Agent/Workflow instructions and review checklists |
| [`mini-template` GitLab repository](https://gitlab.ycb51.cn/center_project/frontend/mini-app/mini-template.git), branch `dev`, revision `0e3c232550e2fc19fb8820a271940d59f2e660f2`, inspected read-only on 2026-11-23 | Supporting observation only: demonstrates one optional WebView-shell implementation and exposes native/H5 URL, message, credential, platform-domain and return-path risk surfaces. It does not determine default architecture, business rules or implementation choices; its routes, API fields, domains, AppID, storage keys, fixed base library and unfinished examples are non-normative | `rules/frontend-mini-program/mini-program-webview-bridge.md`, conditional WebView sections in the platform Doc, development Skill/Agent/Workflow and review profile/checklists |
| `skills/finance-frontend-code-review/**` plus TeamAI platform extension | Evidence-based incremental frontend review protocol, MustFix/ShouldFix/NiceToHave reporting, automation boundary, and isolated PC/mobile/mini-program profiles | `skills/review/frontend-code-review/**`, `agents/review/frontend-reviewer.yaml`, `workflows/review/vibotcode-frontend-review.yaml`, `rules/review/frontend-review.md`, `docs/review/review-model.md` |
| Seven backend repositories' `AGENTS.md`, `.ai/standards/**`, root/module POMs and adjacent source | Java 8 baseline, Spring Boot 2.7 conventions, local module boundaries, API/error/auth/data/async/review constraints | `rules/backend/**`, `rules/backend-review/**`, `skills/backend/**`, `skills/backend-review/**`, `agents/backend/**`, `agents/backend-review/**`, `agentsmd/backend/**`, `docs/backend/**`, `workflows/backend/**`, `workflows/backend-review/**` |
| `center-platform` source and POMs | Single-module MVC foundation service boundary | `rules/center-platform/platform-boundary.md`, `docs/center-platform/center-platform-profile.md` |
| `center-gateway` source and POMs | Reactive Spring Cloud Gateway boundary and non-blocking requirement | `rules/center-gateway/reactive-gateway.md`, `docs/center-gateway/center-gateway-profile.md` |
| `center-point`, `center-vip` and `center-chain` module trees, POMs and source | COLA client/adapter/app/domain/infrastructure/dbsdk/start dependency direction and service-specific invariants | Matching project rules and project profile docs |
| `center-manage` source and POMs | Single-module marketing orchestration boundary | `rules/center-manage/marketing-orchestration.md`, `docs/center-manage/center-manage-profile.md` |
| `center-mall` source, POMs and Redis-related implementations | Single-module mall boundary and runtime counter consistency | `rules/center-mall/mall-runtime.md`, project profile doc, mall learning |
| `xxl-job` root/module POMs, source and database documentation | Customized `com.ybt.xxljob` scheduler compatibility and admin/core module boundary | `rules/xxl-job/scheduler-platform.md`, project profile doc, scheduler learning |
| Official `Tencent/teamai-cli` 0.22.0 distribution and sharing guides | Independent team repo, intersect role ceilings/project scopes, resource file formats, workflow branches, review-before-merge | `teamai.yaml`, `manifest/*`, setup script, workflow layout and README |

## WeChat Mini Program official source snapshot

The following sources were reviewed on 2026-11-23. They establish platform behavior only; they do not supply VibotCode business fields, directory conventions or repository commands.

| Topic | Official source or identifier | TeamAI decision |
| --- | --- | --- |
| `App`, `Page`, `Component`, lifecycle, custom events and `setData` | [App](https://developers.weixin.qq.com/miniprogram/dev/reference/api/App.html), [Page](https://developers.weixin.qq.com/miniprogram/dev/reference/api/Page.html), [Component](https://developers.weixin.qq.com/miniprogram/dev/reference/api/Component.html), plus [`wechat-miniprogram/api-typings` `master`](https://github.com/wechat-miniprogram/api-typings) | Use native lifecycle and component contracts; pair teardown; update view state through `setData`; do not substitute Web/Vue lifecycle assumptions. |
| Application/page/component configuration, packages, preload and lazy loading | [App configuration](https://developers.weixin.qq.com/miniprogram/dev/reference/configuration/app.html), [subpackages](https://developers.weixin.qq.com/miniprogram/dev/framework/subpackages.html), [`wechat-miniprogram/miniprogram-demo` `master`](https://github.com/wechat-miniprogram/miniprogram-demo) | Keep declarations aligned with files and runtime use. Evaluate current official limits at implementation time instead of copying mutable numeric limits into rules. |
| Network and temporary login credential | [network](https://developers.weixin.qq.com/miniprogram/dev/framework/ability/network.html), [`wx.request`](https://developers.weixin.qq.com/miniprogram/dev/api/network/request/wx.request.html), [`wx.login`](https://developers.weixin.qq.com/miniprogram/dev/api/open-api/login/wx.login.html) | Reuse repository request/authentication layers, respect platform domain/HTTPS constraints, and exchange the temporary login credential through the server. |
| Storage, privacy and capability detection | [`wx.setStorage`](https://developers.weixin.qq.com/miniprogram/dev/api/storage/wx.setStorage.html), [`wx.getPrivacySetting`](https://developers.weixin.qq.com/miniprogram/dev/api/open-api/privacy/wx.getPrivacySetting.html), [`wx.canIUse`](https://developers.weixin.qq.com/miniprogram/dev/api/base/wx.canIUse.html) | Treat storage as non-secret persistence, align privacy declaration/consent/refusal with actual calls, and check base-library capability when required. |
| Developer-tool automation and component simulation | [developer-tool CI](https://developers.weixin.qq.com/miniprogram/dev/devtools/ci.html), [`wechat-miniprogram/miniprogram-ci-dist` `master` at `e5c123f9afd14df7cb6a6e30c5d02423ab010c44`](https://github.com/wechat-miniprogram/miniprogram-ci-dist), [`wechat-miniprogram/miniprogram-simulate` `master`](https://github.com/wechat-miniprogram/miniprogram-simulate) | Use only when the repository is configured for it. Automation and simulation do not replace developer-tool, preview/trial or real-device evidence for platform behavior. |

## Mini-program evidence precedence

1. WeChat official documentation, official examples and current base-library behavior define platform constraints.
2. Target-repository requirements, configuration, adjacent code and interface contracts define project architecture and business choices within those constraints.
3. Community engineering practices fill uncovered security, async, state, cleanup, maintainability and verification concerns; they are not labeled as WeChat mandates and do not override explicit repository contracts.
4. Reference templates such as `mini-template` are supporting observations only. They may trigger conditional checks when the target repository has the same architecture, but they never select that architecture or define team business rules.

## Backend snapshot

The backend evidence was read from clean working trees on the following revisions. These identifiers describe the extraction snapshot; they do not replace reading the current repository before a change.

| Repository | Branch | Revision |
| --- | --- | --- |
| `center-platform` | `prod` | `14dda805` |
| `center-gateway` | `prod` | `fdf2bb0` |
| `center-point` | `prod` | `63ecab15a` |
| `center-vip` | `prod` | `0ad8cacf` |
| `center-manage` | `prod` | `f350d0c4` |
| `center-mall` | `prod` | `b6e7fd5cd` |
| `center-chain` | `prod` | `3eaa9e0db` |
| `xxl-job` | `prod` | `eb760025` |

## Conflict handling

- Repository `AGENTS.md`, package scripts and adjacent code outrank the team-level summary.
- Backend repository `.ai/standards`, POMs and adjacent implementations outrank generalized backend resources. `xxl-job` has no repository `AGENTS.md` or `.ai/standards` in the recorded snapshot, so its POMs, source and database documentation are the primary evidence.
- The team guide says JavaScript-first; if a target file or future project is TypeScript, follow that repository instead of converting it.
- Frontend resources are selected by runtime namespace (`frontend-pc`, `frontend-mobile`, `frontend-mini-program`), never by business repository name. Platform rules prevent desktop, mobile Web and mini-program runtime assumptions from crossing.
- Frontend and backend implementation resources use separate namespaces. With `namespaceMerge: intersect`, roles are capability ceilings and projects are directory candidate sets. Frontend review remains in `review`; backend review uses `backend-review` because TeamAI 0.22.0 isolates at the first namespace segment and one shared namespace would deliver both review stacks.
- TeamAI 0.22.0 keeps Learnings on role+project union even when other axes intersect. A mismatched selection may therefore receive the selected platform/project learning records, but receives no cross-domain Skill, Agent or Workflow; setup rejects obvious mismatches before pull.
- The imported review Skill supplies common review behavior and platform differences. Repository-specific commands, aliases, guardrails, identity parameters and tool configuration are discovered from the current repository rather than encoded as TeamAI project identity.
- The source Skill remains unchanged at `skills/finance-frontend-code-review`. Its TeamAI copy is renamed to `frontend-code-review` so the directory and frontmatter name match the CLI resource contract.
- The imported `MustFix`/`ShouldFix`/`NiceToHave` protocol replaces `P1`/`P2`/`P3` only for frontend review resources. Backend review retains the evidence-backed `P1`/`P2`/`P3` contract defined by backend rules, Skill, Agent and Workflow.
- Browser and runtime baselines follow the selected platform and current repository configuration. PC reference targets do not apply to mobile Web; browser rules do not apply to mini-program runtimes.
- The team guide asks for JSDoc in hooks, utils and complex functions. This is kept as review context rather than an unconditional global rule because existing repositories are not uniformly documented.
- Extracted backend rules record observed engineering constraints, not new business policy. Unknown permissions, status transitions, data ownership and compatibility behavior must be confirmed in current code or with the owning team.

## Promotion rule

New rules begin as docs or learnings when evidence is incomplete. Promote them to `rules/` only after repeated validation and human review. Experimental personal resources remain outside this shared repository until promoted through PR/MR.

