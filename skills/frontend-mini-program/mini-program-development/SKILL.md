---
name: mini-program-development
description: 在微信原生小程序或明确以小程序运行时为目标的仓库中开发页面、组件、分包、平台 API、网络请求或样式时使用；先识别平台和框架，不适用于普通 PC/H5 Web 项目。
---

# Mini Program Development

## Establish The Runtime

1. 读取仓库指令、README、应用与页面配置、开发者工具配置、依赖、构建配置和相邻实现。
2. 用证据确认目标平台、原生或跨端框架、语言、最低基础库、请求/身份/storage 层和真实命令。
3. 微信原生项目使用本 Skill 的微信基线；其他平台或跨端框架只复用平台中立的风险判断，并以其仓库和官方文档为准。

证据使用顺序为：官方平台约束；目标仓库的需求、配置和相邻实现；用于填补空白的社区通用工程实践；仅用于观察风险面的参考模板。参考模板不得替目标仓库选择 WebView、目录、字段、工具链或业务规则。

需要系统梳理配置和仓库证据时，读取 [references/repository-discovery.md](references/repository-discovery.md)。

## Implement The Change

- 保持应用、页面、组件和分包配置与真实文件及调用一致。
- 使用目标运行时的生命周期、组件和事件模型；不把 Web/Vue 生命周期、DOM、路由或 `localStorage` 套入微信原生代码。
- 页面或组件改动涉及 WXML、WXSS、`setData`、`Component` 契约或页面栈时，读取 [references/runtime-components-and-data.md](references/runtime-components-and-data.md)。
- 涉及请求、登录、storage、隐私、支付、订阅消息、分享、扫码、定位、媒体、文件或 Socket 时，读取 [references/platform-apis-and-privacy.md](references/platform-apis-and-privacy.md)。
- 使用原生 `<web-view>` 承载 H5 业务或处理 H5 消息、分享、登录跳转时，读取 [references/webview-shell-and-bridge.md](references/webview-shell-and-bridge.md)。
- 复用仓库已有请求、身份、状态、组件和平台适配层。不得发明接口字段、权限语义、storage 键、环境值或业务资格。
- TypeScript 只在仓库已采用时遵循其配置；不要把 JavaScript 项目迁移为 TypeScript。

## Verify And Report

- 涉及 `setData`、长列表、图片媒体、分包、版本兼容、发布或平台工具时，读取 [references/performance-and-verification.md](references/performance-and-verification.md)。
- 运行最小且相关的现有 lint、类型检查、测试和构建命令，不臆造脚本。
- 根据风险执行开发者工具、预览/体验版或真机验证；明确区分已运行命令、平台验证、未执行项和残余风险。

`mini-template` 初始化模板仅作为 WebView 壳形态的辅助样本，不是实现依据或默认架构。目录、业务字段、组件库、基础库版本、命令和验收路径继续由目标仓库证据决定。
