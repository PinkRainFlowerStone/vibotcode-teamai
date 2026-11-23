---
paths:
  - "src/**"
  - "vite.config.*"
  - "package.json"
  - "unocss.config.*"
---
# Frontend Mobile Runtime

- 适用于移动 Web、H5、WebView、活动页和消费端旅程，不按业务仓库名区分规则。
- UI 框架、viewport/rem 口径、safe-area、legacy/polyfill、别名、列表加载模式和 storage 工具以当前仓库配置为准，不套用 PC 组件、分页或权限约定。
- 修改启动、路由、登录、游客态、站点、回跳或请求链路时，先识别当前仓库唯一身份来源和初始化顺序，不建立平行状态链路。
- 支付、分享、OAuth、定位、媒体和 App Bridge 必须在真实域名、容器或设备环境验证；无法验证时明确披露。
- 移动列表复用当前仓库的 refresh/loading/finished 状态模型，处理触底、刷新、空态、失败和重复请求。
- 兼容性以 browserslist、build target、legacy 配置和实际 WebView 为准，不继承 PC 浏览器基线。
