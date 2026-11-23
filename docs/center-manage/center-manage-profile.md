# Center Manage Project Profile

> 证据基线：`prod@f350d0c4`，工作树干净。

## 技术与结构

- Java 8、Spring Boot 2.7.18，单模块 Spring MVC。
- MyBatis-Plus、DM 驱动，源码含 StarRocks 访问；Redis/Redisson、RocketMQ、Feign、Nacos、XXL-JOB 和 Spring 定时任务。
- 入口：`src/main/java/com/ybt/center/manage/ManageApplication.java`。
- 主要目录：controller、service、dao/mapper、qualify、app/job、app/listener、mq/listener。

## 服务边界

负责活动/画布配置、客群标签协作、触达、报表和资格批次。Feign 下游包括 analysis、etl、mall、platform、portrait、strategy、vip；同时被多个营销服务调用。

## 风险与验证

- 活动状态机、客户批次幂等、分页游标、消息重试、跨数据源查询和恢复任务风险较高。
- 当前未发现正式测试源码，`mvn test` 不能替代必要的目标单测与联调计划。
- 真实数据源组合、Topic、Cron 和 Nacos 覆盖项待环境确认。

