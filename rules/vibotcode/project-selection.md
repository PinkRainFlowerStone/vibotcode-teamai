# VibotCode Project Selection

- 当前工作区的前后端目录都是独立 Git 项目，命令、依赖、模块边界、运行时组件和配置不能跨项目假设。
- 进入业务目录后先读该项目 `AGENTS.md`、`.ai/standards/`、`README.md`、构建清单和相邻实现；不存在的文件不要臆造。
- Web 前端重点核对 `package.json`、构建/样式配置、路由、API 与组件体系；小程序重点核对应用清单、页面/分包、平台配置和目标基础库。
- 后端重点核对根/模块 POM、启动模块、包结构、数据库/MQ/缓存/任务实现和当前测试入口。
- 前端按运行端选择 `frontend-pc`、`frontend-mobile` 或 `frontend-mini-program`，不按仓库名创建项目画像，也不跨平台套用组件、路由、存储或兼容规则。
- `center-platform`、`center-manage`、`center-mall` 是单模块 MVC 服务；`center-gateway` 是 WebFlux 网关；`center-point`、`center-vip`、`center-chain` 是 COLA 多模块服务；`xxl-job` 是定制调度平台。不要跨架构套用分层和阻塞模型。
- 选择匹配的平台或后端 TeamAI project 后再开发；无法确认前端运行端时，只使用通用规则与当前仓库事实，并先完成平台识别。

