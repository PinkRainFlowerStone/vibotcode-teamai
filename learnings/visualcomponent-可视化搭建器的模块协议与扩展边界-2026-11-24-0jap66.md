---
title: "VisualComponent 可视化搭建器的模块协议与扩展边界"
author: 查查
date: 2026-11-24
tags: [workflow, pattern, best-practice, config]
session: { platform: codex, sessionId: 01a20d3b-3a22-7ac1-b541-ecab2e97402a }
---

## Context

在 `eshop-admin-equity` 中梳理 `src/VisualComponent` 的设计方式、支持场景和已有组件。该目录不是普通组件库，而是运营后台用于生成 C 端页面 JSON 协议的可视化搭建器。分析时需要同时查看编辑器入口、模块注册、实际调用方和模块配置，不能只依赖目录 README。

## Solution

### 1. 编辑器整体结构

编辑器采用左中右三栏：

- `VisualSelect` 根据模块元数据展示可拖拽组件。
- `VisualPreview` 使用 375px 手机预览容器完成排序和选中。
- `VisualConfig` 提供页面配置与当前模块配置。

根组件通过 `provide/inject` 共享 `visualConfig`、`pageConfig`、`pageType`、未保存检查和父容器查询等上下文。

### 2. 模块扩展协议

一级模块采用固定的四文件结构：

```text
modules/ModuleName/
├── index.js
├── Select.vue
├── Preview.vue
└── Edit.vue
```

`index.js` 提供稳定模块 `id`、默认 `data`、`visible` 以及 `meta`。其中：

- `meta.type` 决定图片、辅助、业务、功能或画布分组。
- `meta.acceptType` 决定 `home`、`personal`、`micro`、`static` 场景可用性。
- `meta.multiple` 控制同类模块能否重复添加。
- `meta.nestable` 控制模块能否进入容器。
- `meta.canUse` 控制是否出现在选择面板。

`modules/index.js` 使用 `import.meta.glob` 自动注册 Select、Preview、Edit 和配置映射。新增模块时不需要手工维护总注册表，但管理端与 C 端必须保持同名、同 ID 和兼容数据结构。

### 3. 数据与校验协议

持久化 JSON 只保存：

```js
{
  pageConfig,
  moduleList: [{ id, vid, visible, data }]
}
```

初始化时再通过 `modulesMap[id]` 补回模块名称、元数据和组件实现。`vid` 是页面实例 ID，用于区分同类型模块。

每个 `Edit.vue` 应通过 `defineExpose({ validate })` 暴露校验。保存时 `VValidateConfig` 隐藏渲染模块编辑器并逐个执行校验，失败后选中并滚动到对应模块。

当前树形能力是显式实现的，不是通用递归协议：容器 `103` 和分类切换 `104` 在初始化、保存和校验阶段有专门处理。扩展新的嵌套模块时必须同步检查这些流程。

### 4. 页面与事件场景

代码支持四种页面类型：

- `home`：商城首页。
- `personal`：个人中心。
- `micro`：微页面或自定义页面。
- `static`：静态页面，代码支持但当前业务选项禁用。

事件由 `VEvent` 和 `VEnvEvent` 统一配置，并按照页面类型、嵌套状态以及 `WX`、`WX_MINI`、`APPLET` 环境过滤。事件包括链接、小程序、业务页面、自定义页面、商品专题、分类、店铺和多种营销活动跳转。

### 5. 当前组件现状

代码中共有 35 个一级模块，32 个启用：

- 图片类 8 个：单张图片、多张图片、自定义热区、轮播图、横向滚动、悬浮图标、宫格、图片列表。
- 辅助类 11 个：标题、公告、搜索、容器、分类切换、分割、富文本、Excel、音乐、视频、文章资讯。
- 业务类 11 个启用：商品、两类用户信息、订单、权益、积分、平台服务、秒杀、店铺、商户服务、拼团。
- 画布类：基础画布。
- 功能类：弹窗。
- 已实现但停用：会员卡片、自动执行、授权弹窗。

基础画布内部还有二级自由画布。其 750px 设计稿宽度下支持拖拽、缩放、图层、复制、键盘微调和热区。7 个画布插件中启用了文本、图片、线条、按钮和商品，业务数据与商户服务暂时停用。

## Lessons

- 阅读 VisualComponent 时，以模块 `index.js` 和实际调用方为事实来源；当前 README 的组件清单已落后于实现。
- 新增模块不能只创建 Vue 文件，还必须确认模块 ID、C 端同步、页面场景、事件过滤、校验协议和是否允许嵌套。
- 新增嵌套容器需要同步修改初始化、序列化、校验、父模块定位和删除逻辑，现有实现只特殊支持 `103` 与 `104`。
- 时间和渠道可见性保留了数据结构，但编辑入口当前被注释；自定义/预置画布列表加载也没有启用。
- 营销活动大厅存在旧版接入方式：未传当前必需的 `type`，并传入入口未声明的属性。复用编辑器前应以首页、个人中心和自定义页面调用方式为基线。
