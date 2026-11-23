# Center Point Project Profile

> 证据基线：`prod@63ecab15a`，工作树干净。

## 技术与结构

- Java 8、Spring Boot 2.7.18、Spring Cloud 2021.0.0、COLA 4.3.2。
- 模块：client、adapter、app、domain、infrastructure、dbsdk、start。
- MyBatis-Plus、MySQL/DM 声明、Redis/Redisson、RocketMQ、Feign、Nacos、XXL-JOB。
- 入口：`start/src/main/java/com/ybt/point/Application.java`。

## 服务边界

负责积分规则、账户/明细、业务账户、发放/订单、预算、黑名单、预警和任务。Feign 下游包括 analysis、etl、mall、manage、platform、portrait；上游包括 chain、mall、payment、platform、vip。

## 风险与验证

- 积分精度、账务审计、业务号幂等、预算并发和规则 SQL 是核心风险。
- 源码大量使用事务、Redis/Redisson、MQ 和重试任务，但当前分支未发现正式测试源码。
- 验证以目标模块测试和 `mvn -pl start -am test` 为基线，并保留外部依赖联调缺口。
- 运行数据源和 StarRocks 实际范围待环境确认。

