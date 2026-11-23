# Runtime And Security

- 先读取目标项目 `build.target`、legacy、browserslist、viewport 和运行环境说明，再选择 Web API、CSS 能力或 polyfill。
- `v-html`、`innerHTML`、Markdown 和富文本需要说明内容来源、转换与净化边界。
- 不新增 `eval`、`new Function`、未知 CDN、个人 key 或绕过现有 request/storage/auth 链路的实现。
- Object URL 用后及时 revoke；文件预览、下载、复制、媒体与微信能力在目标环境验证。
- 编辑器、图表、可视化等重模块先复用现有异步加载和 chunk 策略；新增依赖时记录必要性与 bundle 影响。
