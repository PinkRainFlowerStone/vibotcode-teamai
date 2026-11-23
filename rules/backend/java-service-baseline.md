# Java Service Baseline

- 修改前读取目标仓库 `AGENTS.md`、根/模块 `pom.xml`、架构文档和相邻实现；冲突时以代码、构建配置和测试为准。
- 8 个已登记项目均以 Java 8 为最低编译基线；不得引入更高 JDK 语法/API，也不得把升级父 POM、BOM、插件或依赖作为默认前提。
- 保持目标项目现有结构：单模块服务沿用 Controller → Service/Facade → Mapper；COLA 项目沿用 client → adapter/app/domain/infrastructure/dbsdk/start 的职责与依赖方向。
- 接口使用项目现有 DTO、校验注解、统一响应和异常模型；不要为单个需求新建平行包装，也不要用无类型 `Map` 取代明确业务契约。
- 新增代码复用现有 Mapper、Repository、事务、缓存、锁、Feign、MQ、任务与日志设施；只改需求所需范围。
- 注释说明业务原因和边界；不得伪造作者、日期、覆盖率、兼容周期或审批制度。

