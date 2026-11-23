---
paths:
  - "**/app.json"
  - "**/app.js"
  - "**/app.ts"
  - "**/project.config.json"
  - "**/project.private.config.json"
  - "**/sitemap.json"
  - "**/*.wxml"
  - "**/*.wxss"
  - "src/**"
  - "miniprogram/**"
  - "package.json"
---
# Frontend Mini Program Runtime

## Platform Boundary

- 先从应用清单、页面与分包配置、开发者工具配置、依赖和构建目标确认平台与框架，不按仓库名猜测。
- 本规则中的 `App`、`Page`、`Component`、WXML、WXSS、`wx.*` 和基础库约束仅在目标为微信原生小程序时作为官方基线。其他小程序平台或跨端框架以目标仓库和对应平台文档为准。
- 不套用浏览器 DOM、Web 路由、`localStorage`、CSS 全局层、Element Plus 或 Vant H5 假设。

## Configuration And Registration

- `app.json`、页面 JSON 和组件 JSON 各自承担应用、页面和组件配置；页面、组件、分包、插件、权限和隐私相关声明必须与真实调用及仓库配置一致。
- 页面只能依赖当前运行包可达的资源。调整主包、分包、独立分包、预下载或懒加载时，核对入口、依赖方向、首屏路径和回退路径，不硬编码可能随平台变化的包体积上限。
- `project.config.json`、私有开发者工具配置和环境选择不得替代应用运行时配置。不要提交仅属于个人机器的设置，除非仓库已有明确约定。

## Lifecycle And Data

- 使用微信 `App`、`Page` 和 `Component` 的实际生命周期。初始化、显示、隐藏、卸载和组件分离的资源获取与清理必须成对，不套用 Web/Vue 生命周期名称或执行时序。
- 将页面 `onLoad` 查询参数和扫码、分享、跳转等入口数据视为外部输入；按现有契约校验、规范化，并避免用未经确认的字段建立业务分支。
- 需要同步到视图的数据通过 `setData` 更新；不要依赖直接修改 `this.data` 触发渲染。更新应控制路径、频率和载荷，尤其避免在滚动、高频事件或长列表中重复传输大对象。
- 页面隐藏或卸载、组件 `detached` 后，定时器、监听器、订阅、网络任务和异步回调必须停止、取消或具备失效保护，避免陈旧回调继续写状态。

## Components And Styles

- 原生组件的 `properties`、`data`、`methods`、`observers`、`behaviors`、`relations`、生命周期和 `triggerEvent` 应形成明确契约。不要通过隐式父子访问或共享可变对象绕过输入输出边界。
- `observers` 只处理必要的派生或联动，防止循环更新和高频重算；复杂跨页面状态沿用仓库已有状态层，不由组件私建持久化链路。
- WXML 负责平台支持的数据绑定、条件/列表渲染和事件声明；复杂转换、带副作用表达式和不稳定列表标识应移到可测试逻辑中。
- WXSS 的应用级、页面级和组件级边界以实际配置与样式隔离行为为准。不要假设浏览器选择器、布局特性、全局穿透或单位语义在目标基础库中等价可用。

## Repository-Owned Decisions

- TypeScript 仅在目标仓库已经采用时适用，并遵循其 `tsconfig`、类型声明和构建链；不得要求 JavaScript 项目迁移。
- 基础库版本、目录布局、组件库、请求层、状态方案、环境字段、业务模型、命令和验收入口均由目标仓库决定。
- `mini-template` 初始化模板只佐证一种可选 WebView 壳形态，不构成架构选择、业务字段、固定目录或统一工具链的依据。官方平台约束、目标仓库契约和社区通用工程实践必须保持清晰分层。
