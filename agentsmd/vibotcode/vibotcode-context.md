# VibotCode Context

VibotCode 工作区包含多个前端仓库和 8 个 Java 后端项目，全部是独立 Git 仓库。进入任一仓库后，以该仓库的 `AGENTS.md`、`.ai/standards/`、构建清单和相邻代码为最终依据。

- 前端不按仓库名选择 TeamAI project，而按运行端选择 `frontend-pc`、`frontend-mobile` 或 `frontend-mini-program`。平台画像只约束运行端差异；API、路由、自动导入、组件、环境变量和验证命令始终从当前仓库读取。
- 后端：`center-platform`、`center-manage`、`center-mall` 为单模块 MVC；`center-gateway` 为 WebFlux 网关；`center-point`、`center-vip`、`center-chain` 为 COLA 多模块；`xxl-job` 为定制 admin/core 调度平台。不要跨架构套用分层、阻塞模型或构建命令。
- TeamAI `0.30.0` 会合并当前 Role 与 Project 声明的 namespace。Role 提供开发或审查能力，Project 只提供平台或服务上下文；原始 CLI 不校验两者是否属于合法业务组合，错误组合可能把一种职责能力与无关项目上下文同时投递。必须按团队组合表选择，并优先使用 `scripts/setup-workspace.ps1` 拒绝非法组合。
- PC/移动 Web 开发使用 `frontend`，微信原生小程序开发使用 `frontend-mini-program`，后端开发使用 `backend`；前端审查使用 `frontend-review`，后端审查使用 `backend-review`，仅通用资料治理使用 `common`。

