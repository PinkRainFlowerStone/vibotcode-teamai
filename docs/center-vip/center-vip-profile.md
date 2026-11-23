# Center VIP Project Profile

> 证据基线：`prod@0ad8cacf`，工作树干净。

## 技术与结构

- Java 8、Spring Boot 2.7.18、Spring Cloud 2021.0.0、COLA 4.3.2。
- 模块：client、adapter、app、domain、infrastructure、dbsdk、start。
- MyBatis/MyBatis-Plus、MySQL/DM 声明、Redis/Redisson、Feign、Nacos、Sentinel 配置、XXL-JOB。
- 入口：`start/src/main/java/com/ybt/vip/Application.java`。

## 服务边界

负责会员等级、成长值、成长任务、会员权益、门户和资产同步。Feign 下游包括 activity、analysis、platform、point、portrait；上游包括 gateway、manage、platform 等。

## 风险与验证

- 等级状态机、成长值精度、跨期批处理、资产同步、缓存失效和补偿任务是主要风险。
- 当前有少量 JUnit 4 领域/任务测试；按改动模块运行后再执行 `mvn -pl start -am test`。
- 根 POM 未直接声明 RocketMQ starter，不因源码引用或传递依赖假设消息能力可用。
- Nacos/Sentinel 运行规则和 StarRocks 使用范围待环境确认。

