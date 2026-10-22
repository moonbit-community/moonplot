# 迁移工作状态与待办

更新时间：2026-10-23（Asia/Shanghai）

这份文件是跨上下文压缩的工作接力清单。开始新的工作回合时，先读本文件，直接执行
下一条未完成项；只有需要范围或历史依据时才查阅 `MIGRATION_PLAN.md` 和
`COMPATIBILITY.md`。每完成一个步骤或检查就更新，避免依靠聊天摘要恢复进度。

## 检查点：从这里继续

- 当前切片编号：D22（命名MaxNLocator/AutoLocator），只读准备完成，尚未冻结/实现。
- 最近完成D21：命名Linear/Index/Fixed、真实signed/nested/0stride views、checked axis/SVG、
  本地raw data interval、共享owner/实际Grouper删除顺序与SubFigure分组隔离。旧helpers保留。
- 最终四目标：wasm/wasm-gc/native各6380/6380，JS6387/6387（7个无Node测试）。
  info&&fmt、check-all79tasks（8旧Ref warnings）、八个source --check全部exit0。
  D21-interface.diff符合预期3类/view/checked/provider，无date接口变化/foreign类型。
- 下一条具体动作：读取 .moonagent/checkpoints/D22-readonly-notes.md（235行已定向分析），
  冻结MaxN/Auto typed参数与partial-update、offset Edge/tiny、完整nticks/prune/cap和真实
  tick-space边界；保存D22-before后分派三个独占实现/原源包，root负责公共接线和门禁。
- 当前无live Moon/source session。最终test-all4524、check-all28603、shared source75085均
  exit0，历史ID勿轮询；三个agents全部交付停止。D22只有只读笔记，不得误报已实现。
- Git本地基线commit 1b61c4b（D01–D19）；D20验收commit d385718；D21验收commit 2403fcb。
  无remote。用户已授权分批commit与并行subagents，后续按验收步骤继续本地提交。
- 整体目标持续，约46%全目标/80%核心二维SVG工程估算暂不变，无阻塞。
- 固定上游 Matplotlib 源码/测试在 .moonagent/upstream/matplotlib-v3.11.2/；
  CPython v3.11.0 timedelta 源码在 .moonagent/upstream/cpython-v3.11.0/，仅行为
  参考。独立参考脚本 scripts/generate_date_range_reference.py 校验 dates.py 哈希，
  testdata/date_range_reference.json 和 date_range_README.md 记录版本与复现。
- D04 源码/接口快照 .moonagent/checkpoints/D04-before/；之前快照仍保留，勿覆盖。
  IANA 数据/名称和缓存迭代器保持已验收状态。Git 仓库仍 master、无远端；
  历史无commit指令已被用户新授权覆盖。
- 当前无需要用户回答的阻塞项。

## 当前目标

- [ ] 持续把 Matplotlib v3.11.2 的公开能力迁移到 MoonBit；本目标仍在进行中。
- 下一纵向切片候选：命名MaxNLocator/AutoLocator；命名LinearLocator/IndexLocator/FixedLocator、通用数值MultipleLocator、命名MicrosecondLocator与fractional interval、跨级clock mask checked查询错误、命名日历/时间locator家族、命名YearLocator与自动年分支、公开rrulewrapper/自动locator recurrence接线、typed日历相对运算relativedelta、默认timezone rc 与日期时区解析、datestr2num / dateutil 默认日期解析、可移植 C locale 日期格式指令、DateConverter/ConciseDateConverter 与 date.converter、完整AutoDateLocator、AutoDateFormatter/ConciseDateFormatter/日期epoch/时长/数值序列、recurrence 缓存/迭代器、
  TZif/IANA、Axes 位置/选择/移除、numeric aspect、anchor、adjustable 与 box_aspect 已验收。
- 已确认的用户决定：支持合理复用；保留 `Figure::to_svg` → `internal/render` →
  `backend/svg`，有具体共享需求再增加抽象层。不要反复讨论已解决的架构问题。
- 用户2026-10-23新授权：可以多做本地Git commit，覆盖此前不提交决定；按通过验证的
  完整步骤提交。master已建立本地基线与分批commit，无remote；每个切片仍审查接口差异。
- 整体迁移目标持续有效，完成一个切片不能把整体目标标为完成。

## 已完成并验证的基线

- [x] `Figure::subplots_adjust` 与 `pyplot.subplots_adjust`：bounds、间距继承、显式
      GridSpec 间距优先、已有/嵌套 Axes 即时更新、失败时原子保持旧布局。
- [x] 上一基线：`moon check --target all` 通过；wasm/wasm-gc/js/native 各 663/663
      测试通过；工程估算约 46% 全目标、约 80% 核心二维/SVG。该百分比是工程估算，
      不是 API 覆盖率、代码行数比例或测试通过率。

该基线在 L02 改动之前成立；不能用 663/663 声称当前尚未验收的改动也已通过。

- [x] L02 新基线：全目标 check 通过，四目标各 682/682 测试通过；记录于
      `/tmp/mathplotlib-L02-check-all.log`、`/tmp/mathplotlib-L02-test-all.log`。
      session 86872 已 exit 0，不再轮询。整体估算保持约 46% / 80%。

## L02 已验收的实现

- [x] `scene/gridspec/layout.mbt`：公开 `rect` 构造器，供手动 Axes 复用 Rect。
- [x] `scene/figure.mbt`：`new_axes_state` 供 `add_subplot` 与 `add_axes` 复用；
      `insert_axes_state` 替换未使用的隐式默认面板，之后按创建顺序追加。
- [x] `scene/layout.mbt`：`Figure::add_axes` 归一化左下角坐标转换，独立于 GridSpec。
- [x] `pyplot/state.mbt`：`axes` 默认/手动布局、`sca` 和失效当前句柄恢复已完成。
- [x] `scene/figure_test.mbt`：矩形/SVG、`subplots_adjust` 独立性与非法参数测试。
- [x] `pyplot/state_test.mbt`：新面板绘图测试已加入；SVG 断言已设置显式范围。
- [x] `MIGRATION_STATUS.md`、`AGENTS.md` 与计划入口：持久清单及恢复规则已写入。
- [x] 第一版 `.mbti` 已由 `moon info && moon fmt` 重新生成并审查；
      `Figure::add_axes`、`pyplot.axes`、`gridspec.rect` 签名符合当前实现，
      `Figure::axes()` 与 `axes_list()` 返回契约未变。无 git 历史可用于接口差分。
- [x] L02 最终接口已生成；当前签名已核对，新添 `Axes::is_attached`、`pyplot.sca`；
      兼容清单和计划已修正零尺寸与无参数行为。原临时基线副本为 NUL 数据，
      不能提供可信差分；已按本轮公开声明逐项核对生成签名，无手工改写接口。

## L02 执行顺序与验收条件

- [x] **L02-01** SVG 断言已修正并通过窄测试（92/92）；保留默认 5% 自动 margin。
- [x] **L02-02** 对齐上游边界和默认行为（已通过 L02-07 验收）：
  - [x] 已查上游 `pyplot.py:1444`：无参数 `axes()` 调用 `fig.add_subplot()`；
        显式矩形才调用 `fig.add_axes(...)`。当前硬编码 0.125/0.11/0.775/0.77
        不作为无参数行为，显式提供部分矩形参数时才使用这些缺省值。
  - [x] 已查上游 `pyplot.py:1464`：`sca(ax)` 同时切换 Axes 与其 Figure。
  - [x] 已查上游 `figure.py:779`、`:1710` 和 `tests/test_figure.py:238`：选择
        当前 Axes 不改变保存/绘制顺序。
  - [x] 已查 `_base.py:704`：只拒绝 width/height `< 0`，允许零尺寸；不用再做
        上游搜索。实现已改为 `< 0`。
  - [x] 实现允许零尺寸、拒绝负尺寸；无参数 `axes()` 复用 1×1 `add_subplot`。
  - [x] 非有限输入、归一化/显示坐标溢出原子拒绝；支持延伸到 Figure 外。
- [x] **L02-03** 直接公开已有 `Axes::is_attached`，未新增冗余所属状态；
      `Figure::axes()` 保持第一/default panel 契约。新增文档示例。
- [x] **L02-04** 已实现 `pyplot.sca(ax)`：跨 Figure 同步且原子拒绝失效句柄；
      `require_axes` 检测失效当前句柄并恢复当前 Figure 的第一个 Axes。已通过验收。
- [x] **L02-05** 聚焦回归已加入，窄测试 117/117 通过：
  - [x] 多个手动 Axes 按创建顺序渲染，图元、范围和颜色循环彼此独立。
  - [x] 手动 Axes 与 GridSpec/shared axes 同时存在，布局调整不移动手动面板。
  - [x] 默认 `axes()` 跟随 subplot bounds；显式矩形保持固定位置。
  - [x] `sca` 同 Figure 切换、跨 Figure 切换及绘图路由；切换前后 SVG 顺序不变。
  - [x] `subplots` 替换面板后旧句柄被拒绝，失败不会改变另一 Figure 的当前选择。
  - [x] 上游允许的零尺寸/外部矩形，以及负尺寸/NaN/Inf/显示坐标溢出的边界。
- [x] **L02-06** 文档与接口（示例已通过全量测试验收）：
  - [x] 修正 `Figure::add_axes` 文档中自动成为 pyplot current 的错误表述。
  - [x] `axes_list` 文档从 row-major 改为创建顺序；`Axes::rect` 描述涵盖手动矩形。
  - [x] 新公开 API 有可编译文档示例及黑盒测试，包括 `gridspec.rect`。
  - [x] 校准 `COMPATIBILITY.md`、`MIGRATION_PLAN.md`；用接口文档提供新入口示例。
- [x] **L02-07** 窄测试 117/117；`moon info && moon fmt`、全目标 check 通过，
      最终生成签名已审查；全目标测试 wasm/wasm-gc/js/native 各 682/682，exit 0。
- [x] **L02-08** 检查点转入 L03；未将小切片验收等同于整个迁移完成。

## L03 执行顺序与验收条件

- [x] **L03-01** 核对位置 API 与现有几何链，冻结本切片范围及明确不支持项。
- [x] **L03-02** 复用归一化矩形校验/转换，增加位置读写及必要的状态同步。
- [x] **L03-03** 黑盒测试覆盖手动/默认/网格 Axes、几何/SVG、边界及失败原子性；
      覆盖本切片承诺的 original/active 与等比例语义。最新专项测试 20/20 通过；
      后续全目标验收已在 L03-05 完成。
- [x] **L03-04** 公开文档示例、兼容清单、接口生成与审查；已核对归一化语义和
      set/reset、两个 SVG helper、extend_mode 工具链映射。
- [x] **L03-05** 专项 146/146，info/fmt、全目标 check 通过；四目标各 701/701，
      session 69739 exit 0。当前 check 9 条 Ref 构造弃用警告、0 errors。
- [x] **L03-06** 下一切片 L04；限制、变更文件、证据和工具链修复均已记录。

### L03 已核实的语义与实施边界

- 固定上游 _base.py:1152–1239, 2040–2074：get_position(original=False)
  会 apply_aspect；set_position(which=active) 的值会在下一次读取/绘制时
  被 original 和 aspect 覆盖；reset_position 仅恢复 active，不清除 original。
- figure.py:1363：subplots_adjust 仍重设拥有 SubplotSpec 的 Axes，
  不能因手动定位删除 spec。保留当前 GridSpec 动态尺寸传播；调整时清除位置覆盖。
- 修正现有 get_position() 像素别名为 Figure 归一化左下角坐标；保留
  Option 返回形状，正常默认面板也返回位置；rect() 保留显示像素/原始布局契约。
- 本切片实现 auto/equal、both/active/original、reset、失败原子性；
  numeric aspect、box_aspect、anchor、adjustable=datalim、locator、twins、
  constrained/tight layout 和 SubFigure 局部坐标转换留待后续，不能声称已实现。
- 复用现有 SVG 范围与几何算法；不重写或搬迁整套范围解析。
- L03 实现已写入：scene/position.mbt（新增）、scene/figure.mbt、
  scene/layout.mbt、scene/shared_axes.mbt、scene/svg.mbt、
  scene/matplotlib_compat.mbt、scene/matplotlib_compat_test.mbt、
  scene/gridspec/layout.mbt、backend/svg/render.mbt。
- 共用 position_rect 校验；原始位置覆盖优先于 spec；subplots_adjust 成功时
  清除网格覆盖；get_position 已转为归一化左下角坐标，equal 复用 SVG ranges。
- SVG 新增 panel_position 与 render_with_positions，复用既有范围/等比例算法；
  to_svg 将实际绘制的矩形同步到 active_position。internal/render.Panel 未增加
  active_rect；active-only 必须在读取/绘制时重新按 original/aspect 计算。
- 新增 scene/position_test.mbt（12 个黑盒测试）、scene/position_wbtest.mbt
  （1 个状态时序测试）；backend/svg/render_test.mbt 增加公共几何与绘制一致性回归。
- 已更新 COMPATIBILITY.md、MIGRATION_PLAN.md；README 位置坐标/示例、
  backend/svg/render.mbt 两个 helper 的可执行文档示例均已通过 L03 最终验收。
- 实现期间 moon check --target wasm 通过，14 条原有 warnings/0 errors；曾出现的
  接口移动、括号及 render_panel 参数问题已修复。专项测试曾误用命名 set_margins
  参数，已改为位置参数并通过，不是当前阻塞。
- 上轮实现阶段：scene 337/337、pyplot 88/88；专项 19/19（session 43971）。
  这些结果发生在最后一次私有 helper 整理与 backend 测试新增前。
- 最新专项命令：moon test --target wasm scene/position_test.mbt
  scene/position_wbtest.mbt scene/matplotlib_compat_test.mbt backend/svg/render_test.mbt，
  exit 0，20/20（session 57804），已覆盖最后一次整理；后续全目标验收已完成。
- 原 /tmp/mathplotlib-L03-interface-before/ 已不在当前环境；已在
  .moonagent/checkpoints/L03-interface-before/ 保存本轮 info 前全部接口快照，勿覆盖。
  已审查 scene 与 backend/svg 的预期公开签名变化，gridspec 无签名变化。
- 原 /tmp/matplotlib-v3.11.2/ 上游目录也已不存在；L03 已记录的语义不重新调查，
  下一切片需要上游源码时恢复固定版本到持久目录。

## 后续队列（当前切片验收后按序细化）

以下是尚未验收的能力，不把已有原型整模块重新列为“从零开始”。开始前先核对局部
接口与 `COMPATIBILITY.md`，已存在的能力直接复用；每次只展开一个可验收切片。

- [x] **L03** 独立 Axes 位置读写与 original/active/reset、SVG 几何同步已验收。
- [x] **L04** 已有 Axes 移除、Figure/SubFigure 成员管理、每 Figure 当前面板历史，
      四目标验收通过。
- [x] **L05** numeric aspect 的 box 调整、直接共享组传播与 SVG/位置一致性已验收。
- [x] **L06** anchor 锚定、共享传播和 SVG/位置/图像几何一致性已验收。
- [x] **L07** adjustable=datalim 实际范围调整、共享限制、checked 接口与绘制同步已验收。
- [x] **L08** box_aspect 物理框比例、auto/numeric/datalim 组合与共享约束已验收。
      twins、自动布局、locator 和 SubFigure 局部坐标为后续布局切片，不并入本轮完成。
- [ ] **D01** 日期剩余能力：IANA 规则数据、recurrence 缓存/迭代器与商业日历；已有
      transition、gap/fold、RRule/RRuleSet 查询不重复实现。
- [ ] **G01** 图表高级参数与返回对象：按兼容清单逐项补齐 transform、Artist /
      Collection 对象和统计掩码适配，避免把已接入的图表重写一遍。
- [ ] **T01** 文本、字体和主题：文本测量、完整样式/rcParams 与后续自动布局。
- [ ] **B01** 后续静态后端：SVG 稳定后评估复用现有库的 PNG/PDF 等路径，平台依赖
      单独交付；已有内部 PNG 嵌入不等同于完整 PNG backend。
- [ ] **E01** 完整目标剩余系统：交互/事件、动画、3D、宿主数据适配及图像比较工具，
      按平台和依赖拆分验收，不以原型存在宣称全部兼容。

## 恢复上下文时的检查点

- 先读本文件的检查点和活动切片；必要时 `git status --short` 确认新增外部改动。
- `[x]` 表示该项写明的动作已完成；“实现已写入”不能替代“通过验收”。
- 每个测试结果记录命令、代码阶段、计数、失败原因；保留失败到修复验证通过，不能
  只记录最后一次成功而丢失正在处理的问题。
- 原窄测试（L02 SVG 断言修正前）：92 个测试，91 通过、1 失败；失败名称为
  `pyplot axes creates and selects an independent normalized panel`。矩形断言已通过，
  SVG 端点断言没有计算自动 margin。
- 修正后窄测试：`moon test --target wasm scene/figure_test.mbt pyplot/state_test.mbt`，
  exit 0，92/92 通过。旧 session 26705 已完成。仅验证当前第一版及测试修复，
  不代表 L02-02 之后尚未实现的边界/选择语义通过。
- 第一版接口/格式检查：`moon info && moon fmt`，exit 0，0 errors、14 条原有
  warnings；已审查新接口。此结果发生在 L02-02 实现前，不替代最终验证。
- L02-02～04 实现后：`moon check --target wasm`，exit 0，14 条原有 warnings，
  0 errors。原临时接口副本后来发现是 NUL 数据，未作为差分证据；最终按公开声明审查。
- 新测试首次编译失败：`pyplot.subplots` 必须用 `rows=`/`columns=`，已修正。
  随后 93/95 通过，2 个十进制坐标断言存在浮点舍入误差；改容差后 95/95 通过。
- 新增独立测试文件后：`moon test --target wasm scene/figure_test.mbt
  scene/manual_axes_test.mbt scene/gridspec/layout_test.mbt pyplot/state_test.mbt
  pyplot/selection_test.mbt`，exit 0，117/117 通过。
- 最终实现的 `moon info && moon fmt` 已通过（exit 0，14 条原有 warnings），
  当前无 live session。新增文件为 `scene/manual_axes_test.mbt`、
  `pyplot/selection_test.mbt`；已有 `scene/gridspec/layout_test.mbt` 也增加了构造器回归。
- 上游固定源码已经在 `/tmp/matplotlib-v3.11.2/lib/matplotlib/`；优先使用这个目录，
  不重复下载，不把已安装的 Python Matplotlib 3.6.3 当成 3.11.2 的依据。
- 已知原有 14 条 `extend` 保留字 warning，不因它们重复扩大本切片范围。
- L02 最终全目标检查 exit 0（14 warnings、0 errors）；全目标测试 session 86872
  已 exit 0，wasm/wasm-gc/js/native 各 682/682。不要重跑已经完成的验证。
- 只在相关代码、依赖变化或尚有未解决问题时重复验证；纯清单更新无需跑全量测试。
- 任何后台命令启动后立刻记录 session ID；完成后记结果并删除 live 标记。

## 当前工具链兼容修复（L03 验收期间）

- 当前工具链：moon 0.1.20261012、moonc v0.10.15+943464bfa。
- 专项测试首次 exit 1：尚未进入测试执行；extend 从旧警告变为硬关键字，
  core/colors/normalize.mbt 首先产生解析错误（不是 L03 几何失败）。
- 已统一将代码标识符 extend 改为 extend_mode；保留字符串取值和校验语义；
  源码备份位于 .moonagent/checkpoints/toolchain-before/。
- 受影响文件：pyplot/state_test.mbt、pyplot/state.mbt、transforms/path.mbt、scene/triangle.mbt、scene/contour_test.mbt、scene/contour.mbt、scene/triangle_test.mbt、scene/colorbar_test.mbt、backend/svg/render.mbt、core/colors/normalize_test.mbt、core/colors/normalize.mbt。
- 原有 14 条 extend warning 的环境结论不再适用；L03 check 为 9 条 Ref 弃用
  warning，L04 删除冗余 current_axes Ref 后为 8 条，0 errors。

- 工具链修复后专项命令：moon test --target wasm scene/position_test.mbt
  scene/position_wbtest.mbt scene/matplotlib_compat_test.mbt backend/svg core/colors
  scene/contour_test.mbt scene/triangle_test.mbt scene/colorbar_test.mbt pyplot/state_test.mbt；
  exit 0，计数见 .moonagent/checkpoints/L03-narrow.log；无 live session。

- 专项实际结果 146/146；moon info 与 moon fmt 均 exit 0。首次 info 时机械替换
  误改 transforms/path.mbt 的两条真实 extend 声明，已恢复，第二次 info 通过；
  这两行无最终变更，不属于最终修复范围。
- 接口差分已审查：L03 仅 scene 的 get_position(original?)、set/reset_position，
  backend/svg 的 panel_position/render_with_positions；工具链适配仅 colors/scene/pyplot
  的 extend→extend_mode，剩余接口未发生变化。

## L04 执行顺序与验收条件

- [x] L04-01 固定上游 figure.py:70–104、930–974、1710–1727；
  artist.py:235–270、pyplot.py:1455–1462、test_figure.py:459/875 已核对。
- [x] L04-02 实现 Axes/Figure/SubFigure/pyplot 移除入口和 Figure gca/sca；
  复用已有句柄、共享分组和 SVG 路线。
- [x] L04-03 9+6 个新黑盒回归及现有共享轴/SubFigure/pyplot 专项 99/99 通过。
- [x] L04-04 新 API 均有可执行文档；README/兼容清单已同步；info/fmt exit 0。
  接口差分仅 scene 新增 5 个方法与 pyplot.delaxes，未泄漏私有选择状态；
  审查记录 .moonagent/checkpoints/L04-interface.diff。
- [x] L04-05 专项 99/99，info/fmt、check 全目标通过；四目标各 722/722。
  最终单文件四目标各 9/9，8 条已有 Ref 弃用 warning、0 errors；下一切片 L05。

### L04 冻结范围

- 新增 Axes.remove、Figure.delaxes、SubFigure.delaxes、pyplot.delaxes；非法/外部/
  已失效句柄在任何变更前以 DataError.InvalidReference 拒绝。
- Figure.gca/sca 维护每个 Figure 的选择历史；删除当前面板恢复最近选择的存活面板，
  删除非当前面板不切换；Figure.axes() 保持首/default panel 契约。
- 删除最后面板允许空 Figure，axes_list/to_svg 不隐式补面板；axes()/gca()/绘图便利
  API 在需要时创建 1×1 subplot，沿用 subplot bounds。
- pyplot.delaxes(ax) 可删除另一 Figure 的面板而不切换当前 Figure。原 pyplot.subplots
  返回首面板为 current 的便利契约保留；对象式 grid 替换后 gca 跟随最后创建面板，
  作为当前选择接入的显式对齐（原 fallback-first 用例同步更新）。
- 移除同步清理 SubFigure 成员列表；共享分组仅消费附着状态，失效句柄修改仅影响自己。
- 不扩展 Figure.clear/SubFigure.clear 语义、不增加 GUI 事件/twins、重挂载或 colorbar
  所属关系；colorbar 当前属于 Figure 独立列表，移除 Axes 不删它。

- L04 实现已写入 scene/lifecycle.mbt；Figure 增加私有选择历史；pyplot 复用
  Figure 当前选择。新增 scene/pyplot lifecycle_test.mbt（9+6 个黑盒测试）。
- 首次 L04 check 因 pyplot/layout.mbt 的 DataError 与原 LayoutError 签名冲突而失败；
  刚创建的句柄确定附着，内部 sca 改为 try!，保留原公开错误签名。

- 已将新测试中的 try? 即时 Result 模式改为 try/catch/noraise，避免当前编译器弃用
  警告；测试变量 local 改为 direct_axes，避免新增保留字警告。

- L04 当前变更：scene/lifecycle.mbt、scene/lifecycle_test.mbt、scene/figure.mbt、
  scene/shared_axes.mbt、scene/subfigure.mbt、pyplot/state.mbt、pyplot/layout.mbt、
  pyplot/lifecycle_test.mbt、pyplot/selection_test.mbt、README/COMPATIBILITY/检查点。
- 专项最终命令：moon test --target wasm scene/lifecycle_test.mbt scene/shared_axes_test.mbt
  scene/subfigure_test.mbt pyplot/lifecycle_test.mbt pyplot/selection_test.mbt
  pyplot/state_test.mbt；99/99，exit 0。文档示例将在全量测试验收。

- L04 四目标各 722/722，check 全目标通过。check 发现新测试变量 alias 引起两条
  保留字 warning，已仅重命名为 same_panel；运行该文件四目标窄回归和最终 info/fmt/check
  确认清除新增 warning，不重复全量测试。8 条其余 Ref 弃用 warning 与 L04 行为无关。

## L05 执行顺序与验收条件

- [x] L05-01 固定上游 _base.py:1700–1791、1968–2074 与 test_axes.py:6428–6470、
  9005–9016、9098–9110 已核对；复用现有 ranges 和 positioned_panel_rect。
- [x] L05-02 已写入单一 numeric 状态、IR 传递、SVG aspect_rect 与共享设置，
  wasm check exit 0（8 条已有 warnings）；后续整理已通过专项和全目标最终验收。
- [x] L05-03 新增 scene 15 条、pyplot 1 条、backend 1 条黑盒回归；
  包含流线箭头与微小 transformed span floor，专项 50/50，exit 0。
- [x] L05-04 新 API 可执行示例、README/兼容清单/计划已更新；info/fmt exit 0；
  scene 和 internal/render 的差分已审查，其他接口无变化。IR 旧 bool 构造参数保留。
  差分 .moonagent/checkpoints/L05-interface.diff。
- [x] L05-05 专项最终 50/50；info/fmt/check 全目标通过；四目标各 744/744，
  session 75983 exit 0。新文件/限制/下一切片 L06 已记录，未创建 Git 提交。

### L04 验收结论

- 上述源码/文档变更及 scene/pyplot 两份生成接口已审查。没有 Git 提交或远端变更。
- 原 master 分支没有 HEAD；git diff --check 因全为未跟踪文件不构成源码审查证据，
  采用保存的接口/源码快照、moon fmt 和实际行为回归。
- 仅变量 alias→same_panel 的最终整理后没有行为变化，已跑受影响测试文件四目标各
  9/9 与全目标 check；不重复已经通过的全量 722/722。
- 全目标工程估算仍为约 46% / 核心二维 SVG 约 80%，未据小切片虚增百分比；
  整体迁移继续，不能标记整个目标完成。

### L05 冻结范围与接口映射

- Axes.set_aspect(Double, share?=false) 设置正有限 y/x 显示比例；get_aspect()->Double?
  中 None 对应上游 auto、Some(1) 对应 equal。保留 set_aspect_equal/auto，加入可选
  share，以自身 x/y 共享组直接成员的并集传播（不传递闭包）。
- Figure.set/get_aspect 继续首/default Axes 便利契约；pyplot 通过 gca().set_aspect
  使用同一状态，不额外发明 pyplot 顶层函数。
- AxesData 使用单一 Option[Double] 比例替换 bool；IR 保留旧 bool 构造参数兼容，
  增加可选数值 aspect 与 getter；后端统一从数值计算 active rectangle。
- 保持 box 调整、居中、范围不变、original/active 与读取/绘制同步；拒绝非正、NaN、
  Inf 并原子保持状态。复用图像/共享范围/非线性尺度，检查 streamplot 箭头的
  原有 equal-aspect 专用尺寸分支，补数值比例支持。
- anchor、adjustable=datalim、box_aspect、twins、自定义 transform 与 SubFigure
  局部坐标仍待后续；图像 aspect 字符串入口仍为 auto/equal，可随后对 Axes 设置数值。
- 接口/源码快照 .moonagent/checkpoints/L05-before/ 已保存，勿覆盖。

- L05 实现变更：scene/aspect.mbt（新增）、scene/figure.mbt、scene/shared_axes.mbt、
  scene/position.mbt、scene/svg.mbt、scene/streamplot_arrows.mbt、
  internal/render/model.mbt、backend/svg/render.mbt。

- 新增 scene/aspect_test.mbt（13 个黑盒）、pyplot/aspect_test.mbt（1 个）、
  backend/svg/render_test.mbt 新增 IR 数值传递/几何一致性测试，内部 Panel getter
  新增可执行文档；覆盖流线箭头实际显示比例、共享组并集与失败原子性。

- 初版专项命令：moon test --target wasm scene/aspect_test.mbt scene/position_test.mbt
  scene/position_wbtest.mbt scene/streamplot_test.mbt backend/svg/render_test.mbt
  pyplot/aspect_test.mbt internal/render；48/48，exit 0。随后新增 mixed log/linear
  回归及说明，下一次专项应为 49 条。

- 第二次专项 49/49，info/fmt exit 0（8 条已有 warnings）。局部审查发现上游
  get_data_ratio 对 transformed spans 的 1e-30 floor 尚未复用；已补入原几何 helper
  并增加微小跨度回归，最后专项应为 50 条。该补充同时修正 equal 极小跨度语义，
  需最后全目标回归，不把之前结果当作最终验收。

- L05 源码差分已复核：原几何 helper 参数化而非复制 ranges；scene 与 IR 均单一
  Option[Double] 状态，旧 equal getter 判断 Some(1)；equal/auto 无参调用仍兼容。
  8 条已有 Ref 弃用 warnings 未扩展处理。后续全目标验收已通过。

### L05 最终验收与变更文件

- scene 新文件 aspect.mbt、aspect_test.mbt（15 个黑盒），pyplot/aspect_test.mbt
  （1 个）；backend/svg/render_test.mbt 增加 1 个，新增公开 getter/setter 均有
  可执行文档。总测试由 722 增至 744（含 5 个文档测试），四目标全部通过。
- 已改 scene/figure.mbt、scene/shared_axes.mbt、scene/position.mbt、scene/svg.mbt、
  scene/streamplot_arrows.mbt、internal/render/model.mbt、backend/svg/render.mbt；
  scene/internal-render 两份生成接口、README/兼容清单/计划/检查点已同步。
