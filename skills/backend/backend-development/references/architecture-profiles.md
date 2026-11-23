# Architecture Profiles

## 单模块 Spring MVC

适用：`center-platform`、`center-manage`、`center-mall`。

- 保持 Controller → Service/Facade → Mapper 的既有方向。
- Feign、listener/consumer、job 和 cache 属于现有横向入口，不另建平行架构。
- 构建通常从仓库根执行 `mvn test` 或目标测试；环境 profile 以 POM 为准。

## WebFlux Gateway

适用：`center-gateway`。

- 只处理路由、鉴权、登录态和上下文传播，不承载业务持久化。
- Filter 链保持非阻塞，不引入 Spring MVC 或阻塞数据库/远程 I/O。
- 路由、白名单、Header 和 Token 规则变化必须与下游路径联动验证。

## COLA 多模块

适用：`center-point`、`center-vip`、`center-chain`。

- `client` 放跨服务 API/DTO；`adapter` 放入口；`app` 编排用例；`domain` 放领域模型与 gateway；`infrastructure` 放外部实现；`dbsdk` 放数据访问；`start` 负责装配。
- 不从 domain 反向依赖 adapter/start，不把跨服务契约藏到实现模块。
- 构建入口通常为 `mvn -pl start -am test`，目标模块测试可进一步收窄。

## XXL-JOB 平台

适用：`xxl-job`。

- `xxl-job-admin` 是调度中心，`xxl-job-core` 是执行器核心协议与运行时。
- 调度、注册、触发、回调、阻塞策略、失败重试和日志协议属于兼容性边界。
- 根 POM 声明了当前工作树不存在的 sample 模块；不要假设完整 reactor 可直接构建。

