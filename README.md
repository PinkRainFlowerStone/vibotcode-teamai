# VibotCode TeamAI 使用手册

本仓库是 VibotCode 团队的 TeamAI 资源仓库。它通过 `teamai-cli` 向业务仓库投递 Rules、Skills、Agents、Docs、Learnings 和 Workflows，使开发、检查与代码审查使用同一套团队约束。

当前基线：

- TeamAI CLI：`0.22.0`
- 团队仓库：`git@github.com:PinkRainFlowerStone/vibotcode-teamai.git`
- 资源合并策略：`sharing.namespaceMerge: intersect`
- 工作流驱动：`local`
- 自动更新：关闭，由成员显式执行 `teamai pull`

## 1. 核心使用模型

每个接入 TeamAI 的业务工作区都必须选择：

1. 一个 `role`：决定允许使用的能力上限。
2. 一个 `project`：决定当前业务领域或前端运行平台。

TeamAI 只投递角色与项目命名空间的交集。角色不能代替项目，项目也不能绕过角色授权。

### 角色

| Role | 用途 |
| --- | --- |
| `common` | 通用上下文、项目接入与变更验证，不提供领域 Agent 或 Workflow |
| `frontend` | 前端开发，按 PC、移动 Web、小程序平台加载开发能力 |
| `backend` | 后端开发，按实际后端服务加载开发能力 |
| `review` | 前端或后端代码审查，不加载实现类 Skill |

### 项目与平台

前端只按运行平台区分，不按业务仓库名称区分：

| Project | 适用范围 |
| --- | --- |
| `frontend-pc` | PC 管理后台、桌面 Web |
| `frontend-mobile` | H5、移动 Web |
| `frontend-mini-program` | 微信原生小程序；其他小程序或跨端项目只复用平台中立风险规则 |

后端按服务仓库区分，因为各服务的职责、依赖和数据边界不同：

`center-platform`、`center-gateway`、`center-point`、`center-vip`、`center-manage`、`center-mall`、`center-chain`、`xxl-job`。

通用项目为 `vibotcode`，只与 `common` 角色配合使用。

### 合法组合

| 使用场景 | Role | Project | 主要能力 |
| --- | --- | --- | --- |
| 通用项目梳理 | `common` | `vibotcode` | 项目接入、上下文梳理、变更验证 |
| PC 前端开发 | `frontend` | `frontend-pc` | Vue 3 开发、前端 Agent、前端自检 |
| 移动 Web 开发 | `frontend` | `frontend-mobile` | Vue 3 开发、移动端约束、前端自检 |
| 微信小程序开发 | `frontend` | `frontend-mini-program` | 原生小程序开发、平台 Agent、小程序自检 |
| 后端开发 | `backend` | 对应后端项目 | 后端开发、项目约束、开发及自检 Workflow |
| 前端审查 | `review` | 对应前端平台 | 前端代码审查 Skill、Reviewer、审查 Workflow |
| 后端审查 | `review` | 对应后端项目 | 后端代码审查 Skill、Reviewer、审查 Workflow |

`scripts/setup-workspace.ps1` 会拒绝非法组合。直接使用原始 CLI 选择错误组合时，交集策略不会授予另一领域的 Skill、Agent、Rule、Doc 或 Workflow，但 TeamAI CLI `0.22.0` 的 Learnings 固定使用 union，因此不要把错误组合当作安全隔离方式。

## 2. 环境准备

需要准备：

- Git 和团队 GitHub SSH 权限
- Node.js 20 或更高版本，以及 npm
- TeamAI CLI `0.22.0`
- 支持的 Agent 工具，例如 Codex
- 完整使用 GitHub 发布能力时，需要 GitHub CLI `gh`，并完成 `gh auth login`

安装并确认版本：

```powershell
npm install -g teamai-cli@0.22.0
teamai --version
gh auth status
```

如果安装后提示找不到 `teamai`，先重新打开终端，并确认 npm 全局可执行目录已加入 `PATH`。团队当前锁定 `0.22.0`。不要单独升级个人 CLI；升级前必须在团队仓库完成兼容性验证。

Windows 成员首次接入前必须启用 Git 长路径支持，否则 TeamAI 数据目录叠加 Skill、Rule 的多级目录后可能导致 clone 或 checkout 失败：

```powershell
git config --global core.longpaths true
git config --get core.longpaths
```