- 最终验收命令：moon info && moon fmt；moon check --target all；moon test --target all。
  全目标日志与 before 快照均持久保存在 .moonagent/checkpoints/，无待轮询进程。
- 剩余限制：anchor、adjustable=datalim、box_aspect、twins、SubFigure 局部坐标；
  图像 aspect 参数仍为 auto/equal，numeric 通过随后调用 Axes.set_aspect 接入。

## L06 执行顺序与验收条件

- [x] L06-01 固定 _base.py:717、1909–1966、2053–2061；transforms.py:493–527；
  test_axes.py:6501–6506 已核对。默认 C；clear 不重置 anchor；共享为直接组并集。
- [x] L06-02 scene Anchor 状态/方法与可选 set_aspect(anchor)、IR tuple、SVG
  剩余空间偏移已接入；moon check --target wasm exit 0（8 条已有 warnings）。
- [x] L06-03 scene 15 条、pyplot 1 条、backend 1 条新黑盒回归；专项 52/52，
  包含图片 PNG viewport/叠加线和 Figure 组合 setter 验证，exit 0。
- [x] L06-04 可执行文档、README/兼容清单/计划已更新；info/fmt exit 0。
  差分已审查：scene 新 Anchor、Axes/Figure set/get_anchor 与 set_aspect 可选参数；
  internal/render 新 tuple/构造参数/getter，其余接口无变化。差分保存在 L06-interface.diff。
- [x] L06-05 专项最终 52/52；info/fmt/check 全目标通过；四目标各 766/766，
  session 67017 exit 0。下一切片 L07，未创建 Git 提交。

### L06 冻结范围与接口映射

- 新 pub(all) Anchor 枚举：Named(String) 对应上游 compass string，Fraction(Double,Double)
  对应 tuple；get_anchor 保留输入形式，不把字符串不可逆地转换为 tuple。
- Axes/Figure.set_anchor(Anchor, share=false)、get_anchor；Figure 仍作用于首面板。
  numeric set_aspect 新增可选 anchor，一次校验后应用比例与锚点；equal/auto 既有
  无抛错接口不改，调用 set_anchor 单独设置即可。pyplot 使用 gca() 同一状态。
- 支持 C/N/S/E/W/NE/NW/SE/SW，Fraction 相对原始框左下角；允许越出 [0,1]。
  非有限 tuple、无效方向字符串以 InvalidReference 原子拒绝，不照搬上游仅检查
  字符串长度导致未知二字符延迟到绘制失败的行为。
- 默认 C；clear 保留 anchor（上游保持），新网格/新 Axes 恢复 C。auto 不缩小，
  因此 anchor 不改变 active 位置；设 fixed aspect 后才生效，original 不变。
- IR 使用 (x,y) 归一化锚点，默认 (0.5,0.5)；data_aspect_rect 使用剩余空间
  位移，SVG y 方向反转；不复制/迁移 ranges。流线箭头只依赖尺寸，不受平移影响。
- box_aspect、adjustable=datalim、twins、SubFigure 局部坐标和自动布局留后续。
- 接口/源码快照在 .moonagent/checkpoints/L06-before/，勿覆盖。

- L06 已写入 scene/anchor.mbt（新增）、scene/figure.mbt、scene/shared_axes.mbt、
  scene/aspect.mbt、scene/svg.mbt、internal/render/model.mbt、backend/svg/render.mbt；
  无 live session，尚未运行专项验收。

- 新增 scene/anchor_test.mbt（13 个）、pyplot/anchor_test.mbt（1 个）、
  backend/svg/render_test.mbt 增加 1 个黑盒；验证 compass/tuple、组合 setter
  原子性、shared union、stale 句柄、原始/活动框、log/共享范围与 SVG y 方向。

- 初版专项 50/50：moon test --target wasm scene/anchor_test.mbt scene/aspect_test.mbt
  scene/position_test.mbt scene/position_wbtest.mbt backend/svg/render_test.mbt
  pyplot/anchor_test.mbt internal/render；8 条已有 warnings。

- L06 当前文档变更：scene/anchor.mbt 与 IR getter 可执行文档，README/
  COMPATIBILITY/MIGRATION_PLAN/检查点同步；待生成接口和最后全量验证。

- 接口审查与已改源码局部复核完成；补正原 equal API 文档中的始终居中表述，
  当前使用配置的 anchor。最后重新 info/fmt 后运行全目标验证。

### L06 最终验收与变更文件

- 新增 scene/anchor.mbt、scene/anchor_test.mbt（15 个）、pyplot/anchor_test.mbt
  （1 个）；backend/svg/render_test.mbt 增加 1 个；新增 5 个可执行文档示例。
  总数由 744 增至 766，wasm/wasm-gc/js/native 均 766/766、exit 0。
- 改动 scene/figure.mbt、scene/shared_axes.mbt、scene/aspect.mbt、scene/svg.mbt、
  internal/render/model.mbt、backend/svg/render.mbt，以及 scene/IR 生成接口；
  README/COMPATIBILITY/MIGRATION_PLAN/检查点同步，源码与接口差分已复核。
- 本轮实际验证：moon check --target wasm；专项（最终 52/52）；moon info && moon fmt；
  moon check --target all；moon test --target all。日志和快照持久保留，无 live session。
- Named/Fraction 映射保留输入形式；非法方向和非有限元组在任何写入前拒绝。
  clear 保留 anchor；省略 set_aspect(anchor) 保持原锚点；auto 模式仅保留设置。
- 当前剩余位置能力：adjustable=datalim、box_aspect、twins、SubFigure 局部坐标、
  locator 和自动布局。工程估算保持约 46% / 核心二维 SVG 约 80%，整体目标仍在进行。

## L07 执行顺序与验收条件

- [x] L07-01 固定 _base.py:1790–1853、2063–2151、2210–2235；
  test_axes.py:6428–6477、9018–9031；现有 Axis.view、SVG.ranges、position 接线已核对。
- [x] L07-02 已写入 mode 设置/继承/share、Axis 视图写回、纯 panel_view 解析、
  apply_aspect 与 checked SVG；moon check --target wasm exit 0（8 条已有 warnings）。
- [x] L07-03 scene 18、Axis 2、pyplot 2、backend 2 条黑盒及 1 条范围白盒；
  专项最终 102/102，覆盖 checked 批量原子性、log/symlog、image/PNG、nested 布局与流线。
- [x] L07-04 新增公开 API 均有可执行文档，README/兼容清单/计划同步；
  info/fmt exit 0。scene/scene-axis/IR/SVG 接口差分已审查，其余接口无变化。
  证据 .moonagent/checkpoints/L07-interface.diff。
- [x] L07-05 最终专项 102/102，info/fmt/check 全目标通过；四目标各 801/801，
  session 19123 exit 0；8 条已有 warnings、0 errors，下一切片 L08。

### L07 冻结范围与接线决定

- Axes/Figure.set_adjustable("box"|"datalim", share=false)、get_adjustable；
  numeric set_aspect 增加 adjustable 参数，省略时继承自身模式，share 时一并传播模式。
  既有非抛错 set_aspect_equal/auto 保持仅切换 ratio 的便利契约，不扩展为新错误接口。
- 公共 Axes.apply_aspect() 可抛 DataError；get_position 原有 Option/非抛错签名不变，
  解析失败返回 None。get_position(original=true) 不应用 aspect，不改范围。
- Figure.to_svg_checked() 提供错误通道，旧 to_svg 保留便利签名并内部 try!；
  checked 绘制先预解析所有 datalim 面板再写回范围，避免中途失败的局部更新。
- 后端新增纯 panel_view 返回 (position, xlimits, ylimits)，复用原 compute_scale、
  artist 边界和非线性变换；compute_scales/绘制消费同一个 datalim 调整函数。
  不迁移/复制 ranges，不创建新抽象层；IR 增加 adjustable 元数据。
- Axis 新增 set_view_limits/current_view_limits：保存实际视图但保持原显式/自动选择；
  自动视图仍在新增数据/修改 margin 后失效，显式视图可被 datalim 覆盖（上游语义）。
  Axes/Figure 的 limits getter 在 datalim 模式读取已解析视图，其他模式保持既有契约。
- 采用上游 0.5% 容差、1.05 数据边界 margin 启发式、变换空间中心缩放、保留方向。
  shared x 仅改 y、shared y 仅改 x；两轴都共享的 datalim 在 setter 提前原子拒绝，
  避免延迟到旧非抛错 draw 才失败。共享判定看真实存活 sibling 数量。
- 非正显示尺寸保留原框/范围；计算溢出、逆变换非有限或折叠不可表示范围通过 checked
  API 报错，不静默回退到另一种 aspect 行为。
- pyplot.axis("equal") 对齐上游，使用 datalim 并恢复 autoscale；其余既有 mode 保留。
  警告日志不作为跨平台输出；文档明示 datalim 可覆盖固定范围，原 DataError 通道复用。
- clear 保留 adjustable（上游保持），新 Axes 默认 box；box_aspect、twins、自动布局、
  自定义 scale/data_ratio 与 SubFigure 局部坐标仍待后续。
- 接口/源码快照在 .moonagent/checkpoints/L07-before/，勿覆盖。

- L07 新文件 scene/adjustable.mbt、backend/svg/aspect.mbt；改 scene/figure.mbt、
  shared_axes/aspect/position/svg、scene/axis/view.mbt、IR model、SVG ranges/render、
  pyplot/state.mbt；尚未运行新专项。当前无 live session。
- 中间 check 曾因 adjustable 字段尚无 setter 导致 unused_mut error；第二阶段 setter
  接入后 check 通过，不是当前阻塞。
- artist_data_scale 从既有 artist 累积提取为私有 helper，使用无穷空边界，保证 datalim
  的真实 dataLim 不混入显式 view；raw_scale 复用它，顺带避免旧 1e30 哨兵截断大数据。
  该公共范围路径变化需全目标回归，并补大范围数据专项。

- 新增 scene/adjustable_test.mbt（15 条）、pyplot/adjustable_test.mbt（2 条），
  scene/axis/view_test.mbt 增加 2 条；正在运行包含已有 aspect/anchor/position、
  backend 全包与 IR 文档的专项回归。

- 首次专项 81/81 通过。后新增 backend panel_view 纯性/共享错误、旧 1e30 哨兵
  截断回归；局部审查发现 streamplot 箭头仍用 box 模式单位，在 datalim 强制缩小
  共享轴对侧视图时会改变显示尺寸。已用真实解析视图单位计算并加 10px/6.5px
  箭头显示回归；scene/streamplot(_arrows).mbt 的私有调用链扩展 DataError，
  公开签名保持原样。本次专项也包含原 streamplot_test.mbt。

- 第二次专项 100/100，通过流线箭头真实显示单位回归。随后补充 image/PNG 与
  nested GridSpec 几何变化的 datalim 回归，scene 新测试最终为 18 条，待最终专项。

- L07 最终专项命令：moon test --target wasm scene/adjustable_test.mbt
  scene/axis/view_test.mbt scene/aspect_test.mbt scene/anchor_test.mbt
  scene/position_test.mbt scene/streamplot_test.mbt pyplot/adjustable_test.mbt
  pyplot/aspect_test.mbt pyplot/anchor_test.mbt backend/svg internal/render；
  102/102，session 48089 exit 0，8 条已有 warnings；后续全目标验收已完成。

- L07 源码局部复核与接口审查完成：面板解析保持纯函数，scene 负责已验证视图
  写回；共享限制检查真实存活 sibling。全量前未修改 pyplot 其他 mode；旧非抛错
  to_svg 和 getter 签名保持，新增 checked 通道单独公开。最终全目标验收已通过。

### L07 最终验收与变更文件

- 新增 scene/adjustable.mbt、backend/svg/aspect.mbt；新增 scene/adjustable_test.mbt
  （18 条）、pyplot/adjustable_test.mbt（2 条）；Axis 2 条、backend 2 条、范围白盒 1 条。
  新增 10 个可执行文档测试，总数由 766 增至 801，四目标均通过。
- 改动 scene/figure.mbt、shared_axes.mbt、aspect.mbt、position.mbt、svg.mbt、
  streamplot.mbt、streamplot_arrows.mbt、scene/axis/view.mbt；IR model；backend SVG
  ranges/render；pyplot/state.mbt。scene/axis/IR/SVG 四份接口和 README/兼容清单/计划
  已同步并审查。没有 Git 提交或远端变更。
- 实际检查：moon check --target wasm；专项依次 81/81、100/100、102/102；
  moon info && moon fmt；moon check --target all；moon test --target all。
  日志、L07-before 快照与接口 diff 已持久保存，所有会话终止，勿重复验证。
- 行为边界：两轴共享的 datalim 提前原子拒绝；旧非抛错 get_position 解析失败返回 None，
  to_svg 保留 try! 便利语义；apply_aspect/to_svg_checked 提供 DataError。固定范围覆盖
  不提供 Python 日志警告；现有 log/symlog 支持，不增加其他 scale 或自定义 data_ratio。
- L08 应复核 box_aspect 自动模式下的共享约束：单纯物理框缩放不需要改共享范围，
  应按上游组合语义处理，不能机械套用 numeric datalim 的两轴共享禁令。
- 整体迁移目标继续；工程估算保持约 46% / 核心二维 SVG 约 80%，不以小切片替代完整目标。

## L08 执行顺序与验收条件

- [x] L08-01 固定 _base.py:1856–1907、2040–2090；transforms.py:538–561；
  test_axes.py:9033–9096 已核对；复用现有 aspect/anchor、checked panel_view 和 ranges。
- [x] L08-02 状态/IR、物理框 shrink、数据范围组合、auto fast-path 和 checked
  预解析已接入；streamplot 使用解析后的物理框/视图。wasm check exit 0（8 条已有 warnings）。
- [x] L08-03 scene 16 条、pyplot 1 条、backend 2 条新黑盒；专项最终 114/114，
  覆盖模式组合、清除、共享、极值、log/PNG/live grid 与流线实际显示尺寸。
- [x] L08-04 新公开 API 均有可执行文档；README/兼容清单/计划同步，info/fmt
  exit 0。scene 四个方法和 IR optional field/构造参数/getter 已审查，其余接口不变；
  .moonagent/checkpoints/L08-interface.diff 保存差分。
- [x] L08-05 专项最终 114/114，info/fmt/check 全目标通过；四目标各 825/825，
  session 70953 exit 0；8 条已有 warnings、0 errors。按队列转入 D01。

### L08 冻结范围与接口映射

- Axes/Figure.set_box_aspect(aspect? : Double)：aspect=正有限数值设置物理框高/宽比，
  省略参数对应上游 None（清除）；get_box_aspect()->Double?。不向普通共享轴传播，
  twins 尚未支持，不引入虚构 twin 分组。Figure 入口保持首/default 面板。
- 设置 Some 自动选择 datalim；清除 None 不重置 adjustable；clear 保留 box_aspect。
  非正/非有限数值在任何状态更改/空 Figure 创建前拒绝（上游非正值会延迟到 draw 失败）。
- 组合顺序：auto+无 box→原框；auto+box+datalim→仅缩物理框；numeric+datalim→先
  按 box（如有）缩框，再按缩后物理尺寸调整视图；numeric+box 模式→按数据比例缩框，
  暂不使用保存的 box_aspect。auto+box+box 模式在 checked apply/render 报无效组合，
  不默默按另一种策略绘制；配置过程允许这种中间状态，便于随后设置 numeric aspect。
- 共享约束细化：仅有真正 numeric datalim 调整时，两轴共享才需拒绝；auto 数据
  比例的物理框缩放允许两轴共享。private validate_adjustable 接受新固定比例上下文，
  numeric setter 仍在改状态前校验所有目标；旧非抛错 equal helper 的不合法组合
  由 checked apply/render 报错。这是 L08 组合能力要求的修正，不是放弃 L07 约束。
- IR 增加可选 box_aspect；后端独立的物理框 shrink 与既有 numeric 几何共享锚定
  位移 helper，原 numeric 比例运算顺序保留以避免极值溢出回归。
- Axes.apply_aspect 的 auto fast path、checked Figure 预解析与流线箭头单位也需涵盖
  box_aspect；箭头使用解析后的物理框和视图，不能继续用原始框尺寸。
- 新/改接口均有可执行文档与黑盒回归；完整验证后才标记验收。快照在
  .moonagent/checkpoints/L08-before/，勿覆盖。

- L08 新文件 scene/box_aspect.mbt；已改 scene/figure/shared_axes/adjustable/aspect/svg、
  streamplot_arrows、IR model、backend SVG render/aspect。私有 resolve_aspect_view
  抽出供 apply_aspect/箭头共享，不增加新公共抽象层。当前无 live session。

- 新增 scene/box_aspect_test.mbt（16 条）、pyplot/box_aspect_test.mbt（1 条）；
  覆盖完整 mode/auto/numeric 组合、共享、clear/清除、log、PNG、live grid、checked
  预解析原子性、零尺寸/极值与流线箭头物理尺寸。正在运行专项。

- 初次 L08 专项的 PNG viewport 和叠加线断言已通过；失败仅因测试错误地要求
  auto+box-only 绘制保存自动范围。当前语义应保持自动缓存未保存状态（None），
  修改断言后仍以 SVG 几何证明实际范围未变。新增 backend 2 条纯解析/组合策略回归。

- 最终专项：moon test --target wasm scene/box_aspect_test.mbt scene/adjustable_test.mbt
  scene/aspect_test.mbt scene/anchor_test.mbt scene/position_test.mbt scene/streamplot_test.mbt
  pyplot/box_aspect_test.mbt backend/svg internal/render；114/114，exit 0，8 条已有 warnings。
  文档/兼容清单/计划已同步，checked 通道保持；后续接口/全目标验收已通过。

- L08 源码/接口局部复核完成：原 numeric 浮点运算顺序保留，只共享锚定 helper；
  auto+box 不写回视图，numeric+datalim 使用缩后物理框；非法 auto/box 组合通过
  checked 预解析报错，L07 无效共享数值比例在 setter 仍原子拒绝；全目标验收已通过。

### L08 最终验收与变更文件

- 新增 scene/box_aspect.mbt、scene/box_aspect_test.mbt（16 条）、pyplot/box_aspect_test.mbt
  （1 条）；backend 2 条新黑盒，5 个可执行文档示例。总数由 801 增至 825，四目标均通过。
- 改动 scene/figure/shared_axes/adjustable/aspect/position/svg/streamplot_arrows，
  internal/render/model.mbt、backend/svg/render.mbt 与 aspect.mbt；scene/IR 两份接口，
  README/COMPATIBILITY/MIGRATION_PLAN/检查点同步并审查，无 Git 提交。
- 验证：moon check --target wasm；首轮专项 111/112（图片测试误要求保存 auto cache），
  断言修正及 backend 回归增加后专项 114/114；moon info && moon fmt；
  moon check --target all；moon test --target all 各 825/825。日志与快照持久保存。
- 物理比例输入用 aspect=...，无参清除；设置选择 datalim，清除/clear 保留模式；
  auto 物理框允许两轴共享，numeric datalim 仍拒绝；无效 auto+box 策略通过 checked
  API 报错，不替换为别种绘制语义。twins 和自动布局等限制仍在兼容清单。
- D01 静态接口预读定位：ticker/date/pkg.generated.mbti 的 timezone/fixed_timezone/
  timezone_transition、DateTimeZone.initial_offset_minutes/offset_at/to_datetime/to_ordinal；
  源码 ticker/date/timezone.mbt，已有 timezone/locator_timezone/rrule_timezone tests。
  尚未调查新的 IANA 依赖或协议，下一轮从局部证据继续。
- 工程估算继续保持约 46% / 核心二维 SVG 约 80%，不因局部验收宣称整个迁移已完成。

## D01 执行顺序与验收条件

- [x] D01-01 核对 IANA/TZif 规则数据与现有分钟偏移模型，评估合理复用候选，冻结首个子切片。
- [x] D01-02 实现并接入规则数据与已有 DateTimeZone/转换链，保留历史与未来规则所需精度。
- [x] D01-03 黑盒覆盖真实时区数据、transition/gap/fold、日期显示及 recurrence 接线。
- [x] D01-04 文档、依赖/许可（若新增）、兼容清单、info/fmt 与接口审查。
- [x] D01-05 专项与四目标验收；D02 继续名称查找/数据分发，随后细化 recurrence 缓存/迭代器与商业日历剩余能力。

### D01 首个数据适配切片（冻结）

- 复用 caijiewei295/tzif-engine@0.1.0（Apache-2.0，源码已核查），仅私有接入
  load/PosixRule；不向公共 API 泄漏第三方类型。temporal@0.1.0 只有 UTC provider，
  仍需外部规则源，故本次不采用。规范依据 RFC 9636（取代 RFC 8536）。
- 新 tzif_timezone(Bytes) 接受调用方提供的 TZif v2/v3，保留秒级偏移、缩写与
  footer 外推；不捆绑完整数据库或宣称已有字符串名称解析。v1/v4 与 leap 数据
  显式拒绝（本项目为 POSIX/Matplotlib UTC 日序）。空 footer 按已有表保留末 offset，
  明确为兼容策略，不宣称 RFC 定义了这段数据。
- DateTime/transition/zone 内部使用完整 offset_seconds；新增秒级构造/访问入口。
  原分钟级入口继续兼容；旧分钟 accessor 明确仅返回向零截断的投影，内部计算
  不使用投影。日期格式化 %z 可含秒，%Z 优先使用 TZif 缩写。
- 复用现有 local_ordinal_candidates、gap/fold、formatter、locator、recurrence；
  recurrence 边界/heap watermark 改为秒并计入未来规则的所有可能 offset。
- 用固定 IANA 数据生成可复现 fixtures（含来源/版本/许可）、真实 NY/Paris/
  Lord Howe/南半球/远未来与 malformed/拒绝输入、秒级历史 SVG/recurrence 验收。
- 快照 .moonagent/checkpoints/D01-before/ 已建立，未改实现。下一步加固定版本
  依赖并完成秒级模型及 TZif 适配，然后进行专项、接口与四目标验收。

- session 36915 已 exit 0：固定依赖已加入，当前无 live session。

- D01 实现第一步：已加入固定依赖、秒级 DateTime/transition/zone 与 TZif v2/v3
  adapter；check wasm 通过（8 条已有 warnings）。首轮日期专项 131/132，原
  inactive-transition phase 回归揭示全历史 offset 边界会改变 inferred phase，
  已改为窗口内实际 transition（含 footer）边界，等待复验。无 live session。

- 秒级衔接修复后日期专项 132/132；session 36426 已 exit 0，固定 IANA 2026e fixtures 已生成，当前无 live session。

- 补齐 auto date_tick_values 的 timezone 接线及 plot_date 秒级首次 offset 推断，避免 SVG 自动刻度仍使用分钟投影；已备份 scene/date 与 scene/axis 原始源码。

- 新增真实 IANA 四区与 synthetic 解析边界 fixtures/生成脚本，日期新增前 13 条已通过（145/145）。session 66983 已 exit 0；新增边界测试使用了不存在的 Double 常量导致编译失败，已改为标准无穷值表达式，专项待复验。当前无 live session。

- 专项已 175/175（日期/scene/axis/pyplot），无测试失败。session 35556 已 exit 0；固定 tzcode2026e 重生成 fixtures 完成，校验值未变。当前无 live session。

- 已增加 ISO 秒级 offset 后缀及 2 个可执行文档，session 82638 已 exit 0，专项最终 178/178。当前无 live session。

- D01 文档/依赖/许可说明已同步。新增 ticker/date/tzif.mbt、秒级公开入口；
  修改 date/ordinal/iso/timezone/format/formatter/auto_locator/locator/locator_rrule/
  locator_recurrence/rrule_ticks/rrule_set/rrule_clock/rrule_selection、scene/date、
  scene/axis/axis；新增 ticker/date/scene/pyplot 的 TZif tests 与 test fixtures、
  scripts/generate_tzif_fixtures.py、testdata/tzif。尚未做接口与四目标验收。

- info/fmt 首轮通过，接口审查发现 DateTime 原可读 offset_minutes 字段需保留；
  已恢复原字段为兼容投影，完整 offset_seconds/abbreviation 改私有并通过方法公开，
  避免已有字段读取源码破坏。待最终 info/fmt/check-all/test-all。

- session 87472 已 exit 0：最终 info/fmt、check --target all 通过，8 条已有 warnings、0 errors；当前无 live session。

- 最终接口审查：只变更 ticker/date/pkg.generated.mbti；新增秒级入口与 TZif loader、
  datetime/from_ordinal/num2date 可选 seconds、自动 ticks 可选 zone，保留原可读
  分钟字段。无第三方类型泄漏；scene/pyplot 接口不变。差分 D01-interface.diff。

- session 36500 已 exit 0：moon test --target all 四目标各 847/847，日志 D01-test-all.log。

### D01 最终验收与变更文件

- 新增 ticker/date/tzif.mbt；ticker/date/tzif_test.mbt（16 条）、scene/tzif_test.mbt
  （3 条）、pyplot/tzif_test.mbt（1 条）、两个可执行 API 文档示例，共 22 条。
  四目标各从 825 增到 847，全部通过；专项 178/178。
- 修改 ticker/date 的 date、ordinal、iso、timezone、format、formatter、auto_locator、
  locator、locator_rrule、locator_recurrence、rrule_ticks、rrule_set、rrule_clock、
  rrule_selection 及 moon.pkg；scene/date、scene/axis/axis；moon.mod 固定依赖
  caijiewei295/tzif-engine@0.1.0（Apache-2.0）。只修改日期 mbti，第三方类型不外露。
- 新增三个包各自 test-only fixture 文件、scripts/generate_tzif_fixtures.py、
  testdata/tzif 的四个二进制、manifest、许可与复现文档；使用固定 tzdata/tzcode2026e，
  覆盖 NY/Paris/Lord Howe/Nuuk 与 v2/v3/历史秒/未来至9999年/解析拒绝边界。
- README/COMPATIBILITY/MIGRATION_PLAN/DEPENDENCIES/THIRD_PARTY_NOTICES 已同步。
  原 offset_minutes 字段和方法保留为明确文档化的分钟投影，计算全用完整秒；
  日期构造/num2date/from_ordinal 新增可选秒参数，ISO 支持秒级后缀。
- 默认 auto ticks 也接 zone；plot_date 初始秒级 offset 推断使用精确固定 zone；
  recurrence 窗口只取查询区间内实际变化以保持 inferred phase，heap watermark
  另取所有可能 offsets（含未来），保留 UTC fold 排序/count/until 行为。
- 限制明确：不搜索系统/捆绑生产库，未支持按名称解析；拒绝 v1/v4、leap 表和
  >=24h offset；空 footer 保留末 type 是兼容策略。D01 数据适配已验收，整个
  日期迁移及 Matplotlib 完整公开能力目标仍未完成，继续 D02。
- 工程估算保持约 46% 全目标 / 核心二维 SVG 约 80%，不把局部测试作为总体覆盖率。

## D02 执行顺序

- [x] D02-01 核对 _get_tzinfo 字符串/别名与可复用数据库分发候选，冻结名称 provider 范围。
- [x] D02-02 将名称解析接到已验收的 TZif/formatter/locator/scene 链，明确数据来源与版本。
- [x] D02-03 黑盒与文档/许可/接口审查、专项及四目标验收。

### D02 冻结实现与验收范围

- 前一轮为实际进展：D01 已实现并验收，四目标各 847/847；当前从 D02-01 继续。
- 上游 dates.py _get_tzinfo 的字符串入口调用 dateutil.tz.gettz，保留未知名称报错。
  新包 ticker/date/tzdb 用 `timezone(String) -> @date.DateTimeZone raise DateError`
  对接；同时公开 version() / available_timezones()。已有 formatter/locator/scene/
  pyplot 接收返回的 zone。保持静态 MoonBit 包边界，不让基础 date/scene 反向依赖
  大数据包；名称映射由可选显式 import 完整提供，不只注册少量样例。
- 再次核查候选：tzif-engine 无内置库；temporal 仅内置 UTC provider；moondate
  明确无 IANA/named DST。继续复用 D01 引入的 tzif-engine 解析/未来规则，不加
  重复日期模型或新依赖。原始 IANA 数据/许可为官方 public domain。
- 固定官方 tzdata/tzcode2026e，标准 primary regions + etcetera/factory/backward，
  无 leap 表；不启用官方默认也未启用的 backzone/packrat。用 pinned zic -b slim
  编译，保留完整 64-bit 历史及 footer，按内容去重共享 aliases，查询时按需解析。
  用 case-sensitive exact IANA names；不接受文件路径、环境 TZ 或任意 POSIX 字串。
- 可复现脚本校验归档 hash/版本，核对全部 Zone/Link 名称与编译产物；生成独立包
  私有 bytes/索引、manifest 与来自 Python zoneinfo 同字节的独立黄金断言。
- 验收：全部发布名称可解析并与参考多时代/未来 offset 对照，兼容 aliases/UTC/
  Etc 正负号、近期2026e政策、历史秒、DST gap/fold、共享缓存复制隔离/未知名；
  named zone -> formatter/locator/recurrence -> scene/pyplot/SVG 黑盒接线；文档、
  许可、生成可复现审查、接口、专项与四目标通过后标记 D02 完成。
- 快照 .moonagent/checkpoints/D02-before/ 已建立，尚未修改实现；无 live session。
  下一步编译整库并统计名称/唯一 blobs，然后实现生成脚本和名称查询。

- 全库编译统计：598 名称，345 唯一 blobs，共 206817 字节；zic slim 保留 64-bit 数据。
- 已写 scripts/generate_tzdb.py；session 31836 已 exit 0，生产数据/索引/manifest/黄金断言已生成；当前无 live session。

- 已实现 tzdb 三个公开入口与按内容缓存；wasm check 可编译。首轮 11 条新测试 2/11，通过的为版本/名称目录，名称加载均抛 DateError；正在诊断 slim 数据与解析器接线，未缩减数据覆盖。

- 已定位名称查询失败：当前 MoonBit String::compare 使用 shortlex（先长度），而
  官方名称索引用字典序生成；二分必须用 String::lexical_compare。已改为显式
  字典序比较（API 经 moon ide doc 确认）；slim 数据未发现问题。待专项复验。

