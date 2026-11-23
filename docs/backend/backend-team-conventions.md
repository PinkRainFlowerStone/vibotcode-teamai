# Backend Team Conventions

## 已确认基线

- 目标项目最低编译版本均为 Java 8；业务服务主要使用 Spring Boot 2.7.18。
- `center-platform`、`center-manage`、`center-mall` 是单模块 Spring MVC 服务。
- `center-gateway` 使用 Spring Cloud Gateway/WebFlux，不承载数据库业务逻辑。
- `center-point`、`center-vip`、`center-chain` 使用 COLA 4.3.2 多模块结构。
- `xxl-job` 包含调度中心和执行器核心，协议与任务运行语义优先于业务服务分层。

## 共同工程习惯

- 复用现有统一响应、业务异常、参数校验、Mapper/Repository、事务、缓存和日志方案。
- 接口、Feign、MQ、任务和共享 DTO 变化先做消费者与兼容性分析。
- SQL 参数化；数据库类型和环境覆盖不能仅凭某个 profile 推断生产事实。
- 金额、积分、库存、预算、资格、权益、结算和状态迁移需要明确精度、并发、幂等和补偿。
- CI 多处跳过测试；构建成功与测试通过必须分开报告。

## 待团队确认

- 统一覆盖率阈值、强制审批人、发布窗口、兼容周期和生产回滚时限。
- 各环境实际数据库组合、Nacos 覆盖项、MQ Topic、Cron 和告警配置。
- 内部接口统一认证方案及跨服务 trace 标准是否已形成正式制度。

