# Center Platform Boundary

- 本服务负责站点、组织、账号、角色权限、字典、系统配置、文件和平台公共能力；保持单模块 Controller → Service → Mapper 结构。
- 权限模型、站点上下文、内部 Feign DTO、文件访问和系统配置是高影响契约，修改前检查 gateway 及业务服务消费者。
- 统一响应、业务异常、参数校验和权限上下文复用 `center-abstract` 与现有配置，不建立第二套平台协议。
- Redis/Redisson、RocketMQ 和 XXL-JOB 已参与流程；缓存 key、消息结构和任务重跑必须兼容旧数据并保持幂等。
- 构建从仓库根执行 `mvn test`；权限或站点变更至少验证允许、拒绝和跨站点隔离。