- 修复字典序后 tzdb 专项 11/11 通过（含 3 个可执行文档）；全 598 名称 ×
  14 个独立参考 instant = 8372 个 offset 断言全部通过，别名全量表也通过。
  当前无 live session；下一步 scene/pyplot 按名称接线黑盒与文档/生成检查。

- 已新增 scene/pyplot 名称接线测试；scene moon.pkg 重复 test import 块被工具拒绝，已合并到原块。session 99096 已 exit 0：独立重新构建/再生成 --check 通过，日志 D02-generation.log；当前无 live session。

- scene/pyplot 命名接线专项通过，tzdb+scene+pyplot 合计 14/14；无新增 warnings
  （只余 8 条已有 Ref 弃用）。已更新 README/兼容/计划/依赖/notice，生产库 LICENSE
  和 manifest 已保存；待 info/fmt、接口审查与四目标。无 live session。

- 最终 info/fmt 通过，接口差分 D02-interface.diff 仅新增 tzdb 三个入口；
  基础 date/scene/pyplot 接口不变。check --target all 已通过（8 条原有 warnings）。
- session 96247 已 exit 0：fmt 后生成 --check 再次通过，日志 D02-generation.log。

- session 62860 已 exit 0：moon test --target all 四目标各 861/861，日志 D02-test-all.log。

### D02 最终验收与变更文件

- 新包 ticker/date/tzdb：catalogue.mbt 三个公开入口 timezone/version/
  available_timezones，私有按内容缓存；data.mbt/index.mbt 生产数据；
  catalogue_test.mbt（8 条）+ 3 个可执行 API 文档、独立 reference_test.mbt；
  manifest.json/README.md/LICENSE/pkg.generated.mbti/moon.pkg。
- 新 scripts/generate_tzdb.py 验证 tzdata/tzcode2026e 归档哈希并在临时目录编译
  pinned zic；核对全部标准 Zone/Link 与产物，生成 345 blobs/598 名称/参考断言。
  --check（含 fmt 后重复）可无修改重现；无网络/系统 zoneinfo 或系统 zic 输入。
- 新 scene/tzdb_test.mbt（2 条）、pyplot/tzdb_test.mbt（1 条）；两包 moon.pkg
  仅加 test import。基础生产包依赖和接口不变，数据包由用户显式导入，不形成
  date→tzdb 依赖环；公共 API 只返回原 DateTimeZone/DateError。
- README/COMPATIBILITY/MIGRATION_PLAN/DEPENDENCIES/THIRD_PARTY_NOTICES 已同步，
  数据 public-domain notice 随包保留；未新增 Mooncakes 依赖；无 Git 提交。
- 初轮 binary search 使用默认 String Compare（shortlex）导致名称误报 unknown，
  改显式 lexical_compare 后全量独立断言通过，未退回线性搜索或缩减数据。
- 验证：专项 14/14；moon info && moon fmt；check --target all（8 条已有 warnings，
  0 errors）；四目标各 861/861（847 + 14）；每目标核对 598×14=8372 个历史/
  当前/未来 offset，以及全部 253 个 alias 与 canonical 表。生成 --check 通过。
- 标准发布 primary regions + etcetera/factory/backward；遵循官方默认不启用
  backzone/packrat，无 leap/right/system-local/path/POSIX 字串扩展。未知名称明确
  DateError，现有外部 TZif 加载入口仍可使用。数据更新按固定版本生成并验收。
- D02 已完成，整体 Matplotlib 完整公开能力目标仍进行中；接 D03。
  工程估算继续约 46% 全目标 / 核心二维 SVG 约 80%，不是测试/API 覆盖率。

## D03 执行顺序

- [x] D03-01 核对 RRule/RRuleSet 与上游 cache/迭代器契约，冻结可复用实现范围。
- [x] D03-02 接入缓存/迭代入口并保留 occurrence/count/until/gap/fold 与复制/失效语义。
- [x] D03-03 黑盒/文档/接口审查、专项与四目标验收。

- session 86029 已 exit 0，dateutil 2.9.0.post0 rrule.py/tests/LICENSE 已持久保存；当前无 live session。

### D03 冻结实现范围

- 前轮 D02 为实际已验收进展；D03 对照固定 dateutil 2.9.0.post0 rrule.py
  的 rrulebase.__iter__/_iter_cached/_invalidate_cache/replace 及对应测试，
  Matplotlib 固定 dates.py.rrulewrapper 将 cache 参数透传并在 set 时重建规则。
- rrule/rruleset 新增可选 cache=false；RRule.replace(cache?) 默认保留开关并
  独立重建空缓存，with_offset/with_timezone 同理；新 cache_enabled() 可查询开关。
- RRule/RRuleSet 新 iter()->Iter[DateTime] 与 iter_after(value,count?,inc?)，
  独立消费位置、耗尽后恒 None；采用 MoonBit 原生 Iter，不先 materialize all()。
  数组查询保留最多100000的边界；lazy iterator 可继续到真实 count/until/年9999。
- 把现有 calendar/clock 的 local-candidate 枚举提取为 lazy Iter，并继续复用
  DateRule selector/positions 与 RecurrenceWindow 的 gap/fold/pending UTC heap/
  count/until 归约；原 locator eager 入口复用同一枚举，避免双份科学计算逻辑。
- 缓存保存逐步产生的共享 occurrence 前缀（单独 reader index），只在首次推进时
  初始化 underlying iterator；新 RRule 有独立缓存。RRuleSet mutator 以新一代缓存
  失效，已有 iterator 保持创建时来源快照，新查询见新增规则/日期/排除来源。
- 缓存接入查询链；after/xafter/all/set merge 按需读取，未启用缓存的有界查询
  尽量保留现有 seek/反向 probe 优化。set lazy merge 按精确 UTC 微秒去重/排除，
  不对每个来源先 all()，保持排序和子规则时区表示。
- 用黑盒覆盖各频率、selectors/BYSETPOS、count/until、秒级 offset、DST UTC顺序、
  多 iterator 交错、缓存重用/派生复制、set 四种失效/快照、超过 eager cap 的 lazy
  消费与日历边界；必要白盒确认未 eager 生成以及已缓存前缀确被复用。
- 快照 D03-before 已建立；下一步实现共用 lazy candidates/ordinal reduction，先跑
  旧日期专项，再接缓存和对象 API。无 live session；不创建 Git 提交。

- 日历/时钟候选已提取为原生 lazy Iter，统一 recurrence_ordinals 保留 UTC heap/
  count/until，state counter 提升 Int64；旧日期专项 150/150。新增前缀 cache 与
  RRule.iter/iter_after、构造/派生开关；after/xafter/all 开始复用流式查询，待编译。

- 已接入 RRuleSet cache/iter/iter_after：按精确 UTC 微秒 lazy merge/dedup/exclude，
  mutator 换代失效，reader 快照；after/xafter/all/between 共用流式来源，保留 before
  反向优化。旧日期加两个新文档 152/152。删除已不再使用的旧 eager helper，
  仅剩原 8 条 warnings 待最终核对。下一步缓存/交错读取/边界黑盒与白盒。

- 新增 iterator 黑盒 12 条（含超过100000、set 排除后继续生成、UTC边界比较）、
  白盒 2 条确认未 eager 生成/缓存前缀确实复用，前次日期专项 165/165。
  保留旧 throws API 的 after/xafter/set-between 注解，局部关闭 unused_error_type；
  不为消警告加入会拒绝本来有效 offset 查询边界的额外校验。
- 新增 scene cached locator SVG 黑盒；session 34872 已 exit 0：日期、tzdb、scene/pyplot 专项 199/199，日志 D03-narrow.log；当前无 live session。

- 专项 199/199 后已同步 API/README/兼容清单/计划/notice，并保留 LICENSE-DATEUTIL；
  白盒补充 after/between/before 确实读取已有缓存前缀。待 info/fmt/接口审查与全目标。
  新增 rrule_iterator/set_iterator、iterator_test/cache_wbtest、scene/rrule_cache_test；
  修改 locator_rrule/rrule_set/rrule_calendar/rrule_clock/rrule_ticks。无 live session。

- 接口初审仅日期 mbti 的 cache 参数/查询方法有预期增加。边界复核发现 reader
  上界不应沿用原 DTSTART offset（转 zone 后会过早截断9999年最后一天）；
  已改统一 UTC 年9999终点，并增加原 +14h DTSTART 转 -5h 的38小时尾部回归。
  session 87535 已 exit 0：最终专项 200/200，日志 D03-narrow.log；当前无 live session。

- 局部公开接口核对：固定 dates.py.__all__ 明列 num2timedelta/drange，但本地尚无
  对应入口；BusinessDay/HolidayCalendar 不在该清单中。D03 验收后下一项应优先
  迁移这些实际公开数值序列/时长接口，商业日历扩展保留为后续可选项，不以额外
  功能取代原 Matplotlib 对齐目标。未重新调查总体架构。

- 最终 info/fmt、moon check --target all 均通过（8 条已有 Ref warnings，0 errors）。
  最终接口差分只变 ticker/date：rrule/rruleset/replace 新 cache 可选参数，
  RRule/RRuleSet 各 cache_enabled/iter/iter_after；其他包接口不变，无第三方泄漏。
  D03-interface.diff 已复核。无 live session，开始全目标测试。

- session 85805 已 exit 0：四目标各 879/879，日志 D03-test-all.log；无 live session。

### D03 最终验收与变更文件

- 新增 ticker/date/rrule_iterator.mbt、rrule_set_iterator.mbt：共享前缀 cache、
  原生 Iter、惰性来源、UTC 微秒合并/去重/排除与来源快照；不先 all() 再迭代。
- 修改 locator_rrule.mbt、rrule_set.mbt：构造/replace 增 cache，派生保持开关但
  新缓存；查询接入流式/cached 来源，保留 uncached before 的反向探测优化。
  保留原抛错 API 签名，对确实无需抛错的旧入口局部标记 unused_error_type。
- 修改 rrule_calendar/rrule_clock/rrule_ticks：抽取 lazy local candidates，共用
  selector/BYSETPOS/phase 与 RecurrenceWindow 的 gap/fold/UTC heap/count/until；
  occurrence 计数改为 Int64，locator eager 仍 take(100000)，迭代本身不受此上限。
- 新 iterator_test 13 条、cache_wbtest 2 条、2 个执行文档、scene/rrule_cache_test
  1 条，总计 +18；四目标从 861 到各 879/879，最终专项 200/200。
- 覆盖七频率、selector/BYSETPOS、count/until、秒级偏移、真实 IANA gap/fold、
  reader 交错与耗尽、派生隔离、set 四种失效/已有与未启动 reader 快照、前缀查询
  复用、超过100000的合法流式消费和年9999边界。set 不再预截断每个子来源后
  排除，避免排除首100000条时漏掉后续有效 occurrence；时区转换后的迭代 UTC
  终点也不再沿用原 DTSTART offset 而过早截断，已补 +14h→-5h 尾部回归。
- 文档 README/COMPATIBILITY/MIGRATION_PLAN/THIRD_PARTY_NOTICES 与日期 mbti 已同步；
  新 LICENSE-DATEUTIL 记录固定行为参考的 Apache/BSD notices，无新依赖/提交。
- 验证：旧日期 lazy 枚举专项150/150；基础接线152/152；缓存/流式165/165；
  扩展199/199；尾部边界修复后200/200；最终 info/fmt/check-all 与四目标全部通过。
- D03 已验收；整体完整 Matplotlib 公开能力仍在迁移中。下一步按固定 __all__
  中明确缺失的 num2timedelta/drange 开始 D04，不把额外商业日历功能当作公开 API
  对齐的替代。估算继续约46%全目标 / 核心二维SVG约80%，不是API/测试覆盖率。

## D04 执行顺序

- [x] D04-01 核对 num2timedelta/drange 源码与测试、时长数值表示与舍入/溢出契约。
- [x] D04-02 实现时长/日期数值序列入口，复用既有 Gregorian/offset/ordinal 运算。
- [x] D04-03 黑盒/文档/接口审查、专项与四目标验收。

- session 54283 已 exit 0，固定 test_dates.py/CPython 源码已持久保存；无 live session。

### D04 冻结接口与语义

- 上轮 D03 为实际已验收进展；本轮局部核对固定 dates.py:489–553、test_dates.py
  test_num2timedelta/test_drange，以及 CPython v3.11.0 accum/delta_new 的浮点舍入。
- TimeDelta 为私有规范化 days/seconds/microseconds 三元组（±999999999 days），
  不以单个 Int64 微秒缩小 Python timedelta 范围。timedelta 提供精确整数 days/
  weeks/hours/minutes 与 Int64 seconds/milliseconds/microseconds；num2timedelta
  接受浮点日数，num2timedeltas 对应浮点数组。NaN/Inf/范围溢出明确 DateError。
- 暴露分量 getter 与 total_seconds；浮点日数先截整数天，再乘余数与 half-even
  微秒舍入，复用现有 round_even_to_int64。整数 constructor 分段商/余数归一化，
  含 Int64 极值时避免中间乘法溢出；Python 全范围保留。
- DateTime 新私有 timezone 引用，zone.to_datetime/with_timezone 保留，with_offset
  清除；增加 timezone() 与 add_timedelta(TimeDelta)。本地整数微秒加法保留所有
  小数位，跨规则重新取 offset；fold 取较早 instant（算术 fold=0），gap 用 dateutil
  的 post-transition offset。原 zone.to_ordinal(gap) 仍抛错，不更改既有转换语义。
- drange(DateTime,DateTime,TimeDelta)->Array[Double] 复现 upstream ceil、精确墙钟
  末点、同 zone 引用的墙钟比较与 linspace（不是逐项累加）。原有负步长/反向边界
  按源码实际行为对照，零步长/日历中间溢出/负样本数报错。结果无100000人为截断；
  超过 MoonBit Int32 数组索引范围显式报错，不做静默转换或截断。
- 私有未来 transition 枚举提取供规则算术 gap 与 recurrence window 实际变更边界
  共享，复用既有 parser/POSIX evaluator/offset lookup，不建立第二套时区引擎。
- 独立参考使用已发现 bundled Python3.12.14 + NumPy2.3.5 + dateutil2.9.0.post0，
  仅抽取执行固定 upstream num2timedelta/drange/date2num，未用系统旧 Matplotlib；
  构造 duration 极值/half-even/浮点日数、微秒端点、跨 DST/时区/越界/负步长黄金值。
- 快照 D04-before 已建立；下一步实现 duration 与 DateTime 规则算术，再接 drange。
  当前无 live session；不创建 Git 提交。

- TimeDelta/整数分量与标量/数组浮点转换、DateTime retained-zone 与本地算术、
  drange 已实现；旧日期加3个新文档 170/170。未来 transition helper 已与
  recurrence 边界共享。当前无 live session；下一步独立黄金向量与新黑盒。

- 已生成独立参考（340 durations + 46 ranges），最初新测试179/180：唯一失败是
  手写大数组预期100001；实测固定上游亦为100002并保留终点（浮点ceil越过一项
  后仅修正一次），已按真实上游修正断言及文档，不改算法。来源/版本/哈希记录
  testdata/date_range_reference.json；脚本验证 dates.py 精确哈希。
- DateConverter.default_units 从首日期取 tzinfo；DateTime 现已有规则引用，已补
  scene.plot_date 首次继承完整 zone（后续配置保留），并备份原 scene/date.mbt。
  新增 scene/pyplot drange/保留规则→自动日期 SVG 黑盒；待专项与最终验证。

- session 35931 已 exit 0：日期/整库/scene/pyplot 专项215/215，日志 D04-narrow.log；无 live session。

- 精度复核发现远期 transition 前1微秒若走浮点 ordinal 会被舍入到 transition。
  已给私有 transition 保留精确UTC微秒、footer保留原UTC秒，规则算术使用同表的
  integer lookup/POSIX evaluator；原浮点查询接口不变。补2400/9999年转换前1微秒
  回归，待复验。没有另建时区规则引擎，仍复用同一 transition/parser/POSIX 数据。

- session 8137 已 exit 0：精确 transition 专项216/216，D04-narrow.log；无 live session。

- 专项已216/216（session8137 exit0）。进一步保留 aware 日期算法的临时UTC越界：
  规则算术可对合法本地年1..9999的临时UTC年0/10000取offset，drange仅按上游
  真正执行UTC转换的位置检查精确整数UTC边界，避免浮点日数round到10000年的
  误拒绝。补4个固定上游日历边界黄金场景，待复验。

- session 46275 已 exit 0：新增UTC边界后专项216/216；无 live session。

- 最终端点顺序复核：上游即使返回空/单元素 linspace 也先转换最后端点为UTC；
  已将端点校验放到空/单元素返回之前，并补第51个参考场景验证空结果下的UTC
  下溢仍报错。其余上游数值向量/场景已全部通过，继续最终专项及文档/接口。

- session 26539 已 exit 0：最终专项216/216（340 duration/51 range参考及旧回归）；无 live session。

- README/兼容/计划/notice 与 testdata 参考复现说明已同步。新增 duration/range/
  timezone_arithmetic、duration/range/reference tests、scene/pyplot date_range tests；
  修改 date/timezone/tzif/locator_recurrence/rrule_ticks、scene/date 与 date moon.pkg。
  暂未 info/fmt/接口最终审查或全目标验收，下一步执行这些检查；无 live session。

- 最终 info/fmt、接口审查、check --target all 通过（8 条已有 Ref warnings，0 errors）；
  参考生成 --check 在 fmt 后通过（340 duration /51 drange）。D04-interface.diff
  仅日期新增 TimeDelta/num2timedelta(s)/timedelta/drange/DateTime.add_timedelta/timezone
  与标准 Debug/Eq/Compare；其他包公共接口不变。开始四目标，暂无 live session。

- session66967 已 exit0：四目标各895/895，日志 D04-test-all.log；无 live session。

### D04 最终验收与变更文件

- 新 timedelta.mbt：TimeDelta 私有 days/seconds/microseconds、Eq/Compare/Debug，
  精确整数构造、标量/数组浮点日数转换与 total_seconds；完整 Python timedelta
  天数范围，不受 Int64 总微秒限制。日期加法先检查日历范围/乘积，避免中间溢出。
- 新 range.mbt：drange 按固定上游 ceil→精确墙钟端点调整→UTC转换→linspace，
  兼容正/负步长和浮点 ceil 边界。无100000截断，超过Int32数组索引范围报错。
- 新 timezone_arithmetic.mbt，修改 date/timezone/tzif/locator_recurrence/rrule_ticks：
  DateTime保留zone引用；精确整数UTC微秒查表/原POSIX evaluator供墙钟算术，
  transition与footer保留精确时刻；未来transition枚举供gap与recurrence共用。
  保持原Double查询和显式gap转换报错，算术fold=较早/gap=变更后offset。
- 修改 scene/date 首次plot_date优先保留的规则时区，后续配置保留；date moon.pkg
  新标准core/debug。只有date mbti变化，scene/pyplot公开接口不变，无新第三方依赖。
- 新 timedelta_test 8条、range_test 3条、3个可执行API文档、scene/pyplot各1条，
  共+16条：879→四目标各895/895。range_reference_test包含340时长/51范围场景，
  独立执行固定上游函数（Python3.12.14/NumPy2.3.5/dateutil2.9.0.post0），--check可复现。
- 新参考生成脚本/JSON/说明；README/COMPATIBILITY/MIGRATION_PLAN/NOTICE同步。
  覆盖范围极值、Int64分量、half-even/负时长、DST/秒级offset/远期微秒、年1/9999
  本地与UTC临时越界、空/单元素端点、负步长和>100000数组；SVG动态标签接线通过。
- 验证：初旧日期170/170；新向量初179/180，唯一手写大数组预期错误，固定上游亦
  返回100002并保留终点，按实测修正；扩展215/215；精确transition/UTC端点复核后
  最终216/216。info/fmt/接口/check-all/四目标全部通过，8条已有warnings，0errors。
- D04已验收；完整Matplotlib公开能力目标仍未完成，接D05真实公开epoch能力。
  约46%全目标/核心二维SVG约80%的工程估算保持，不将局部通过率当覆盖率。

## D05 执行顺序

- [x] D05-01 核对 get_epoch/set_epoch、NumPy epoch表示与既有绝对/相对时间边界。
- [x] D05-02 配置/解析与全部日期数值换算、规则/locator/render接线，保留锁定契约。
- [x] D05-03 黑盒/文档/接口审查、专项与四目标验收。

### D05 冻结范围

- D04 是已验收实际进展；本轮只核对 epoch 及相对/绝对时间边界，不重启总体调查。
- date.get_epoch()->String 确定/锁定当前 epoch；set_epoch(String) raise DateError
  只允许未确定时调用。config 新 date_epoch 默认值/get/set 与 RcParams 字段；
  修改 fallback 不改变已经确定的 date epoch，reset config 也不清 date 锁。
- 为保留现有非抛错 date2num/to_ordinal，epoch setter 验证 ISO 后原子保存；
  内部共享 parser 位于 internal/date_epoch（config 与 date 确有共享需求），
  复用已有 tzif-engine.posix Gregorian Int64 日历，不再造日期模型或依赖。
  支持 signed Int32 年（含0）、年/月/日、T/空格时间至微秒；拒绝时区后缀、
  NaT/now/today 与亚微秒格式。保留原字符串；不宣称支持所有 NumPy 输入语法。
- Canonical 时间继续使用 Unix 整数秒/微秒；epoch stamp 用 Int64秒+微秒，不把
  巨大原点乘成单个Int64微秒。公开浮点日序才相对 epoch。转换按固定 upstream
  运算顺序：正向减整秒epoch再转Double；反向round(relative us)+完整epoch，
  20us远期修正取abs(relative days)。保留上游微秒epoch正反向不对称行为并记录。
- TimeZoneTransition/规则footer只存绝对时刻，公开at()/offset数值入口动态换算。
  纯规则构造/时区文件解析不锁epoch；DateTime.with_timezone 改用既有精确UTC
  lookup（不经浮点日数），保留instant/全部微秒且不因epoch微秒而平移。
- locator/recurrence/heap watermark/auto calendar/microsecond bounds/iterator/
  formatter/range与scene/pyplot全链接入。整点/日历网格保持日历相位，不按epoch
  的时分秒移位；内部临时本地日数与公开相对日数分清，绝对IANA规则不被重写。
- 不公开 reset epoch。自定义epoch黑盒以独立测试包/新VM初始化隔离，覆盖配置
  fallback/锁定、2000/2400/年0/带时分秒/微秒、精度/边界与IANA/DST/缓存/SVG；
  用固定 upstream + NumPy 独立生成 epoch reference。旧895测试需保持通过。
- D05-before 快照已建立；下一步共享 parser/config/state，再接转换与刻度。
  当前无 live session，无需要用户答复的阻塞，不创建提交。

- 已实现共享 ISO parser、config fallback 与锁定 state，并把 numeric转换/规则表/
  recurrence/auto calendar 接到 epoch；首轮默认日期+整库191/192。唯一失败定位为
  auto本地临时坐标重建漏了既有远期20us修正，已改共用同一decode helper（选择
  forward origin），不把近transition的微小浮点误差变成额外tick。待复验，无live。

- D05 默认专项复验192/192，exit0，确认无live；下一步独立epoch reference与黑盒。

- 独立reference最初7/7，parser/config/锁定9/9；加入integration后定位fractional
  epoch会经RRule的公共num2date产生123456us漂移，已将生成坐标解码和对象本地
  字段转换改为forward origin/精确with_timezone，保留公开num2date上游不对称。
  新增integration/epoch_{2000,2400,legacy,clock,fraction,bce,expanded,config,
  conversion,invalid}，固定参考scripts/generate_date_epoch_reference.py及testdata。
- 当前专项session11220（D05-narrow.log）运行中；包括日期+IANA+config+parser+
  所有integration/epoch_*。上一轮发现无DTSTART locator调用helper unwrap，已用
  原until本身作为offset fallback修正，待此次复验；未全目标验收。

- session11220已exit0，最终专项208/208（日期181+IANA11+config3+parser3+
  独立epoch包10）。RRule生成坐标修复已通过默认回归；无live。
- README/能力表/计划/notice及独立参考说明已同步；下一步info/fmt、接口diff、
  reference --check、check-all/test-all。D05-02完成，D05-03尚未验收。

- info/fmt与reference --check通过。D05-interface.diff已复核：仅config date_epoch
  字段/get/set/RcParams getter和date get/set增加；新internal parser接口及10个空
  integration接口符合预期，旧scene/pyplot/时区公开签名不变。8条已有Ref warnings。
- check-all session14485运行中；全目标测试待check成功后启动。

- check-all session14485已exit0；准备四目标全量测试，D05-test-all.log。无live。

- 四目标全量test session18032运行中；不重复poll历史session。D05全目标待验收。

- session18032已exit0：四目标各909/909，D05-test-all.log；无live session。

### D05 最终验收与变更文件

- 新ticker/date/epoch.mbt：get_epoch/set_epoch和仅首次选择的state；公有Double日数
  相对所选origin，canonical IANA/算术仍是绝对整数。整数秒+微秒分别保存origin，
  避免将巨大年份原点乘成溢出的Int64微秒。保留上游整秒forward/完整origin inverse
  与相对70*365天后的20us修正。无public reset，invalid setting原子失败。
- 新internal/date_epoch/{moon.pkg,parse.mbt,parse_test.mbt}：共享ISO parser，复用
  已有posix Gregorian日历；signed Int32天文年含0/负年/扩展年、年月日/至微秒。
  修改config/{config.mbt,moon.pkg}并新增date_epoch_test；default/get/set/RcParams
  snapshot保留fallback，已选date epoch不受config修改/reset影响。
- 修改date/{ordinal,auto_locator,locator_microsecond,locator_recurrence,locator_rrule,
  rrule_iterator,rrule_ticks,timezone,timezone_arithmetic,tzif}.mbt及moon.pkg：
  公开数值边界换算、phase/heap水位/日历边界接线；transition/footer只保存绝对时刻；
  exact with_timezone无数值往返且不锁epoch。RRule生成坐标用forward origin解码，
  对象本地字段精确转换，避免微秒origin给occurrence/cache引入偏移。scene/pyplot
  通过既有date入口完成接线，公开签名不变；没有新增第三方运行时依赖。
- 新integration/epoch_{2000,2400,legacy,clock,fraction,bce,expanded,config,conversion,
  invalid}独立测试包，各有新VM/单个测试，无顺序依赖或reset钩子。parser3+config1+
  集成10=14条新增，895→909。覆盖锁定/无效atomic、config fallback、纯规则构造、
  秒级offset/DST/future fold、month/year/hour/day phase、microticks、RRule缓存/
  between/before/set去重排除、scene/pyplot SVG日期与微秒标签。
- 新scripts/generate_date_epoch_reference.py与testdata/date_epoch_{reference.json,
  README.md}：校验固定upstream dates.py SHA256，执行其4个AST函数；Python3.12.14/
  NumPy2.3.5/dateutil2.9.0.post0，7epoch共3752正反转换组、84逆向边界值、14range，
  --check在fmt后通过。不使用系统旧Matplotlib，MoonBit运行无Python依赖。
- README/COMPATIBILITY/MIGRATION_PLAN/THIRD_PARTY_NOTICES已同步。新增API仅date
  get/set、config epoch字段/get/set/RcParams getter；internal parser有内部接口，
  10个test-only包空interface。D05-before与D05-interface.diff保留，无Git提交。
- 验证：默认日期初191/192→20us临时calendar修正后192/192；独立reference7/7，
  parser/config/锁定9/9；额外集成定位RRule微秒漂移和误写year边界预期（上游从
  clamp年1后步进1000，正确1/1001/2001）；修复后专项208/208，session11220 exit0。
  最终moon info/fmt/check --target all及四目标test全部通过，8条已有warnings。
- D05已验收，完整Matplotlib目标仍进行中；约46%全目标/约80%核心2D SVG工程估算
  不变，未将局部通过率作为整体覆盖率。接D06 ConciseDateFormatter公开能力。

## D06 执行顺序

- [x] D06-01 固定上游ConciseDateFormatter/test与既有axis/render offset接线定契约。
- [x] D06-02 批量日期标签/共享offset对象与轴/scene/pyplot/SVG完整接线。
- [x] D06-03 独立上游参考、黑盒/文档/接口、专项与四目标验收。

当前无live，无阻塞，无需用户确认；不要创建commit，不重复已验收检查。

### D06 冻结实现契约

- 新ConciseDateFormatter命名对象，构造可传6项formats/zero_formats/offset_formats、
  show_offset/usetex；空数组按上游默认，非空长度非6抛DateError，复制数组隔离。
  format_ticks按上游level/zero/共同小数尾零/offset规则，get_offset保留最近成功结果；
  空数组返回[]并清offset（上游空批量IndexError显式适配）；无效ordinal抛错且不写部分state。
  format_value默认%Y、format_data_short完整日期；with_offset/with_timezone/with_show_offset
  返回独立对象，规则TZif/自定义epoch沿用现有数值转换。
- DateFormatter加私有concise settings和usetex标记，共享转换/TeX wrapper；新增copy、
  format_values与offset_label，ConciseDateFormatter.as_formatter()接通通用日期formatter。
  命名Concise对象保留上游get_offset状态，轴存配置副本/批量推导，避免共享state污染。
- Axis新set_date_formatter/date_formatter getter，Axes/Figure x/y setters与pyplot x/y
  入口；保留date_mode sentinel/既有locator/fixed ticks，set_date_format显式替换formatter。
  手写labels抑制offset，clear/reset清formatter。formatter自己的时区只影响labels；
  set_date_offset/timezone仍同时更新轴locator和已挂载formatter，与既有轴入口一致。
- 复用backend/svg现有formatter_offset_label_with_view与边距位置，无新render抽象。
  动态倒序tick在批量算法前规范为上游递增次序并将label还原，倒置offset取首端；
  fixed ticks保留调用顺序，按照上游inverted flag选择offset。共享轴广播配置，副本隔离。
