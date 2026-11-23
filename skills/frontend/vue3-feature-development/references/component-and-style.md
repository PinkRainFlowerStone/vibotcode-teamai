# Component And Style

- 新 SFC 默认顺序：`script setup`、`template`、`style scoped lang="scss"`；旧文件跟随相邻顺序。
- script 内优先顺序：imports、defineOptions、props/emits、router/store/hooks、常量、state、computed、watch、functions、lifecycle。
- 可复用组件优先受控，输入显式，输出事件表达动作。
- 表单、表格、弹窗等职责明显混杂，或单文件接近 600 行且已经影响阅读时，再按业务职责拆分。
- 简单布局用项目已有 UnoCSS；复杂状态和组件覆盖使用 SCSS。
- 深层覆盖使用 `:deep()`，层级保持浅；局部样式不进入全局入口。
- 图标和图片沿用项目现有体系，不为单个需求引入新图标库。
- 格式细节由目标仓库 ESLint、Prettier 和相邻代码决定；只格式化本次改动文件。

