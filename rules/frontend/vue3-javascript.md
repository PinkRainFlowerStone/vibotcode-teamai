---
paths:
  - "src/**/*.vue"
  - "src/**/*.js"
  - "src/**/*.scss"
  - "vite.config.js"
  - "unocss.config.js"
  - "uno.config.js"
---
# Vue 3 JavaScript Baseline

- `.eslintrc*`、`.prettierrc*`、Vite/UnoCSS 配置和相邻代码是格式、自动导入与目录约定的执行来源；不在 TeamAI 中维护第二套机械格式规则。
- 当前 VibotCode 项目以 JavaScript 为主，不主动新增 TypeScript 文件或语法。
- Vue SFC 优先使用 `<script setup>`；响应式状态优先 `ref`，大对象且不依赖深层响应时考虑 `shallowRef`。
- `computed` 只做派生，不做副作用；避免在模板中直接堆叠 `filter`、`map`、`sort` 等复杂表达式。
- `v-if` 与 `v-for` 不在同一元素混用。
- 事件处理函数使用 `handleXxx`；列表和详情函数使用带业务语义的名称。
- 重复业务字面量和状态值收敛到项目已有常量目录或目标模块常量，不为一次使用制造全局枚举。
- 注释解释来源、边界和原因；hooks、utils 或复杂公共函数存在非显然契约时补充 JSDoc，不要求给自解释的局部代码写叙述性注释。
- 自动导入、组件注册、路径别名和 SFC block 顺序以目标项目配置和相邻文件为准。