- usetex支持固定上游_wrap_in_tex的输出字符串；SVG的通用TeX排版引擎仍属文本模块
  未迁移能力，不为D06新建外部TeX依赖，文档明确原样文本限制，不能宣称完整TeX渲染。
- 独立参考执行固定dates.py的ConciseDateFormatter AST及_wrap_in_tex/_from_ordinalf，
  以显式tick输入验证算法，不将尚未完全一致的AutoDateLocator混作formatter参考。
  将覆盖6层级/微秒/边界offset/reset/自定义格式/TeX/offset/时区/DST/inversion及SVG。
- D06-before快照已建；D06-01完成，开始实现；无live，无Git提交。

- 新ticker/date/{concise_formatter,concise_layout,format_tex,formatter_batch}.mbt，
  修改formatter.mbt；新增Axis日期formatter配置和批量/offset分支，scene/pyplot
  x/y setter已接线。date默认回归182/182（原181+doc示例1）；scene/axis/scene/
  pyplot静态检查通过，只有8条已有warnings。当前无live，开始独立reference与黑盒。

- 新scripts/generate_concise_date_reference.py已校验固定source哈希并独立执行两个
  formatter类与原函数，生成104个case（默认/三种自定义格式/TeX/正倒序/倒置/
  时区秒级偏移/DST/未来规则/单点重复值/小数尾零）。golden与metadata已落盘。
- 日期专项live session35801，D06-narrow.log；新参考尚待结果。无其他live。

- session35801已exit0：104reference初103/104；唯一巴黎PMT/LMT来自dateutil tzfile
  对相同offset但缩写不同transition的归并，参考provider改为CPython ZoneInfo.from_file
  读取同一TZif，固定Matplotlib仍执行原class/helper，future用等价dateutil POSIX规则。
  复验286/286（181旧+1doc+104参考）通过。
- 新concise_formatter_test（复制/验证/缩放state/invalid atomic/scalar批量）和axis
  date_formatter_test（fixed/manual优先、倒置、时区独立、clear及非法轴拒绝）。
  当前专项live session99691（D06-narrow.log）；scene/pyplot/SVG/epoch验证待补。

- session99691已exit0，专项320/320。新增scene/date_formatter_test五场景与pyplot一
  场景；并将2400/微秒epoch参考从固定class独立生成，嵌入D05的隔离包同一test。
  当前live session9729（D06-narrow.log），日期/axis/scene/pyplot/两个epoch包验证中。

- session9729已exit0，端到端初870/871；唯一手写SVG测试把interval=30当整点相位，
  原有定位器会按窗口推断phase，已明确byminute=[0,30]表达预期；未改既有算法。
  generator增加两个epoch输出与原TZif checksum。当前session19310（D06-narrow.log）
  运行中，待复验。

- session19310已exit0，专项871/871；补公开defaultfmt的getter/copy配置及TeX copy
  方法与断言后，最终专项session99281（D06-narrow.log）待确认；其他无live。
- README/能力表/计划/notice/参考说明已同步，D06-02完成。下一步确认专项，然后
  moon info/fmt、接口diff、reference --check、check-all/test-all，尚未最终验收。

- session99281已exit0，最终专项871/871；无live，开始最终info/fmt与静态检查。

- info/fmt和104+2独立reference --check通过。D06-interface.diff已复核：date新增
  ConciseDateFormatter/constructor和DateFormatter批量/copy/offset/TeX；axis日期
  formatter set/get、scene Axes/Figure x/y setters、pyplot x/y入口；只加私有字段，
  旧签名不变，internal/render/backend接口未变。8条已有warnings，无新增。
- 当前check-all live session4915（D06-check-all.log）；通过后全量四目标。

- check-all session4915已exit0，8warnings/0errors；无live，启动D06-test-all.log四目标。

- 当前四目标test live session33049（D06-test-all.log）；无其他live。

- session33049已exit0，四目标各1028/1028；无live，D06已验收。

### D06 最终验收与变更文件

- 新date/{concise_formatter,concise_layout,format_tex,formatter_batch}.mbt，修改
  formatter.mbt：命名ConciseDateFormatter、6层级规则、zero/custom/offset格式、
  共同小数尾零、show_offset/倒置端点、get_offset成功批次状态、scalar/defaultfmt/
  cursor格式和TeX字符串；DateFormatter配置副本、批量labels/offset、共享原日期
  转换/格式工具。无效批次不改状态，空batch清offset，输入/getter数组复制隔离。
- 新scene/axis/date_formatter.mbt与scene/date_formatter.mbt，修改axis.mbt和
  pyplot/date.mbt：轴配置/清理/显式格式替换、DateFormatter copy getter、共享轴
  原子广播、x/y Axes/Figure/pyplot入口。显式tick labels优先并抑制offset，动态
  倒序ticks规范为上游formatter的递增输入后还原label顺序；fixed ticks保留顺序。
  formatter label时区独立于locator，axis timezone/offset入口仍更新两者。
  沿用已有backend offset渲染链，无新render抽象或第三方运行时。
- 新date/{concise_formatter_test,concise_reference_test}.mbt、axis/date_formatter_test、
  scene/date_formatter_test、pyplot/date_formatter_test；104 reference+4对象+4axis+
  5scene+1pyplot+1doc=119新增，909→1028。D05两个隔离epoch包新增generated helper
  并在原test调用（不加global reset），验证2400微秒和fractional epoch/SVG。
- 新scripts/generate_concise_date_reference.py，testdata/concise_date_{reference.json,
  README.md}；固定source SHA256与两个TZif SHA256，Python3.12.14/NumPy2.3.5/
  dateutil2.9.0.post0/locale C，执行原两个类与helper AST，不导入已装Matplotlib。
  CPython ZoneInfo用于历史fixture，等价dateutil POSIX用于未来参考。104+2cases，
  格式/TeX/正倒序/倒置/秒级offset/DST/未来规则/单点重复/尾零全覆盖，可--check复现。
- README/COMPATIBILITY/MIGRATION_PLAN/THIRD_PARTY_NOTICES同步。格式沿用既有确定性
  strftime子集；空batch为明确适配；TeX字符串输出已对齐，通用SVG TeX排版仍待
  文本模块迁移，不宣称有外部TeX后端。新private字段及上述API为预期interface差异。
- 验证：初旧182/182；reference初285/286唯一巴黎dateutil缩写归并差异，用同TZif的
  ZoneInfo参考后286/286；对象/axis320/320；SVG初870/871的手写分钟相位预期错误
  改成显式byminute=[0,30]，未改已验收locator算法；最终专项871/871（session99281
  exit0）。最终info/fmt、reference --check、check-all、四目标test均通过，8条已有warnings。
- D06-before与D06-interface.diff保留；本地Git仍master，无提交/无远端；未创建commit。
  完整迁移目标继续，约46%全目标/约80%核心二维SVG工程估算不变，不把测试数当覆盖率。

## D07 执行顺序

- [x] D07-01 固定AutoDateFormatter、locator unit/interval、rc与major/minor接线定契约。
- [x] D07-02 真实scaled格式字符串/回调/默认值与动态locator绑定、配置、SVG接线。
- [x] D07-03 独立上游参考、文档/接口、专项与四目标验收。

当前无live、无阻塞；继续下一项，无需用户确认，不创建Git提交。

### D07 冻结实现契约

- 命名AutoDateFormatter::new(locator?、default_format、usetex)，复用DateFormatter
  adapter和转换；保留旧auto_date_formatter(lower,upper)范围helper签名，明确其为
  已有原型，不用它替代新的对象。基础unit固定365/30/7/1/1h/1min/1s/1us，
  interval不参与unit；DateLocator新增unit_scale，自动轴取现有choose_interval
  实际选择频率的unit（AutoDateLocator本身仍是后续完整迁移项）。
- DateFormatter private mode枚举Fixed/Concise/Auto，两个具体batch需求共享；Auto
  scaled字典排序按首个>=unit选择，否则default_format，重复key最后值、允许负/
  infinite key，NaN key明确验证拒绝。配置复制隔离，with_locator/with_locator_unit
  支持重绑定；轴每次format按实际major/minor locator更新unit，忽略安装时decoy。
- DateScaleFormat Text/Func支持scalar numeric和position；另提供明确ValuesFunc/
  DatesFunc及format_array/format_dates，保留upstream直接传数组给callable的测试
  语义。标准format_ticks仍逐值/逐position调用；不同输入形状不静默相互改写。
  回调负责自身TeX，不再自动包装；字符串规则用现有TeX wrapper和时区/epoch转换。
- config新增七个date.autoformatter默认格式的命名get/set与数组snapshot getter，
  Auto对象构造时读取配置副本；已有formatter不随config reset/修改变化。新日期轴
  默认安装真实AutoFormatter（已建立/显式DateFormatter和Concise不改变）。
- 新minor date locator/formatter入口贯通Axis/Axes/Figure/pyplot；clear/date reset与
  时区广播涵盖minor，major改变不破坏独立minor设置。过滤与major重复的minor，
  按固定axis.py transformed viewport*1e-5容差，可关闭；minor默认Null labels，
  需要显式formatter才绘制，SVG复用位置/可见性与文字编码。轴共享offset文本仍取
  major formatter，遵循上游，不为minor另造排版层。
- D07验收包括上游minute config与minor decoy/rebind原场景、major/自动频率随zoom
  更新、callback位置与原始日期数组、scaled threshold/默认/负key/复制、TZif/DST/
  epoch/TeX、x/y/shared SVG、旧1028回归。默认格式语义改进的旧预期需按源码核对
  更新，不能为了保留旧原型输出退回仅opt-in。
- 新固定axis.py/mpl-data/matplotlibrc已存同commit upstream路径；D07-before已建立。
  继续实现，无live，无Git提交。
- D07追加参考 axis.py SHA256 f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0。
- D07追加参考 mpl-data/matplotlibrc SHA256 8b76e138ce9dc944a843dc6aa1ef9ee0e88638358b10baf227cd248d271b5f5a。

- 新config/date_autoformatter.mbt与RcParams七项默认快照；date新增locator_unit、
  auto_formatter、formatter_mode，原DateFormatter/Concise改用私有mode复用。
  Axis默认Auto、实际unit重绑定和minor日期状态/重复过滤已接线；当前日期/axis
  回归live session80761（D07-narrow.log），SVG minor/facade与新reference待实现。

- session80761已exit0，原日期/axis319/320；仅旧HourLocator单值预期从原型完整日期
  对齐为上游hour rc格式"01-01 05"（+05:45）。已按源码更新该预期。
- SVG minor标签和scene/pyplot x/y minor locator/formatter入口已接线；当前专项
  live session19114（D07-narrow.log），新功能独立reference/黑盒仍待实现。

- session19114已exit0，旧回归869/872；三个默认SVG测试仍期望旧span formatter完整
  年份。已按真实hour rc格式更新为月日小时，保留offset继承的实质检查。
- 新scripts/generate_auto_date_reference.py独立执行固定AutoDateFormatter、
  get_unit_generic与axis.get_minorticklocs，校验dates/axis/rc三个哈希；64scaled+
  missing unit+7unit+6overlap参考已生成。当前live session40604（D07-narrow.log）。

- session40604已exit0，含64scaled/reference与6overlap及全部旧受影响包944/944。
  新Auto scalar/array callback、dictionary复制/NaN、rc snapshot、TZif/TeX以及
  axis major/minor decoy/zoom/overlap/clear测试已加，当前live session66064。
  SVG非空minor labels与两自定义epoch自动formatter参考仍待补。

- session66064已exit0，新增对象/config/axis后954/954。随后增加SVG x/y minor重绑定、
  shared callback/可见性/XML escaping与倒置DST、pyplot新API测试；session82852
  已结束（结果见D07-narrow.log）。独立generator另加3callable和2epoch helper，
  接下来统一复验当前全部文件，不能拿此前test计数代替新reference验收。

- session82852已exit0，新增SVG/pyplot958/958。独立generator补了3种callable和
  2400/fractional epoch两个helper；当前统一专项live session53746（D07-narrow.log）。
  发现需复核Auto的offset_label不能重复调用用户callback（上游get_offset为空），
  待本次结果后修正并加副作用计数断言；仍未全目标验收。

- session53746已exit0，统一新reference/两个epoch963/963；offset查询不再重复回调，
  加调用次数断言/default-axis rc snapshot/doc后session81144 exit0、965/965。
- 复核补齐日期轴Numeric major/minor locator实际替换（包括元数据unit缺失时1天
  fallback）；原实现会拒绝或忽略已有numeric locator。Fixed minor关闭重叠移除时
  保留全部位置。当前新专项session55622运行中，待最终docs/接口/四目标。

- session55622已exit0，最终专项966/966；新doc+rc snapshot+numeric locator替换
  都已验证。Auto offset无重复用户回调，minor SVG 4场景、全部旧受影响包通过。
- 文档/能力表/计划/notice/参考说明已同步；两个隔离epoch helper改用在set_epoch前
  构造的Auto对象，补证明构造不锁epoch且转换使用后续选择。接最终reference生成/
  info/fmt与接口检查，再check-all/test-all；D07-02完成，D07-03未验收，无live。

- 当前info/fmt live session34709，D07-info.log和D07-fmt.log；reference已重新生成，待其完成。

- session34709已exit0，info/fmt通过，8条已有warnings/0errors。D07-interface.diff
  已复核：config命名defaults与snapshot getter、date AutoDateFormatter/typed scales/
  unit接口、axis minor配置/labels与scene/pyplot入口；旧公开签名未删改，render/
  backend公开接口不变（SVG只增private minor文字编码）。reference --check在fmt后通过。
- 当前全目标check live session43398（D07-check-all.log），通过后启动四目标test。

- check-all session43398已exit0，8warnings/0errors；无live，启动D07-test-all.log四目标。

- 当前四目标test live session52343，D07-test-all.log；无其他live。

- session52343已exit0，四目标各1120/1120；当前无live，D07已验收。

### D07 最终验收与变更文件

- 新config/date_autoformatter.mbt，修改config.mbt：七个原rc默认格式命名get/set、
  复制数组与RcParams快照，旧Auto对象及已启用日期轴不受后续config修改/reset影响。
- 新date/{auto_formatter,formatter_mode,locator_unit}.mbt，修改formatter/
  formatter_batch/concise_formatter：私有Fixed/Concise/Auto mode共享现有转换；
  命名AutoDateFormatter::new，选择首个sorted key>=unit，否则defaultfmt；Text/
  scalar Func与ValuesFunc/DatesFunc保留直接callable数组/原DateTime输入语义。
  interval不乘unit；negative/infinite key支持，NaN key明确验证；with_scale(s)/
  locator/unit/default/offset/timezone/TeX均copy配置。通用formatter保持非抛错回退。
  offset_label对Auto/Fixed直接空字符串，不额外调用用户function。
- 修改axis/{axis,date_formatter}.mbt，新date_minor.mbt：默认日期轴真实Auto而非
  旧span原型，默认/显式formatter时区策略分开，实际major/minor locator及视口
  选择频率动态绑定unit，安装时decoy不影响；允许numeric locator替换date locator，
  无unit元数据按1天fallback。新增minor date locator/formatter、clear/reset/
  timezone广播、labels与上游viewspan*1e-5重叠过滤（可关闭），minor默认Null labels。
- 新scene/date_minor.mbt与pyplot/date_minor.mbt完整x/y/shared Axes/Figure/facade
  入口；修改backend/svg/render.mbt的private labels编码，minor沿用对应侧和shared
  labels可见性/字号、XML writer，offset文本仍取major。没有新的render抽象/依赖。
- 新auto_formatter_test(5)、config/date_autoformatter_test(1)、axis/date_autoformatter
  tests(6)、scene/date_autoformatter_test(3)、pyplot同名test(1)、Auto构造doc(1)；
  原4个默认日期测试预期按实际hour rc从完整年份更新为月日时，其他旧回归保持。
- 新scripts/generate_auto_date_reference.py、date/auto_reference_test与axis/
  date_minor_reference_wbtest，testdata/auto_date_{reference.json,README.md}；
  固定dates/axis/matplotlibrc SHA256，Python3.12.14/NumPy2.3.5/dateutil2.9.0.post0/C
  locale，执行原AutoDateFormatter/get_unit_generic/get_minorticklocs AST，不导入
  已装Matplotlib。64scaled+missing1+unit7(1test)+3callable+6overlap=75 reference tests。
  两隔离epoch包各加generated helper，在set_epoch前构造Auto对象后验证2400/
  fractional转换，证明构造不锁epoch；不新增public reset或test-order依赖。
- 合计75参考+17手写/doc=92新增，1028→1120。覆盖阈值邻域/负零无穷NaNunit/
  fallback、单位不乘interval、typed callback原值/position/TeX/数组形状与调用次数、
  配置/字典副本、minor decoy更换、默认formatter zoom、numeric替换、overlap关闭、
  x/y/shared/倒置/DST/XML/SVG与pyplot。README/能力表/计划/notice/参考指南同步。
- 检查：初319/320及869/872仅旧span默认输出预期，按固定hour默认格式更新后
  944/944；新对象954、SVG958、callback+epoch963、offset/rc/doc965、numeric重绑定
  966专项全部通过。最终info/fmt/reference --check/check-all及四目标test全部通过，
  8条已有Ref warnings，0errors；session52343 exit0，无live。
- D07-before/D07-interface.diff保留，Git仍master无提交/无远端，本轮未创建commit。
  当前自动locator仍是原型，完整对象/参数/频率与phase选择接D08；完整Matplotlib
  目标继续，约46%全目标/约80%核心2D SVG工程估算不变，不把测试通过率当覆盖率。

## D08 执行顺序

- [x] D08-01 固定AutoDateLocator参数/intervald/选择/nonsingular/rc与既有locator契约。
- [x] D08-02 完整对象/自定义参数/真实选择状态与unit、默认轴/formatter/SVG接线。
- [x] D08-03 独立上游参考、文档/接口、专项与四目标验收。

当前无live、无阻塞；继续下一项，无需用户确认，不创建Git提交。

### D08 冻结契约

- 新命名AutoDateLocator::new，minticks=5、maxticks默认7频率字典或typed All/ByFrequency，
  interval_multiples=true；DateFrequency Year/Month/Day/Hour/Minute/Second/Microsecond。
  intervald按构造参数取原表，with_intervals保留列表顺序并复制；参数正整数/非空列表
  验证，maxticks=1允许fallback；with_interval_multiples只改flag，不覆盖定制intervald。
- 选择按原relativedelta(月差/剩余时分)+timedelta(days/total_seconds)组合，byranges
  累积None/低频默认项/高频range，interval_multiples daily 7/14特例；year multiples
  返回既有year_locator，其余rrule_locator无固定dtstart/until，复用已验收展开窗口。
  micro返回现有micro locator。保留all-frequencies不足minticks时_freq不更新的上游
  细节，get_locator/selected interval/warnings状态可观察。warnings为复制的typed
  诊断，不打印；覆盖interval fallback与正向远期微秒warning的原触发条件。
- get_locator(DateTime,DateTime)、get_locator_for_range(Double,Double)、tick_values
  numeric有checked方法。numeric范围支持项目既有升/降序契约（先按viewlim排序，
  再还原tick顺序）；nonsingular是独立方法，不擅自改变直接tick_values的单点输入。
- DateLocator加Automatic私有适配与copy；Auto.as_locator共享选择state供独立
  formatter跟随，Axis存/取配置副本隔离不同轴。AutoDateFormatter持有可变Auto
  locator引用时动态读unit，轴实际绑定unit覆盖原decoy引用，不能继续只捕获旧unit。
- Axis私有默认Auto对象，启用日期模式捕获config.date_interval_multiples（默认true），
  用户显式tick_count可设置默认Auto maxticks；constructor原默认不被初始6覆盖。
  默认主轴用真实对象，major/minor Auto adapter、timezone/copy/clear/shared/facade
  沿既有date locator入口；legacy date_tick_values/auto_date_unit helper保持兼容。
- nonsingular接到SVG range normalization之前（空数据1970两天/同点±730天，之后
  既有margins），不改numeric轴。完整对象选择state、默认格式单位、nonsingular
  和rc必须同时验收，不用只opt-in对象替代默认路径。
- 独立参考固定AutoDateLocator/get_locator/nonsingular，结合固定RRuleLocator/
  YearLocator/MicrosecondLocator+dateutil，覆盖原8/7跨度、multiple flag、全部参数/
  自定interval/警告、month-end/reverse/时区/epoch/微秒/空与单点与SVG。
  原TZif gap/fold扩展语义沿已验收实现保留并明确，不能重启时区模型重写。
- D08-before快照已建立，开始实施，无live，无Git提交。

- 新automatic_locator/distance/selection/adapter.mbt：typed频率/max/diagnostics、
  calendar+duration选择、源i索引hour7/14特例、返回真实Year/Recurrence/Micro locator、
  nonsingular、state/config copy；DateLocator加Automatic/copy及unit动态metadata，
  AutoDateFormatter持有live locator引用，axis覆盖unit仍清decoy引用。
- config date_interval_multiples get/set与snapshot；Axis私有默认Auto对象/配置捕获、
  日期locator安装/getter copy、major/minor/defaultunit动态更新、nonsingular bounds，
  backend/svg/ranges在margin前应用。旧helpers保留。静态check 0errors，新增括号
  precedence warning待修（此外8条已有Ref），当前旧回归session80936运行中。

- session80936已结束，旧回归964/966；两个Concise默认3天范围现在按源选择12h，
  固定source独立生成确认labels为Jan-30/12:00/.../Feb-02，共享offset正常2024-Feb-02、
  倒置2024-Jan-30。已据实更新旧预期，没有改变Concise算法。
- 新generator执行原DateLocator/Auto/RRule/Year/Microsecond及ticker MultipleLocator/
  _Edge_integer，共94场景；ticker.py固定SHA256 49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad。
  初golden编译因positional pattern用..不合法，已改(_,_)，继续验证，无live。

- 当前94场景独立golden专项live session1390（D08-reference-test.log），无其他live。

- session1390已exit2，94原class参考85/94；9个失败均远期micro/point输入。固定源
  viewlim_to_dt先做20us修正，原MicrosecondLocator再date2num；新的Auto曾直接把原
  numeric bounds传旧locator，遗漏这一步。已抽出既有locator_ticks(已解码字段+clip
  bounds)共享，不改变公开旧DateLocator数值协议；Auto使用一次解码后的DateTime
  字段及date2num bounds，避免fractional epoch二次inverse。待golden复验。

- 94原class参考已94/94；远期micro端点修正复用ticks_for_dates后全部匹配。
  新增4直接DateTime选择（反向月末/不同offset/残差hour）、6nonsingular及两隔离
  epoch复用Auto+live formatter的8次连续选择参考，当前live session39361
  （D08-reference-test.log）；手写复制/配置/状态与axis/SVG测试待补。

- session39361已exit0，日期+两隔离epoch471/471（含104named source参考+8连续epoch
  子场景）。增加5对象、1config、4axis与1doc测试，当前统一专项live session99520。
  对象live引用、axis安装/getter隔离、表复制/验证、typed warning与rc捕获已覆盖，
  还需新增singleton/empty默认SVG、shared与显式Auto/pyplot端到端用例及最终验收。

- session99520 已结束 1080/1081，唯一失败为 NaN 经 min/max 丢弃；range_dates 在排序前
  验证非有限数，重跑 D08-narrow.log 已 1081/1081，通过后无 live session。

- 端到端初测554/557；141天源选择Day而非Month，测试zoom改182天。显式singleton
  SVG还暴露Axis生成刻度重新读取原始单点limits，已对主/次/date formatter单位统一
  应用nonsingular，新增backend白盒验证margin前±730天及explicit无margin，live46296。

- session46296 exit0，scene/pyplot/axis/backend 622/622，显式singleton问题修复已验证。
  新增3 scene、1 pyplot、1backend测试；README/能力表/计划/notice/两reference guide更新。
  接下来补manifest计数、info/fmt/接口审查与全目标验收，无live，无commit。

- 原参考 --check 通过（104 named + 8 epoch），info/fmt 通过（8已有warning，0error）。
  D08-interface.diff已审查：仅config对齐开关、Auto及typed参数/诊断、DateLocator适配/
  copy/nonsingular、Axis默认状态getter/范围入口；无意外移除，旧API保留。
  check-all live57441，全目标test已启动（ID见下一记录），无commit。

### D08 已验收（2026-10-22）

- 完整 AutoDateLocator：七频率、默认/typed maxticks、minticks、自定interval表、
  source signed relativedelta+duration 选择、multiples/原hour7/14特例、typed诊断，
  state/copy/as_locator动态引用、真实concrete locator和unit已接入。
- Axis默认自动对象、rc首次捕获、explicit tick_count、主次/时区/共享/scene/pyplot/SVG
  已验收；nonsingular在margin之前应用，显式singleton主次/formatter一致；数值轴保留。
- 94numeric+4direct+6nonsingular源class参考和2epoch共8连续选择通过，原94最初远期
  micro问题通过一次decode+重编码clip修复；新增5对象+1config+4axis+1doc+3scene+
  1pyplot+1backend=16，1120→1240（104+16）；两个旧Concise预期按原真实ticks更新。
- 接口仅增加config/Auto typed对象及适配/copy/nonsingular/Axis状态与范围入口；
  README/COMPATIBILITY/PLAN/notice/参考说明同步。最终info/fmt/源--check/check-all
  通过，四目标各1240/1240，8已有Ref warning，0error，session43068 exit0，无live。
- 保留D08-before/interface.diff和全部log；Git master无HEAD/无远端，无commit。
  完整迁移继续，工程估算约46%全目标/80%核心2D SVG不变。

## D09 执行顺序

- [x] D09-01 固定 DateConverter/ConciseDateConverter/切换配置与现有日期类型边界。
- [x] D09-02 typed converter/axisinfo、date.converter 默认选择与 scene/pyplot 接线。
- [x] D09-03 独立原对象参考、专项、文档/接口与四目标验收。

- 已读固定dates.py1732–1868。DateConverter.axisinfo用Auto+AutoFormatter、1970两天
  日期默认limits和空label，convert直接date2num，default_units首个值tzinfo；
  Concise构造先写flag再super()默认true覆盖，不能臆改为false传递。待独立参考冻结。

### D09 冻结契约

- 仅日期纵向converter；不提前引入全局动态Python units registry。DateConverter.new与
  ConciseDateConverter.new/as_converter、axisinfo(unit?)、convert/convert_value、
  default_units(flat Array[DateTime])与default_unit标量；复用date2num与DateTime保留zone。
  DateTime既有类型无naive标记，统一显式fixed offset（含0），无值仅空数组返回None；
  不新增naive/heterogeneous/NumPy ndarray标记，明确typed边界，不改已验收DateTime。
- DateAxisInfo封装major_locator/major_formatter/label空串/default_limits1970两DateTime；
  getters共享该info的live locator供formatter单位动态读取，copy显式隔离并重新绑定。
  构造/axisinfo不锁epoch，limits保持DateTime值而非提前数值化。
- Concise参数数组构造时copy，axisinfo时复用既有六项验证；保留固定source __init__
  super无参将interval_multiples改回true的行为（独立参考验证，不静默修上游bug）。
- config.date_converter auto/concise字符串，默认auto，未知值DataError/原子拒绝；
  default_date_converter每次读取current rc；Axis首次date启用捕获converter副本，
  clear_date清除。已有轴不随globalrc变化。显式set_date_format仍优先。
- Axis.set_date_converter安装typed配置、默认locator/formatter，复制隔离，尊重既有
  explicit locators/fixed ticks/labels/timezone/tick_count；Ax​​es/Figure x/y与pyplot转发。
  plot_date复用converter conversion/default_unit，首次日期空数组也启用date模式；
  后续series保持已有formatter/locators/units；保留现有整分offset getter路径兼容。
- 独立执行原DateConverter/ConciseDateConverter/_SwitchableDateConverter AST，仅
  ConversionInterface/AxisInfo与typed first-element容器stub；检查原配置覆盖细节、
  axisinfo tick/labels/defaultlimits、固定/规则zone、转换与empty，隔离epoch。
- D09-before已建立。当前无live，无阻塞，无commit；实现D09-02后验收D09-03。

- D09 typed converters/DateAxisInfo、config.date_converter和Axis/scene/pyplot默认接线
  已实现；check-wasm通过8已有warnings、0error。新generator复用D08固定ASTloader，
  cbook保留原unpack stub；AutoDateFormatter缺base format_ticks stub，待用原scalar
  dispatch生成label（Concise仍原format_ticks），当前参考尚未生成。epoch两个package
  已插入纯构造与helper调用，等待generator落盘。session51534见后续结果，无commit。

- generator现已生成44个named参考+4个epoch轴info子场景；原父类stub无format_ticks，
  Auto用原__call__逐值生成、Concise仍原format_ticks，get_offset Auto按原base空串。
  NY复用已有tzif_new_york fixture（避免date/tzdb测试反向依赖）。前次51534已结束
  缺helper编译失败，已解决。当前专项session86271（D09-reference.log），无commit。

- session86271 exit0，D09-reference.log 1129/1129；44 named源converter参考+4个隔离
  epoch子场景全部通过，含Concise false→true父类覆盖、live formatter、规则/秒级
  zone与默认limits。新增1config/4对象/2axis/3scene/1pyplot手写（11），专项82977。

- session82977 1138/1140，两个手写预期误用了旧axis行为：tick_labels已有范围会动态
  选择Hour，set_ticks会清除explicit locator；测试按现有协议分阶段验证，未改实现。
  session13909 exit0，1140/1140。追加checked doc与两个epoch的空转换纯构造验证；
  README/能力表/计划/notice/guide更新，待最后验收，无live。

- D09 info/fmt与原--check通过；D09-interface.diff仅新增typed converter/axisinfo、
  config模式和Axis/scene/pyplot转发，无意外改动/移除。全目标check35002见后续结果，
  全目标test已启动，session ID见下一记录；不修改live测试输入，无commit。

### D09 已验收（2026-10-22）

