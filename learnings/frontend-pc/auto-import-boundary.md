# Auto-Import Exclude May Replace Defaults

部分 Vite 自动导入插件的 `exclude` 选项是替换语义而不是追加语义。仓库为特殊目录增加排除项时，应先确认插件行为，并保留依赖目录、生成目录等默认排除，避免无关文件进入扫描。

特殊目录的边界命令和护栏配置由当前仓库决定。只有仓库实际提供对应脚本时才运行，并报告实际命令与结果。

Source: existing PC repository Vite guardrail behavior and documentation.