第二条命令应输出 `true`。接入脚本会检查该配置，但不会自动修改用户的全局 Git 配置。

## 3. 首次接入业务仓库

所有命令都应在目标业务仓库根目录执行。

### 推荐：使用接入脚本

先在本地取得本仓库，然后进入业务仓库执行：

```powershell
git clone git@github.com:PinkRainFlowerStone/vibotcode-teamai.git <vibotcode-teamai目录>
```

```powershell
cd <业务仓库目录>
& "<vibotcode-teamai目录>\scripts\setup-workspace.ps1" `
  -TeamRepo "git@github.com:PinkRainFlowerStone/vibotcode-teamai.git" `
  -Role frontend `
  -Project frontend-pc `
  -Agent codex `
  -Provider github
```

常用参数示例：

```powershell
# 移动 Web 开发
-Role frontend -Project frontend-mobile

# 微信原生小程序开发
-Role frontend -Project frontend-mini-program

# center-platform 后端开发
-Role backend -Project center-platform

# PC 前端代码审查
-Role review -Project frontend-pc

# center-platform 后端代码审查
-Role review -Project center-platform
```

`-Agent` 默认值为 `codex`，也可传入 TeamAI CLI 支持的其他 Agent ID；多个 Agent 使用逗号分隔。`-Provider` 默认值为 `github`，支持自动创建 Pull Request；只需要拉取资源且没有 GitHub CLI 登录时，可以传入 `-Provider git`，但该工作区不能通过 TeamAI 自动创建 Pull Request。脚本会完成初始化、Agent 启用、角色选择、项目选择、资源拉取和 `doctor` 检查，并在选择非法组合时直接终止。

### 手工接入

无法使用脚本时，执行等价命令：

```powershell
teamai init git@github.com:PinkRainFlowerStone/vibotcode-teamai.git `
  --provider github `
  --role frontend `
  --project frontend-pc `
  --agent codex

teamai pull
teamai doctor
```

接入后确认当前选择：

```powershell
teamai roles list
teamai projects list
teamai status
```

## 4. Codex 必做配置

TeamAI 的文件已投递，不代表 Rules 已经在 Codex 会话中生效。Rules 依赖 TeamAI Hooks 注入，首次接入必须完成以下操作：

1. 在 Codex 中信任当前项目。
2. 在 Codex 的 `/hooks` 或设置页中信任 TeamAI Hooks。
3. 完成信任后新建一个 Codex 会话。
4. 在新会话中执行一次 `teamai doctor` 并检查提示。

`teamai doctor` 返回成功，只说明文件和基础配置可用；如果仍提示项目或 Hooks 未信任，Rules 可能没有注入当前会话，不能把该结果视为完整生效。

## 5. 日常使用规则

开始工作前建议执行：

```powershell
teamai status
teamai pull
teamai doctor
```

必须重新执行 `teamai pull` 的场景：

- 团队仓库发布了新版本。
- 修改了 `role` 或 `project`。
- 新建了工作区、独立 clone 或 worktree。
- 本地投递文件缺失或 Workflow 无法发现。

切换角色或项目：

```powershell
teamai roles set review
teamai projects set frontend-pc
teamai pull --force
teamai doctor
```

角色和项目是当前 Git 工作区的 TeamAI 选择。开发与审查需要同时保持不同角色时，使用独立 clone；同一 Git 仓库的 linked worktree 会共享 TeamAI 项目配置，不适合承载不同角色选择。

## 6. 前端开发

先按运行平台选择项目：

- PC 或桌面管理端：`frontend + frontend-pc`
- H5 或移动 Web：`frontend + frontend-mobile`
- 微信原生小程序：`frontend + frontend-mini-program`

平台必须根据目标仓库的真实运行环境判断，不能根据业务仓库名称猜测。

开发时遵循以下顺序：

1. 读取目标仓库配置、相邻代码、接口契约和已有实现。
2. 使用投递的开发 Skill 和 Agent 完成功能。
3. 按改动触点执行仓库已有的 lint、typecheck、test、build 或手工验证。
4. 启动对应自检 Workflow，记录实际执行命令、未执行项和残余风险。

PC 与移动 Web 自检：

```powershell
teamai workflow start vibotcode-self-check `
  --driver local `
  --inputs '{"task":"描述本次前端改动"}'
```

微信小程序自检：

```powershell
teamai workflow start vibotcode-mini-program-self-check `
  --driver local `
  --inputs '{"task":"描述本次小程序改动"}'
