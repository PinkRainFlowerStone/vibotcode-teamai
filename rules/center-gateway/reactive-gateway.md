# Center Gateway Reactive Boundary

- 本服务只负责统一入口、路由、鉴权、登录态和请求上下文传递，不新增业务持久化或领域编排。
- 使用 Spring Cloud Gateway/WebFlux；Filter 链禁止阻塞数据库访问、阻塞式 HTTP 调用和 Spring MVC 处理模式。
- 路由 predicate、StripPrefix、开放路径、Header 或 Token 规则变化时，同时核对下游 Controller 路径、默认拒绝和兼容期。
- Redis 登录态结构依赖公共模型；变更前检查 `center-abstract` 与下游参数解析。
- 过滤器变更至少验证一条开放路由、一条鉴权路由、无效 Token、下游异常和上下文透传。

