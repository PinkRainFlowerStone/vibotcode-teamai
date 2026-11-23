# Center Point Ledger Boundary

- 遵循 client/adapter/app/domain/infrastructure/dbsdk/start 分层；`client` 的 API、DTO 和积分状态是跨服务契约。
- 积分发放、扣减、账户明细和预算使用稳定业务号保持幂等与审计；不得产生隐式精度损失。
- 预算扣减、黑名单、预警、MQ 和补偿任务需要覆盖重复、并发、部分失败和重跑。
- 规则 SQL 必须走现有解析与校验，禁止直接拼接未验证输入；MySQL、DM 或 StarRocks 使用范围以目标环境确认。
- 启动模块为 `start`；构建使用 `mvn -pl start -am test`，规则/发放变更至少验证重复业务号、预算不足、并发扣减、消息重复和补偿重跑。