```

小程序规则以微信官方约束、当前基础库行为和目标仓库证据为优先。WebView 壳规则只在目标代码确实使用 `<web-view>` 承载 H5 时启用，不把参考模板当作默认架构。

## 7. 后端开发

后端开发必须选择实际服务对应的 Project，例如：

```powershell
teamai roles set backend
teamai projects set center-platform
teamai pull --force
```

启动完整开发 Workflow：

```powershell
teamai workflow start vibotcode-backend-development `
  --driver local `
  --inputs '{"task":"实现具体后端需求并说明验收条件"}'
```

该 Workflow 按 `plan -> implement -> verify` 执行，并创建独立工作区或分支。它不会自动合并代码。完成后必须由开发者检查 diff、验证结果和残余风险，再手工决定是否合入。

只执行后端自检：

```powershell
teamai workflow start vibotcode-backend-self-check `
  --driver local `
  --inputs '{"task":"检查当前工作区后端改动"}'
```

没有执行 Maven 构建、测试或关键链路验证时，结果必须明确写入 `not_run`，不能把未验证状态描述为通过。

## 8. 代码审查

正式代码审查必须切换到 `review` 角色，并选择目标平台或后端服务：

```powershell
teamai roles set review
teamai projects set frontend-mobile
teamai pull --force
```

### 前端审查

```powershell
teamai workflow start vibotcode-frontend-review --driver local
```

也可以显式指定审查范围与需求：

```powershell
teamai workflow start vibotcode-frontend-review `
  --driver local `
  --inputs '{"scope":"origin/pre...HEAD","requirements":"需求与验收条件","context":"补充背景"}'
```

前端问题级别统一为：

- `MustFix`：合入前必须修复。
- `ShouldFix`：应修复，未修复需要给出明确理由。
- `NiceToHave`：非阻断改进建议。

### 后端审查

```powershell
teamai workflow start vibotcode-backend-review `
  --driver local `
  --inputs '{"scope":"当前分支与目标分支差异","requirements":"需求与验收条件","context":"补充背景"}'
```

后端问题级别统一为 `P1 / P2 / P3`。每条发现必须包含文件与行号或精确位置、触发场景、影响和修复方向。

审查输出以问题为先；没有发现时应明确说明，并列出仍未覆盖的测试或环境风险。

## 9. Workflow 启动约束

TeamAI CLI `0.22.0` 对声明 `invoke` 的 Workflow 存在版本兼容限制，因此当前仓库的 Workflow 不声明自动调用入口。

使用规则：

- Workflow 必须由成员在独立终端显式执行。
- 固定使用 `--driver local`。
- 不要要求 Codex Agent 在当前受管会话内部代为启动，当前版本会按隐式 `invoke: deny` 拒绝。
- 正式执行前可使用 `--describe` 检查定义和输入。

示例：

```powershell
teamai workflow start --describe vibotcode-frontend-review --driver local
```

## 10. 资源证据与适用边界

使用 TeamAI 资源时遵循以下证据顺序：

1. 目标仓库的需求、配置、接口契约和相邻代码。
2. 平台或框架官方文档以及当前运行时行为。
3. 团队 Rules、Skills 和项目画像。
4. 社区通用工程实践。
5. Learnings 和参考模板，只作为线索，必须回到当前代码验证。

TeamAI 不替代业务仓库自身的 ESLint、Prettier、commitlint、Maven、测试和构建配置。仓库已有命令是实际质量门禁；TeamAI 负责补充流程、审查维度与团队上下文。

## 11. 创建和发布团队资源

TeamAI CLI `0.22.0` 负责发现、校验、分发和发布资源，但没有 `teamai skill create` 这类脚手架命令。

创建资源时需要区分：

- **生成内容**：由成员手工编写，或让 Codex 等 Agent 按团队要求生成。
- **发布内容**：由 `teamai push` 放入正确 namespace、创建分支并发起 Pull Request。
- **分发内容**：Pull Request 合并后，由成员执行 `teamai pull` 或通过会话启动 Hooks 获取。

### 11.1 查看 CLI 自带的 Skill 指引

`teamai skill` 用于查看已安装 Skill 和 CLI 内置指引，不用于创建团队 Skill：

```powershell
teamai skill list
teamai skill get core
teamai skill get core --full
teamai skill show <skill名称>
teamai skill path teamai
```

`teamai skill get` 返回的内容与当前 CLI 版本一致，遇到 TeamAI 命令或发布流程问题时应优先读取。

### 11.2 创建一个新 Skill

Codex 会读取 `$HOME\.codex\skills` 和 `$HOME\.agents\skills`。团队成员自己的草稿建议放在 `$HOME\.codex\skills`，不要直接修改 TeamAI 已投递到 `$HOME\.agents\skills` 的副本。

目录结构：

```text
$HOME/.codex/skills/<skill-name>/
├─ SKILL.md
└─ references/             # 可选，放按需读取的详细材料
```

最小 `SKILL.md`：

```markdown
---
name: example-skill
description: 说明何时使用该 Skill，以及它解决什么问题。
---

