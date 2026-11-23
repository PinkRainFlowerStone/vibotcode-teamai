# Center Chain Supply And Order Boundary

- 遵循 client/adapter/app/domain/infrastructure/dbsdk/start 分层；`client` API/DTO、订单和权益状态是跨服务契约。
- 订单创建、库存、履约、核销、退款、售后和结算的跨系统一致性依赖消息、状态和补偿，不扩大本地事务假装全局一致。
- 库存扣减、退款单号、核销和结算使用稳定业务键、条件更新/唯一约束与有限锁；重复回调和重复出账必须被持久化防线拒绝。
- 修改 RocketMQ、Feign、Redisson 或任务逻辑时说明顺序、超时、幂等、部分成功和补偿。
- infrastructure 同时声明多个 Redisson 版本；使用版本特有 API 前先确认最终依赖树。
- 启动模块为 `start`；构建使用 `mvn -pl start -am test`，订单/履约变更覆盖重复回调、部分履约、退款、消息重复和任务补偿。

