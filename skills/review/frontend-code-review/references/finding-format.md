# Finding Format

## Review Summary

Begin with `## 审查发现`, followed by one sentence that compresses the review metadata in this order: review object and operation mode, scope source and resolved range, project type, validation status, and context gaps.

```text
本次对<审查对象>进行<操作模式>，范围采用<范围来源>（<审查范围>），项目判定为<项目类型>；<验证情况>，<上下文缺口>。
```

Example:

```text
本次对当前开发分支已提交代码进行只读审查，范围采用默认 `pre` 基线（`origin/pre...HEAD`），项目判定为 PC 管理端；已完成静态代码审查，但未找到完整 API 参数映射及验收标准，且未验证后端实际契约。
```

Keep this as one factual sentence. Omit inapplicable fragments, avoid counts and conclusions here, and disclose stale base refs only when they materially limit confidence. Do not add a metadata table.

## Formal Finding

```text
[MustFix][高可信度] 富文本未经可信净化进入 v-html

位置: src/example.vue:56
增量归属: introduced
证据: 接口字段 detail.content 直接进入 v-html，调用链中没有净化边界。
规则: SEC-HTML-001
影响: 恶意内容可能在用户会话中执行。
修复方向: 在集中富文本适配层执行白名单净化，并记录可信边界。
```

Use exactly two bracketed title tags:

```text
[修复等级][高/中/低可信度] 问题标题
```

- 修复等级: `MustFix`, `ShouldFix`, or `NiceToHave`.
- 置信度: use `高可信度`, `中可信度`, or `低可信度`.
- Keep rule IDs such as `CONTRACT-002` in the `规则` field only; do not place them in the title.

Every formal finding must include:

- a tight, verified file and line reference;
- rule ID;
- severity and confidence;
- scope attribution;
- concrete evidence and impact;
- a focused correction.

## Confidence

- **High**: execution/data path and rule are directly evidenced.
- **Medium**: likely impact, but one external contract or runtime fact is unavailable.
- **Low**: hypothesis needing confirmation. Put it under `待确认事项`, not formal findings.

## Report Order

1. One-sentence review summary.
2. Formal findings ordered MustFix, ShouldFix, then confidence/impact.
3. `待确认事项` only for material missing contracts or external evidence.
4. `NiceToHave` only when useful.

Do not add finding counts, an index table, a coverage recap, or a repeated validation section. Do not praise routine compliance, flood the report with passed checklist items, merge independent axes into one score, or claim server-side security from frontend evidence alone.
