---
name: change-verification
description: 根据改动范围选择并执行仓库已有验证，区分本次问题、历史问题和环境问题。
---

# Change Verification

1. 读取 `package.json`、CI 配置、`AGENTS.md` 和 README，列出仓库实际存在的 lint、test、type-check、build、boundary、smoke 命令。
2. 根据改动风险选择最小充分验证：文档只做格式与链接检查；局部逻辑跑相关 lint/test；共享组件、路由、请求层和构建配置扩大到 build 或浏览器验证。
3. UI 改动检查 loading、empty、error、disabled、权限、响应式和文本溢出。
4. 运行命令前确认不会改写无关文件；格式化只针对本次改动。
5. 记录每个命令的结果。失败时区分：本次改动、已有失败、依赖缺失、网络/环境限制。
6. 未执行的检查不得写成通过；最终说明剩余风险和人工验证范围。