# Example Skill

1. 先读取目标仓库事实和约束。
2. 按步骤完成任务。
3. 执行验证并报告未验证项。
```

也可以在 Codex 中使用可用的 `$skill-creator` 辅助生成或整理 Skill。该能力负责生成内容，不替代 TeamAI 的 namespace、健康检查和 Pull Request 流程。

创建后先检查本地发现结果：

```powershell
teamai list skills --source local
teamai skill show example-skill
```

发布到角色 namespace：

```powershell
teamai push `
  --skill "$HOME\.codex\skills\example-skill" `
  --role frontend
```

发布到项目或平台 namespace：

```powershell
teamai push `
  --skill "$HOME\.codex\skills\example-skill" `
  --project frontend-mini-program
```

只有所有角色都必须获取的资源才能使用 `--shared`：

```powershell
teamai push `
  --skill "$HOME\.codex\skills\example-skill" `
  --shared
```

`--role`、`--project` 和 `--shared` 表示发布位置，不能凭方便随意选择。本仓库使用 namespace 交集控制能力，发布到错误 namespace 会导致资源不可见、跨领域泄漏或错误组合获得不应出现的上下文。

### 11.3 创建其他资源

| 资源 | 推荐位置 | 创建与发布方式 |
| --- | --- | --- |
| Skill | `skills/<namespace>/<name>/SKILL.md` | 本地创建后 `teamai push --skill`，或在团队仓库分支直接添加 |
| Rule | `rules/<namespace>/<name>.md`，或含 `RULE.md` 的目录 | 在团队仓库分支创建；目录型 Rule 可带 checklist、示例等辅助文件 |
| Agent | `agents/<namespace>/<name>.yaml` | 在团队仓库分支创建；名称必须与文件名一致 |
| Workflow | `workflows/<namespace>/<name>.yaml` | 在团队仓库分支创建，并执行解析和 `--describe` 验证 |
| Doc | `docs/<namespace>/<name>.md` | 在团队仓库分支创建，或通过知识导入流程生成 |
| Learning | `learnings/<namespace>/<name>.md` | 通过团队经验贡献或导入流程生成，并保留证据来源 |

发布单个已经准备好的文件时，也可以使用：

```powershell
teamai push `
  --file .\new-review-workflow.yaml `
  --path workflows/review/new-review-workflow.yaml
```

`--file` 会把文件原样放到 `--path` 指定的位置，不能与 `--skill`、`--role`、`--project`、`--shared` 或 `--all` 组合。涉及多个互相依赖的文件、manifest 或 namespace 调整时，应直接在团队仓库独立分支修改并通过 Pull Request 发布。

### 11.4 导入已有规则和知识

从本机已安装 Agent 工具导入 Rules：

```powershell
teamai import --from-tools
```

从本地或远程代码仓库生成代码知识：

```powershell
teamai import --dir <本地仓库目录>
teamai import --from-repo <Git仓库地址>
```

导入结果需要人工确认。自动分类只能作为候选，不能跳过敏感信息检查、业务事实核对和 namespace 选择。

### 11.5 新增 Role 或 Project

CLI 提供基础维护命令：

```powershell
teamai roles add <role-id> `
  --namespaces common,<namespace> `
  --description "角色说明"

teamai projects add <project-id> `
  --namespaces common,<namespace> `
  --name "显示名称" `
  --description "项目说明"
```

本仓库不允许仅执行命令就直接发布。新增 Role、Project 或 namespace 后，还必须人工检查 `manifest/roles.yaml`、`manifest/projects.yaml`、接入脚本拒绝矩阵、README 组合表和实际 pull 隔离结果。

