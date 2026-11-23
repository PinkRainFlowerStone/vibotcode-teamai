# Center Manage Orchestration Boundary

- 本服务负责活动、画布、客群/标签协作、触达、报表和资格批处理；保持 Controller → Service → Mapper/Feign 及既有 job/listener 结构。
- 不与独立同名/近名工作副本混用；开始修改前确认当前仓库与发布单元。
- 活动/画布状态、资格批次、触达链路和 DTO 变化前检查 strategy、portrait、analysis、mall、vip 等调用关系。
- 批处理必须维护分页/游标、批次状态、有限重试、部分失败记录和恢复入口；消息或任务不得无边界重放。
- 构建从仓库根执行 `mvn test`；当前缺少正式测试源码，资格/批任务变更需补目标单测并给出关联服务集成方案。

