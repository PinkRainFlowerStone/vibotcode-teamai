---
name: project-onboarding
description: 进入 VibotCode 工作区或其中一个项目时，快速识别项目、选择 TeamAI project 并定位开发入口。
---

# VibotCode Project Onboarding

1. 确认当前目录属于哪个独立 Git 仓库，不把工作区根目录当作单仓库。
2. 读取存在的仓库指令、README、构建清单、架构文档和 Git 状态，不假设所有项目都有同名文件。
3. 按构建清单分流：
   - 有 `package.json` 或小程序清单：读取 scripts、构建配置、路由/页面清单、UI 框架、运行目标和相邻实现；根据运行端选择 `frontend-pc`、`frontend-mobile` 或 `frontend-mini-program`，不要按仓库名创建 TeamAI project。
   - 有根/模块 `pom.xml`：读取 Maven modules、启动模块、`.ai/standards/`、数据库/MQ/缓存/任务入口和相邻 Java 实现。
4. 后端按架构继续分流：
   - 单模块 Spring MVC：`center-platform`、`center-manage`、`center-mall`。
   - Spring Cloud Gateway/WebFlux：`center-gateway`。
   - COLA 多模块：`center-point`、`center-vip`、`center-chain`。
   - 调度平台 admin/core：`xxl-job`。
5. 前端按运行端选择 TeamAI project；后端选择与仓库同名的 TeamAI project；只做跨项目资料治理时选 `vibotcode`。
6. 选择匹配角色：PC/移动 Web 实现用 `frontend`，微信原生小程序实现用 `frontend-mini-program`，后端实现用 `backend`，前端审查用 `frontend-review`，后端审查用 `backend-review`，仅通用上下文用 `common`。
7. TeamAI `0.30.0` 会合并 Role 与 Project 资源。Windows 使用 `teamai.cmd roles set <role>`、`teamai.cmd projects set <id>`、`teamai.cmd pull --force` 激活资源，再用 `teamai.cmd roles list`、`teamai.cmd projects list` 核对选择；Linux/macOS 使用对应的 `teamai` 命令。不得把错误组合当作隔离边界。
8. Web 前端根据任务定位 `views`、`api`、`components`、`hooks`、`stores`、`router`；小程序根据实际框架定位页面清单、分包、组件、服务层、状态和平台配置；后端根据架构定位 controller/adapter、app/service、domain、infrastructure、dbsdk、start 或 admin/core。
9. 输出项目类型、关键约定、预计改动范围和验证命令后再实现。

