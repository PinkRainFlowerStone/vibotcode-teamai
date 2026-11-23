# Center Chain Project Profile

> 证据基线：`prod@3eaa9e0db`，工作树干净。

## 技术与结构

- Java 8、Spring Boot 2.7.18、Spring Cloud 2021.0.0、COLA 4.3.2。
- 模块：client、adapter、app、domain、infrastructure、dbsdk、start。
- MyBatis/MyBatis-Plus、MySQL/DM 声明、Redis/Redisson、RocketMQ、Feign/Hystrix、Nacos、XXL-JOB。
- 入口：`start/src/main/java/com/ybt/chain/Application.java`。

## 服务边界

负责商户/门店、供应商、商品权益、订单履约、物流、售后退款、核销、结算和报表。Feign 下游包括 mall、payment、platform、point；上游包括 activity、mall、payment、platform。

## 风险与验证

- 库存、订单履约、支付退款、核销、结算和跨服务状态机是主要风险。
- 当前分支测试源码很少；目标模块测试后执行 `mvn -pl start -am test`，并保留联调/数据验证缺口。
- Redisson 和 MP Join 存在多版本组合，最终依赖树需单独确认。

