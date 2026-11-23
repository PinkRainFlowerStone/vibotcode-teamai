# Center Gateway Project Profile

> 证据基线：`prod@fdf2bb0`，工作树干净。

## 技术与结构

- Java 8、Spring Boot 2.7.18、Spring Cloud 2021.0.3。
- Spring Cloud Gateway/WebFlux、Redis/Lettuce、Nacos Config/Discovery。
- 启动类：`src/main/java/com/ybt/center/gateway/GatewayApplication.java`。
- 重点代码位于 `filter/`、`config/`，静态路由基线位于 `src/main/resources/bootstrap.yml`。

## 服务边界

客户端请求经路由 predicate 与 StripPrefix 后，由全局过滤器读取登录态、写入下游请求上下文，再经 Nacos/LoadBalancer 转发。仓库未声明业务数据库 ORM 或 MQ。

## 风险与验证

- 白名单、Token、Header、错误响应和路由调整可能影响所有服务。
- WebFlux 上下文不能依赖普通 ThreadLocal 跨调度器传播。
- 当前未发现测试源码；新增过滤规则应补单测并做隔离环境路由验证。
- 真实路由、超时和注册信息可能由 Nacos 覆盖，发布前需环境确认。

