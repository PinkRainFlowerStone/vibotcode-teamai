# XXL-JOB Project Profile

> 证据基线：`prod@eb760025`，工作树干净。

## 技术与结构

- Java 8；`xxl-job-admin` 使用 Spring Boot 2.7.18、Spring MVC、Freemarker、MyBatis 和 MySQL。
- `xxl-job-core` 使用 Netty、Gson、Groovy 和 SLF4J，提供执行器注册、触发、回调和日志能力。
- 调度中心入口：`xxl-job-admin/src/main/java/com/xxl/job/admin/XxlJobAdminApplication.java`。
- 数据库脚本位于 `doc/db/tables_xxl_job.sql`。

## 服务边界

admin 管理任务、执行器组、用户权限、触发日志与回调；core 被多个业务服务以 `com.ybt.xxljob:xxl-job-core:1.2.2` 依赖。协议或模型变化具有跨仓库影响。

## 风险与验证

- 登录 Cookie、用户/执行器组权限、手工触发、重复 logId、阻塞策略、超时和失败回调是关键边界。
- 回调失败会写入执行器本地文件后重试，容器磁盘生命周期与多副本行为待部署环境确认。
- 根 POM 引用了缺失的 `xxl-job-executor-samples`，且设置 `maven.test.skip=true`；不要把根 reactor 打包或无测试输出描述为完整验证。
- 修改 admin/core 时分别验证编译、数据库迁移、滚动兼容和至少一个真实执行器注册/触发/回调链路。

