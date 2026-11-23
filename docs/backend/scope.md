# Backend Role Scope

后端角色当前覆盖 8 个已验证仓库：`center-platform`、`center-gateway`、`center-point`、`center-vip`、`center-manage`、`center-mall`、`center-chain`、`xxl-job`。

共同事实是 Java 8 基线、Spring Boot 2.7.18 业务服务、Maven 构建，以及大量 Feign、Redis、Redisson、RocketMQ 和 XXL-JOB 集成。项目并非同构：包含单模块 Spring MVC、WebFlux 网关、COLA 多模块和独立调度平台，因此通用规则只定义契约、安全、一致性、日志和验证底线，分层与业务约束由项目命名空间补充。

无法从仓库证明的运行数据库、远端配置覆盖、生产拓扑、覆盖率目标、审批制度和兼容周期仍是待确认项，不得自行补充为团队政策。


