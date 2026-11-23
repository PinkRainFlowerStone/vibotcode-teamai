---
paths:
  - "src/**"
  - "vite.config.js"
  - "package.json"
---
# Frontend Runtime And Security

- 禁止新增 `eval`、`new Function` 或来源不明的远程脚本、CDN、域名资源和个人 key。
- `v-html`、`innerHTML`、Markdown 和富文本渲染必须追踪内容来源与净化边界；未知或未净化内容不得直接进入 HTML sink。
- 登录、身份、站点和业务状态使用项目已有 storage 工具；不把敏感信息随手写入 `localStorage` 或 `sessionStorage`。
- `URL.createObjectURL` 创建的 URL 在使用结束后调用 `URL.revokeObjectURL`；文件预览、下载、复制、媒体和浏览器 API 按目标运行环境验证。
- 新 Web API、CSS 能力和 polyfill 以目标项目的 Vite target、legacy 配置、browserslist 与实际 WebView 为准，不套用跨平台兼容假设。
- 编辑器、图表、可视化和其他重模块优先复用现有异步加载与 chunk 策略；新增依赖前确认现有能力、bundle 影响和按需引入方式。