- typed DateConverter/ConciseDateConverter与generic adapter、DateAxisInfo的live绑定/
  explicitcopy重绑、首个日期规则zone或fixedseconds单位推断、scalar/flatarray转换、
  Gregorian defaultlimits构造纯净。保留固定Concise super覆盖flag=true的源细节。
- date.converter auto/concise的rc/get/set/snapshot/验证，Axis首次捕获/clear/显式默认
  替换、shared setters原子校验、scene/pyplot x/y和空plot_date日期初始化已接线；
  explicit locator/fixedlabels/units与后续series保留。无通用动态units registry声明。
- 原DateConverter/Concise/_Switchable AST：40axisinfo+4rc=44 named参考，2隔离epoch
  共4info子场景，构造+空转换在set_epoch前保持pure。11手写+1checked doc，1240→1296。
  专项1129、1140已通过；手写两处旧协议预期修正，不需要改实现。
- 最终info/fmt、原--check、check-all通过（8已有Ref warnings，0error）；四目标
  wasm/wasm-gc/js/native各1296/1296，session67885 exit0，无live。
- D09-interface.diff审查仅增加converters/axisinfo/rc与轴facade，无旧接口移除；
  README/COMPATIBILITY/MIGRATION_PLAN/THIRD_PARTY_NOTICES/新reference guide同步。
  Git仍master无提交无远端，D09-before与logs保留；整体估算仍46%/80%，整体目标继续。

## D10 执行顺序

- [x] D10-01 固定 portable C-locale strftime 指令、ISO/传统week边界与现有语义。
- [x] D10-02 复用 Gregorian 实现指令并接入formatter/axis/scene/pyplot既有链路。
- [x] D10-03 原formatter/CPython独立参考、专项、文档/接口与四目标验收。

- D09结束后已定向读取已有format_date、固定dates.py公开定义列表与CPython
  wrap_strftime。当前支持Y/y/m/d/H/M/S/f/z/Z/b/B/a/A/w/%%，未知保留，缺少
  常见12h/AMPM/yearday/week/ISOweek/C locale组合。下一步只冻结这个切片，
  不重启全项目盘点、不更改D09typed输入边界、不扩展动态locale/OS padding flags。

### D10 冻结契约

- 新增Python文档标准strftime指令中尚缺的11项：I/p（12h与AMPM）、j（三位年日）、
  U（周日起首周，之前00）/W（周一起首周，之前00）、u（ISO weekday 1–7）、
  G/V（ISO weekyear/周号）、c/x/X（C locale组合）。固定C英文、c日期空格补齐、
  x=%m/%d/%y、X=%H:%M:%S。G年四位padding与现有Y一致。沿用既有未知码/尾%保留。
- 私有calendar helper复用days_from_civil/civil_from_days/weekday，不新增public API，
  不重写rrule byweekno算法；只从本地DateTime字段计算，时区转换仍由既有formatter。
  Fixed/Concise/Auto/DateConverter/Axis/scene/pyplot共享format_date自然接入。
- 原DateFormatter.__call__调用num2date.strftime；固定dates.py SHA同D05–D09。
  参考CPython3.11.0 iso_week1_monday/date_isocalendar/wrap_strftime（已本地读），
  _datetimemodule.c SHA256 bf16f5f4c0fff97d03147c7d3a1c763fc233fa703ad180bdb96e9b40afc7ec6e。
- 独立参考执行原DateFormatter，C locale、固定原runtime Darwin Python3.12.14/
  NumPy2.3.5/dateutil2.9.0.post0，涵盖year1/9999、ISO跨年/53周、传统week00/53、
  闰/世纪年、AMPM邻域、规则/秒offset、本地跨日、TeX/epoch；另用原datetime.strftime
  在1–400完整146097日周期生成每年滚动摘要（Int64模1e9+7，31倍逐ASCII字节），
  Moon遍历相同Gregorian日期核对400摘要，并保留明确边界逐值golden防摘要弱证据。
- 不声称任意系统locale、padding flags/E/O/OS扩展或通用SVG TeX排版已经完成。
  D10-before已建，无live，无commit。下一步实现format指令与原formatter参考。

- format_calendar.mbt复用Gregorian整日算ISO Thursday/week1和年日/传统week，format.mbt
  新增11标准码与checked doc。generator执行原DateFormatter/Auto/Concise；首轮Concise
  None locator缺axis属性，改最小axis=None容器后生成成功，独立测试live98974。

- session98974 exit0，ticker/date 615/615，90 named原参考（87日期边界/clock/zone/TeX、
  1完整400年逐日oracle、Auto/Concise各1）和checked doc通过。遍历146097日、400个
  按年摘要匹配原datetime.strftime；private helper未发现差异。新增5手写端到端测试，
  两epoch formatter/helper与纯format_date检查，当前专项live60363（D10-narrow.log）。

- session60363 exit0，1231/1231，5手写端到端与2隔离epoch formatter子场景通过，
  UTC/local周跨界、秒offset、inversion、shared rc捕获、XML、unknown/%%与pyplot覆盖。
  README/能力表/计划/notice/参考指南同步；接下来info/fmt、--check、接口与四目标。

- D10 info/fmt与原generator --check通过；所有.mbti与D10-before相同，接口未变。
  check-all session56175结果见后续，全目标test已启动，ID待下一记录，无commit。

- check-all56175 exit0，104tasks，8已有warnings/0errors；全目标test live85799。

### D10 已验收（2026-10-22）

- format_date新增I/p/j/U/W/u/G/V/c/x/X，私有format_calendar复用既有Gregorian整日。
  12h/AMPM、年日、traditional00周与ISO weekyear/53周、本地日期与C组合输出齐备；
  Y/y/f/z/Z与未知码/%%/尾%既有协议保留。无新public API，所有.mbti与D10-before一致。
- 独立原DateFormatter逐值87+Auto/Concise各1+完整400年1=90named；逐日1–400共
  146097日、400按年摘要通过；两个隔离epoch子场景和5手写+1doc测试通过，1296→1392。
- 专项615、1231通过；最终info/fmt/源--check/check-all通过（8已有Ref warnings/0error），
  四目标各1392/1392，session85799 exit0，无live；source/runtime/padding区别及未支持
  locale/OS flags/扩展/通用TeX边界均记录。文档/能力表/计划/notice/参考指南同步。
- 无Git提交，无远端，D10-before与logs保留；整体迁移继续，46%/80%工程估算不变。

## D11 执行顺序

- [x] D11-01 固定 datestr2num/dateutil 默认parser、可复用clock/locale入口和独立参考（宿主契约见末尾）。
- [x] D11-02 词法分析、YMD归属、numeric/word时间/日期解析与default填充（仅内部组件验收）。
- [x] D11-03 timezone、weekday、错误/警告/无default时钟、scalar/flat数组公开接线。
- [x] D11-04 全量默认parser参考、专项、文档/接口和四目标验收。

- 已定向读取固定dates.py377–401：字符串dateutil.parser.parse(default)→date2num；
  显式default数组逐值parse/date2num；无default的空数组立即返回，不锁epoch；
  非空走np.vectorize默认parse再date2num。不能用现有ISO parse代替通用默认parser。
- 现有仅dateutil rr​​ule源/测试保留；bundled安装版本2.9.0.post0，parser/_parser.py
  58796 bytes，SHA ee494377289c92c401fd7825fb7500981c33098a2bd40219aa4948713e9d1fff；
  __init__.py 1766 bytes，SHA c1693a185bb14e98e8820086b6091c789a2d8b8a558e5e3f7c7417a4d39a4988。
  下一步获取固定源与原test_parser，按需只读相关段，先冻结时钟/本地zone平台契约。

### D11-01 定向证据与实施边界

- 固定dateutil2.9.0.post0原_parser.py、__init__.py和test_parser.py已保存，前两与bundled
  安装逐字节同SHA；tests SHA95b9f01f8d2f4091fea049f90f9ebc05991ccf0c3455144d50778a888ceeefb0。
- 已读_timelex、parserinfo默认英文表/年pivot、_ymd完整resolve、_parse默认分支与
  _parse_numeric_token/_build_naive/_build_tzaware。datestr2num只调用默认parse；
  fuzzy/dayfirst/yearfirst/tzinfos/自定义parserinfo不是此Matplotlib入口参数；内部YMD仍
  可保留通用flags验证。不能只实现ISO输入或固定默认年后声称完成。
- core/env.now四目标均返回Unix毫秒，已有当前日期source，无需新增x/time依赖。
  core API没有localtime；native/JS自动系统zone与Wasm host边界留D11-03，尚未冻结，
  不静默把宿主本地时区当UTC，也不改变已验收可选tzdb不进入基础date依赖的决定。
- D11-before已建。先D11-02a：原_timelex状态机（包括null/Unicode、decimal点逗号、
  字母/数字边界）和_ymd标签/century/could_be_day/resolve；仅private包内helpers，
  白盒原AST参考。Unicode分类以bundled CPython Unicode15.0.0分类生成精确区间，
  不以ASCII近似替代。公有datestr2num与完整parser仍未实现，D11不能验收。
- 当前无live，无阻塞，无Git提交。下一步实现lexer/YMD与独立原class白盒参考。

- 新parser_unicode/lex/ymd.mbt已落盘；Unicode15分类区间由CPython精确生成，词法
  状态/年标记/消歧复用Gregorian days_in_month。最初误用moon fmt -，已修为moonfmt -；
  LexState补Eq后check-wasm0error。private helpers尚无production caller，存在临时
  unused warnings，必须等完整parser接入消除，不把partial标为验收。
- generate_parser_foundation_reference执行固定_timelex/_ymd AST；默认原表所有字符串
  加Unicode/null/decimal边界，numeric消歧四flags与tagged/dayfeasibility。已生成，
  专项刚启动，live ID见下一记录，无commit。

- foundation session86486 exit0，805/805，189 named（131lex+16numeric分组2340组合+
  37tagged+5dayfeasibility）；unicode与AST脚本可复现。新增parser_fields/decimal/
  numeric/selection，精确正小数按Decimal28位half-even做%1和*60，compact14位日期
  避免提前Int32整型截断。当前check-wasm0error/14warnings（含WIP unused），待原_parse
  字段/Decimal参考。timezone算offset用Int64避免中间乘加overflow；尚未publicparser。

- fields session84067 exit0，989/989（新增184个原_parse字段参考），小数28位/Unicode/
  compact14位/GMT反号/AMPM与原字段全部匹配。新parser_build补default替换、只有缺失
  day才month-end clamp、weekday前移与numeric/UTC zone；hostlocal与warnings仍待D11-03。
- 原parse显式defaults参考生成3个默认值×184输入+规则zone/DSTfold场景。WB不能读取
  blackbox fixture和@date，已改WB专用同源TZif Bytes并去selfalias；新的ArrayView
  to_array弃用改to_owned。当前build专项54075（D11-build.log）结果见后续。

- build初次54075 exit2：993/994，唯一差异是default保留后侧fold，普通arithmetic
  总选earliest。新parser_replace_zone从default确切瞬时恢复fold，在target选相应
  later候选；原Gregorian/zone模型未改、weekday arithmetic仍复用原resetfold语义。
  重跑79987结果见后续。新helper不读epoch；D11 public/hostlocal/clock/warnings未完成。

- build session79987 exit0，994/994，5分组565个显式default原parse场景全部通过；
  修复default later-fold后源一致。info/fmt与四个generator --check通过，D11-foundation
  接口diff为空。四目标日期包测试23534结果见后续；整体D11未验收。
- 已应用并读取moonbit-c-binding技能（/Users/lampese/.codex/skills/moonbit/moonbit-c-binding/SKILL.md），
  为D11-03 native接口；后续C参数按borrow/owned、原语直接值传、C返回Bytes用moonbit_make_bytes，
  native-stub按文件target gating，不改变项目preferred_target=wasm/四目标决策；C实现后需native+ASAN。
- 新固定dateutil src/dateutil/tz/tz.py 62855bytes，SHA1149c474c7de4e15e263a978b21f7205a6d9eb7fcf3b3cb4d734ac87db619f5a。
  已读tzlocal201–326：std=-time.timezone/dst=-time.altzone/current names；不能简单用
  mktime择fold；naive_is_dst调用localtime(wall_unix_seconds+time.timezone).tm_isdst，
  再用wall-dst_saved的同查询检测ambiguous，fold0选DST，assign_tzname可改fold1匹配name。
  系统local名优先于显式offset（parser._build_tzaware原顺序），unknown名warn但保留default zone。
- D11-03下一具体动作：冻结内部host descriptor（std/dst offsets、两name、isdst查询、
  now local calendar）和native/JS/Wasm宿主约束及typed可注入context；core/env.now可复用，
  local日历默认必须为host local年月日的naive午夜（不能把now实际offset加到最终10am数值上）。
  原dateutil DEFAULTPARSER.info年pivot是构造时当前localyear，独立于default年份。
  不引入基础date→tzdb循环依赖/强制捆绑；Wasm host无localtime入口的边界要明确提供适配。
- 后续公开datestr2num的numeric oracle还必须覆盖带offset的year1/9999 UTC越界：原
  date2num内部astimezone可能Overflow，不能只用既有to_ordinal额外可表示范围认为通过。
  Scalar/array empty不锁epoch、未知TZ typed诊断、连续调用/copy/时钟与epoch均待验收。

- session23534 exit0，日期包四目标各994/994（新增378 named源参考，共2340YMD组合、
  131lexer、184字段及565default子场景）；无live。info/fmt通过8旧Ref+2临时unused
  warnings、0error，接口未变。两个unused根parser_select/parser_build_explicit将在
  D11-03 production入口接入后消除；不把内部测试替代完整D11/整体目标验收。

### D11 当前停点（必须从宿主接线继续，不重做survey）

- 生产新增文件：parser_unicode/lex/ymd/fields/decimal/numeric/selection/build.mbt；
  参考scripts generate_parser_unicode/foundation_reference/fields_reference/build_reference，
  private WB与四manifest；尚无public datestr2num，moon.mod/moon.pkg没有新增依赖或Cstub。
- 最新四目标仅ticker/date各994/994，整个项目的最近完整验收仍D10各1392。不得把两者
  混用。当前无live，无commit；两个private根unused仍在，完整public接线后消除。
- 下一步D11-01/03：冻结并实现最小内部host descriptor，core/env.now读Unixms，提供
  local civil date、std/dst seconds+names及dateutil tzlocal的isdst查询；typed context可
  显式注入clock与现有DateTimeZone，基础date保持不强制导入可选tzdb。native/JS/Wasm
  的宿主能力差别必须记入契约/测试，不能靠UTC假设把缺少的自动local能力藏掉。
  技能C-binding已读并已向用户说明，下一轮无需重复通知；C返回GC Bytes/原语即可，
  不需要长期handle/callback。用户决策preferred_target=wasm优先于技能示例native默认。
- 注意parser默认now只是host local年月日的naive午夜；无显式zone的字符串仍按UTC
  日历编码。tzlocal原算法依赖当前std/dst offset与names，不是历史gmtoff；不可简单
  mktime替代。控制TZ的独立参考要复用本地原tz.py/class和宿主time函数，包含fold名
  优先、GMT冬夏回退、unknown names保留default、UTC/numtags优先级与现在clock边界。

### D11-03 宿主与公开入口冻结契约

- 复用现有TZif-engine active_offset的is_dst和POSIX footer parser，core/env.now；
  x/fs0.4.46已有传递版本转为direct用于native/Wasm文件读取。JS读文件用guarded
  process.getBuiltinModule动态入口，避免把node:fs静态导入传给浏览器。基础date不导入tzdb。
  不新增自有C时间绑定，前一轮C技能setup/ASAN仅适用于实际新增绑定，本方案无新增Cstub。
- host按TZ/TZDIR查显式文件、系统zoneinfo或POSIX规则；TZ未设置读取/etc/localtime。
  不支持/不可读的host明确DateError并要求显式context，不将host local假装UTC。
  DateParserContext.from_tzif/from_posix/utc，clock是签名()->Int64 Unix毫秒可注入；
  可选tzdb另加parser_context(name)复用现有Bytes索引，浏览器无需系统文件。
- local descriptor按固定CPython3.12.14无HAVE_DECL_TZNAME分支：YEAR=31557600，
  floor(now_seconds/YEAR)*YEAR及+YEAR/2取raw offset/name，较小east offset为standard；
  按dateutil tzlocal用raw is_dst查询和std/dst当前offset，保留负DST/历史offset细节。
  names截9ASCII（C fallback），fixed无DST两name相同。descriptor在parser构造快照。
- DateStringParser.new(context?,reference_year?) 捕获当前host localyear pivot；parse时
  无default用clock当前local年月日的naive午夜。提供parse/parse_many/to_number/to_numbers、
  copy与warnings复制getter；DateParseWarning.UnknownTimezone为typed诊断（不打印）。
  default_date采用既有DateTime（统一显式offset，无naive/raw fixed fold位），保留规则fold。
- datestr2num scalar、datestrs2num flat-array可传default_date/parser；free默认parser懒建。
  无default非空数组保留原np.vectorize首元素probe额外parse（clock/警告次数）再全parse，
  最后统一date2num；有default逐parse/encode。空数组不建parser/不锁epoch。
- 数组mixed timezone原date2num的first-aware会将后续naive按host actual local解释；
  必须保留aware metadata，含gap fold0旧offset/fold1新offset及fold earliest/later选择。
  单值naive仍UTC日历编码；输入aware UTC超year1/9999时按原astimezone越界抛DateError。
- 新固定CPython3.12.14 Modules/timemodule.c SHA81ce33b3f784a9abae1663576424faabb9c584d84f36daa4c27d0e16195c76b0，
  已读init_timezone1795–1905。bundled Darwin HAVE_DECL_TZNAME=0/HAVE_ALTZONE=0，
  UTC/NY/Dublin/LordHowe/Kolkata的time descriptor已核实。整个D11尚未验收，无commit。

- internal/date_host目标文件读层、DateParserContext（TZif/POSIX/system/UTC+注入msclock）、
  local snapshot/isdst/实际naive本地映射、DateStringParser和scalar/flat datestr(s)2num
  已落盘；普通旧tzif_timezone只抽出shared date_tzif_data验证，不改已验收限制。
  修复Moon pub extend/Option默认/函数field调用语法与新deprecated/reserved warnings。
  原build WB5组565场景改为调用真正DateStringParser.parse，移除旧test-only production
  parser_build_explicit根；全目标日期测试session83256结果见后续。无commit。

- session83256 exit0，日期包四目标994/994；public typed上下文/解析器/入口已静态通过，
  未出现新warnings。新增可选tzdb.parser_context(name,clock?)复用同一Bytes索引，
  timezone(name)提取shared zone_index且保留原缓存/文档；base不引入tzdb循环依赖。
- 新generate_string_parser_reference执行固定datestr2num+原parser、模拟local now，
  用固定IANA生产Bytes与控制TZ，涵盖UTC/NY/Paris/Dublin/LordHowe/Kolkata、NumPy首probe/
  clock/unknown warning重复、mixed-aware、year边界；当前72642（D11-string-reference.log）。

- 完整helper原参考session72642 exit0，tzdb478/478；新增POSIX±14/12与秒offset、
  跨年clock序列后原参考617 named。新增4API/copy/clock/default手写和2host
  WB测试，当前全目标日期+tzdb79640（D11-public-all.log），尚未验收。

- session79640因测试对Array[DateTime]使用assert_eq要求额外Eq/Debug编译失败；改is_empty
  判断，host回调用arrow消除新effect warning，TZ fixture改绝对路径后重跑50519。
  617完整helper named参考已生成，含三个POSIX contexts与local跨年clock序列，待50519结果。

- session31730已结束：Wasm/WasmGC/native1628全部通过，JS1627/1628仅host文件失败ABI：
  JS None应由MoonOption构造，不能直接从FFI返回null。file_js改Bytes空sentinel+Moon
  Option，新增JS-only无process嵌入测试（guarded Node lookup无静态import），重跑8756。
- 新增2独立epoch错误顺序package，2400/fraction各3原helper子场景，scene shared/DST
  fold SVG与pyplot串接；新专项93582，结果见下一记录，继续doc/最终验收，无commit。

- session44037 exit0，含完整617helper参考、hand/host/browser、epoch顺序/两个customepoch
  与scene/pyplot的专项四目标2198/2198（JS多1项=2199/2199）。JS Option ABI改Bytes
  sentinel后测试通过，无新warning，仅8旧Ref；无live。
- 为覆盖CPython HAVE_DECL_TZNAME分支的实际宿主描述符差别，context加with_local_info
  (std_seconds,dst_seconds,[std_name,dst_name])，不读clock/epoch且不改raw规则；默认仍固定
  sampling profile。新增原time全局descriptor覆盖Dublin(IST+1/GMT0)参考，避免仅支持
  单一CPython编译profile；D11仍待文档/接口和最终全部package验收。

- profile30668 exit0，tzdb812/812（801完整helper reference），新增half-hour与负DST
  mixed-gap/fold、POSIX半小时DST alias/不同profile source验证均通过。补2 checked docs、
  with_local_info名称副本/验证hand test、README/能力表/计划/notice/依赖/参考指南。
- free helper增加date_parse_warnings()复制getter，避免默认实例typed未知TZ诊断无路
  可读；getter/空输入不建parser不读epoch，增加受控TZ测试。接下来最终info/fmt、
  全部5generator --check、接口审查、check-all与整项目四目标验收，无live，无commit。

- D11最终info/fmt通过8条已有Ref warnings/0error；5个generator --check与check-all
  session41644/29597结果见后续，interface.diff审查仅新增DateParserContext/
  DateStringParser/Warning/free helpers、内部Bytes文件读层、tzdb context，以及2空
  integration接口；无旧API移除，无第三方类型泄漏。整项目test-all已启动，ID见后续。

### D11 已验收（2026-10-23）

- 通用默认dateutil语法：精确Unicode15词法/YMD消歧/英文字段/compact/AMPM/Decimal28
  时间/default填充/月末/weekday/继承fold；public DateStringParser、DateParserContext、
  datestr2num/datestrs2num和默认诊断getter接线。DateTime既有类型/算术/epoch模型保留。
- context从TZif/POSIX/UTC/system构造，可注入signed-ms clock，标准sampling snapshot或
  with_local_info明确descriptor；tzlocal原优先级/DST/历史/负DST/half-hour、NumPy首probe/
  mixed-aware实际hostlocal转换、未知TZtyped诊断/复制/clock/epoch顺序、UTC越界均验证。
- 五个原生成器--check通过：189 foundation named（含2340 YMD组合）+184fields+
  5default组（565子场景）+801完整Matplotlib helper=1179 named；2自定义epoch共6子场景。
  14 hand/doc=1193新增，1392→2585；JS-only无Node测试另1=2586。测试计数不等于API覆盖率。
- host read复用direct moonbitlang/x0.4.46（原有传递版本），内部目标文件gating，JS
  guarded builtin lookup、无静态node:fs导入；未写自有Cstub。JS None ABI用Moon Option
  修正；clock/tzif/context构造保持无epoch读取。可选tzdb.parser_context复用原Bytes。
- 两独立epoch错误package、scene shared/inverted/DST SVG与pyplot使用链路通过。
  README/COMPATIBILITY/PLAN/THIRD_PARTY_NOTICES/DEPENDENCIES/tzdb说明/新参考指南同步；
  typed String/flat-array、非naive defaults、lazy默认parser、宿主文件能力/采样profile等
  边界独立记录，未将Python动态/多维/掩码容器声称迁移完成。
- 最终info/fmt、5个原--check、check-all157tasks通过（8已有Ref warnings/0error）。
  session92935 exit0：全项目wasm/wasm-gc/native各2585/2585，JS2586/2586，无live。
  .mbti审查仅新parser/context/warning/helpers、内部Bytes读接口与tzdb context，旧API无移除，
  第三方类型不暴露。Git仍master无HEAD无远端，无commit；D11-before与logs保留。
- 整体目标继续，约46%全目标/80%核心二维SVG工程估算不变，不以日期参考数量替代覆盖率。

## D12 执行顺序

- [x] D12-01 固定 _get_tzinfo/timezone rc、omitted/显式时区与默认捕获时机。
- [x] D12-02 实现默认时区解析与formatter/locator/num2date/轴接线，保留兼容helper。
- [x] D12-03 独立固定源参考、host/context边界、文档/接口和四目标验收。

- 这是D11之后的下一项定向日期能力；尚未实现/冻结接口。先读固定dates.py208–254，
  以及Rc timezone默认与现有DateFormatter/Auto/Concise/DateLocator/num2date构造。
- 保留既有架构与optional tzdb；D11新增内部host/TZif/POSIX能力可复用。不要把所有
  内部offset默认0全局替换为rc时区，必须核实Python省略值与显式UTC/项目legacy helper
  的区别，避免破坏已验收整数calendar/recurrence与epoch协议。

### D12-01 契约已冻结（2026-10-23）

- _get_tzinfo采用timezone rc，默认UTC；rcsetup固定SHA a052eac4af21ce8cdb58ee49c3ab952af4c2ff5e18f36cc8b741793fa79b5f59，仅validate_string，非法名称延后解析失败。
- num2date每次解析默认；DateFormatter/DateLocator构造捕获。AutoDateFormatter构造先建
  DateFormatter校验一次，但文本scaled分支每次用原tz重新构造；callback不解析tz。
  Concise构造不解析，scalar/batch/short调用解析原tz。不能把所有formatter统称捕获。
- Python字符串gettz使用TZif第一32位兼容区块、首non-DST initial、最后standard兜底，
  不使用64位区块/footer；已有显式tzif_timezone与optional tzdb完整IANA语义继续保留。
  字符串POSIX复用已有engine，GMT/UTC符号特例须在文件搜索后应用。
- Moon接口采用tz?:String / timezone?:DateTimeZone（互斥），get_timezone省略读rc；
  num2date保留显式offset0可辨识，from_ordinal/format_date_ticks/date_tick_values维持UTC兼容。
  日期构造/字符串parser本身不读取timezone rc。基础包host查询、浏览器可注册指定TZif名称；
  optional tzdb提供显式注册，不强制导入整库；注册名称走dateutil32位profile并独立说明。
- DateFormatter/AutoDateFormatter构造新增checked错误，Concise保持原有checked接口；
  invalid默认不应abort轴，要映射DataError并保持原轴状态。
- D12-before已保存config/date/axis及文档快照；无live，无commit。下一步实现resolver/config，
  然后ctor/动态formatter与轴接线，再固定源oracle。

### D12-02 首轮实现（待参考与验收）

- config新增timezone字符串rc/快照/reset，未在setter提前校验名称。
- default_timezone/dateutil_tzif复用host Bytes与TZif parser，32-bit widening/standard
  兜底、注册/注销/host路径/POSIX GMT-UTC特例；optional tzdb显式register单一名称。
- num2date省略读rc、显式offset0可区分；DateFormatter checked捕获；Auto checked构造
  校验、文本动态解析，Concise延迟解析；with_offset/with_timezone显式绑定。
- 公共calendar/Auto locators捕获默认；automatic_selection内部显式UTC再绑定已捕获zone，
  避免后来坏rc破坏已有locator。rrule_locator显式dtstart扩展保留原边界，无dtstart读rc。
- axis启用准备info再写状态，DateError映射DataError；date_timezone_is_default区分
  捕获默认与显式覆盖，防止强制冻结动态formatter/覆盖独立locator；显式offset/zone可绕过坏rc。
- 原callback固定UTC helper改用try!，tzif测试helper传播checked错误；JS全项目check通过，
  仍仅8已有Ref warning/0error。现有JS test-all状态见后续输出；未验收当前切片。
- 下一步原dates.py/_get_tzinfo/gettz独立oracle（含动态切换、32/64差异、POSIX符号）、
  构造/错误/epoch顺序、scene/pyplot、无Node注册，修复实际差异后文档/info/四目标。

- existing-js session51839已exit2：2585/2586，唯一失败为legacy显式with_offset locator
  标签被误当默认。已修复：普通ctor现在带captured zone，timezone=None识别显式fixed
  扩展，继续同步其默认formatter。接下来新独立参考验证；当前无live。

- 独立timezone generator初版21 named（每name13UTC样本、三种捕获/动态切换、8locator
  ctor）接原_get_tzinfo，不替换成手写解析；固定tz.py/rcsetup/rc源sha、隔离TZPATHS。
- 原oracle发现大DST偏移的tzstr月底/午夜语义不同于POSIX footer：dateutil先转标准时间
  再relativedelta weekday。新增私有dateutil_footer profile与按需transition evaluator，
  IANA完整footer/D11context保持原engine路径；未展开1..9999全表。
- 补固定dateutil tz/_common.py SHA720cc34c036c397bc473ce9c605efb12c962b9269bf0fbb0a6c979f9b5f7fd2e、
  relativedelta.py SHA218fe6825323a196d87ebbe5a1363671ed366a25633c892265faa03536517ee0；与
  固定tag和运行时逐字节相同。POSIX名称offset单独遵守H/HH/HHMM/H:MM（不含offset秒），
  engine扩展clock-basis不当作dateutil语法。后续扩充分界/Julian/optional slim参考。
- session39000已exit0；oracle-js当前session47317结果见后续输出；未通过整切片验收。

### D12-02 完成，D12-03 最终验收中

- 32原named source参考：4fat+17POSIX（17个UTC样本/组、三种num2date/formatter入口），
  3捕获/动态切换、8locator构造一组、非法输入一组、6生产slim组；已验证第一兼容区块
  和完整IANA刻意区别。M-hyphen/HHMM/seconds/J/yearday/leap、大DST跨午夜profile均通过。
- hand覆盖config快照/重置、显式UTC与offset0/typed互斥、错误与callback延迟、注册原子性、
  epoch2000、host绝对/colon路径与TZ、无Node注册/POSIX、轴原子DataError/default动态
  与explicit覆盖、scene共享倒置/pyplot SVG。JS整项目98942 exit0：2632/2632；
  之后只清理等价构造block、priv内部flag与增加checked ctor doc，待最终all统计。
