# Center Mall Project Profile

> 证据基线：`prod@b6e7fd5cd`，工作树干净。

## 技术与结构

- Java 8、Spring Boot 2.7.18，单模块 Spring MVC，源码规模超过两千个 Java 文件。
- MyBatis-Plus、DM 驱动、Druid、Redis/Redisson、RocketMQ、OpenFeign/Hystrix、Nacos、XXL-JOB。
- 入口：`src/main/java/com/ybt/center/mall/CenterMallApplication.java`。
- 主要目录：controller、facade、service、dao、entity、feignapi、strategy、cache、job、consumer、distinguish、searchchain。

## 服务边界

承载 C 端、运营后台、内部和开放接口，覆盖营销活动、商品店铺、订单售后、优惠券/礼品包、内容消息、报表导出。主要下游包括 chain、platform、point、manage、payment、portrait。

## 风险与验证

- 下单/支付/退款、库存预算、活动状态机、资格、MQ 消费、缓存重建和数据权限是核心风险。
- 项目已有较多 JUnit 4/5、Mockito 和集成测试；先运行目标领域测试，再扩大到 `mvn test`。
- 部分测试依赖真实 DM、Redis 或 MQ，执行前确认隔离环境。
- POM 存在重复/多版本依赖声明，依赖调整必须先检查最终依赖树。