前端新增业务仓库时通常不新增 Project，应继续映射到 `frontend-pc`、`frontend-mobile` 或 `frontend-mini-program`。只有出现新的运行平台且现有平台规则不能覆盖时，才评估新增前端 Project。

### 11.6 Workflow 自动生成的 Skill

TeamAI 可以为声明 `invoke: allow` 或 `invoke: ask` 的 Workflow 自动生成调用 Skill。该 Skill 由 `teamai pull` 维护，不应手工编辑或使用 `teamai push --skill` 发布；应该修改 Workflow 本身。

本仓库当前锁定 CLI `0.22.0`，现有 Workflow 为兼容该版本没有声明 `invoke`，因此不会生成自动调用 Skill，仍按第 9 节从独立终端显式启动。未来升级 CLI 并启用 `invoke` 前，必须完成兼容性和权限边界复验。

### 11.7 发布前检查

新资源或资源修改至少完成以下检查：

1. 名称、目录、frontmatter 和内部引用有效。
2. namespace 已被对应 Role 或 Project 声明。
3. 合法组合能拉取资源，错误组合不能获得执行能力。
4. Workflow 能解析，输入、Agent 和输出绑定正确。
5. 没有凭据、内部地址、个人信息或项目专属业务字段泄漏到通用资源。
6. 来源和适用边界已记录到 `docs/vibotcode/resource-provenance.md`。
7. `teamai review --branch <分支> --json` 返回 `0 fail / 0 warn / 0 info`。

Pull Request 合并后，消费端执行：

```powershell
teamai pull --force
teamai doctor
teamai list skills --source repo
```

## 12. 常见问题

### 没有看到预期的 Skill、Agent 或 Workflow

```powershell
teamai roles list
teamai projects list
teamai pull --force
teamai doctor
```

确认 Role 和 Project 属于合法组合，并重新打开 Agent 会话。

### Rules 没有生效

检查 Codex 项目信任和 TeamAI Hooks 信任。完成信任后必须新建会话；仅重新执行 `pull` 不会让已经打开的会话重新注入 Rules。

### Workflow 报 invoke denied

不要在 Agent 会话内部启动。打开独立 PowerShell 终端，在业务仓库根目录使用 `--driver local` 执行。

### 前端加载了错误的平台规则

重新选择真实运行平台并强制拉取：

```powershell
teamai projects set frontend-mobile
teamai pull --force
```

### 团队仓库更新后本地没有变化

确认 GitHub SSH 权限和远端地址，然后执行：

```powershell
teamai pull --force
teamai status
```

### Windows 报 Filename too long

启用 Git 长路径支持后重新执行接入或拉取：

```powershell
git config --global core.longpaths true
teamai pull --force
```

如果失败发生在首次 `init` 的 TeamAI 仓库 clone 阶段，修正配置后重新执行原接入命令。

## 13. 团队仓库维护规则

维护 TeamAI 资源时：

1. 在独立分支修改，禁止直接向主分支推送未经验证的资源。
2. 保持前端开发、前端审查、后端开发和后端审查 namespace 隔离。
3. 前端按 PC、移动 Web、小程序平台建模，不新增业务项目名 namespace。
4. 后端项目专属知识只进入对应服务 namespace。
5. 修改 Workflow 后验证解析、输入绑定、Agent 引用和 `--describe`。
6. 修改角色、项目或 namespace 后验证合法组合与错误组合的实际 pull 结果。
7. 发布前执行 TeamAI branch health，并确保 `fail / warn / info` 均为 `0`。
8. 通过 Pull Request 评审后再合入和发布。

分支检查示例：

```powershell
cd <vibotcode-teamai目录>
teamai review --branch <待检查分支> --json
```

修改资源来源、官方依据或参考仓库快照时，同步更新：

`docs/vibotcode/resource-provenance.md`

## 14. 仓库目录

```text
agents/       角色 Agent
docs/         团队约定、平台画像、项目画像和来源追踪
learnings/    可复用经验；使用前必须结合当前代码复核
manifest/     角色和项目 namespace 映射
rules/        自动注入的强约束与检查规则
scripts/      工作区接入脚本
skills/       开发、审查和验证方法
workflows/    可显式启动的开发、自检和审查流程
teamai.yaml   团队仓库与投递策略
```

业务事实或规则发生变化时，优先修改对应 Rule、Skill 或 Doc；README 只维护稳定的接入方式、使用规则和操作入口。
