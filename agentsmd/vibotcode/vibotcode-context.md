# VibotCode Context

VibotCode 工作区包含多个前端仓库和 8 个 Java 后端项目，全部是独立 Git 仓库。进入任一仓库后，以该仓库的 `AGENTS.md`、`.ai/standards/`、构建清单和相邻代码为最终依据。

- 前端不按仓库名选择 TeamAI project，而按运行端选择 `frontend-pc`、`frontend-mobile` 或 `frontend-mini-program`。平台画像只约束运行端差异；API、路由、自动导入、组件、环境变量和验证命令始终从当前仓库读取。
- 后端：`center-platform`、`center-manage`、`center-mall` 为单模块 MVC；`center-gateway` 为 WebFlux 网关；`center-point`、`center-vip`、`center-chain` 为 COLA 多模块；`xxl-job` 为定制 admin/core 调度平台。不要跨架构套用分层、阻塞模型或构建命令。
- `sharing.namespaceMerge=intersect`：角色是能力上限，项目是当前目录候选集。错误的前后端角色/项目组合只能获得 `common`/`vibotcode` 共享开发上下文，不具备另一领域的开发或评审能力。Learnings 按 TeamAI 0.22.0 规则保持角色+项目并集，但不授予 Skill、Agent 或 Workflow。
- `review` 角色在前端平台获得对应平台规则、文档和前端评审资源；在后端项目获得后端基础规则、文档和 `backend-review` 评审资源。

