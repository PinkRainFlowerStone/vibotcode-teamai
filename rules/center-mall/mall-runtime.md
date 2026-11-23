# Center Mall Runtime Boundary

- 保持单模块 Controller → Facade/Service → Mapper 结构；跨服务调用统一放在现有 `feignapi`，多分支业务优先复用 strategy/factory/handler 模式。
- 统一返回 `ApiResponse`，业务异常使用 `BusinessException`；后台、C 端、内部和开放接口保持各自上下文与鉴权边界。
- 订单、库存、预算、资格、奖品、支付和退款变化前检查 chain、payment、point、portrait、manage 等消费者与失败补偿。
- Redis 运行态库存/预算按现有 key、Lua、数据库镜像和强对账模式扩展；不得用普通读改写替代原子扣减。
- MQ 消费按业务唯一键幂等；活动状态更新防止定时任务与人工审批并发覆盖；缓存写后失效与重建需校验版本。
- 编译可用 `mvn -DskipTests compile`，测试使用 `mvn test` 或目标测试；订单/活动变更覆盖重复、超时、库存不足、退款/补偿和消息重投。

