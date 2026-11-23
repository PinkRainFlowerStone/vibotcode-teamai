---
name: vue3-feature-development
description: 在 VibotCode 现有 Vue 3 JavaScript 项目中开发页面、组件、表单、表格、API、路由或样式时使用。
---

# Vue 3 Feature Development

## 进入任务

1. 读取项目的 `AGENTS.md`、README、`package.json`、ESLint/Prettier、Vite/UnoCSS 配置和目标模块相邻代码；缺失的文件直接跳过，不假设存在。
2. 确认运行端是 PC Web 或移动 Web，并从 `references/platform-profile.md` 选择对应画像；小程序任务改用 `mini-program-development` Skill。
3. 确认目标、范围、非目标、字段来源、权限/身份语义、兼容环境、边界状态和验证方法；需求缺口必须显式披露。
4. 只加载与改动触点有关的 reference：数据和状态、组件和样式、运行时和安全，不一次性展开全部规范。

## 实现

1. 优先复用现有组件、Hooks、Store、工具、常量和 API 模块。
2. 新页面放入现有业务模块；页面私有组件就近；两处以上复用且语义稳定后再提升。
3. API 字段只使用有依据的名称。高风险字段先建立 `field -> source` 映射。
4. 状态按页面私有、跨页面共享、跨刷新持久化三层放置；权限、游客态、站点和回跳等身份状态沿用当前仓库已有链路。
5. 异步操作处理 loading、成功、空、失败、禁用和重复提交；loading 在 `finally` 回收。
6. 样式先复用现有主题和布局；简单样式用已配置 UnoCSS，复杂状态和覆盖使用 scoped SCSS。
7. 涉及 HTML 渲染、存储、Object URL、浏览器 API、重依赖或构建配置时，执行运行时与安全检查。

## 自检

1. 检查是否新增未知字段、兼容兜底、平行权限/身份链路、无用代码、调试日志、全局样式或非必要依赖。
2. 检查公共组件、路由、请求层、存储、HTML sink 和移动端/桌面端兼容影响。
3. 按 `change-verification` Skill 运行仓库实际存在的验证。

按需读取 `references/` 中的主题文件，不要一次性加载全部内容。