- README/COMPATIBILITY/PLAN/NOTICES/DEPENDENCIES/tzdb说明与testdata/timezone_README.md
  同步；新的checked DateFormatter/Auto ctor、String和typed参数、32-bit named profile、
  显式dtstart legacy扩展与未覆盖Windows/bundle/alias/deprecated语法均独立写明。
- moon info/fmt通过，8已有warning/0error；D12 timezone --check（32named）和修改过的
  D07 auto --check通过；check-all session4700 exit0（privflag最后收紧后info亦通过）。
  D12-interface.diff已审：config getter/setter、tz/get/register、ctor labels与2个checked
  error变更；轴新flag已priv，无第三方类型暴露，无旧API移除；新integration接口为空。
- 四目标全项目test-all当前live session见后续；该进程完成前不再修改测试输入。
  下一步确认exit与每目标计数，再最终checkall/文档标记验收与选取下一未迁移日期入口；无commit。

- D12最终全项目test-all live session=7296，日志D12-test-all.log。其余已记录session均已终止；
  不要再次轮询旧ID。当前禁止改测试输入直到7296完成。

- 最终首轮7296已exit0：wasm/wasm-gc/native各2631/2631，JS2633/2633；check-all亦exit0。
  尚未标记验收：最后接线审查发现scene共享converter全局预检绕过显式unit判断，已修复。
- 新Axis::validate_date_converter(converter?)对照该轴真实unit作只读预检，供shared group
  先验证后写入。默认/format/major/minor共享入口按各自是否会构造默认参数接预检，
  防止混合显式与默认轴遇到坏rc时部分更新；Axis私有default标记不暴露。
- scene新增显式unit+坏rc成功、混合group失败原子保持与typed plot_date推断UTC回归。
  首次手测期望误用了ConciseConverter的interval_multiples=false（固定源本来强制true），
  测试已改用AutoConverter(false)，未改已验收Concise语义。
- 专项scene JS session50731结果见后续；补改后还需info/fmt/接口diff/checkall/testall，
  不能沿用7296作为当前状态的最终验收。无commit。

- scene专项50731 exit0：530/530。补改后info/fmt与check-all（76tasks、8已有warning）
  已通过；两个源--check再次通过。接口仅增加一个跨包共享预检方法
  Axis::validate_date_converter(converter?)，新内部flag保持priv，其余diff与前述一致。
- 最终test-all重新启动，live ID见后续；旧7296/50731已结束，不再轮询。此后不改测试输入。

- 当前唯一live session=34665（D12最终test-all）。旧check/info/专项全部exit0；无commit。

### D12 已验收（2026-10-23）

- rc/config/num2date/formatter/locator/converter、DateTimeZone私有dateutil profile与
  host/registration/optional tzdb接线完成；默认UTC与legacy UTC helpers保留。
  普通DateFormatter与locator捕获，Auto文本/Concise按原None/string动态解析，显式对象绑定。
  原timezone rc setter仅存String，两个原nonraising构造改checked错误，文档明确接口变更。
- 32独立source named参考（21 conversion、3动态switch、1 concrete-locator组、
  1错误组、6 production-slim组），conversion每组17UTC样本；不以子断言数量充当API覆盖率。
  分别验证dateutil第一32位/last-standard profile与完整IANA64位/footer不同语义；
  GNU offset/GMT/UTC、J/dayyear/leap、M-hyphen/HHMM/seconds、大DST跨午夜weekday顺序通过。
- 15 hand/doc named新增，合计原32+hand/doc15=47：2585→2632。JS额外无Node测试2个。
  配置/缓存替换原子性、显式单位坏rc绕过、callback/constructor/error/epoch顺序、hostfile、
  shared混合default/explicit group预检、typed plot_date、倒置SVG与pyplot均验证。
- 最终info/fmt、timezone与修改D07两个源--check、check-all通过（8已有Ref warnings，0error）。
  最终test-all session34665 exit0：wasm/wasm-gc/native各2632/2632，JS2634/2634。
  原7296是补共享预检之前基线，最终以34665及D12-test-all.log为准。当前无live。
- interface.diff审查：config timezone getter/setter/snapshot、get/register/unregister，
  optional tzdb register、各ctor tz/typed labels与两个checked错误、Axis只读共享预检。
  Axis内部flag已priv，无第三方类型泄漏；新integration/timezone_epoch公开接口为空。
- 主要改动：config/timezone、ticker/date/default_timezone/dateutil_tzif/dateutil_posix及
  ordinal/formatter/Auto/Concise/locator/converter、scene/axis和共享date入口、tzdb catalogue；
  新reference generator/JSON/base+tzdb断言、config/date/host/browser/axis/scene/pyplot/epoch测试；
  README/COMPATIBILITY/PLAN/DEPENDENCIES/NOTICES/tzdb说明/参考指南同步。
- 能力边界：Unix host文件和GNU TZ、显式注册；Windows registry/dateutil bundle/host缩写
  兜底、弃用numeric-comma语法等仍未覆盖；全IANA能力仍由显式完整zone路径提供。
  DateTime无naive标记、legacy explicit dtstart扩展等既有类型决定不改变。
- Git核实master无HEAD无远端，无commit。整体目标继续，工程估算仍约46%/80%。

## D13 执行顺序

- [x] D13-01 固定relativedelta public契约与第一版typed边界，区别绝对字段替换/相对年月日时间、
  weekday nth、leapdays/yearday与normalized；不要把TimeDelta实数秒运算当日历月运算。
- [x] D13-02 按冻结范围接DateTime日历相对运算，复用现有Gregorian/时区墙钟/epoch模型。
- [x] D13-03 固定原源参考、文档/接口与目标验证，typed范围已验收，Python动态协议边界保留。

- 根据固定dates.__all__，公开relativedelta仍无typed对应，是下一条具体日期接入缺口。
  已固定源 src/dateutil/relativedelta.py SHA218fe6825323a196d87ebbe5a1363671ed366a25633c892265faa03536517ee0，
  与2.9.0.post0 tag/运行时逐字节相同。尚未选定新接口名称或字段类型；先读相关源，建D13-before再写。

### D13-01 typed契约已冻结，进入实现

- full typed RelativeDelta路线不缩成整数月helper：相对years/months用Int64，其余days/
  hours/minutes/seconds/microseconds/leapdays用有限Double，绝对字段Int32?；years/months
  超Int64/非有限值为类型范围错误。yearday/nlyearday遵守truthiness/优先级/Dec32/leapdays转换。
  ctor保留0和非法绝对字段直到应用时的源验证点（year/month/day=0在应用时fallback）。
- RelativeWeekday保存weekday Int32与nth Int32?，源weekday对象允许任意index；delta直接
  weekday整数参数限制-7..6按Python tuple索引；与on_weekday对象参数互斥。None/0/1的
  source Delta Eq等价规则须区别于weekday自身Eq。提供mo/tu/we/th/fr/sa/su只读值和with_nth。
- constructor按源_fix依次microseconds→seconds→minutes→hours→days、months→years，
  不把微秒时间简单合成一个Double。保留混合符号和分数，不在ctor调用normalized。
- D13-02持续范围包括DateTime应用/减法、两个日期between、normalized、delta组合/与
  TimeDelta组合、neg/abs/scale/divide/is_zero/Eq与weeks setter。当前先实现constructor/
  weekday/getters与独立源参考；这只是实现步骤，不是重定义切片完成标准。
- DateTime应用顺序绝对year+relativeyear→month→clampday→绝对时间→墙钟timedelta→weekday；
  即使零duration也遵守原fold重置。复用现有rulezone resolve_arithmetic_local，不用ordinal算。
- 后续归一化十进制round与混合float timedelta累积须独立核实CPython，不能以简单乘除近似。
- D13-before已保存；本地git仍无HEAD/commit，无live。下一步写RelativeWeekday/Delta ctor、
  搭固定源生成器，构造验证后接应用及完整对象运算。上一回合D12是真实进展，整体goal继续。

### D13 constructor/weekday 首轮实现

- 新relative_weekday.mbt：private不可变对象、mo..su、getter/with_nth与对象自身精确Eq/Debug。
- 新relative_delta.mbt：完整typed ctor字段、Yday优先/转换、浮点CPython正数divmod carry
  顺序、Int64年月checked相加、getter/weeks/has_time/Debug。保存绝对0/非法值延迟应用。
- 新固定源generator/JSON/Moon断言：155 constructor named +1非法输入组，覆盖正负carry
  临界nextafter、分数、混合符号、Int64边界、yearday负/0/366优先级、weekday对象/索引。
  _common.py SHAefbc34cb2b64af19586d29fefa50d53d431a6d45d147d237941bffbd0454a946，
  原tag与运行时逐字节相同；整个原relativedelta模块执行，没有用手写模型生成参考。
- constructor静态JS检查通过（只有config原Ref warning）。新hand测试typed finite/溢出/
  互斥与weekday精确Eq。目标包四目标test当前live ID见后续；未标记D13完成。
- 下一项继续DateTime应用、CPython混合float duration与normalized精确round，之后between/
  完整对象运算/Eq/文档/整项目验收。不能把constructor参考数当完整relativedelta覆盖率。

- constructor四目标包测试85213已exit0：wasm/wasm-gc/native各2012/2012，JS2014/2014。
- 新relative_apply.mbt接DateTime::add_relative_delta：绝对字段/source month单次回绕/
  月末clamp/relative时间/weekday顺序、固定abbr与原rulezone恢复。时间分量按CPython
  us→seconds→minutes→hours→days分拆integer/fraction，最后round按whole奇偶；不能用
  leftover+parity后舍入（在0.5前nextafter会丢精度），改为原fraction与whole+floor奇偶。
- 新generate_relative_apply_reference.py/JSON/Moon断言：100 named×12基日期=1200
  observations，覆盖year1/9999、monthend/leap、零绝对fallback/非法绝对补偿、微秒ties/
  mixed floats、巨量leapdays抵消、NY/LordHowe gap/fold/2400future与overflow。
  JS目标包test live见后续。应用generator还需补运行时tzstr/fixture sha验证再验收。
- 仍未实现normalized/between/完整对象运算/Eq/weeks setter；D13整体未完成。无commit。

- application首轮JS6120已exit2，2113/2114：reference用现代NY tzstr但Moon全IANA，
  绝对跳到year1时source=-18000/Moon正确LMT=-17762，属于oracle时区输入不等价。
  已修参考：主NY/LH使用dateutil.tzfile同fat bytes +Moon注册32-bit profile，future补
  同POSIX名字对象；不改正确历史实现。100 named现为1300 observations，JS17317 exit0：2114/2114。
- 应用generator已补CPython3.12.14、tz.py/tzrange/fixture SHA验证，CPython datetime源
  固定SHAcd11d1f38e9e637c7404c98ff45e355053b7f7e8251015d58a4c1f17e6d5f8a8。
  constructor和application两源--check通过；info/fmt/check-all65962均exit0，8已有warning。
- D13-interface.diff仅新增RelativeDelta/RelativeWeekday private结构及getter/构造/DateTime应用、
  七个weekday值，未暴露foreign类型，无旧API变化。README/NOTICES明确完整对象仍在迁移。
- 新完整项目四目标test live见后续（D13-step-test-all.log）；当前禁止再改测试输入。
  该验收仅支撑已实现constructor/application，D13-02/03仍未完成，goal继续。

### D13 当前实现步骤已验证（完整切片未完成）

- 最终73169 exit0：全项目wasm/wasm-gc/native各2889/2889，JS2891/2891。
  257新增named=155ctor+1错误组+100应用+1 hand；未以1300 observations充当API覆盖率。
  info/fmt、全目标check通过（8已有Ref warnings/0error），两个独立源generator --check通过。
- 新文件relative_weekday.mbt、relative_delta.mbt、relative_apply.mbt、relative_delta_test.mbt、
  两个源generator/JSON/生成test以及testdata/relative_delta_README.md。README/NOTICES已明确
  部分实现状态，接口diff仅新增公开typed对象/weekday值/DateTime方法，无旧API移除或foreign泄漏。
- CPython累计浮点时间逻辑按us→second→minute→hour→day分拆，最后半偶舍入看exact whole；
  readonly日期算术不读epoch/rc。源时区参考已修为相同fat/tzstr profile，保留IANA真实LMT。
- 下一项normalized：源码要求hours round11位、minutes10位、seconds8位、microseconds整数。
  现有round_even_to_int64只适用小范围0位，不能用Double乘10^n近似。可复用标准库
  moonbitlang/core/bigint（from_uint64/shl/div/mod/to_string）和core/string.parse_double，
  Double.reinterpret_as_uint64拆精确mantissa/exponent；先核对源再实现/独立临界参考。
- between后续须保留Python比较/差值的同tzinfo对象墙钟语义与不同tzinfo瞬时语义；
  Moon builtin physical_equal存在，DateTimeZone结构为immutable handle，需参考验证身份路径。
- normalized/between/delta组合/TimeDelta组合/neg/abs/scale/divide/is_zero/Eq/weeks setter
  都仍未完成；D13-02/03不打勾，整体目标继续。当前无live，无commit。

### D13 normalized 实现与首轮验证

- 读取固定CPython3.12.14 floatobject.c SHA d558f168de7ec864b64ffad7ee2b056bda4efca1ee68ca690189354b893ccc76，
  正常配置使用dtoa decimal→strtod，非简单Double乘10^n后round。
- 新relative_normalize.mbt按binary64 mantissa/exponent转标准库BigInt有理数，十进制量子
  半偶舍入后经core/string.parse_double转换；复用标准库bigint/string，无新增外部依赖。
  normalized按原11/10/8/0级联，保留absolute/leapdays/weekday；不读epoch/rc。
- 新原normalized generator/JSON/黑盒和白盒参考：320 normalized named、4组3431 binary64
  round observations（含near-tie/nextafter/subnormal/负零/maxdouble/随机位形），按原round位比较。
- 初始JS静态检查通过（只有config已有Ref warning），JS目标包test session28133结果见后续。
  normalized验证后继续between和对象完整运算；D13尚未完成，无commit。

- normalized JS28133 exit0：2438/2438，320对象+4decimal组新增验证通过。
- 新relative_between.mbt，183固定原差值/reconstruction案例（UTC边界/monthend/seconds
  offset、NY/LH同一/不同对象/UTC mix、fold与随机日期），JS67218 exit0：2621/2621。
  已验证physical_equal的zone identity路径，无ordinal/epoch读取。
- relative_operations.mbt实现add/subtract/TimeDelta组合/neg/abs/with_weeks/is_zero/Eq/
  datetime减法及scale/divide（后续原参考待跑）。Scale独立truncate各字段并用BigInt exact
  carry再暴露Double days，leapdays/absolute/weekday保持；加减先月carry再检查Int64years，
  防止中间years溢出但月归一后可表示的组合被过早拒绝。
- 仍待完整原对象运算参考和所有目标验收/文档同步。无live，无commit。

- 对象运算713原named（add/sub、TimeDelta、unary、weeks、scale/div、Eq/zero/datetime减法），
  单独Eq组144 observations；JS79321 exit0：3334/3334。Int64正/负边界由month carry
  抵消中间year越界、scale1.1后month carry救回Max均原参考覆盖并通过。
- 新readonly operations hand与integration/relative_epoch证明全部相对日期操作在坏rc下
  不锁epoch，transition gap/between亦无数值转换；scene shared倒置月末SVG新测试。
  整项目JS test session75298结果见后续。D13实现范围已齐，待文档/源check/接口/四目标验收。

- integration JS75298 exit0：全项目4114/4114；五个typed对象路径实现完成。
  新增normalized checked doc后待最终统计。README/COMPATIBILITY/PLAN/NOTICES/DEPENDENCIES/
  参考指南已更新；明确Int64/finite Double、immutable与未迁移Python动态协议边界。
  D13-02实现打勾，D13-03验收仍未完成。下一步源--check、info/fmt/interface/checkall/testall。

### D13 最终验收中

- info/fmt通过，8已有Ref warnings/0error；check-all31854 exit0（123tasks），五个源
  --check session30398全部exit0：156ctor、100apply(1300)、320normal+4round(3431)、
  183between、713operations(Eq组144 observations)。命名/子观测不等于API覆盖率。
- D13-interface.diff审查仅RelativeDelta/Weekday只读typed结构/方法、weekday值、DateTime
  加减方法及Eq，无旧API移除、无BigInt/foreign类型泄漏；relative_epoch新接口空。
- 最终整项目test-all已启动，live ID见后续。该进程完成前不再改测试输入；
  下一步确认每目标计数与exit，再标记D13验收并准备下一public日期能力rrulewrapper契约。
- 无commit，goal整体继续，不以D13验收声明全Matplotlib目标完成。

### D13 已验收（2026-10-23）

- RelativeWeekday只读值/构造/with_nth/Eq与mo..su；RelativeDelta绝对/相对字段、
  year-day优先转换、源_fix/carry/getters/weeks/has_time、DateTime加减、精确normalized、
  between同/异zone handle语义、add/sub/TimeDelta/neg/abs/scale/divide/zero/Eq/weeks copy齐备。
- 浮点duration复用现有微秒时长/墙钟模型；decimalRound用core BigInt+string精确量子舍入，
  no先乘10^n伪tie；scale中间int carry及月carry恢复年份边界精确，归一后检查typed范围。
  没有引入新外部依赖、自有C、Python运行时需求或新的日期对象模型。
- 五源generator --check（30398 exit0）：156ctor +100apply(1300 observations)+
  320normal+4round(3431 binary64 observations)+183between+713operations(Eq组144)=1476 named。
  2 hand+1 epoch package+1 shared/inverted SVG+1 checked doc=5，共1481新增；2632→4113。
  数量是验证证据，不是API覆盖率。完整原source/hash/fixture/profile范围见参考指南。
- 最终info/fmt、check-all31854 exit0（123tasks，8已有Ref warnings/0error），
  全项目test-all44872 exit0：wasm/wasm-gc/native各4113/4113，JS4115/4115。当前无live。
  D13-test-all/check-all/info/fmt/interface.diff与D13-before保留，旧ID不再轮询。
- .mbti审查仅新typed对象/weekday值/DateTime方法/Eq，无旧API变化、foreign或BigInt类型泄漏；
  integration/relative_epoch接口为空。README/COMPATIBILITY/PLAN/DEPENDENCIES/NOTICES与
  testdata/relative_delta_README.md、5组参考JSON/测试同步。许可说明为行为rewrite，无C分发。
- 类型边界：Int64相对年月、有限Double日/时间/leapdays、Int32绝对/weekday、年1..9999；
  不宣称迁移Python任意精度整数对象、date-only/naive动态混合、任意字段突变、反射/序列化协议。
  immutable weeks方法与源setter语义对应，Debug遵循Moon约定；显示rc/epoch无关已独立验证。
- Git仍master无HEAD/remote，无commit。整体目标继续，约46%全目标/80%核心2D SVG工程估算不变。

## D14 执行顺序

- [x] D14-01 固定公开rrulewrapper的timezone推断、dtstart/until规范化、set与查询代理契约。
- [x] D14-02 按冻结typed范围复用RRule/DateTime/现有时区与clock能力实现wrapper和locator接线。
- [x] D14-03 独立固定源参考、复制/更新/时区/epoch边界、文档/接口与四目标验收。

- dates.__all__公开rrulewrapper目前尚无命名typed对应，是下一个定向入口；原class在
  固定dates.py943–1064（SHAfb8d673fbc57c2499f2dd138c87c6c9520a59b38b60b01a6d59d5eb6540ef233）。
  D14已冻结并有before快照，当前继续named locator与adapter，尚未验收。

### D14-01 契约已冻结（2026-10-23）

- Wrapper必须使用naive墙钟core recurrence，再给输出附tzinfo：gap保留imaginary post-gap
  offset，fold只一份fold0，UTC可能重复/不排序；已有RRule skip-gap/双fold扩展保持独立。
- 新RRuleDateTime只在wrapper边界显式标记naive/aware，DateTime既有始终aware模型不改。
  aware保留原zone handle或精确fixed snapshot；from_local提供dateutil attach/fold选择。
- RRuleWrapper保存explicit base timezone、raw construct、effective timezone与old/new core；
  构造/每set按源把aware dtstart/until转base并去时区；infer tz不成为base，后续set若
  dtstart已naive则effective tz重置None。Set先写construct，normalize成功后写tz，再建core；
  失败时保留相应阶段的部分状态，不能改成原子rollback。
- dtstart可省略，每次需默认时从host-local clock截整秒（不是base zone now），复用D11
  DateParserContext并可显式注入；explicit dtstart不读clock/host。构造microseconds清零，
  until原微秒保留。count<=0为空规则。interval/selector沿用typed有效域与100000 eager上限。
- after/before无匹配：effective tz Some时源attach(None)会抛错；tz None返回None。
  无tz的aware query仅在实际比较时出错（空规则不会）；between先比较before再after，
  xafter count0也先比较首个匹配候选，不能提前全局拒绝或一律返回空。
- Wrapper查询必须epoch-independent，不能直接调用现有RRule公共ordinal query。已有
  calendar/clock候选生成仅需first_date/last_date/anchor，抽出这个具体共享窗口，
  wrapper流用Int64墙钟过滤count/until并复用RecurrenceCache；原ordinal路径保持不变。
- 支持RelativeWeekday ordinal selectors（月/年，年bymonth决定month vs year范围），
  其余频率忽略nth；混合plain/nth按原mask相交。现有core增加私有ordinal字段并扩展匹配，
  不为实现简单而删掉常用MO(n)参数；旧RRule API/行为不改。
- 新RRuleLocator(rule,tz?/timezone?)对象与as_locator adapter共享mutable wrapper handle，
  每range调用按原RelativeDelta扩展后set dtstart/until；显式base与display timezone独立。
  标准对象直接DateTime bounds按源；numeric adapter保留项目倒置生成tick约定，单位/interval
  随wrapper底层成功core更新。普通DateLocator复制仍复制数组，wrapper adapter共享handle。
- static typed raw_rule/getters/copy为可审查入口，反射/pickle/任意callable代理/pytz.localize
  不在typed协议内；copy为独立construct/core/cache快照扩展，不宣称Python shallow-copy协议。
- D14-before已保存。实现顺序：RRuleDateTime与纯calendar窗口/流→wrapper ctor/set/query/
  source参考→ordinal weekday/core与named RRuleLocator接线→docs/interface/全部目标验收。
  无live，无commit；D14-02/03未完成。

### D14 基础与wrapper首轮实现

- 新RRuleDateTime(naive/aware/from_local/fold/date/zone)，不改DateTime旧模型；same-zone
  identity避免多余UTC越界转换，attach采用已验收墙钟resolve。
- 实际共享需求抽出RecurrenceCalendarWindow(first_date/last_date/anchor)与candidate dispatch；
  原ordinal-window去掉两个不再使用字段。新rrule_naive_stream用Int64过滤start/until/count，
  不锁epoch。旧clock/calendar算法保持原路径。
- DateRule加私有bynweekday，月/年ordinal weekday匹配、mixed plain/nth相交、禁用旧day默认。
  wrapper对象形态byweekdays使用D13 RelativeWeekday，其余频率忽略nth；RRule.copy派生保留字段。
- 新WrapperOptions/RRuleWrapper ctor/set/metadata/raw_rule/raw_iter/occurrence_count/copy及
  after/before/between/xafter，含inferred tz set后消失、None endpoint aware错误、deferred
  naive-aware比较顺序与失败阶段。Set前参数数组保留引用，core snapshot复制；外部数组变动
  将在下次set消费（源_construct shallow copy），显式copy独立复制配置数组/缓存。
- 源None补充：dtstart/until关键字显式None会在normalizer访问tzinfo时失败，并非恢复默认；
  新typed null名单精确表示keyword None，count/selector/wkst/cache可清；dtstart省略才读clock。
  Source无effective tz时xafter返回generator，有tz时返回list；typed xafter统一eager Array，
  raw_iter暴露无epoch lazy underlying stream，Python动态迭代协议不宣称1:1。
- 静态JS目标包检查通过，仅config原Ref warning，无新warning。已有全项目JS测试当前live见后续；
  新wrapper原source oracle尚待写入/验证。Named RRuleLocator及adapter仍未实现，D14未验收。

- 旧整项目JS22957 exit0：4115/4115，calendar窗口抽取/ordinal私有字段未破坏基线。
- 新generate_rrule_wrapper_reference.py执行固定原Matplotlib class +原dateutil RRule，
  clock通过局部rrule.datetime namespace注入，保留真实datetime isinstance；受控TZ=UTC0。
  source rrule.py SHA289cca95a09dd6311bbb8037f1996db256a801487d9d26dd6ce15d8e9ef429ec，
  wrapper/dates、tz和fixtures固定校验。generator当前session99104结果见后续；尚未运行新Moon参考。
- 原源码补充：普通rrule.weekday拒绝n=0，但dateutil._common.weekday允许0且core按普通
  weekday处理；新RelativeWeekday对应D13的_common类，producer按该类生成对象。
- 后续仍需RRule.raw_rule().replace频率降为weekly及更细时将ordinal合并为ordinary
  weekday（原_original_rule行为）；目前保留ordinal的简单copy不足，待参考/修复。
- 待完成named RRuleLocator/DateLocator live-wrapper adapter、epoch/browser/hand/scene链路、
  源--check与四目标验收；D14不能标完成。无commit。

### D14 wrapper原源验证进展

- 原源脚本已扩展到71个named/138个状态，含null optional keywords；generator78516已结束。
- 日期包JS最新3409/3409通过，D14-wrapper-js.log记录。新增两个手写回归验证raw_rule.replace
  月/年ordinal选择器在降频时重映射为plain weekday，count<=0复制为空，以及显式copy独立
  配置数组/cache与旧reader snapshot；原RRule显式count校验保持不变。
- raw_rule.replace重映射已修复，不再是未完成项。无live，不改动时不重跑这一轮。
- 下一步named RRuleLocator及live DateLocator adapter，然后补epoch/scene、原源参考与全部门禁。

### D14 named locator与扩展验证

- 新RRuleLocator/direct RRuleDateTime bounds、RelativeDelta扩展/UTC caps、wrapper.set、between、
  fallback端点及批量UTC溢出预检实现。Numeric adapter按现有约定排序范围再倒置输出，
  与wrapper共享handle；DateLocator.copy/Axis安装保留live wrapper，unit/interval/nonsingular
  动态读取成功core。with_offset/with_timezone只改display，不改wrapper base。
- 原源103 named/111 states定位器参考通过，覆盖各频率/selector/月末/倒置/空/边界caps/
  tz独立与mutable失败/恢复；fraction和2400 epoch参考也通过。
- 新原源发现dateutil tzstr负DST gap的utcoffset保留旧offset，不能统一post-gap。
  resolve_arithmetic_local按dateutil_footer执行原tzrangebase标准墙钟标签算法，支持fold；
  IANA/fullTZif原策略保持。wrapper扩展到75 named/142 states，固定tz/_common.py SHA。
- 原项目全JS25147 exit0：4301/4301，无新增warning；JS有3个无Node测试，其余目标预计4298。
  2个hand/copy/raw replace、1个epoch独立、2个scene/axis(shared inverted SVG/minor)、
  2个checked doc与自定义epochhelper已接线。info/fmt已过，interface.diff仅新增3typed对象/
  DateLocator getter，无旧API变化/foreign类型泄漏；integration新接口为空。
- 已结束所有test/generator session；当前无live。D14最终四目标门禁与文档未完成，不标验收。

- 最终门禁当前live：test-all12135，wrapper+locator --check96743。info&&fmt完成，
  check-all35056 exit0（124 tasks，8原Ref warnings/0error）；新文档/参考指南已同步。
  等待测试期间不修改测试输入。D14-info/fmt/interface.diff/check-all/test-all保留。

### D14 已验收（2026-10-23）

- 全项目test-all12135 exit0：wasm/wasm-gc/native各4298/4298，JS4301/4301；
  D13基线增加185个通用测试+1个JS无Node测试。178个source named/253states与
  2hand+1epoch+2scene/axis+2doc=185；epoch helpers在既有tests内调用，不另计named。
- info&&fmt、check-all35056 exit0（124tasks/8旧Ref warnings/0error），两个新generator
  --check96743 exit0。D14-interface.diff仅新增RRuleDateTime/RRuleWrapper/RRuleLocator与
  DateLocator.rrule_locator getter，旧接口不变；无第三方类型泄漏，新integration接口空。
- 新源码：rrule_datetime/wrapper/options/query/naive_stream/ordinal_weekday/locator，
  shared calendar window/dispatch与DateRule私有ordinal字段及raw replace降频重映射；
  dateutil_posix_local_info修复负DST原墙钟attach，DateLocator adapter动态unit/interval。
- README/COMPATIBILITY/PLAN/DEPENDENCIES/NOTICES/testdata/rrule_wrapper_README与两组
  JSON/generated assertions/custom epoch helpers已同步。无外部新依赖/C/运行时Python。
- 已验证typed边界：显式RRuleDateTime awareness、set失败阶段、推断zone丢失、caller数组
  延迟生效、copy独立cache/construct、epoch无关query、direct caps/float溢出顺序、
  浏览器explicitclock与shared/inverted SVG/minor/自动标签单位。100000 eager cap保留。
- 后续D15实际共享需求已确定：AutoDateLocator当前RRule分支仍用旧ordinal recurrence，
  会skip-gap/双fold，与原wrapper不同；接入新wrapper时必须保留已decode/rounded bounds，
  不能再inverse一次导致fraction epoch位移。旧显式hour/rrule_locator等扩展已有已验收
  skip-gap/双fold测试，保持独立，不静默改它们。先冻结此定向契约再实现，非整体resurvey。
- 所有session已结束，无commit，整体目标未完成。

## D15 执行顺序

- [x] D15-01 固定AutoDateLocator RRule选择/查询与已decode bounds共享契约及针对性源码。
- [x] D15-02 接入新wrapper，补正DST参考、直接/adapter/scene与自定义epoch接线。
- [x] D15-03 source--check、文档/接口审查与四目标验收。

### D15-01 契约已冻结

- 仅AutoDateLocator index<6且非year-multiples分支改用RRuleWrapper(dtstart=aware dmin,
  until=aware dmax, selectors/actual interval) → namedRRuleLocator(display self.tz)。
  原get_locator保留推断timezone/规范化construct；取tick时重新按calendar delta扩展。
