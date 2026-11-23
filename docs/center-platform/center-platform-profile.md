# Center Platform Project Profile

> 证据基线：`prod@14dda805`，工作树干净。

## 技术与结构

- Java 8、Spring Boot 2.7.18，单模块 Spring MVC。
- MyBatis-Plus、DM 驱动、Redis/Redisson、RocketMQ、OpenFeign、Nacos、XXL-JOB。
- 启动类：`src/main/java/com/ybt/center/platform/PlatformApplication.java`。
- 主要方向：Controller → Service → Mapper，另有 Feign client、job、listener 和文件能力。

## 服务边界

负责站点、组织、账号、角色菜单权限、字典、配置、文件与平台公共业务。静态 Feign 下游包括 analysis、chain、etl、mall、manage、point、portrait、vip；同时被多数业务服务调用。

## 风险与验证

- 权限、站点/租户上下文、共享 DTO、缓存失效、消息幂等和文件契约影响范围大。
- 当前源码存在少量 JUnit 4/5 与 Mockito 测试；优先运行改动包测试，再执行 `mvn test`。
- POM 同时声明不同 MP Join 版本，最终依赖树需在允许解析依赖时确认。
- 运行数据库与配置中心覆盖项以环境为准，不能仅凭 dev/prod profile 推断。

