# Center VIP Growth Boundary

- 遵循 client/adapter/app/domain/infrastructure/dbsdk/start 分层；等级、成长值、权益状态和 `client` 契约影响多个服务。
- 等级状态机、成长值发放、跨日/月任务、资产同步和缓存失效必须保持幂等、可追踪、可补偿。
- 任务使用批次、游标、唯一键、状态条件和有限重试；不得仅依赖分布式锁防止重复处理。
- 事务提交后的缓存或同步副作用沿用现有 afterCommit/补偿模式，避免回滚后外部状态已生效。
- 启动模块为 `start`；构建使用 `mvn -pl start -am test`，等级/成长变更至少验证重复事件、周期边界、降级保护、补偿任务和并发更新。