- numeric tick_values已经inverse/round过的bounds必须直传named locator，不重复inverse；
  保持fraction epoch、自定义origin/远年精度、不等间隔日历phase与输入倒序约定。
  AutoDateLocator direct raised错误保留，DateLocator UI adapter继续checked捕获为空。
- 旧显式hour/day/rrule_locator等skip-gap/双fold扩展不改；year multiples与microsecond
  分支沿用已验收路径。本切片只完成auto RRule分支真实共享接线，不宣称named子类全部。
- sourceget_locator/tick_values位于dates.py1345–1446，D14源hash固定；automatic_distance
  本轮保持既有已验收算法，若新原源发现实际差异再定向修复，不重启survey。
- D15-before已保存；无live、无commit。下一步改automatic_selection后写DST原源测试。

### D15 实现进展（最终验收未完成）

- automatic_selection的非year-multiples recurrence分支用显式aware初始bounds构造wrapper，
  named locator捕获display zone。Auto.tick_values直传已经decode/round的日期，不重复inverse。
- 原全JS69383：4300/4301，唯一旧pyplot测试要求automatic保留fold1，与原源不符；
  已用原源future同范围对照修改为只fold0/仍含02:00EST。显式locator双fold回归保持不变。
- 新source generator 92 named跨NY/LH/PARIS/负DST/2400footer、seconds/minutes/hours/day/month、
  multiples开关、get_locator初始core/adapter/selected/倒置/labels。全部新原源通过。
- source额外定位到负DST fromutc两步语义：UTC mask先移本地墙钟，返回datetime.utcoffset
  再按标准墙钟mask求offset，可能与原UTC mask不同。新增from_utc_calendar共享helper用于
  to_datetime/generated_datetime/with_timezone；只dateutil_footer改变，fullTZif保留既有。
- 全项目JS76366 exit0：4393/4393，无新增warning；随后补num2date/with_timezone逐字段
  原源断言、无epoch get_locator、axis major/minor gap/倒置回归，等待新门禁。当前无live。
- 下一步重生成92组，最终info&&fmt、interface审查（应为空）、source--check/四目标门禁。

- D15最终source附加了num2date/with_timezone逐字段断言（每个range两端），并在既有epoch
  隔离测试验证get_locator不读epoch/rc；新增Axis major/minor duplicate-gap/倒序回归。
- info&&fmt完成，D15-interface.diff为空，check-all72678 exit0（118 tasks，8旧warnings）。
  最终test-all6194 live；新auto-wrapper --check exit0，wrapper16657与locator22187 live。
  运行中不改测试输入；本切片尚未标验收。README/COMPATIBILITY/NOTICES/DEPENDENCIES与
  auto_locator_README已同步，待最终计数后更新PLAN。无commit。

### D15 已验收（2026-10-23）

- 最终test-all6194 exit0：wasm/wasm-gc/native各4391/4391，JS4394/4394；相比D14新增
  92个source named+1个axis major/minor回归=93。既有独立epoch测试增加get_locator纯度
  断言，既有pyplot future fold测试改为原源fold0行为，未额外计named。
- 三个source --check通过：auto-wrapper92 named（直接exit0）、wrapper16657 exit0
  75named/142states、locator22187 exit0 103named/111states/custom epoch helpers。
  参考生成器校验固定Matplotlib/dateutil来源及fixtures，不导入已安装Matplotlib。
- 最终info&&fmt完成；check-all72678 exit0（118tasks，8原Ref warnings/0error）；
  D15-interface.diff为空，无公共API变化/第三方类型泄漏，无新外部依赖。
- 实现变更仅automatic_selection、timezone、timezone_arithmetic三个生产文件；新原源
  script/JSON/generated tests，axis gap/倒置、epoch纯度、pyplot sourcefold0接线已通过。
  README/COMPATIBILITY/PLAN/DEPENDENCIES/NOTICES及auto_locator_README已同步。
- 日期转换from_utc_calendar只为dateutil_footer先UTC shift再墙钟utcoffset求值，fullTZif
  evaluator不变。Auto每次选择新wrapper，原copy/axis状态隔离保持；返回的具体adapter
  仍按D14共享wrapper。旧显式locator skip-gap/双fold扩展与year/micro分支保持。
- 无live，无commit，整体goal仍active；下一切片D16命名YearLocator与年对齐边界。

## D16 执行顺序

- [x] D16-01 读取YearLocator与_Edge_integer原源、现有year路径，冻结有效日期/年对齐/
  原construct更新/clock与命名typed对象边界，并建立D16-before。
- [x] D16-02 复用D14 wrapper/locator实现命名YearLocator，补原源与epoch/scene接线。
- [x] D16-03 参考--check、文档/接口与四目标验收。

先执行D16-01，不提前变更旧year_locator或泛化所有locator家族；依既有冻结架构复用。

### D16-01 契约已冻结

- 命名YearLocator保存冻结正Int32 base，与wrapper成功core.interval分开；base用于年界
  floor/ceil后cap1..9999，wrapper interval/frequency仍可live更新；单位/nonsingular动态读取。
  typed范围下整数精确运算等价_Edge_integer(offset0,tol1e-10)，Int64避免base*ceil溢出。
- start用vmin.replace(year=ymin,month=raw_construct.bymonth,day=raw_construct.bymonthday,
  hour/minute/second=0)，保留microsecond与fold/zone identity；stop由start只换ymax。
  日期非法立即raise，不跳过或夹紧；直到两日期构造都成功才wrapper.set，之后query start/stop。
  inherited emptyfallback为原vmin/vmax。Year直接bounds可混合awareness，只取vmax.year；
  不继承普通RRuleLocator的RelativeDelta upfront mixed拒绝。numeric adapter排序/倒序。
- source读取原_construct scalar形态；新增wrapper兼容可选bymonth_value/bymonthday_value
  表示scalar，原数组参数保持。私有form区分omitted/null/scalar/array，Year查询array/null
  即使singleton也抛错；set先更新raw形态与既有失败阶段一致。不得把数组缩成scalar蒙混。
- Year::new复用wrapper无dtstart的hostclock/显式DateParserContext，先建rule再解析display
  timezone（source顺序），不预读epoch。构造负monthday可由core接受，但Year.tick日期替换拒绝。
  base<=0/无效selector沿既有typed校验，不宣称Python任意动态值/floatbase/数组fields协议。
- 在RRuleLocator内部新增私有year alignment mode，Year.as_rrule_locator保留虚拟year行为；
  DateLocator既有wrapper adapter无需加一组重复字段。Year.as_locator kind为Years，仍先走
  wrapper动态metadata/tick guard。auto year-multiples分支也接入新Year对象，传已有bounds
  直达query，保持fraction epoch无二次inverse；旧year_locator扩展独立保留。
- RRuleDateTime需保存from_local明确传入的fold供Year.replace，aware(DateTime)可由精确
  offset/candidates推断普通fold；不改原DateTime模型，不增加外部时区或日期类型。
- D16-before已保存，无live/无commit。下一步实现scalar形态、Year alignment及原源参考。

- D16新增真实共享需求：Year empty fallback允许mixed-awareness原端点，date2num按首元素
  awareness决定整体UTC预处理。直接复用D11 parser_check_utc/interpret_naive，对first-aware
  后续naive使用wrapper.context或system host；first-naive不加Python aware UTC溢出预检。
- AutoDateLocator增加可选DateParserContext，Year选择分支传递用于默认host now；构造Auto
  本身不读clock，年分支才读，其他分支不读。浏览器年规则可显式注入，不假造UTC host。

### D16 首轮实现与原源结果

- YearLocator/new/rule/base/timezone/unit/interval/with_zone/as_rrule_locator/as_locator/tick已实现；
  RRuleLocator内部year_base模式保留virtual year_bounds行为，所有adapter复用既有路径。
  Wrapper scalar关键词与formmetadata、RRuleDateTime私有fold、Auto context/Year分支已接线。
- 原有全JS38345 exit0：4394/4394，新功能未破坏已验收基线，无新warning。
- 新YearLocator generator109named/138states：107版首轮仅mixed-aware year1 fallback一例
  与原源不同，定位为CPython astimezone对naive host的±24h fold探测超年界，最终UTC可用
  仍会报错。复用D11interpret_naive改为原local_to_seconds两fold算法及local probe年界检查；
  删除不再使用possible_offsets枚举函数。CPython v3.12.14源hash固定写入参考manifest。
- 生成器新增pre-first-tick scalar更新clock重采样与maxyear mixed fallback，覆盖first-naive
  NumPy允许aware UTC超界 vs first-aware Python preflight错误。全项目JS70806结果待后续。
- 当前实现未验收：仍待scalar通用wrapper补充参考、epoch/custom-origin/浏览器/scene与docs、
  .mbti审查和四目标门禁。无commit。

### D16 实现与扩展验证完成，最终验收待执行

- 新Year原源109named/138states，通用wrapper原源扩展76named/146states；Year源还为
  fraction/2400 epoch生成direct Year与Auto year-multiples原源helper，接入既有隔离tests。
- 新checked Year示例、1个scalar copy/duplicate forms回归、1个shared inverted SVG year
  live月日更新、1个JS无Node Year/Auto context回归；既有epoch新增invalid year earlyerror纯度。
- info&&fmt完成，D16-interface.diff只新增YearLocator、wrapper两个可选scalar关键字及Auto
  可选context；无旧参数删除或foreign类型泄漏。保留RRuleDateTime.fold私有，不改DateTime。
- 全JS38180结果见后续；最新修改为文档/指南时不重跑不相关门禁。无commit。

- D16最新全JS38180 exit0：4508/4508；4个JS无Node测试，其他目标预计4504。
- 最终check-all66434 exit0、Year109named/138states --check直接exit0、wrapper18002
  exit0 76named/146states。参考指南/root docs/compat/license/dependencies已同步。
- 最终test-all当前live见接下条记录；运行中不改源码/测试输入。无commit，尚未验收。

- 最终test-all session20724已确认live；验收前先轮询该ID，不修改源码/测试输入。

### D16 已验收（2026-10-23）

- 最终test-all20724 exit0：wasm/wasm-gc/native各4504/4504，JS4508/4508。相比D15新增
  113通用=109Year源+1wrapper scalar源+1hand+1shared SVG+1checked doc；另新增1JS无Node。
  custom epoch/helper与既有epoch earlyerror断言在原tests内，不另计named。
- info&&fmt与check-all66434 exit0（121 tasks、8旧Ref warnings/0error）；Year109named/
  138states --check直接exit0，wrapper18002 exit0（76named/146states）。参考hash指南匹配JSON。
- D16-interface.diff仅新YearLocator方法/typed对象，RRuleWrapper.new/set新增兼容可选
  bymonth_value/bymonthday_value，AutoDateLocator.new新增兼容可选context；无旧参数删除/
  foreign类型泄漏，原DateTime协议不变。RRuleDateTime保存私有fold，wrapper构造形态私有。
- 生产变更：year_locator新增，rrule_locator private year mode/批量日期编码，wrapper/options
  scalar形态，automatic_locator/selection接入年分支/context，rrule_datetime fold，
  parser_local精确CPython local_to_seconds双fold/±24h探测及年界；删除旧offset枚举实现。
- 源证据覆盖base独立于live interval、保留微秒排除首occurrence、非法aligned日期前置错误、
  original construct scalar/array/None、set失败阶段、clock重采样、min/max混合awareness，
  日期纯度/自定义fraction与2400原点、浏览器显式context、shared inverted SVG live月日。
- README/COMPATIBILITY/PLAN/DEPENDENCIES/NOTICES与year_locator_README、wrapper/auto指南
  及2组源JSON/generated tests/custom epoch helpers已同步。无新增外部依赖/C/运行时Python。
- 所有session已结束，无commit；整体goal继续。下一切片D17标准命名locator家族。

## D17 执行顺序

- [x] D17-01 定向读取Month/Weekday/Day/Hour/Minute/Second构造与父协议，冻结typed selector
  /默认值/clock/验证顺序、通用adapter共享与兼容边界，并建立D17-before。
- [x] D17-02 复用wrapper/RRuleLocator实现六个命名对象及主要查询/scene/epoch/browser接线。
- [x] D17-03 原源参考--check、文档/接口与四目标验收。

先执行D17-01，保持旧helper扩展及已验收DateTime/epoch/共享SVG链路；不重启整体survey。

### D17-01 契约已冻结

- 六个命名对象各保存RRuleLocator，直接委托rule/timezone/unit/interval/with_zone/offset/
  as_rrule_locator/as_locator/tick_values；不复制日期算法，不增加DateLocator字段或新IR。
  与Year一致typed封装；这些子类未override_create_rrule，RR delta/caps/query完整复用。
- Month为Monthly，默认bymonth1..12、bymonthday scalar1，固定h/m/s0；Weekday为Daily，
  默认Tuesday(1)，支持Int/RelativeWeekday及其数组，Daily忽略nth；Day为Daily，默认
  月日1..31，固定h/m/s0；Hour默认0..23固定m/s0，Minute默认0..59固定s0，Second默认0..59。
- scalar参数采用对应*_value，与现有数组参数互斥；Weekday另外on_weekday/byweekdays
  传对象。Month月日也支持scalar/array，None月日不筛选；默认None与省略的差异以
  null名单表达。各ctor只接受其source selector的null名；month/day/hour/min/sec的None
  selector恢复完整默认范围，Weekday None解除筛选，Month bymonthday None解除筛选。
- 保留调用方数组引用至wrapper.construct，core复制；每次set消费新数组值；命名对象
  adapters与copy/Axis共享wrapper。显示时区在rule构造后捕获，baseNone；context传递
  host-local clock，constructor先.now再display zone；Day interval正Int检查在.now前。
- 非Day无效interval沿D14 typed正Int32 guard，Python允许但可导致挂死的值不宣称兼容。
  其余选择器沿既有有效非空typed范围，不用非法动态值作为支持能力。
- source1499–1656固定hash已核对；原源参考必须执行原6class AST，增加原_get_tzinfo
  避免共享loader的zone stub掩盖invalid display/capture与clock错误顺序。
- D17-before已保存，无live/无commit；下一步先实现constructors与委托，再写原源对照。

### D17 首轮实现与原源生成

- 新month/weekday/day/hour/minute/second_locator六个opaque typed对象与委托方法；
  named_locator_selection只共享真实constructor默认/None/scalar-array归一，不复制RR算法。
- 静态JS包检查通过，仅config原Ref warning。生产实现尚未四目标验收。
- generate_named_locator_reference执行原6class与原_get_tzinfo，144named/171states；包含
  15个constructor failure（invaliddisplay/rc、Day interval前置、Hour不可能相位），
  UTC0 controlledclock、defaultRC捕获、各selector形态/None、核心更新失败/修复、
  caller数组变更、NY/LH/Paris/负DST与年1/9999/倒置、direct/generic/numeric路径。
- generator74726/67957均已结束；最新日期包JS测试live ID见后续。输入JSON保存原始case，
  不把mutable selector最终值误记为构造输入。原source与TZif哈希固定，未引入新依赖。
- 后续：scalar/object跨freq、customepoch/helpers、epoch/browser/scene与checkeddocs、接口/
  文档和门禁。无commit。

- 日期包首轮JS95090已结束：3865/3868，3处原源差异均为same-frequency clock BYXXX
  的不可达相位应在构造/重建时raise；原RRule legacy直到迭代才返回空。新增wrapper私有
  wrapper_clock_selection按gcd(interval,24/60)筛core选择器并拒空，raw construct数组不改，
  旧RRule规则扩展保持。raw_rule().replace需要读取已筛core，不能仅检查是否有匹配值。
- 原源新增Weekday objects跨freq与通用wrapper三个不可达constructor/一个raw core prune
  versus construct/replace案例，generator当前live见后续；尚未最终验收。无commit。

### D17 扩展验证完成，最终验收待执行

- 日期包JS25457 exit0：3872/3872；修复3处source构造/更新相位差异，无新增warning。
- 增加6个checked API示例、typed重复形态前置错误回归、shared inverted SVG月日live更新、
  major/minor hour/minute绑定和JS无Node全6类测试；既有epoch纯度测试包含各构造器/raw reader。
- 原源144named/173states，6个基础case增加with_offset/with_timezone浅copy共享rule对照；
  fraction/2400 epoch新增12个direct/numeric原源观察helper，在既有隔离tests中执行。
- 通用wrapper参考80named/150states，包含相位constructor错误、core筛选与raw construct/
  raw_rule.replace差异。未改变旧RRule本身的不可达空规则扩展。
- info&&fmt完成，interface.diff仅新增六个opaque typed对象及方法，无旧接口变化/foreign
  类型泄漏。全项目JS10487 exit0：4666/4666，含5个无Node测试；其余目标预计4661。
- 下一步同步当前文档、原源--check、check-all/test-all验收；当前无live，无commit。

- D17首轮四目标test-all61301 exit0：4661/4661(wasm/wasm-gc/native)，JS4666/4666。
- 最后审查补Month显式None月日传到wrapper.with_null，保留NullCalendar形态而非仅等价
  的omitted/no-filter core；当前数值输出不变，但raw construct应准确。此生产小改后重跑最终
  info/fmt/check-all/test-all；原源生成文件未改，不重复生成。无live、无commit。
- 定向原源probe已确认下个共享recurrence问题：Minutely interval1440/byhour13/byminute0、
  Secondly interval86400/byhour13/byminute0/bysecond0在start2024-01-01 12:00构造成功，
  after(start)迭代会ValueError（跨级clock mask不可达）；旧naive stream slots.empty返回空。
  D18从这个已验证差异继续checked查询错误对齐，不重做survey；raw_iter typed协议另冻结。

- Month最后形态修正后最终check-all16813 exit0（117 tasks，8旧warnings），info&&fmt完成。
  test-all当前live见下一记录；运行中不改源码/测试输入。无commit。

- 最终test-all50871确认live；原61301已结束且通过，此次验证Month最后None形态修正。

### D17 已验收（2026-10-23）

- 最终test-all50871 exit0：wasm/wasm-gc/native各4661/4661，JS4666/4666；包含Month
  explicit None最后raw形态修正。D16基线新增157通用+1JS：144named原源+4wrapper原源+
  6checked docs+1输入歧义hand+2scene/axis=157；新JS无Node全六类另1，epoch helpers复用原tests。
- 最终info&&fmt/check-all16813 exit0（117tasks，8已有Ref warnings/0error）；named57784
  --check exit0 144named/173states+12custom epoch观察，wrapper83463 exit0 80named/150states。
  D17-interface.diff审查纯新增6opaque对象/方法，无旧接口删除或foreign类型泄漏。
- 生产新增6个命名locator文件和named_locator_selection，复用RRuleLocator；wrapper_options
  仅补同级clock selector按gcd筛core/拒空，raw construct数组不改，旧RRule扩展保持。
- 原源覆盖Tuesday默认、各种selector形态/None、host clock与display rc顺序、Day interval
  前置检查、更新与失败/恢复、外部数组变动、阴影core/construct/raw replace、TZif/GNU TZ/
  gap/fold/秒级offset/年界/倒置、direct/generic/adapter与with_offset/with_timezone共享。
- custom epoch、无epoch构造/raw query、无Node显式context、shared inverted SVG live月日、
  主次hour/minute formatter独立绑定已验收。原小写helper独立扩展未修改。
- README/COMPATIBILITY/PLAN/DEPENDENCIES/NOTICES、named_locator_README与wrapper指南，
  两组JSON/generated参考及fraction/2400 helper均同步，无新依赖/C/运行时Python。
- 新发现下个真实差异已保存D18-discovery.log：跨级clock mask导致source迭代ValueError，
  当前naive slots.empty返回空；D18从这里对齐checked查询/计数及错误时机。不能把所有
  无候选date filter一律当错误，也不能提前改成constructor failure。raw_iter协议另冻结。
- 当前无live/无commit，整体goal仍active；命名MicrosecondLocator可在共享clock错误切片后接入。

## D18 执行顺序

- [x] D18-01 从固定source两个反例冻结MINUTELY/SECONDLY跨级mask不可达的构造/迭代/
  count/until/cache/查询优化边界与typed raw_iter/checked count协议，建立D18-before。
- [x] D18-02 复用现有clock slots模型对齐checked查询及必要接口，原源验证错误时机与纯度。
- [x] D18-03 参考--check、文档/接口与四目标验收。

不要重启survey；先读取已验收查询与clock候选代码，保持旧RRule和共享SVG架构决策。

### D18-01 契约已冻结

- 只MINUTELY/SECONDLY跨级clock masks，在同级__construct_byset已成功后仍可无任何
  24h周期可达slot；source在首次推进iterator时ValueError，不是constructor failure。
  共用已有clock slot/residue模型，抽取惰性slot iter；旧RRule候选仍以无slot返回空。
- checked after/before/between/xafter在normalize query后、实际reader读取前检查成功core
  的clock可达性。before target<start/window优化、反向/不重叠between、count0/negative、
  until<start均不能掩盖错误；不能把普通calendar filter无匹配当错误。
- occurrence_count按source count可抛DateError，签名补raise；已有成功用法不变，callback
  中补显式错误处理。检查读取self.core.rule，不读取可能失败/未规范化的construct。
- 保留raw_iter非raising Moon Iter扩展。新增checked_raw_iter→opaque RRuleDateIterator，
  next()->RRuleDateTime? raiseDateError，在第一次next检查，创建时不抛；发生错误的reader
  终止，后续next None；snapshot/core/cache与旧reader保持独立/共享既有规则。
  所有checked查询与计数复用同一reader内核，不发明一套候选算法。
- source cached iterator异常后会保留线程锁，重复用同一失败core可死锁；参考生成每操作
  使用新rule，或先set为新core。Moon typed单线程cache不模拟Python锁/死锁，仍检查
  失败前cache.complete=false/值为空，set/copy/旧reader行为按可观察typed协议验证。
- source新probe矩阵已确认countNone/0/-1/1、until omitted/before/start、cache开/关，
  before/empty between/count/xafter0均ValueError。明确until=None另为D14 normalizer错误，
  probe已修正为省略keyword，不把它当迭代错误。D18-before已保存，无live/无commit。

### D18 首轮实现

- recurrence_clock_slots抽为惰性residue iterator，candidate复用to_array，checked helper复用
  next检测可达slot；保留旧RRule空规则路径。新RRuleDateIterator支持checked next/终止状态，
  checked_raw_iter创建不抛、按成功core/cache snapshot读取。
- after/before/between/xafter/occurrence_count统一checked reader；before优化先检查，防
  target<start早返回吞错。occurrence_count新增raiseDateError，两个JS callback补try!。
- 首轮静态errdefer assignment语法改成block；其他代码检查无新warning。原全JS2156结果
  见后续；还未增加新源参考或验收，无commit。
- 新源probe扩展矩阵（24规则×4查询，cache错误每操作fresh防Python锁死）确认所有
  countNone/0/-1/1与until省略/早于/等于start均在迭代ValueError，不能被窗口/计数短路。

### D18 原源与扩展验证进展

- 原基线全JS2156 exit0：4666/4666；新日期包JS50482 exit0：4088/4088。
- generate_clock_iteration_reference执行固定原wrapper/dateutil：208named、2912观察，含
  128主矩阵、跨级不同mask、合法可达/零count/early-until、calendar-no-match非错误、
  年1/9999，9类checked查询/count+3次同reader读取+direct/numeric locator。
  cached失败每操作fresh，避免原Python锁行为导致参考挂死。
- 新opaque RRuleDateIterator.next已支持source reader error后终止；raw_iter保留旧native
  不抛扩展，checked API不受legacy坏规则空cache.complete掩盖。新增public/whitebox
  snapshot/copy/set失败及恢复/cache纯度、独立clock_iteration_epoch、无Node与axis错误映射。
- info&&fmt完成，interface.diff仅新增RRuleDateIterator/next、checked_raw_iter以及
  occurrence_count补raise DateError；非raisingJS callbacks已补try!，无其它签名删除/foreign。
- 全项目JS63320结果见后续；docs/source--check/四目标门禁仍待，尚未验收，无commit。

- 全JS63320 exit0：4880/4880，含6个无Node测试，其余目标预计4874。docs/root兼容/
  参考指南/依赖/许可已同步。最终check-all96811与source--check49478均exit0，
  test-all当前live见下一记录；运行中不改源码/测试输入，无commit。

- 最终test-all48055确认live，先轮询该ID；check-all96811为128tasks/8旧warnings。

### D18 已验收（2026-10-23）

- 最终test-all48055 exit0：wasm/wasm-gc/native各4874/4874，JS4880/4880；D17基线
  新增213通用=208原源+1snapshot hand+1cache whitebox+1epoch独立+1axis+1checked doc，
  另1JS无Node回归。所有既有日期/时区/场景测试仍通过。
- info&&fmt/check-all96811 exit0（128tasks，8旧Ref warnings/0error）；source--check49478
  exit0 208named/2912观察，指南来源hash与JSON一致。D18-interface.diff仅新增opaque
  RRuleDateIterator.next/checked_raw_iter、occurrence_count增加raise DateError；callback已适配。
- recurrence_clock_slots惰性residue模型在旧候选与新checked读共用；after/before/between/
  xafter/count统一reader，before早返回前检查成功core。错误不提前到constructor，也不被
  count/until/window/cache掩盖；普通calendar无匹配仍为空。errdefer使失败reader终止。
- raw_iter与旧RRule native扩展保持无错空stream；需要source错误语义用checked_raw_iter。
  constructor/query不读epoch/rc，copy空cache、旧reader snapshot/set修复与cache未推进均验收；
  legacy坏规则空cache.complete也不能掩盖checked错误。单线程typed cache不模拟Python锁死。
- 新原源208case覆盖6类mask、countNone/0/-1/1、until省略/早于/等于/晚于、cache/base开关、
  早before/反向between/xafter0/count/同reader错误后None、年界与direct/numeric locator。
- README/COMPATIBILITY/PLAN/DEPENDENCIES/NOTICES、clock_iteration_README与已有wrapper/
  named指南已同步，无新依赖/C/运行时Python。无live/无commit，整体goal仍active。

## D19 执行顺序

- [x] D19-01 读取MicrosecondLocator/MultipleLocator与现有microsecond helper、DateLocator/
  Auto metadata，冻结typed fractional interval、direct/mixed awareness/date2num、epoch/
  inverse、year边界与adapter协议，建立D19-before。
- [x] D19-02 复用ticker multiple/date转换实现命名对象及Auto/axis接线，补固定源参考。
- [x] D19-03 参考--check、文档/接口与四目标验收。

注意source interval可为fractional，不能仅按旧Int32 helper声称完整；先核对现有ticker模型
和DateLocator.interval兼容边界，再决定最小真实共享适配，保持旧helper独立扩展。

### D19-01 契约已冻结

- 原MicrosecondLocator先DateLocator捕获tz，再构造MultipleLocator(step)。新named对象
  interval有限正Double（含fractional/subnormal/大于Int32），ctor不读clock/epoch；
  context只供mixed first-aware后续naive日期的host解释，不采样now。
- direct tick_values(RRuleDateTime,RRuleDateTime)复用已有whole-array date2num（首元素
  awareness/UTC预检顺序）；先t0=floor(first_num)，再减origin并乘864e8，再Multiple排序；
  最后tick/864e8+t0。direct reversed保留first的origin并按source输出升序；numeric
  adapter排序/num2date后调用direct并按项目倒置约定reverse，不重复inverse。
- Micro输出保留邻接点、重复值与出Gregorian界的坐标，不用旧helper的supported_ordinal
  clipping。old microsecond_locator(Int32)继续保留其范围clip与旧numeric helper协议。
- 现ticker包没有MultipleLocator（enum仅Linear/MaxN/Fixed/Log），不能声称已复用不存在的
  public类。本切片复用已有date微秒kernel，提取共享Double multiple/divmod计算并由旧helper
  与新named调用；通用ticker.MultipleLocator完整对象/viewlimits/rc可在后续真实跨包需求时接入。
- _Edge_integer.ge与n // step必须执行原Float/NumPy divmod（CPython3.12.14 Objects/
  floatobject.c SHA d558f168de7ec864b64ffad7ee2b056bda4efca1ee68ca690189354b893ccc76）。
  不用floor(a/b)代替：1.0 // 0.1为9.0。eager保留100000前缀cap；非finite n/长度报DateError。
- DateLocator新增micro对象私有字段/ getter 与interval_value()->Double准确元数据；原
  interval()->Int32仅对新fractional/巨量对象给截断/饱和projection，原domain不变。
  nonsingular用exact Double；axis/formatter用同adapter。Micro.interval()->Double为准确值。
- Auto micro分支也返回new named adapter；其tick_values使用已decoded fields直接调用，
  与RR分支一样避免fraction epoch二次inverse。year/RR/旧helper行为与架构保持。
- D19-before已保存，无live/无commit。下一步实现shared grid、named对象与private adapter，
  然后固定源参考验证Double/epoch/边界及mixed日期。

### D19 基础实现

- 新MicrosecondLocator(Double interval/context/captured zone/direct ticks/nonsingular/adapter)，
  DateLocator加私有microsecond_object及exact interval_value getter；Int32 interval仅对新域
  trunc/saturate兼容projection，nonsingular已用exact值。with_offset/zone同步对象。
- 复用旧微秒kernel提取Double multiple/divmod+unclipped grid，旧Int32 helper调用后保留clip。
  date_values_to_numbers由RR文件移出成为真实共享private转换；Auto micro分支接入新对象并
  使用已decode日期直接调用。新numeric路径先拒NaN/Inf并保留inverse选择epoch的顺序。
- 静态JS95314 exit0，只有config原Ref warning。全项目JS47807结果见后续；新source oracle
  尚未写入，未验收。D19之前无其他live；无commit。

### D19 参考差异定位（2026-10-23）

- 基础全JS47807 exit0 4880/4880。新增173 named原源参考、72 CPython/NumPy divmod逐bit
  whitebox、48个自定义epoch direct/numeric/Auto观察，生成器exit0；还未完成验证。
- 第一轮date-JS97514 exit2，仅首naive后aware秒offset两项失败；确认NumPy向零截断偏移到
  整分钟（±561/±61/±59），共享转换已修正并增加负值参考。首aware分支仍精确offset。
- 参考生成器加100000枚举预算并fail-fast以防OOM；不把oracle预算错误当上游错误。
  极小interval非零point未枚举，生产cap后续手写覆盖。Ctor/epoch/browser/axis仍待。

### D19 JS通过与用户新提交授权

- 全项目JS94426 exit0：5131/5131；173named/72逐bit divmod/48个epoch观察及constructor、
  nonfinite numeric锁epoch、cap、metadata、axis、无Node新参考全部通过，只有8个旧warnings。
- 用户最新授权“可以多commit一下”，覆盖历史不commit决定，AGENTS与当前用户决定已同步。
  首次四后端验收后提交完整基线，后续按切片提交；历史无commit记录仅作当时事实。
- shared inverted SVG与checked文档示例已新增，文档/最终门禁待完成；无live。

- D19 info&&fmt exit0；接口快照审查只有ticker/date/pkg.generated.mbti变化：新增opaque
  MicrosecondLocator及其方法，DateLocator新增interval_value/microsecond_locator getters；
  无签名删除/foreign类型泄漏。D19-interface.diff已保存。最终check-all93266确认live。
- shared inverted SVG及checked constructor例已补，完整JS基线5131后新增2项待最终门禁。
  docs/root兼容/依赖/许可/参考指南已同步；.gitignore增加Python开发缓存排除供首次commit。

- 最终check-all93266 exit0：142tasks/8旧warnings；source--check34675 exit0：173named，
  JSON/黑盒/白盒/epoch helper与生成器一致。test-all54489确认live，先轮询该ID；
  运行中不改源码/测试输入。Git首次commit待四目标结果。

### D19 已验收（2026-10-23）

- test-all54489 exit0：wasm/wasm-gc/native各5126/5126，JS5133/5133。比D18新增252通用
  （173named+72divmod+2hand+2epoch独立+1axis+1sharedSVG+1checked doc）与1JS无Node。
- info&&fmt完成；check-all93266 exit0 142tasks/8旧Ref warnings/0error；source--check34675
  exit0 173named/72divmod/48epoch观察，生成文件与固定原源一致。无live。
- 精确Double interval、首aware/首naive转换/offset截断、date2num阶段epoch顺序、负DST/
  TZif、neighbor/duplicates/年界、Python商修正、Auto字段直传、数值倒置与clip区别验收。
- 接口只有opaque MicrosecondLocator/方法及DateLocator两个getter；old Int32 interval为
  trunc/saturate兼容投影，nonsingular exact。eager cap100000，NaN/Inf interval typed拒绝。
- README/COMPATIBILITY/PLAN/DEPENDENCIES/NOTICES与microsecond参考指南同步，无新依赖。
- 用户新授权本地commit已写AGENTS/当前决定；Git初次commit待下条记录，整体goal仍active。

## D20 执行顺序

- [x] D20-01 定向读取MultipleLocator/view_limits/nonsingular/rc与现ticker/axis/contour，
  冻结构造/更新/adapter copy/倒置、非finite范围、共享Double kernel与typed错误边界。
- [x] D20-02 实现命名数值MultipleLocator、实际复用微秒网格、axis/contour接线与原源参考。
- [x] D20-03 参考--check、接口/文档与四目标验收并做本地commit。

### D20-01 契约冻结与首次commit

- 本地首次基线commit 1b61c4b：feat: establish MoonBit Matplotlib migration baseline through D19。
  644文件全部既有工程/源码/原源fixture/许可证，排除build/upstream/Python缓存；提交后干净。
- 固定原ticker.py MultipleLocator/Edge与transforms.py _nonsingular、axes._base margin/sticky/
  locator.view_limits顺序已读。D20-before已建立；无live。
- 新公开MultipleLocator持有有限正Double base与有限offset；new默认1/0，set_params可选择
  更新base/offset、None等同省略，typed验证后更新；copy独立。tick_values checked输出源升序
  及外侧邻接点，Generic Locator adapter按既有输入方向约定输出、错误映射[]。
- 新Locator::Multiple(handle)/MinorLocator::Multiple(handle)；generic copy为新variant保留live
  handle，显式MultipleLocator.copy独立。axis主/次/shared/secondary与contour用同adapter；
  minor adapter沿既有范围clip/去主刻度协议，direct对象保留原源全部点。旧variants不变。
- 现date Micro与新numeric Multiple有实际共享需求，提取internal/tick_grid：CPython divmod、
  Edge ge/le、offset multiple ticks，100000前缀/非finite alignment/count错误。date映射DateError，
  numeric映射DataError；不复制两套算法，D19所有参考作为回归保留。
- 新config.axes_autolimit_mode data/round_numbers（默认data，RcParams复制/reset/getter）；
  Multiple.view_limits每次读取rc，round按原始bounds分别le/ge后nonsingular，保留source
  特殊相等时±1而非±step；data仅_nonsingular(expander=.001)。inherited nonsingular用.05。
- Axis numeric_nonsingular_bounds仅对新Multiple在margin前展开；Axis.view_limits在自动范围
  margin/sticky之后调用其view_limits，显式/暂存view优先且方向保留；backend现计算链复用，
  不改旧date/其他numeric行为。现tight/auto_view限制须在参考/指南明确，不能声称完整autoscale。
- 原源参考覆盖fraction/offset/负值/倒置/临界ULP/极值、更新失败/独立copy、data/round rc/
  nonsingular；再补共享轴/secondary/contour/主次SVG及D19全回归，四目标验收后commit。

### D20 并行执行与基础实现

- 用户明确授权将任务分成独立subagents；已启动multiple_reference（原源generator/direct测试）、
  multiple_integration（axis/secondary/contour/sharedSVG/config测试）、multiple_docs（指南/rootdocs）。
  root负责生产/共享kernel/整合门禁/commit，三者不运行Moon测试或提交，避免并行改测试输入。
- 生产已补MultipleLocator、mutable参数/copy/direct/adapter/rc view_limits/nonsingular；
  Locator/MinorLocator新增Multiple handle，旧variant保持。copy_secondary_locator在scene及IR
  改委托现有Locator.copy，保留live配置。内部tick_grid抽取D19 arithmetic并供date/numeric调用。
- D19的72divmod逐bit参考移至internal/tick_grid，D19generator相应调整路径，固定观察不变。
- config新增axes_autolimit_mode与复制/reset/getter；Axis pre-margin nonsingular与postmargin
  view_limits已接线。首次check-js39547为IR secondary enum match缺新variant失败，已改copy委托。
- 无live Moon test；后续等待三agent停止写文件后统一验证。当前未验收，无第二次commit。

- D20第二次static JS exit0：19tasks/8旧warnings/0error；D19原源--check exit0 173named，
  72divmod移动路径后的生成数据一致。共享ticks已增加NaN/Inf bounds前置拒绝以避免backend
  min/max差异；checked constructor文档例已补。各subagent仍写独占文件，不启动Moon test。

- 集成预检发现新Multiple邻接点在SVG append_grid/secondary仅做finite筛选，会绘制轴外
  标签/网格。按固定axis.py::_update_ticks与transforms._interval_contains_close，root新增
  tick_in_view：变换后的view+1e-10相对容差，主次/secondary绘制过滤，API仍返回原邻接点。
  integration agent补x/y secondary与轴外邻接点标签回归；源码hash沿既有axis固定hash。

- 三agent已交付并停止写入：reference 198grids/9updates/3ctor错误=1200观察组，202原源test
  blocks+4typed hand，生成/--check exit0；integration 4独占文件13tests；docs六独占文件已同步
  仍标D20接入中。没有agent运行Moon test或commit。source budget只观察8前缀，不伪造源错误。
- 现在开始统一JS门禁，若失败先等进程结束再改输入。root最后补的tick_in_view已纳入13场景回归。

- 统一JS39152 exit1仅编译问题：参考generator用defer try!须加花括号，backend新依赖需for
  wbtest而非for test；已修generator并再生成（173日期参考不变），独立参考仍1200观察。
- JS44384确认live；先轮询该ID，期间不改源码/测试输入。所有agents已停止写入。

- JS44384已exit2：5353中5352通过。全部198grid逐bit/1200观察、13集成和D19回归通过；
  唯一旧lifecycle断言要求在view[5,15]绘制tick1的one标签，与source可视过滤矛盾。
  保留共享tick[1,10]，测试改核对可见ten、不可见one及detached，原removed/shared目的保持。
- 没有live test；接下来info&&fmt/接口review，再最终check/test-all及两source --check。

- D20 info&&fmt exit0，接口review符合预期：ticker新增Multiple对象/variant/getters/便利函数，
  config新增autolimit getter/setter/snapshot getter，axis新增numeric_nonsingular_bounds；
  date接口无变化，内部tick_grid无foreign类型。D20-interface.diff保留。git diff --check通过。
- check-all65736确认live；最终test-all现在启动，source--check两脚本并行只读验证。

- 最终check-all65736 exit0：180tasks/8旧Ref warnings/0error；numeric原源--check exit0
  198grids/9updates/3ctor=1200观察组，日期原源--check70461 exit0 173named。
  最终test-all78599确认live，先轮询该ID；目前不改源码/测试输入。

- 等待D20最终test-all期间，multiple_reference与multiple_integration接只读D21分析：固定
  LinearLocator/IndexLocator/FixedLocator合同及现axis/data interval适配，禁止写文件/Moon测试。
  multiple_docs已完成idle。D21尚未实现/冻结；当前仍以D20验收为优先。

### D20 已验收（2026-10-23）

- 最终test-all78599 exit0：wasm/wasm-gc/native各5346/5346，JS5353/5353。比D19新增220通用
  （202原源test+4typed hand+13集成+1checked doc）。D19原日期与72逐bitdivmod全部回归通过。
- info&&fmt完成；check-all65736 exit0 180tasks/8旧warnings/0error；numeric原源--check
  exit0 198grids/9updates/3ctor错误=1200观察组，D19 micro原源--check70461 exit0 173named。
- 新Multiple有限正base/finiteoffset/原子set/copy独立与live adapter、倒置与neighbor/offset/
  ULP/非finite/极值cap/动态rc、nonsingular与view_limits .05/.001、pre-margin/sticky顺序验收。
- SVG按source变换后view+1e-10容差筛选主次/secondary，formatter保留全ticks；旧lifecycle
  测试改核对view[5,15]可见ten/不可见one，继续验证移除轴不传播。无截图/输出快照随意刷新。
- 接口审查符合预期，date接口不变，内部tick_grid跨numeric/date真实复用；无新依赖/C/Python。
- 三subagents独立交付并全部整合；D21两agent只读分析中，禁止修改源码/测试直至新分派。
- README/兼容/计划/依赖/许可及两guide同步；本切片本地提交，整体goal仍active。

## D21 执行顺序

- [x] D21-01 合同定向冻结（Linear/Index/Fixed、None/presets/alias/nbins/错误/view/data边界），
  真实data interval接线设计与独占文件分派，建立D21-before。
- [x] D21-02 三命名类并行实现/各自原源参考，root整合enum/axis/shared/render/secondary/contour。
- [x] D21-03 docs/source--check/接口/四目标验收并本地commit。

### D21 定向只读事实（尚未冻结/实现）

- D20本地验收commit为 d385718，上一基线1b61c4b；提交后工作树确认干净，无remote。
- multiple_integration只读报告已完成；multiple_reference正在补alias/极值观察。未来三类可
  按ticker/locator_linear.mbt、locator_index.mbt、locator_fixed.mbt独占实现并各带原源
  generator/JSON/test；root独占ticker/locator.mbt、axis/view/ranges/render公共接线。
- Linear源默认numticks None→getter11，0/1语义不能用旧linear helper；先.05 nonsingular
  再presets查找再0空，presets键是已展开排序后的range。round view_limits在numticks<=2时
  log10(max(n-1,1))=0导致除零，必须checked API；不要用非raisingMultiple view协议掩盖。
- Index源从vmin+offset开始到vmax+1e-12（不是+1），不排序/齐倍数。构造不检查base，
  finite负base支持下降、0延迟到tick错误；不能套Multiple正值guard。
- Fixed direct忽略bounds并保留顺序/重复/外侧值；ctor nbins<2夹2，set_params保留0/负数，
  0延迟除零、负数返回全部。stride择最小abs、平局先遇到；空/NaN/alias待reference报告。
- 新named variants必须在generic全局finite guard/排序之前独立dispatch，旧linear_locator
  默认7/count钳2、linear_ticks默认6/point1值、旧fixed严格有限递增/裁范围均保持。
- Index.__call__读axis.get_data_interval。现raw_scale/grouped_raw_scale已被显式view覆盖，
  不能冒充data interval；须从artist_data_scale真实数据建立context，再用最终view过滤绘制。
- shared Index ownership尚未冻结：原Axis data interval为各axes本地dataLim，共享Ticker但
  Locator.set_axis保存最后绑定axis。不能直接声称shared数据union；secondary Index同理。
- 当前无live Moon session，D21未实现；若交接从以上未冻结点继续，不重读已完成D20survey。

### D21-01 冻结补充与并行实施边界

- 原源只读报告已完成，D21-before已保存；当前code基线d385718，所有D20门禁保持。
- Linear new/raw numticks:Int32?保留None但getter11；负数/0/1接受，错误按源延迟。set_params
  None不改；set_numticks(Option)可映射property reset。presets用共享可变typed store，
  同key后写覆盖、nonsingular后匹配；命中返回borrowed值view，copy浅共享store但替换store独立。
- 原源NumPy linspace按delta/div、step下溢(index/div)*delta、num>1最终endpoint覆盖；
  ±max且num1→[NaN]、num2→[NaN,max]。固定function_base.py SHA
  413d696e597ff2b7ffdd9b06b4b42801e435392a82a9e006b4c4f33c013523fc。
- Index base/offset保留完整Double（包括0/负数/NaN/Inf），new/set不前置验证；source NumPy
  arange错误延迟至tick。实际fill step=(start+base)-start；正ratio下溢0仍1点，支持Inf step
  首点等原行为。provider绑定可选callback供root接线，copy保留当前provider但参数独立。
- Fixed nbins:Double?覆盖源实际fraction/NaN/Inf域，new用Python max(nbins,2)顺序，set不夹。
  locs Array[Double]表示borrowed ndarray，另from_list构造复制；copy浅共享buffer、nbins独立。
  None结果及stride subsample必须返回共享可变view，不把物化Array声称alias兼容。
- root新增opaque TickValues(buffer/start/stride/length)，支持length/get/set/to_array/copy；
  Linear/Fixed direct tick_values返回TickValues，adapter显式to_array。稳定shape借用buffer，
  get/set/to_array对外部shrink错误raiseDataError。LinearPresetStore共享可变键/array值。
- 三agent将分别负责每类direct对象+独立原源generator/JSON/tests；root负责TickValues、
  nonsingular共享helper与generic enums/adapters/axis/data/render/checked错误链、统一门禁。
- root新增Axis.view_limits_checked并供checked scale/render传播Linear源range错误；原nonraising
  convenience沿try!惯例。Figure.to_svg_checked调用checked render，避免range错误被panic吞没。
- Index必须真实本地artist data interval；Axis绑定callback最后显式rebind请求设置的轴，
  模拟source共享Ticker但locator.axis指向调用者；先更新各panel真实data，再按view过滤绘制。
  shared/secondary具体接线原源观测由root进一步核实，不以union替代所有权。
- 旧helpers全部保持；named variants在旧guard/sort前dispatch。100000 eager前缀限制保留，
  Linear巨大numticks只保留真正前缀，不把最后一项误写成完整end；budget不冒充source错误。

- D21三个agent已切到真实独占类实现：multiple_reference→Linear+presets+其source/tests，
  multiple_integration→Index+其source/tests，multiple_docs→Fixed+其source/tests。
  各自可Python生成/--check/逐文件moonfmt，不跑Moon test/info/全fmt或commit。
- root已新增TickValues borrowed/strided buffer view基础(get/set/to_array/copy/checked shape)，
  并将multiple_nonsingular改名为可跨类复用的package locator_nonsingular。尚未统一编译/验收。

### D21 当前root整合（尚未编译/验收）

- Linear owner已交付6文件（206原源+4hand/949观察），Fixed owner已交付5文件（469原源+
  4hand+1doc，456cases/12alias/9ranges/4shape）。都已停止原实现文件写入；Index owner
  正实现NumPy Darwin arange fill FMA的纯Moon精确舍入，避免放宽逐bit参考。
- 原_api源码已补fixed commit/hash7e262cedd8ce1a1660c2e2caa63adeb078c29e36bd541b8e6f773cfed4c3c782；
  secondary源同commit补齐hashb2aaaae077e03ff6538d1a4bf8a69c3476eed0e27120aa567de138c794599a93。
  raw curl曾reset，GitHub contents API成功；secondary不持数据、只随父view变换的源行为已读。
- root新增TickValues与1个stride/negativeindex/shape checked白盒；newnamed adapters及getters/
  checked materialize、100000前缀、minor裁范围保序已写。NamedLinear反向按既有port方向，
  NamedFixed忽略bounds与保留任意序列，Index不排序。旧variants在原guard/sort路径保持。
- root新增Axis data_interval callback/bind、checked view/ticks/minor ticks；Scene按本地artists
  动态转换IR并复用SVG artist_data_interval，避免缓存过期或把显式view/shared union冒充数据。
  shared foreach安装后显式rebind真正调用的axis；直接Axes.x_axis getter也提供数据context。
  secondary绑定Index到自身空data interval，不取主轴view当data。
- root checked scale/render链及Figure.to_svg_checked已接线，新named源错误向CoreDataError传播；
  旧nonraising convenience沿try!，旧legacy locator/date安全[]协议保持。
- Linear agent又负责3个新集成测试文件；Fixed agent转D21六份docs；二者不碰生产或旧tests。
  所有agent禁止Moon测试/info/全fmt/commit，当前root未运行Moon测试，尚无live Moon session。
- 下一动作：等待Index FMA/两agent独占新集成/docs停止写入，先统一static/JS编译修复（目前
  大量公共接线尚未编译，勿误标完成），再原源差异、shared Index ownership实证、文档/接口/四目标。

- static JS第三次exit0：22tasks/9warnings（8旧Ref+1新unused compute_scales wrapper），生产
  核心类/公共接线已可编译；将删除多余wrapper并保留checked compute_scales供现whitebox。
- Index owner已交付并停止写入，236generated+4hand/232grids/9updates/3providers/3FMA观察，
  NumPy binary SHA44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305。
- Linear owner新增13集成tests已交付停止；Fixed owner正做独占Index ownership source/tests，
  尚未停止写这些新tests，所以root没有运行Moon test。
- Root按固定Figure._remove_axes补共享owner删除后major/minor Index重绑到首个remaining轴；
  figure.py SHA b440ab0a5be03cb39b13529a2fec497d2d96deb083e3e56d6220593e3ec567da。

- D21推进中：Linear/Fixed源ndarray_view参考原先只核对logical Array，root审查后增加实际
  owner buffer/negative stride/nested stride/zero stride别名观察；不能把flatten副本当np view。
  root TickValues.view(start,stride,length)已落盘，stride内部Int64，首尾/shape checked，支持
  negative start/stride、zero stride与empty；增加nested/极值descriptor白盒。Fixed locations
  改TickValues/from_view，Linear presets加set_view，由原独占agent升级5/6文件，不改公共文件。
- 当前owners：multiple_reference→Linear6文件，multiple_integration→Fixed5文件，
  multiple_docs→Index axis source+JSON+scene/backend两个新测试共4文件；均禁止Moon test/info/
  fullfmt/commit。root统一接线/检查。Index原实现与13个named集成测试已交付不再写入。
- root移除unused compute_scales wrapper，checked compute_scales沿原名供render与WBtests使用；
  static JS第四次正在执行，日志D21-check-js-4.log。此时没有live Moon test。

- 三类/所有新tests writers均已停止：Linear最终184ranges/20presets/3alias/6updates+7strided×4
  阶段=977观察组，213generated+4hand；Fixed456cases/24真实owner alias/9ranges/4shape，
  481generated+7hand+1doc；Index232grids/9updates/3provider/3FMA=961观察组，236generated+4hand。
- Index axis原AST oracle 4traces(x/y×major/minor)、32ownership+6secondary观察、8集成tests已交付；
  13个通用named集成亦已交付。Fixed agent只读review公共接线，docs agent仅更新6docs；
  所有agent已被禁止写源码/测试。root现在首次统一JS tests，日志D21-test-js-1.log。
- static JS第五次exit0：21tasks/8旧Ref warnings/0error（在最后Linear生成前）；第四次
  exit255仅新WB测试旧compute_scales_checked标识与旧locations()[0]，已修正为raising
  compute_scales及locations().get(0)，未把未编译测试误报通过。

- 首次统一JS44940 exit0：6322/6322；全新原源bits/真实owner views/21集成与旧回归均通过。
- moon info&&moon fmt exit0；D21-interface.diff保存：预期新增3类/Presets/TickValues与view、
  live enum/getters/checked adapters、Axis data provider/checked ticks/view、SVG artist_data_interval
  与checked render；date接口无变化、无foreign类型/运行时依赖新增。git diff --check通过。
- 最终check-all已启动日志D21-check-all.log；接下来四目标test-all与六脚本source--check。

- D21最终check-all首次exit0：88tasks/8旧warnings；尚未开始最终test-all。
- agent只读review发现真实source差异：data provider复用display scale时会把log非正坐标
  过滤掉，错误改变Index origin（x[-2,2,4],base3源ticks[-2,1,4]，旧新实现错[2]）。
  原Bbox.update_from_path AST与Index实证已确认。root已把新artist_data_interval收缩为
  (artists,horizontal)并以双linear收集原始finite点；旧display/autoscale筛选保持原实现。
- multiple_integration现拥有3个新文件：scene/index_data_scale_test.mbt、独立generator/JSON，
  补log x/y与另一坐标log负值的data回归及原AST证据；未运行Moon test。等其停止写入，
  再info&&fmt/接口review/最终四目标。其余两个agents只读或idle；6docs最终API/计数已同步。

- 六个固定source --check已启动并行只读：Linear/Fixed/Index/Index axis/Multiple全部exit0，
  microsecond source session54634仍live（只读参考，不是Moon测试，可继续实现log补丁）。
  日志D21-source-*.log。generator经moon fmt后产物仍一致，原源bits未放宽。

- microsecond source54634 exit0，六个source --check全部通过；已无live source/Moon session。
- log data source/JSON/4tests已交付停止；原Bbox.update_from_path纯NumPy body+Index实际执行，
  display identity/log10仅fixture边界。root新raw data helper不再受x/y display scale影响。
- 另一只读审查确认3/4共享轴删除顺序差异：原Grouper首次join登记顺序每组[axis1,axis0,
  axis2,...]，不能按Figure创建顺序选first sibling。实际执行原Grouper/GridSpec.subplots/
  Axes.sharex/sharey/Axis setter/Figure._remove_axes，11删除case中旧实现5例owner错。
- root新增AxesData私有share_x_order/share_y_order，Figure/SubFigure新grid记录初始每组
  [1,0,2,...]rank，删除按remaining最小rank重绑major/minor。顺带纠正SubFigure y Row/Column
  分组反置，以原GridSpec按row/column语义为准。未扩公共API。
- multiple_docs当前独占新增shared order generator/JSON/scene test三文件，含3/4axes、
  row/column、SubFigure、连续删除与external copy；等停止写入再统一最终门禁。
- 新固定源hash：cbook.py e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643；
  gridspec.py df8395306765d9b93f98d6b2e867836a9b2b0786cf5b39a26103309c4331afde；
  axes/_base.py ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b。
- D22候选MaxN+Auto只读报告已收到，agent将保存在ignored D22-readonly-notes.md；仍以
  D21最终验收为先，不提前扩实现。AutoMinor无刚性依赖可后续独立迁移。

- static JS第六次exit0：16tasks/8旧warnings；log raw-data及初始shared rank生产接线可编译。
- SubFigure共享组ID分配发现旧reserve1与row/column多组相撞风险；root把私有allocator改按
  All1/Row rows/Column columns预留完整负ID区间，列分组统一group-column。新的shared order
  oracle/tests追加跨两个SubFigure互不共享与连续删除，避免分组碰撞改变Index owner。
- root当前修改仅D21接线；Linear/Index/Fixed direct core均停止且首次6322JS已过。最终
  shared order三文件仍writer active，尚未启动最终Moon test。D22 notes仍待agent落盘。

- 真实shared order三文件已交付停止：60traces/tests、228stages、84removals，原完整Grouper/
  GridSpec.subplots/Axes.sharex/sharey/Axis setters/Figure.remove实际执行，含Figure/SubFigure
  all/row/column、3/4成员、连续删除、外部copy与两个SubFigure独立分组。rootrank/ID预留修复
  已纳入，public API无新增。静态JS第七次exit0：11tasks/8旧warnings。
- root按Axis.clear原源保留data provider context（仅构造None），加1项clear→新plot→旧Index/
  copy读取新数据回归。原Axes.clear保留旧dataLim直到首个新artist更新；当前Scene实时collector
  清空后立即empty，明确作为尚未实现的dataLim cache/relim边界写guide，未冒称源cache完成。
- 所有source/test/doc writers已停止。最终info&&fmt59835 exit0；接口review保留预期3类/
  view/checked/provider，并将artist_data_interval收缩为(artists,horizontal)不导出scale参数；
  date接口与scene外部类型无变化。git diff --check通过。D21-interface.diff已刷新。
- 开始最终check-all（D21-check-all-final.log），随后test-all及两个新source --check。当前
  D22定向笔记已落盘 .moonagent/checkpoints/D22-readonly-notes.md，235行；D21验收前不实现。

- 最终check-all28603 exit0（详情D21-check-all-final.log，8旧Ref warnings）；最终test-all
  session4524 live，日志D21-test-all-final.log，期间禁止改源码/测试/README doctest输入。
- 新raw data source --check exit0；真实shared order source --check session75085 live（只读），
  日志D21-source-index_shared_order.log。其余六source --check均已exit0。先轮询这两个ID。

### D21 已验收（2026-10-23）

- 最终test-all4524 exit0：wasm/wasm-gc/native各6380/6380，JS6387/6387；比D20每目标新增
  1034tests（930generated+15hand+1checked doc+2view WB+86轴/场景/后端集成）。
- 最终info&&fmt59835 exit0；check-all28603 exit0：79tasks/8旧Ref warnings/0error；
  Linear/Fixed/Index/Index axis/raw data/实际shared order/Multiple/D19 micro八份原源--check
  全部exit0。source shared75085已结束。日志与接口diff保存在D21-*，无live session。
- 213Linear参考/977观察组、481Fixed参考/456cases24alias9ranges4shape、236Index参考/
  961观察组、Index axis4traces32+6观察、raw data4case8观察、实际shared order60traces/
  228stages/84removals通过。原源逐bit与真实buffer写回均未放宽或用实现生成预期。
- 三命名对象/Presets/TickValues真实有符号/嵌套/0stride别名、浅copy与store替换、延迟
  checked错误、固定Darwin NumPy fill、旧helper兼容、主次/contour/shared/secondary/SVG
  门禁通过。数据按原始finite点收集，log显示不改变Index origin；实际Grouper登记rank
  跨连续删除保留，多个SubFigure row/column分组ID隔离，provider context跨Axis.clear保留。
- 明确未迁移：完整Python动态/多维/dtype/无上限物化、任意平台NumPy fill profile，以及
  上游clear后首次data更新前保留旧dataLim的cache窗口/显式dataLim修改/relim协议。
- docs/兼容/计划/依赖/许可与guide已同步。D21切片本地提交，整体goal持续active；工程
  百分比维持46%全目标/80%核心二维SVG，不因测试数膨胀而调整。
- 三agents全部停止写入。D22 MaxN/Auto只读笔记235行已保存；下一步按head冻结新切片，
  勿重做已完成D21项目survey或重复通过门禁，除非新变更使其失效。

## D22 执行顺序（尚未冻结/实现）

- [ ] D22-01 读取定向笔记后冻结MaxN/Auto及真实tick-space合同、保存D22-before并明确文件所有权。
- [ ] D22-02 三个独占工作包并行实现/原源参考，root整合numeric kernel/enum/checked axis/render。
- [ ] D22-03 文档/原源/接口与四目标验收，按通过步骤本地commit。

已确认的方向（完整235行依据在 .moonagent/checkpoints/D22-readonly-notes.md）：

- 旧maxn_locator继续legacy，不能仅改名。源nbins是间隔上限、默认10；默认steps包含1.5/3/4/6/8，
  允许外邻接ticks，min_n_ticks/integer需按源逐级放宽，scale_range含大offset。
- MaxN set_params按源顺序逐项写，后续steps错误可能留下早先更新；不套Multiple原子规则。
  prune的None重置与省略保持需typed区分；steps borrowed输入与extended snapshot的别名分开。
- 当前tick_grid零offset Edge不足，须补abs(offset)相关容差。tick/view与继承nonsingular的
  tiny/expander参数不同；完整nticks决定step，prune先按完整raw序列再取前缀，round view要
  真实full端点，不能用100000 cap改变选择或错误语义。
- Auto应薄封装共享MaxN，构造捕获classic_mode，后续沿继承set；auto绑定axis时使用真实
  physical tick-space provider，不能拿现tick_count冒充。X/Y物理尺寸与label size合同仍需
  定向读原方法后冻结；3D分支留待3D，AutoMinor无刚性依赖可后续独立切片。
- 建议独占包A：MaxN params/steps alias与原源参数测试；包B：raw grid/scale_range/offset Edge/
  浮点数值核与原源网格；包C：Auto/classic config/provider/集成。root负责跨文件API与axis/
  render接线、全门禁，所有Moon tests/info/fullfmt由root在writers停止后统一运行。
- 当前三个agents idle/已完成，没有live tools；不得把这份准备记录标为D22实现。
