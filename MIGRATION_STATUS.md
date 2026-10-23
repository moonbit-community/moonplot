# 迁移工作状态与待办

更新时间：2026-10-24（Asia/Shanghai）

这份文件是跨上下文压缩的工作接力清单。开始新的工作回合时，先读本文件，直接执行
下一条未完成项；只有需要范围或历史依据时才查阅 `MIGRATION_PLAN.md` 和
`COMPATIBILITY.md`。每完成一个步骤或检查就更新，避免依靠聊天摘要恢复进度。

## 检查点：从这里继续

- 当前切片编号：D42 secondary numeric location/alignment已完整四目标验收并分批提交48d1c3c/b8ee64a；checkpoint后准备D43位置Affine参数。先读文件尾，勿重跑D37–D42已过门禁。
- 历史D26：命名AsinhLocator raw参数/Sequence与NdArray不同truth/onlyview主次/shared/
  secondary/contour/SVG、完整linspace/outer排序去重后fallback与cap、最小Asinh geometry。
  raw Python请求与实际Float64 arange shape分离，decimal按恒定pows分段，NaN保数量尾置。
- D26最终四目标：wasm/wasm-gc/native各11116/11116，JS11123/11123；新增1061=
  A参数107+数学399+Bgrid487+Caxis68。info&&fmt、reviewed interface、checkall94tasks
  （8旧Ref warnings/0error）、四新source --check全部exit0。数学sqrt/ln/Taylor区间与
  grid分类/rank/fullset及公共接线经独立只读复核，无新外部依赖。
- D26portable asinh/sinh/log10承接D24正确round合同；原平台8primitive差异与42collection
  差异（39近边界+2tiny+1旧3^34）保留双值，不冒称Darwin bitclone。Core Asinh geometry
  使用现有math，便捷sampler与完整AsinhScale默认安装生命周期明确分开；后者仍待迁移。
- D27最终验收：finalall77638 exit0，wasm/wasm-gc/native各11995/11995、JS12002/12002；
  checkall31tasks/8旧warnings/0error。info&&fmt0、预期接口已审，MaxN/date公共签名不变。
  三source --check全部exit0（grid最新71661；params/axis此前通过后未变化）。新增879=
  A参数121+Bgrid633+Caxis124+root独立MaxN回归1；所有tracked writers停写。
- D28最终验收：new352=A85+B196+C70+root1；全suite29320 exit0，wasm/wasm-gc/native各
  12347/12347，JS12354/12354。B随后仅删8条空samples恒真比较，JSON/其余断言原样；
  final1325 infofmt0、checkall24tasks/8旧warnings/0error、192generated×四目标全过。
  三source root复验0（B final0）；接口全文审且finaldiff逐字未变，旧Formatter pure签名不变。
- D29最终验收：new5161=A63+B2881+C1990+rootnumeric162+mask1+axis64；final38939 exit0，
  wasm/wasm-gc/native各17508/17508、JS17515/17515；infofmt0/checkall83tasks8旧warn0error，
  六新source final0。完整接口仅2newnamed/wrapperdowncast/select_mask，旧pure接口不变。
- D30最终验收：final16019 exit0；新增2293=96A+2079B+117C+1config；wasm/wasm-gc/native
  各19801/19801、JS19808/19808。info0/fmt0/checkall79tasks8旧Refwarn0error；168行接口已审
  finaldiff逐字cmp同。三新source root0（A rootlog、B/C final logs），原JSON源期望保持。
- 下一条具体动作：D42 full3809四目标全过，finalstatic info4/fmt1/check24与source74829均terminal0，接口final逐字同；feature48d1c3c与reference/docs b8ee64a已提交。提交本checkpoint→保存D43-before→读C187line/A34actualrecords最终notes→freeze窄Affine参数与installed locator快照，不重D42门禁。下列D36/D37历史门禁勿重跑。D36已验收，feature ed34eb0（32files，主要新增行是完整JSON/fixtures）。
  full82531四target同1旧minor getter/draw边界假设失败，原完整source确认后仅修该test，
  定点24001四目标各6/6全过，其余已过项目未变；累计nonJS21853/JS21860全覆盖。
  finalinfofmtcheck0、77line接口全文审并finalcmp同，两newsource46918/1739 final0；
  A126line Scene独立审/B140line mixedmeta独立审均Root全文读无新具体缺陷。
  下一D37真实autoscale_view：复用219line notes与现有ranges/data源，不重survey/不重跑D36。
  需独立auto-enable/stale/tight/view/dataLim语义与共享checked范围链设计freeze后推进。
  当前无live工具/无用户阻塞；用户授权多commit与并行agents继续有效。整体goal尚未完成。
  首全量32763四target同9个fixturefail，之后仅两fixture修正，补验25631各13/13全过；
  当前累计nonJS21823/JS21830全验证覆盖。final92913 infofmt0/check79tasks8旧warn0error，
  93行接口逐字cmp同；六newsource最新全0。原实际sourceoutputs不改，派生metadata修正已审。
  D34-before已保存HEAD c7ce6b404750fb6babe98e2e2254ee508369869a的tracked.tar/41份mbti。
  Root Base/batch/Scalar穷举适配、typed locations及真实shared set kernel均已验收。
  D33 full25520、追加exacthalf过滤82978、final80311、四source均terminal0；无live工具。
  nonJS21700/JS21707全过；152newregistered承载4557validationcases，251行接口全文审且
  final逐字cmp同；finalcheck28tasks/8旧Refwarn/0error。所有原JSONexpected保持。
  Root基础feature f92729d（8files）+Log家族feature6dea404（36files）已本地提交；
  无remote/push。D33-before HEAD5f9cfcd archive/全部mbti保留，不重跑D32/D33已过门禁。
  整体goal仍active；旧46%/80%已撤回。D33后重估全目标约50%（40–60%区间）、严格静态2D/SVG约55–70%；依据见MIGRATION_PROGRESS.md，不按tests换算。
- D27无live工具；finalall77638与grid-source71661 exit0，95932旧失败exit2、73479 probe exit0、JS30690 exit0均terminal。
  81493 compileexit1/40418旧5failexit2/62175与29316 sourceexit0都terminal，不轮询。
  D26 final26297/JS82640/source20346/check99335全exit0；
  过早check65209经主动SIGINT exit130已terminal；所有writers停写，不轮询旧sessions。
- Git本地基线1b61c4b（D01–D19）；D20 d385718、D21 2403fcb、D22 fee6885、
  D23 179f365、D24 13ef0b1、D25 c2f6edf；D26 feature61f768f/checkpoint78b0b68、D27 feature524b673、D28 feature53ed70d、D29 feature0b4f8c5、D30 feature11112e9、D31 feature38505e5、D32 feature497212a、D33基础f92729d/家族6dea404已提交。无remote、不push。
  用户已授权分批commit与独立并行subagents，覆盖历史不commit指令。
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
- 下一纵向切片候选：命名基础Formatter（Null/Fixed/Func及基类生命周期）；命名LogitLocator、最小Logit几何、命名AsinhLocator/最小Asinh几何、命名SymmetricalLogLocator、命名LogLocator、命名AutoMinorLocator/NullLocator、命名MaxNLocator/AutoLocator、命名LinearLocator/IndexLocator/FixedLocator、通用数值MultipleLocator、命名MicrosecondLocator与fractional interval、跨级clock mask checked查询错误、命名日历/时间locator家族、命名YearLocator与自动年分支、公开rrulewrapper/自动locator recurrence接线、typed日历相对运算relativedelta、默认timezone rc 与日期时区解析、datestr2num / dateutil 默认日期解析、可移植 C locale 日期格式指令、DateConverter/ConciseDateConverter 与 date.converter、完整AutoDateLocator、AutoDateFormatter/ConciseDateFormatter/日期epoch/时长/数值序列、recurrence 缓存/迭代器、
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

## D22 执行顺序

- [x] D22-01 读取定向笔记后冻结MaxN/Auto及真实tick-space合同、保存D22-before并明确文件所有权。
- [x] D22-02 三个独占工作包并行实现/原源参考，root整合numeric kernel/enum/checked axis/render。
- [x] D22-03 文档/原源/接口与四目标验收，按通过步骤本地commit。

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

### D22-01 冻结与独占分派（2026-10-23）

- 上一goal回合分类progress：D21已验收，2403fcb代码+8714983检查点提交，当前开始时工作树干净。
- 已读取D22全部235行笔记与固定MaxN/Auto/Edge/scale_range/XAxis/YAxis.get_tick_space原方法。
  D22-before从git HEAD归档ticker/scene/backend/grid/config/docs，未混入新untracked实现。
- A(multiple_reference)独占locator_maxn.mbt参数/steps/providers/copy及params generator/JSON/2tests；
  B(multiple_integration)独占maxn_grid/maxn_ticks、数值generator/JSON/2tests，可提取Index FMA到
  numeric_fill并只改Index调用共享helper；C(multiple_docs)独占Auto薄对象/config classic及其
  generator/JSON/2tests，附只读physical/secondary原源分析。root独占helper/enum/axis/render。
- MaxNBins Auto|Count(Int32)，steps传TickValues保留真实view；set_params steps?:TickValues?与
  prune?:String?区分省略保持/None重置。保留源nbins→symmetric→prune→min→steps→integer
  的partial-update，不套Multiple原子规则；steps借用/extended snapshot与浅copy分别保留。
- public get/set/bind协议已发agent：tick-space pure ()->Double，view provider为
  ()->(Double,Double) raiseCore，call传播自动view/range/aspect源错误，不try!吞没。
- rawgrid descriptor必须完整nticks决定step、full-prune后prefix cap、round view真实full端点；
  零/负nbins延迟错误，NaN steps源接受；固定Darwin arange单次舍入之后的乘加独立舍入。
- root已扩tick_grid.ge/le可选offset容差，locator_nonsingular可选tiny默认保持旧值；config新增
  私有classic_mode默认false与snapshot复制。尚未编译/验证；不会提前宣布D22验收。
- actual tick-space根源是plot物理长度/字号（x*3/y*2），root将以SVG实际plot region与同一
  渲染字体建立dpi72/user-unit profile并按aspect前后阶段更新，禁止tick_count替代。C正核查
  secondary与FontProperties数值边界；这些接线还未实现。当前没有live Moon session。

- root新增NamedMaxN/NamedAuto主次variants、live getters/adapters与checked dispatch；旧MaxN helper
  不变。Axis新geometry/view context与MaxN owner绑定接入既有setter/共享删除rank流程；Axis.clear
  仅重置字号配置，所属geometry/view/data context保留。Scene view callback通过checked panel_view
  自动解析真实view，tickspace只读物理rect而不递归求view。
- actual tick-space冻结为SVG dpi72/profile：宽/高与font同userunits，x length/(3*size)、y/(2*size)
  floor；数值字号按真实FontProperties clamp<1到1，NaN/Inf保留。root已新增Axis/Secondary
  set_tick_label_size与get_tick_space，renderer正把实际tick文本字号与计算字号保持一致。
- backend先为所有轴提供初始raw布局尺寸用于autoscale，positions全部算完后为所有轴设置
  active尺寸再逐panel查询ticks，避免共享owner受绘制顺序影响；defer恢复临时layout状态。
  Secondary使用父主方向实际长度与自己字号，view按原forward映射/方向；不取tiny厚度。
- A参数5文件已交付停止：51constructor/40steps/12updates/10alias×4stage/3provider=146观察组，
  103generated+4hand，source生成/--check通过。A现在独占新增numeric axis物理source/JSON/
  scene+backend WB四文件，禁止Moon gate。B数值与C Auto source/tests仍在写入。
- static JS-1 79398已exit255，仅root if表达式缺括号3error与新warnings；root语法/effect注解
  已修，A enum显式trait extend与B descriptor priv修正。static JS-2 38613已exit0（8旧warnings）；
  static JS-3正在检查最近secondary/font改动，尚未运行任何D22 Moon test。
- font_manager.py固定源码已补，SHA d0e464bd1aff8e1815d375aa8bfc6dd32869979b348d8ec3b82edd61b8288788。
  全FontProperties字符串/rc继承与可变dpi仍是字体系统边界，不能把当前固定SVG profile泛称全后端。

- static JS-3 exit255仅root secondary pattern需括号2error；已修，JS-4/5均exit0。
  C生成/hand三新warnings已修并再生source --check通过，A Debug显式extend新增debug包import，
  JS-5只剩8旧Ref warnings。当前所有生产包已可编译，D22全源码/tests仍未统一验收。
- root进一步按source locator.axis所有权修正：NamedMaxN/Auto axis路径必须.call()读取最后
  owner的view和tickspace，不能拿当前绘制轴的bounds代替。backend给ALL轴resolved view与
  active几何再画；Scene外call通过checked panel_view自动求view，临时layout.defer恢复。
  major非checked convenience亦走同context/catch[]；minor按既有裁剪/去主tick合同保持。
- C Auto source正式交付：308grids×5查询、16updates、8copy/provider；312generated+4hand+1doc。
  C现只写README/COMPAT/PLAN/DEPENDENCIES/NOTICES和新maxn guide六docs；A参数停止后转
  physical源与4集成文件（含同对象不同轴/secondary最后owner的view+长度）；B数值source仍写入。
- 两稳定源maxn_params/auto_numeric --check开始只读复核，日志D22-source-*.log；不用Moon tests。

- B数值已交付停止：314cases/1574观察组、315generated+4hand。16cap查询源完整枚举
  124999–166668项；Int32.max的3条请求单独预算省略不冒充源错。numeric_fill提取Index原2helper
  代码不变，Index其余运算未变；Node仅数值开发原型1253原源tick/view查询逐bit匹配，尚非Moon门禁。
- B现在只读审查root physical/checked owner/secondary接线；A新四物理文件仍writing，C六docs
  writing，故继续未跑D22 Moon tests。两稳定source maxn_params/auto_numeric root --check exit0；
  root maxn_grid --check启动，日志D22-source-maxn_grid.log。静态JS-5 exit0仍8旧warnings。

- root检查contour的locator入口仍调用safe tick_values吞named错误，已改checked_tick_values；
  legacy路径保持旧返回值。新增1项MaxN contour live/旧levels快照/Count0 delayed InvalidTicks
  回归，避免只有SVG有checked链、contour把源错误误映射成空levels。
- B数值root --check exit0：314cases/1574观察组/3明确预算省略。当前无live tools；A物理
  source/integration仍writing，C六docs仍writing，root尚未运行D22 Moon测试。

- A最后4文件已交付停止：79 physical/font profiles（含11个ULP/非整数size边界）、10布局
  sourcefixtures、2所有权trace×3stage；scene86tests(79source+7integration)+backend3=89。
  原Axis/font/MaxN/Auto AST实际执行，geometry只供应已变换bbox英寸与最小rc，不冒称原renderer。
- C六docs已交付停止，README全部nocheck无新checked输入；物理计数待gate后root补指南。
  B只读review无新实质问题，已转仅ignored D23 AutoMinor/Null定向笔记，禁止实现新slice。
- root物理helper保留length/72*72原运算次序，A已按原方法补ULP临界参考。
- root发现移除轴后的Scene view callback找不到state会错误fallback[0,1]；私有to_render_figure
  现在支持临时extra detached panel，旧locator/copy在脱离Figure后仍按所属axes真实数据/显式view
  解析，未重新附着或改变图层。另加1项automatic detached/copy后续plot回归（与contour共2tests）。
- 所有D22源码/tests/docs writers已停止；root首轮统一JS session28454 live，日志D22-test-js-1.log。
  期间不改源码/测试输入；A/C/B的source --check已各通过，root正式4脚本复核待JS/formatter后。

- 首次统一JS28454已exit2：7221中7220通过；唯一失败AutoLocator provider-copy/rebind classicTrue
  逐bit1.25 vs1。全数值/params/89physical/两个root集成与D21旧回归全部通过，没放宽比较。
- C重新独占原Auto source/generator/JSON/tests必要文件调查单case（six docs停止写入）；
  排查源fixture跨classic循环/alias快照或真实Auto.copy生产问题，必须独立原源证据定责。
  当前无live测试可编辑；下一动作等C交付停止→相关JS核验→info&&fmt/接口/最终四目标。

- C独立原源确认唯一JS失败是实际dtype差异：classicTrue默认steps np.int64，写1.25截成1；
  classicFalse含2.5为float64保留1.25，独立True→False→True稳定且copy确实共享，非fixture污染。
  原期望正确，不排除观察/不改bits/不靠copy局部补丁。
- root将TickValues升级真实私有Float64/Integer64双buffer，新增from_int64_array(Array[Int64])；
  整数set按NumPy截断并checked拒绝NaN/Inf/越界，get/to_array仍Double坐标，view/copy保留dtype。
  私有is_int64/with_values用于MaxN补端点时保留Int64，extended仍独立Float64 snapshot。
- C仅改Auto classic默认改from_int64_array，不动原期望；A重新独占参数validate步骤的补端点
  dtype保留，并新增integer tick source/JSON/test三文件（整型view/alias/copy/cast错误/MaxN补端点）。
  root独占tick_values.mbt，防共享文件冲突；当前无live Moon test，改完统一重验。

- Int64新typed入口也暴露原np.diff/末乘环绕语义，C实际确认源接受极端steps
  [1,Int64.min,-1,9223372036854775806,-3,10]（np.diff环绕全正），staircase末10*Int64.min环绕0。
  不把此域排除：A负责validate的Int64环绕diff/末乘及独立source cases；root提供精确private
  get_int64与with_endpoints，补1/10时原Int64值复制，避免通过Double丢大整数或误报溢出。
- rootstatic JS-6 exit0：22tasks/8旧warnings（在新增极值整型参考前）。A整型3文件/参数修复
  与C六docs仍writing；所有其它D22代码/tests停止，无live测试。B D23只读笔记229行已落盘
  .moonagent/checkpoints/D23-readonly-notes.md，尚未实现，不要跳过D22最终验收。

- 新Int64 typed入口的Fixed.from_view也必须保留整型择phase：C源实证np.abs(Int64.min)环绕仍
  MIN，Fixed([MIN,0,1,2],nbins2)选[MIN,1]；大于2^53的邻接整数不能先Double abs/min后比较，
  否则值打印相同也会写回错误owner位置。
- C新增独占ticker/locator_fixed.mbt：Integer64分支精确get_int64、UInt64环绕abs、Int64 min/
  strict phase比较，Float64旧路径不变。A整型原源3文件追加上述两case与result.set owner断言；
  仍保留MaxN overflow diff/尾乘/补端点Integer精确值与Classic默认write截断。root不碰C Fixed文件。
- 六docs已同步dual buffer、from_int64_array、MaxN wrap与copy/viewcast后停止；整型计数待A交付。
  当前A参数+整型oracle、C Fixed生产仍writing，无live工具。root TickValues helper与Auto
  classic修复已落盘，尚未统一重跑JS/四目标，D22仍未验收。

- A整型最终交付停止：17scalar writes+7real view/copy alias+10MaxN dtype/wrap/端点+2Fixed
  exact phase=36generated，固定NumPy core哈希，生成/--check exit0，原Auto/其它期望未动。
  MaxN exact wrap diff/尾乘与with_endpoints落盘；C Fixed integer abs/min分支也交付停止。
- static JS-7 exit0（8旧warnings）；所有writers已停止，当前开始最终info&&fmt后统一重验。
  首次JS失败唯一dtype已按真Integer64存储修复，尚待运行证据；不提前标通过。
- 已知后续接线边界：未显式装locator的默认数值Axis仍用旧scale/tick_count原型，新命名Auto
  目前显式接入；切换默认需连同date units/scale/clear默认locator生命周期定向迁移，不能
  把新类验收误称所有Matplotlib默认轴对象行为完整。整体goal继续active。

- 最终info&&fmt93325 exit0；D22-interface.diff已保存并审查符合预期：MaxNBins/MaxN/Auto/live
  adapters与providers，classic config/snapshot，Axis/Secondary physical字号与checked viewcontext，
  TickValues.from_int64_array、内部ge/le offset可选参数与Secondary IR字号。date接口无变化。
  无C/Python/外部依赖新增；debug/math为既有Moon core标准库。git diff --check通过。
- 最终check-all26276已exit0，8旧Ref warnings；final test-all session95557 live，日志
  D22-test-all-final.log。当前禁止改源码/README/tests。最终九source --check并行验证日志
  D22-source-*.log；若返回source session需按实际live ID续轮询，不重启已确认进程。

- 最终九source --check的live ID：auto_numeric87609、microsecond92172；其它七脚本已exit0。
  最终Moon test-all95557仍live，先轮询上述确认的ID，期间不改测试输入。所有agents已停止。

### D22 已验收（2026-10-23）

- 最终test-all95557 exit0：wasm/wasm-gc/native各7250/7250，JS7257/7257；比D21各新增870
  （103+315+312+36 generated、12hand、1checked doc、89physical集成、2root集成）。
- info&&fmt93325 exit0；check-all26276 exit0：171tasks/8旧Ref warnings/0error；九份
  source --check全部exit0（五新脚本+Index/Fixed/Multiple/micro共享代码回归），87609/92172
  均已结束，无live tool。D22-interface.diff保存并审查，日期接口不变、无外部依赖/自有C。
- 全部MaxN/Auto参数/None三态/失败partial-state、step alias/extended snapshot、full nticks/
  prune-before-cap/full view ends、offset Edge/tiny、经典构造捕获、source provider读次数，
  checked owner view+space、SVG实际尺寸/字体、secondary父长度/自己字号、删除后copy、contour
  错误链与旧helpers/日期/SVG回归通过。formatter/layout采用相同实际字号。
- 首次JS7220/7221唯一失败确为经典默认np.int64写小数截断；修复真实Integer64 storage，
  保留全部原逐bit期望，并覆盖Int64 set/copy/view cast、MaxN wrapped diff/末乘/精确补端点、
  Fixed wrapped abs(MIN)与>2^53精确phase/owner写回。没有把源默认dtype差异从验收移除。
- 参考证据：params146观察/103generated+4hand；grid314cases1574观察/315+4hand/3预算省略；
  Auto308×5查询+16updates+8copy provider/312+4hand+1doc；physical79profiles/10layouts/2traces/
  89tests；Int64 17writes+7aliases+10MaxN+2Fixed=36tests。原源budget与源错误保持区分。
- 边界仍明确：typed Count/min Int32、Float64/Int64 steps，其他dtype/动态Python、3D分支、
  完整font/rc/dpi/非SVG与dataLim cache/relim未完。默认数值Axis尚沿legacy scale/tick_count，
  新Auto明确安装；隐式默认须与units/scale/clear生命周期后续迁移，不宣称全轴对象已完成。
- 六docs与新maxn guide同步；本切片本地提交。全目标持续active，46%全目标/80%核心二维
  工程估算暂不变。D23 AutoMinor/Null只读笔记229行已保存；从head继续，不重启D22survey。

## D23 执行顺序（尚未冻结/实现）

- [x] D23-01 冻结：保留Int64 TickValues major，四独立raise Core providers，None首次rc捕获，
  Text/Number（rc精确整数补Integer BigInt）参数，warnings为last-op复制诊断，继承set_params noop。
  unique/step/grid私有kernel拆分保证view读取顺序；Python round任意精度、dtype/full phase后cap，
  新AutoMinor axis raw不clip且transformed overlap，Null独立skip。D23-before从HEAD保存、A/B/C已独占分派。
- [x] D23-02 并行对象/数值/原源包与root checked axis/render整合，旧auto_minor helper保留。
- [x] D23-03 文档/原源/接口/四目标验收，本地提交179f365。

已确认的只读事实（完整依据 .moonagent/checkpoints/D23-readonly-notes.md，勿重做全survey）：

- AutoMinor None只有非log且至少2个unique major时才捕获本axis x/y ndivs rc；捕获的auto token
  后续仍随majorstep选4或5，rc改变/rebind不reset。0源返回[NaN]，负数可能空/一个点，2.5有效；
  不能擅自把ndivs类型/验证收缩为有限正Int。rc validator可接受保留'AUTO'但消费会TypeError。
- Python round产生任意精度整数；np.arange在2^63/2^64/round(1e308)分别可能float64/object，
  n1且viewpoint1e308源能实际返回[1e308]。不能简单Int64 guard或无条件D21 float fill替代。
  计数、完整phase、prune/重合与eager cap要按原源区分，预算省略不是源错。
- source调用保留major重合/外邻接，源Axis后续处理与当前generic minor裁剪协议分别记录。
  绑定context需要axis name、scale、major tick values与view四provider，最后set_axis owner生效。
- D22新增Int64 TickValues会影响Fixed/Linear-preset返回的major dtype；下一步必须定向核查
  AutoMinor unique/diff的原Int64行为，不能在provider先丢成Double再泛称支持全部typed域。
- Null direct/call无axis均[]，继承view/nonsingular .001/.05；源Axis._update_ticks有Null类型分支。
- 隐式默认numeric locator、units/scale/clear生命周期与完整dataLim cache仍在总目标待办；
  不因显式named类已验收而把整体迁移目标标完成。当前agents全部idle，无live工具。

D23 当前写入所有权：A /root/multiple_reference=config与AutoMinor对象/params oracle；
B /root/multiple_integration=auto_minor_grid* kernel/grid oracle；C /root/multiple_docs=Null与axis原源
集成tests/README；root=variants/adapters/axis/secondary/render/总docs与门禁。无live Moon session。

D23-02 root公共接线已写入（未验收）：ticker Locator::Null/MinorLocator::Null、NamedAutoMinor，
explicit tick_values错误与axis call分开，major tick_view_for_axis保留Fixed/Linear整数dtype；
Axis绑定scale/name/major/view四provider，AutoMinor先call再第二次major/view做transformed
span1e-5 overlap，raw不clip，复用set_minor_overlap_removal；shared删除复用既有rebinding。
Secondary新增minor APIs、自身function/functionlog与inverse(+parentlog) overlap、IR minor
provider与SVG短刻度；Null主次独立跳过getter/formatter/offset，并接view/nonsingular。
A config已落盘Text/Number/Integer(BigInt)与x/y rc验证/reset/copy，AutoMinor对象已落盘；
C Null core/11range+26raw+12owner+2shared+8secondary+9skip源证据生成中。
首轮static JS check session27232已exit255，仅3个B kernel未落盘unbound错误，日志
D23-check-js-1.log；配置Number封装警告已改pub(all)，尚不声称编译/测试通过。无live tool。
B发现原NumPy大数组VQSort随机signedzero representative：重复源运行可产±0，单独记录allowed
bitset；小数组确定profile与其它finite bit仍严格比较，不将随机单次输出当确定规范。

D23 static集成更新：B kernel初版已落盘，第二次check-js5554 exit255为root backend未import
@ticker显式Null pattern一错；改用IR tick_group_is_null封装后第三次check-js exit0，15warnings
（8旧Ref、6 A生成raising lambda语法、1root secondary unused raise）。root移除setter无用raise，
A重新生成explicit effect callbacks，未跑tests且B/C仍写入。不提前作为最终验证。
A交付180generated（137rc+43对象）+4hand，sourcegen/--check exit0。

D23交付/自审更新：B已停写，209generated+4hand、2budget omissions、3完整source大数组cap、
2组各1000次VQSort signedzero观测；source --check exit0，exact(first+1)再float的arange第二项
已修正（halfULP first虽非AutoMinor可达，内部仍忠实源）。A已修6callback annotations并停写。
C收尾Null直接Axis getter/secondary Nullskip手写测试，README有scope和待验收计数。
root自审修正：Null minor的直接Axis/secondary getter在overlap开启时仍读major再view；只有
renderer提前Null skip。A只读review修正secondary_axis_ticks入口Null guard，避免先读forward。
所有D23代码尚未跑统一Moon tests；下一步等C停写，info&&fmt→test JS→四目标检查/验收。

D23统一门禁进展：全writers已停写；info&&fmt首轮exit0/8旧Ref warnings；D23-interface.diff
已审查，新增typed config、AutoMinor/Null/live adapters、TickValues source-major入口、secondary
minor和internal IR provider，日期接口无变化/无新外部依赖。三份新source --check全exit0。
JS72921 exit1为B hand 1e308字面量缺小数点，root改1.0e308；JS69694 exit2实跑7713/7714，
唯一失败C hand误把共享ndivs算独立，原AST确认reset后x/y各一个点总2；安装external copy到y后
才共4，C在同一test补两阶段并停写。所有180+209+50 generated源期望未更改，生产数值无变动。
最终info/fmt/check-all开始，下一步四目标test-all；源码/README/tests保持冻结直至门禁完成。

最终info/fmt/check-all45231已exit0：check-all119tasks、8旧Ref warnings/0error；接口diff再次
保存，无日期API或外部依赖改变。final test-all session2062 live，日志D23-test-all.log；
源码/tests/README冻结。A/B/C均停写。源三check此前全exit0，无live source session。

### D23 已验收（2026-10-23）

- final test-all2062已exit0：wasm/wasm-gc/native各7707/7707，JS7714/7714；每目标新增457。
  最终info/fmt/check-all45231 exit0，119tasks、8旧Ref warnings/0error；三份新原源--check
  全exit0。D23-interface.diff符合预期typed config/AutoMinor/Null/adapters/axis/secondary IR；
  date接口无变化，无外部依赖、Python运行时或自有C。git diff --check通过。
- A：137rc+43object generated=180，另4hand；rc包括完整finiteDouble精确截断、Python3.12
  Unicode15的68Nd组/整数空白/underscore/4300位、AUTO原样；原构造不校验，rc转Integer，
  None首次有效查询捕获、错误后不回滚、独立copy/closures、严格provider顺序与warning noop。
- B：209generated+4hand，2独立budget omissions，3完整source125k/200k/125001数组cap；
  Int64真实unique/wrap差、Python BigInt round、int64/float64/object arange与分步mul/add。
  原VQSort两组各1000次证明大等值区±0随机代表，仅该实际不稳定值用allowed bitset；其余
  finite值保持逐bit。未为通过测试放宽确定profile，未把budget省略报成源异常。
- C：12ticker+38scene generated=50，另2ticker+5scene+3SVG hand=10；11Null范围×4方法、
  26raw/axis×2、12owner stages、2真实Grouper删除×3query、8secondary×2、9Nullskip，
  以及直接Null-minor overlap/二次major错误链。Null raw Axis getter仍读major/view，SVG才
  提前skip；secondary自身function/functionlog、inverse(+log) overlap与minor短线已接。
- 首轮JS仅hand字面量语法；次轮7713/7714唯一hand断言误以共享ndivs独立，原AST确认共享
  reset后x/y总2，装回external copy到y后总4，补两阶段assert后最终四目标通过。
  全部生成期望未更改，数值生产无需针对失败弱化。A复核还补secondary Null入口跳forward。
- README/compatibility/plan/dependencies/notices/专门guide同步。默认numeric locator的units/
  scale/clear生命周期、完整dataLim cache/relim、动态Python/其他dtype与完整backend仍待迁移。
  整体goal持续active，46%全目标/80%核心二维工程估算暂不变。

## D24 执行顺序（命名LogLocator，实现后数值验收中）

- [x] D24-01 四notes已读并冻结：LogNumTicks Text/Number/Integer，LogTickSpace Integer/Number
  区分Pythonint物理与raw Double；LogSubs Text/1D TickValues，Int64 normalizeFloatcopy，明确
  readonly/动态Python/非1D shape域待NDArray。保留完整Doublebase/count与BigInt相位、源延迟错误，
  partial base→subs→numticks/构造None与setterNone、四raisingproviders与own/shared minpos、
  NumPy arraypower/Pythonpow差异、完整dtype/fallback后cap。D24-before从HEAD保存，A/B/C已分派。
- [x] D24-02 独占并行参数/数值/axis原源包，root集成live named主次/secondary/contour/SVG。
- [x] D24-03 文档/原源/接口/四目标验收后本地提交13ef0b1。旧log helpers保留；SymLog/Asinh/Logit
  命名类与默认Axis生命周期继续列入后续切片，不扩大本片验收声明。

D23本地实现/参考/文档已提交179f365（45files）；无remote，不push。D24参数只读notes已由A
交付195行并停写：Float64 subs真实借用/Int64输入转Doublecopy、partial base→subs→numticks、
ndim失败装入新bad array而转换失败保留old、constructorNone与setterNone不同、numticks完整
Double域延迟断言/错误、经典构造捕获已实证。B/C仍仅ignored定向只读；暂无live工具。

D24-C只读axis notes已交付336行并停写：17原AST probes，own tick_minpos vs shared nonsingular、
反向positive-first错误、不绑定positive nonsingular错误、secondary空minpos Inf差异、删除后
installed owner与external copy singleton均已观察。新增固定scale.py源hash在notes中。
root只读integration notes也存ignored：TickSpace原int/自定义Double dtype待Bprobe决定；
shared顺序/detached singleton/pairedfinite minpos/checked nonsingular/已知cache边界明确待冻结。
B仍只读grid probes，不能提前开实现；无live Moon/source session需轮询。

D24只读准备全部交付并停止：A195行/B170行/C336行/root44行。未冻结/实现D24，原源候选
probe无live工具。B实证自动tick-space的Pythonint→np.int64与raw Double→np.float64差异，
near-one且n_avail超Int64时，bound integer/float分别可源OverflowError/TypeError，而unbound
Pythonint9可成功；不能用统一Double预算冒充全部源域。major NParraypow与minor Pythonpow的
overflow差异、auto/all提前空、full dtype/fallback/cap与budget/size错误已分别记录。
D23最终门禁/三原源全通过结果仍有效；之后仅文档/检查点更新，无需重跑。下一轮从D24-01
合同冻结继续，整体goal保持active，不因完成本切片标complete。

D24写入所有权：A=LogLocator/LogNumTicks/LogSubs/LogTickSpace对象/params原源包；
B=log_grid*完整dtype/相位/数值helpers与grid原源包；C=backend/svg/minpos.mbt复用collector、
axis原源/集成tests及专门guide；root=所有variants/adapters/axis/scene/backendranges接线和总docs。
root唯一Moon gates/committer；writers写入时不跑Moon tests/info/fullfmt。当前无live工具。

D24-02 root初版接线已落（未验收）：NamedLog主次variants/live adapters与raw source order；
Axis四provider/raising own+shared minpos/context/nonsingular checked、安全旧wrapper；
Scene复用collector绑定localartist与Grouper rankordered siblings、detached singleton；
secondary ownInf/shared[Inf]与physical integer、raw Logminor overlap；backend NamedLog raw
范围不滤负data，activeautoscale checked nonsingular→独立sharedminpos→scale limit→margin→
view_limits→_set_lim finalnonsingular+ownminpos/方向，explicit/group/storedview跳过无用provider。
C真实AST证实singleton transport shared4/最后own1，与5次source minpos读取对应；badbase0非finite
抛Core，baseNaN data恢复1,10而round报错，base1保持1,1后续tick可失败，不用旧finitefallback吞错。
首static JS exit255先是legacy log_locator_ticks(8args)同名（新kernel改named_log_locator_ticks），
第二static exit255为B log_grid.mbt322 `is not Some`语法，B已收到修复；未运行tests/info/fullfmt。
A已交付停写183generated+3hand/367observations，source生成/check exit0，现只读review root。
B grid/private numeric tags已落盘，继续原源generator；C axis/正式autoscale AST oracle/集成tests写入中。
当前无live Moon/source tool session；仍需等writers停止统一门禁，不能提前标D24通过。

D24第3次staticJS29460已exit0，10warnings（8旧Ref+root member保留字2）；root已rename
sibling_axis去新增保留字warnings，尚不跑完整gates。A只读review确认完整provider/lastowner/
Grouper/deletedcopy/physicalinteger/4shared+1own autoscale链，并抓两实质遗漏：
1)旧BoxPlot collector只whiskers/fliers漏内部最小正值，root补q1/q3/median数据坐标；C补实际
bxp源码路径/BoxPlot宽.6/cap.2固定geometry的minpos位置corners与H/V line/span data维metadata。
2)source LogTransform nonpositive clip=-1000，root仅newrawminor overlap helper与secondary
functionlog inverse后补clip，不改旧全局Scale.transform；C新增负/0重合源case。
B source首版494generated（384query+110IEEEhelper），2budget omissions/3完整cap样本；
新binarysearch自动subs可见计数避免1e12 logical subs扫描且保留完整fallback，补手写证据收尾。
C正式源执行整个autoscale_view→set_bound→Axis._set_lim+真实Log/Inverse transform，badbase与
provider次数已观察，继续源/集成tests写入。所有D24实现仍待统一Moon验证，当前无live工具。

D24统一验收进展：全部writer停写后info/fmt exit0/8旧Ref warnings。D24-interface.diff已审查：
新增Log类型/4provider/named主次、Axis minpos/checked range、SVG minpos；日期接口无变化。
三份new source--check全部exit0（grid26735也已结束）；JS23453 exit0，8476/8476，新增762。
check-all94119 exit0：88tasks、8旧Ref warnings/0error。最终test-all启动，按实际live ID续轮询。
root另外补collector HV data-only范围（10原sourcecases同test加intervals断言）与BoxPlot .6实际
corners范围（2原bxp cases同test加原Bbox points范围断言），未改原源数值期望/未增测试项。
B495+4hand，A183+3hand，C69+8hand=762新增。后续源码/README/tests保持冻结直到门禁结束。

D24最终四目标首轮63551已exit2（终止勿再轮询）：JS8476/8476；wasm/wasm-gc/native各
8444/8469，25个失败均是finite pow结果1ULP。相同cases在JS全过，疑Moon非JS pow vs
Darwin source/Node libm。失败B grid42/44/45/47/139/164/165/199/201/262/265/286/289/298/
301/313/326/331/335/336/337、helper26、A range2、C共享x/y，同源多处。原源期望不改，不放宽bit。
下一步D24优先修portablepow：B已从D25只读转回kernel，调查pureBigInt directed interval
integer-power(near1 huge exponent也覆盖)再exact binaryround/adaptiveprecision；A独立查
coremath各target和Darwin source正确舍入profile，ignored D24-pow-investigation-notes.md。
C仍只读D25 symlog notes，不写tracked。暂无live Moon/source会话，D24未验收/未提交；不可
因JS绿而提前标通过。三new source--check全exit0，接口review/8旧warnings仍有效但pow改后重验。
D25只读尚未冻结，不开始实现；D24是active first unfinished task。

D24 pow进一步独立证据：Moon非JS使用纯Moon fdlibm，当前Node24的Math.pow默认std::pow，
固定Darwin NumPy/CPython导入Apple pow。114个失败phase在Decimal180/320精度下均与原源
正确舍入一致；但不能推出Apple pow全域正确舍入。已知一般profile反例为nextafter(1,0)
的-1次方：原Log所用arraypower/np.float64 exponent与Apple/Python/Node均回1.0，精确
Fraction证明正确round应1.0000000000000002；scalar np.power走另一分支，不能替代原表达式。
B继续portable interval整数power及独立property，并新增该真实原表达式sourcecase，原期望
不改；A调查Apple一般算法/近1路径。该已知source差异必须解决或明确范围，不能在验收中
忽略反例。C仅ignored D25 axisnotes，root修专门guide的Box实际corners文字；无live工具。

D24数值合同明确：A固定seed240024随机50000个正normal base的-1次方发现54个Apple
非正确round，实际普通路径tablelog/FMA/exptable，无通用reciprocal/near1特例，非单输入问题。
不复制Apple私有libm/反汇编；portable整数pow采用跨目标正确舍入数学合同，专门guide显式
记录与源平台非正确round结果的兼容边界。原495grid+其它已存source期望仍全部严格不改；
B新增独立数学oracle与source_profile_differences分别记录精确数学bits/原表达式sourcebits，
测试检查数学精确结果，不用tolerance/ignore。这一范围决定不影响原接口/算法查询顺序。
B新log_grid_power.mbt interval与cache已落，首static因loop语法exit255已告B，待其修复收尾；
C只读审核interval终止/包围性质，A收尾ignored报告。root总docs已写D24“验收中”，未宣称完成。
当前无live Moon/source会话；下步待B停止后完整info/fmt及target门禁，再更新准确计数与提交。

D24 portable pow生产与oracle已交付：新log_grid_power.mbt、generate_log_grid_power_reference.py、
log_grid_power_reference.json、log_grid_power_reference_wbtest.mbt；458pairs×数学/source
各1test+1完整原Log近1point=917。两处source_profile_differences记录near1与一般normal反例，
Fraction精确覆盖|e|<=2048（含2^-1075 tie），其余Decimal180/320交叉；不改原sourcebits。
root修B functional loop语法为for precision=192、generator np.finfo max转float字面量，重生成
无JSON数值变化。info/fmt exit0/8旧warnings；四D24 source--check全exit0；gitdiffcheck通过。
C独立ignored pow-review189行，3000组区间运算与600pow Fraction核对无问题，midpoint/early
proof及huge near1已审。A完整ignored pow-investigation-note已交付停写，未复制Apple实现。

native ticker20315终止exit2：8098/8099，原pow失败与917数学/sourceprofile全通过；唯一
paramsrange2最后round_numbers(.001,.001)得[.0001,.01]而原源[.0001,.1]，前两data/nonsing
阶段已通过。A/B独立实证np.log(.01)=-0x1.26bb1bbb55515p+2、ln10=0x1.26bb1bbb55516p+1
均正确round，ratio=-1.9999999999999996/ceil=-1；非JS core ln多项式跨到-2，之前被首pow
失败遮住。B现独占新portable ln及四helper接入（不动旧全局math/已通过generic log路径），
atanh z=(m-1)/(m+1)、BigInt floorceil固定点、几何tail、adaptive192，新增独立数学/source
oracle。A只读查现110helpers np.log正确round域；C powreview完成。无live Moon/source工具。

D24 portable ln已交付停写：新log_grid_logarithm.mbt、generate_log_grid_logarithm_reference.py、
log_grid_logarithm_reference.json、WBtests，188高精度/np.log观察+1原AST边界=189测试。
只替四decadehelpers，不动旧math与tick log10/log2/generic，sample source/math差异0；
A复核原110helper finite域的8个ln输入均正确round，支持不改旧expected。lninfo/fmt exit0、
8旧warnings；第五source --check exit0；native ticker49773 exit0，8288/8288。D24合计新增
762原locator/axis+917power+189ln=1868测试；最终全项目数量等待实际alltarget结果。
当前live finalgate64751（顺序checkall→testall），C仅ignored lnreview；其它writers均停写。


D24最终验收关闭：finalgate64751已exit0，checkall35tasks/8旧warnings/0errors，wasm/gc/native
各9575/9575、JS9582/9582；新增1868（原源locator/axis762+power917+ln189）。五reference
--check全exit0；最新info/fmt exit0，接口diff已审且portable kernels不新增公共接口。
C ln独立review完成（27 Fraction区间+11 Decimal120/240，均p192收敛）无问题，ignored
D24-ln-review-notes.md；此前pow3000运算+600powers与A原profile报告仍有效。README、
compat/plan/dependencies/notices/专门guide均同步，显式数学/source边界，不claim全Applebit。
本地featurecommit13ef0b1（47files），无remote、不push。当前只待checkpoint文档提交；
整体goal持续active，46%全目标/80%核心二维工程估算暂不变。D25为下一firstunfinished。

## D25 执行顺序（候选命名SymmetricalLogLocator，只读准备中）

- [x] D25-01 A207/C733/B172及A合同review齐，C实际secondary变换树4fixture已证实；
  root冻结D25-contract-frozen.md并从HEAD505d068建D25-before快照。
- [x] D25-02 独占并行参数/数值/axis原源包，root接入live主次/secondary/contour/SVG；
  复用既有D24 primitive，不扩为完整scale生命周期/Asinh/Logit。
- [x] D25-03 原源/接口/四目标验收、总文档与本地featurecommit c2f6edf。

D25已知候选事实（非API冻结）：transform仅base→linthresh快照、不读linscale/不重校验；
source Scale默认linthresh2而旧helper1，locator默认numticks15、无classic/physicalrc；
major/minor的None subs均[1]。原raw负subs按decade顺序、不全局sort；原SymLogTransform
用分开log(abs)/log(base)-log(linthresh)/log(base)可避免旧ratio极端overflow，必要named
overlap profile应独立接入，不把legacy scale重命名为完整迁移。C notes留有secondary
实际function inverse与当前SVG mapping的差异推断，未跑renderer；冻结前需明确处理范围。
当前A/C均停写，B需补grid只读notes，root继续合同集成；无live工具。


D25-01已冻结/02实现中（未验收）：ignored D25-contract-frozen.md含全部typed合同和写入所有权。
A=locator_symlog/symlog_parameters/ticker moon.pkg+params reference；B=symlog_grid*及grid
reference；C=Scale两私有数值体修正、axis/scale/secondary完整源references/tests/guide；
root=variants/adapters/Axis/secondary/backend render接线及总代码/docs。Root唯一Moongates。
Ctor ordinaryoptional transform:Scale/base:Double/linthresh:Double，None同omit；subs默认None→
新[1]，SymLogSubs Text/Number/Values，LogNumTicks复用默认PythonBigInt15，仅viewprovider。
Sym view先round再equalstrict最后.001，与Log先nonsing不同；rawsimple signedzero/lateerrors、
Float64完整arange先reverse、每zero只展开一次、全shape再cap；复用D24portableln/pow。

C新ignored secondary-placement-notes已运行原完整transform tree+Secondary/_setscale/_setlims/
Axis/_setscale/Axes/_set_lim_and_transforms，固定bbox矩阵乘法sink、validlimit直接储存边界明确。
x/y symlog parent[-100,100]，f=2x+5，secondary105源normalized.75，parentmapping.94643749；
log parent对照一致.849485。Root在backend render新增secondary_display_scale(privateScale,Bool)
并用于x/y append入口，log保持Log、其余归Linear，使mapping/visibility同原functionprofile。
C改现Scale forward为分开ln避免ratiooverflow、inverse为exp(...*lnbase)；旧factory/ticks不变，
不会新增平行Scalevariant/默认生命周期。对象用既有Scale快照，其他Scale变体Coreerror不fallback。

D25 root初版public接线已落：NamedSymLog主次variants/livecopy/adapters/getters，checkeddirect
与axis .call sourceorder、only viewcontext、rawminor另取major/view overlap、view/nonsing与
secondaryownview。初staticJS因新Values枚举使D24裸构造歧义，root只限定LogSubs::Values；
次staticJS exit0/8旧warnings，未运行tests/info/fullfmt。A/B/C尚写正式reference，不提前gates。
无live Moon/source工具会话；D24最终门禁仍有效，但D25所有变更尚待独立验收。

D25-A参数生产与reference已交付停写：locator_symlog.mbt、symlog_parameters.mbt、
ticker/moon.pkg仅Scale import、generate_symlog_params_reference.py、JSON、两testfiles。
133generated+3hand=136；45构造、21updates×2、10aliases×4、56ranges×3、5view/copy stages。
独立source生成/--check exit0，单fmt已完；尚未统一Moon tests/info/fullfmt。A现只读审查root
onlyview/lastowner/rawerror/overlap/secondary接线，不写tracked；B/C仍写各自oracles/tests/guide。
root README加D25“实现与验收中”示例，总代码其余已接，无新live Moon工具。等B/C停写门禁。


D25 root独立review由A完成并停写，ignored D25-root-review-notes.md。唯一实质遗漏已修：
源np.isclose(a,b,rtol0,atolInf)对reference b非finite非对称，不能直接abs<=Inf吞掉不同Inf。
ControlledLinear view[-Inf,+Inf] / minor SymLog(tInf) raw[-Inf,0,+Inf]，Fixedmajor[+Inf]
源[-Inf,0]、major[-Inf]源[0,+Inf]、NaNmajor保raw、finite1major全移除。root Axis与Secondary
filter均改exactequal || (reference非NaN/Inf&&abs<=tol)，仅guard major不guard minor；
C正式axis oracle补4profile。其余onlyview/lastowner/rawguard绕过/复制/共享删除/secondary
placement+visibility sourceflow未发现具体问题。无live Moon/generator工具，B/C尚写inputs。
B grid首轮250cases：204success/44realerrors/2独立budget，含真实125k/200001full arrays；
正在补4hand与--check，3个3^34源/数学wronground差异单列承接D24portable合同，不弱化expect。

D25全部三writer首次已停写交付：A136；B248generated+4hand=252（2budget只JSON无空test）；
C74generated+4hand=78，合计466。C26变换/14overlap含4Inf非对称/12ranges/x/y owner+shared
remove/4完整secondary placement tree；源gen/check单fmt全0。root info&&fmt exit0、8旧warn；
D25-interface.diff初审仅ticker导入Scale+SymLogSubs/class/主次变体/getters，无Scale/date接口变更。
三D25 source --check root复验均exit0。首JS10006 exit1仅测试编译（未运行）：Bhand裸1e50等
改1.0e50；C minor.checked_tick_values缺major改[]。日志D25-test-js-syntax.log，无live gate。

首compile另unused_try暴露真实合同遗漏：A source paramsrange28 base0/round_numbers view(0,0)
原Pythonfloat严格decade的0/base0抛ZeroDivisionError，而当前Sym view非raise会NaN→fallback。
A已独占回修locator_symlog.view_limits raisingCore及Python/NumPy零operand区别，旧expected
不改；root暂停Moon gates等A停写。C/B继续停写，root手写两语法已修但尚未重验。


D25 A zero-provenance修复完成并停写：Sym.view_limits现raiseCore；排序原零下界从helper
保留Pythonfloat，仅equal strictless遇base±0抛原除零错误；非零经NumPy round产生1/0仍
IEEE→nonsingular，不全base0拒绝。原56ranges不改，新增14signedzero/nonzero/minsub，
现70ranges×3、147generated+3hand=150。D25新合计150+252+78=480测试。
第二info&&fmt exit0/8旧warn；三newsource --check均exit0；接口diff新view_limits raising已审。
修正后JS68257已exit0，10062/10062；live finalgate39228（checkall→testall），log
D25-final-check-all.log/D25-final-test-all.log。全部writers停写，不再改源码/tests直到门禁；
仅总docs/guide与checkpoint收尾。Cguide参数计数需由133/56更新147/70，再填最终实测门禁数。


D25验收关闭：finalgate39228已exit0，checkall89tasks/8旧warnings/0error；wasm/wasm-gc/native
各10055/10055、JS10062/10062。新480= A150(147generated+3hand)+B252(248+4)+C78(74+4)。
三source --check root复验全exit0，info/fmt exit0且接口diff已审；Moon没有新增warnings。
root仅修手写测试两语法（B科学记数必须小数点、C minorchecked补major参数），原数据期望
未改；A view zero-provenance由14新原AST范围证实修复。B3个3^34数学/source差异与2预算
省略明确保留，未改D24已验收bits或把预算省略伪造为源异常。
README/compat/plan/dependencies/notices/专门guide已同步480与准确门禁/零协议边界。
本地featurecommit c2f6edf（36files），待本checkpoint提交，无remote、不push。整体goal仍
active，46%全目标/80%核心二维工程估算暂不变；D26命名AsinhLocator是新firstunfinished。

## D26 执行顺序（命名AsinhLocator与最小Asinh几何）

- [x] D26-01 A参数/B数值/C轴与scale原源notes交付，typed/数学/fullshape合同已冻结。
- [x] D26-02 独占并行参数/数值/axis原源包，root在现有scene/render/SVG链路集成。
- [x] D26-03 source/接口/四目标验收和文档已完成；本地feature/checkpoint提交见下方。

A/B/C上一D25 tracked工作已停写。下一步只写ignored定向notes，不提前新API/实现；
D24 pow/ln正确舍入与源平台差异合同、共享所有权顺序等已settled，复用并保留边界。

D26只读交付中，尚未冻结/实现，Git当前clean于8c5e42f。Root仅读原AsinhLocator完整class
2790–2885及本地core hyperbolic选择（JS Math.sinh/asinh，nonJS Sun/FreeBSD）无tracked改动。
A已交ignored D26-asinh-params-notes.md243行并停写：subs tuple/list truth与ndarray不同，
NP2.3.5 emptyarray也ValueError；constructor原样保空vssetterlen0改None；list长度live；
set_params numticks→symthresh→base→len(subs)，scalar末项当场error而前三已更新。count
Pythonint与Double(11.0也operator.index错误)、ctorNone原样非default；NPint64(0)跨零IEEE[]
与Pyint0 ZeroDivision不同。call只view一次，乘积<0再ratio严格sym阈值；direct不读sym；
view/ns只继承.001/.05且不读axis/rc。没有raise_if_exceeds/logger调用。
C已交ignored D26-asinh-axis-notes.md，40完整AST observations，可复现outputSHA/manifest，
并停写。AsinhScale真实geometry为width*asinh(v/width)、inverse width*sinh(v/width)，原ratio
overflow必须保留，不能套D25稳定比值修正。当前Scale缺Asinh：Linear与真实Asinh overlap
确有可见差异，若声明真实Asinh轴几何需要最小新transform表示；是否增variant由root冻结。
NaN/Infwidth source接受；only-view/共享删除/copy/secondaryownfunction原源已观察。

B尚写ignored D26-asinh-grid-notes.md：165小probes含完整125000/200001 linspace与375000
outer→350000 sortedset。不能前cap：125000(1,2)先去重仅1再fallback原125000 linspace；
200001跨零最终17ticks。direct不sortbounds，fallback可保持倒置方向；完整set/decision后cap。
240常用base10/2/e/1、width1/.1、n10/11、±1/10/1000的源/Decimal180/320数学profile集合一致；
seed260026近basepower边界1200组有39不同集合，单替hyperbolic就触发（如source100 vsmath1000），
不能冒称全Darwin parity。源Python sorted(set(qs))含NaN还非确定：1000重复baseInf有3顺序、
subs[nan,inf]有38。Root倾向承接D24显式portable数学合同并存actualsource/数学双值，NaN用
明确canonical数值升序/firstzero代表/NaN尾部保multiplicity；仍未冻结/实现。B需给fullshape
descriptor/monotonic run+binarysearch/merge或必要资源边界方案，不把oraclebudget冒源错误。
当前无live Moon/source工具，D25门禁仍有效；下一步root读notes并冻结D26。

D26合同已冻结于D26-contract-frozen.md，D26-before基线8c5e42f。A对象API已落盘：
rawDouble/Optionnumticks/Sequence与NdArray不同truth、late setter保部分写、onlyview与pure
view/ns。B实现完整count descriptor/跨零runs/plateaus跳跃/heap合并，源Darwin与数学双profile
保留39边界差异；NaN保multiplicity尾置并明确源非确定。C实现Scale::Asinh最小几何，
便捷sampler有单独规则，axis原AST/overlap/shared/secondary/SVG验证。Root现在独占数学
production与公共接线；A随后独立数学oracle。所有writers停写后root才运行Moon gates/info/
fullfmt/接口检查/commit。当前无live Moon/source工具，D25最终门禁仍有效。

D26 root已落ticker/asinh_math.mbt：精确整数sqrt+ln区间asinh、exact/2^14 Taylor+14squares
sinh、未舍入ln区间ratio log10（exact10^n直接返回整数避免额外计算）。tiny<2^-28
返回原值，IEEE zeros/NaN/Inf与sinh>1024溢出已处理，独立oracle由A随后交付。公共
NamedAsinh主次/checkeddirect/onlyview call/rawminor overlap/共享绑定/范围/secondaryown
view与根asinh_scale导出已落。首static root裸for语法已修为for current=...，乘shift
歧义加括号；次staticJS仅B尚未落kernel unbound，无其他root类型错误，未跑test。
rootREADME/compat/plan/deps/notices已同步“实现/验收中”，不提前宣称接受。
A对象sourcegen/--check exit0，104generated+3hand=107；完整参数notes已验，无livegate。

D26最新staticJS exit0（kernel入口已落，8旧warnings/0error），未跑tests。A math独立399
=asinh129+sinh125+log10145，精确Decimal.from_float双档180/320（tiny增精）bits稳定，
8处源/数学asinh差异全保留并严格验证。A参数107+数学399共506tests已全部停写；
root对两source --check复验exit0。A现只读审查root数学证明/接线，B/C仍独占tracked。
B自审发现decimal pows跨phase可非单调，正补恒定pows细分；root指出原NumPy arange
长度可能先float(rawcount)再ceil，需要B查真实C _calc_length以区分requested count/div与
实际ys shape，尤其2^53+1/2^60-1边界；尚未冻结成新限制或伪造oracleerror。

D26 C10files停写交付：Scale::Asinh/geometry/helpers/sampler、axis generator/JSON、
scale/scene/backend三generatedtests与三handtests、专门guide。60generated+8hand=68，
16geometry/8axis/8range/2owner/2shared/2secondary/6autoscale/4aspect/2layout。C源生成与
--check0，root --check复验exit0；A/C仅只读review，唯一B仍写fullshape grid/source。
截至此刻新已交付574tests（A506+C68），B未计；无live Moon/sourcegate。

A只读数学/接线review155行已交付：未见实质问题；32Fraction sqrt、36exp/sinh与
34log10双档Decimal区间均包围，max26Taylor项。C独立rootpublic/shared/secondary接线review
亦未见遗漏。两者都停写，无Moongates。Root仅更正math整数10^n识别注释：整数是可表示
中心值而非rounding边界，特判是合法优化，不需要用“避免不终止”作依据。

B已按NumPy2.3.5 ctors.c（SHA8deb3951...f274）_calc_length证实并修复requested/count
双字段：actualshape=ceil(float(raw))，div=float(raw-1)，threshold=float(raw)，forcedlast
用actualshape-1；raw2^53+1→2^53、+3→+4。raw2^60-1/-2/-63/-64真实分配前
ValueError证明roundedshape拒绝，未尝试2^53级数组。A独立只读cache/hash/source复核
76行已交付，无问题。decimal恒定pows分段亦已落，再staticJS exit0/8旧warn/0error。
C现只读审查Bfullshape/runs/NaN/heap/fallback，B仍独占正式grid参考，尚未统一Moongates。

B正式generate_asinh_grid_reference.py已落并运行，live session20346/PID54171，完整
125k/200001用Decimal180/320逐点生成双profile，尚待首轮JSON/WBtests；随后独立
--check复验完成才停写。B3production+4handtests已单fmt；不Moongates/info/fullfmt。
root不轮询B工具，等B通知退出。C分类/rank/fullshape只读review进行中。

B报告初gen20346 CPU正常/RSS140MB，另提前启动readonly --check65209。root已要求
终止65209并确认terminal，因为check依赖尚未写出的JSON与metadata，必须gen结束/定稿后
顺序启动；不要为加速把依赖检查并发。B首gen完成tracked停写后，readonlycheck可与
root Moon gates独立并行。20346仍live仅B轮询；65209等待B报告终止结果。

B已SIGINT终止过早依赖check65209（PID54280），明确exit130/terminal，不轮询；
唯一live source仍20346。首genmetadata定稿停写后才串行readonly --check。

D26 B全部7trackedfiles停写：482dualASTcases、每profile436success/43真实error/3budget
omission，483generated（479有效grid+4原linspace采样AST）+4hand=487。42source/math
差异=39近边界+2width1e-300+1旧3^34合同；源完整125k/200001/375kouter都真实执行。
Breadonly --check99335已依赖顺序启动；无tracked写入，可与Moon独立并行。
D26合计新1061=A506+B487+C68；info&&fmt exit0/8旧warnings，interface.diff只预期
Asinh相关，date接口未变。JS82640已exit0，11123/11123（baseline10062+1061）。
root启动最终checkall→testall，工具session见后续状态；所有writers继续停写。

D26 finalgate session26297 live，依赖顺序checkall→testall；由root轮询。

D26最终26297已exit0：checkall94tasks/8旧Refwarnings/0error；wasm/wasm-gc/native
各11116/11116、JS11123/11123（各新增1061）。源码/tests不变，接口diff已审；无Moon
live session。唯一未完成验收是B readonlysource --check99335，由B轮询；A/C三个
source --check已由root复验exit0。待其通过后关闭D26与分批本地commit。
C独立gridreview已停写：1972完整原AST/97448点NaNcategory/1560同号run/1942decimal
constantpows子流/204NaNfactor/72原linspace descriptor均无反例；这些是review证据，
不加入1061正式Moon测试数。ignored D26-grid-review-notes.md。

D26全部验收结束：Breadonly --check99335已exit0/terminal，482dualAST/483generated+4hand
487、42differences/3budgetomissions/seed260026全部39boundary一致。四source检查全0，
infofmt/接口/alltarget全部已通过，不再重复有效检查。总docs与专门guide已改为已验收；
下一firstunfinished为D27定向只读Logit合同准备，待D26本地feature/checkpoint提交完成。

D26 featurecommit61f768f已完成（43files，生产/接口/参考/测试/总体docs与guide）。
本checkpoint单独提交后Git应clean；无remote、不push。继续D27定向notes，所有D26
门禁仍有效，任何新实现只在D27合同冻结后开始。

## D27 执行顺序（命名LogitLocator与最小Logit几何）

- [x] D27-01 A252/B221/C296只读原源notes交付，root全文读取并冻结合同。
- [x] D27-02 root冻结typed合同/所有权/验收，再独占并行实现与原源参考。
- [x] D27-03 接口/source/四目标验收、最终文档与feature524b673本地提交；本checkpoint紧随提交。

D26 feature61f768f与checkpoint78b0b68已提交，提交后Gitclean。D27仅root本状态更新
为tracked改动；A/B/C已followup只读ignored D27-logit-{params,grid,axis}-notes.md，
不得提前tracked实现。root已定向读原LogitLocator2883–3032、必要MaxN tick/view原体及
本地locator_maxn/maxn_ticks、Logit变换定义，未新survey/不跑有效D26门禁。
早期共同证据：Logit call需虚派发自kernel不能直接state.call；auto第一次tickspace
只clamp>=2且不clip9，nonsingular有效域无条件minpos；窄major进原MaxN会再读tickspace，
minor窄域[]；继承view_limits却仍MaxN固定nonsingular/round grid，不是Logit.nonsingular。
合法概率Doublegrid索引有限（binf>=-324/bsup<=17），fullshape自然较小，但rawminpos/
负或零nbins/非finite provider会晚报错，不能统一前validate。具体typed与几何仍待notes
后冻结；完整默认scale/formatter生命周期仍不提前扩展。当前无live Moon/source工具。

D27补充定向证据：A完整AST getter顺序wide=[projection,space,minpos]，zoommajor=
[projection,space,minpos,space,projection]，call最前view，minorzoom不进MaxN，polar
direct只projection就error；继承viewlims data无context，round=[space,projection]且polar
不reject。ctor nbins省略Auto/显式NoneCount10需区分，setterNone是raw错误槽（现D22typed
可排除但不可伪作keep）；默认steps必须freshInt64[1,2,5,10]，alias截断与extendedsnapshot
复用D22。A继续probes/notes，尚未交最终文件。
Root复用提案（未冻结）：MaxN.grid私有延迟raw_step_transform:(Double)->Double hook，
在原rawstep处读取projection；如支持3d，必须step*23再/24，不能乘预round23/24。
抽tick/view薄privatehelpers带hook复用整套symmetric/ns/grid/prune，旧public默认None。
B已确认可行；提醒steps.is_empty现portguard不能提前吞原projection读取，待可达性证据。
B实际极值完整AST已更正binf-324/bsup16/numideal339，major341/minor2710，不是17。
C正验证Logit limit_range_for_scale/clamp与现ranges插点、mask/clip真实几何；未冻结范围。

B找到typed可达emptySteps反例：auto+integerTrue+NaN tickspace+zoom(.49,.51)，
完整原AST事件[projection,space,minpos,space,projection]后UnboundLocalError；末projection
若raise则该error优先。未来最小必要修复为把现MaxN steps.is_empty guard移到raw_step
与延迟hook之后（旧无hook只多pure运算，checkederror类型不变），不提前跳过projection；
Count(-1)的scale_range math-domainerror仍必须在projection之前，不能全延迟早期error。
尚无D27实现，等A/B/C最终notes后freeze。

D27 A参数最终252行notes已交付停写，root已全文读取。关键补充bound检测沿D24
(anycontextSome)=>bound，bound有效nonsingular缺ownminpos必须Coreerror；boundAuto缺space
亦error，只有全unbound默认9/std1e-7；projection缺失可合法dummy无axes。source Data
warning可沿D24最近数值操作diagnostics（copy独立）；MAXTICKS logger仍单独未迁移。
root待冻结effects候选：state沿D22 puretickspace/viewraising，ownminpos/projection
raising，privatehelper carries projectioneffect + requiretickspaceflag保持partialbound错误；
不try!桥接，不用“缺单provider就unbound”伪造默认。所有这些只是提案，尚无实现。
B已完整观察major341（首0）、minor2710只有2702unique（8zero、近1重复），必须保raw
duplicates/underflow0不套D26sortedset。MaxNfallback真实125001/200001/pruneBoth199999；
110dualAST与所有341phase Pythonpow/Fraction当前无差异，保正式双profile不强造差异。
C已证实fullautoscale ownminpos3次/shared raw1次，与D24Log4shared/1own不同。minpos=.9
原ns倒置(.9,.1)但fullauto约(.0818895,.9181105)；minpos2可保view(1e-12,2)，不能strict
domain前拒绝。clip Path原体保映射[-1,0,.5,1,2]→[-1000,-1000,0,1000,1000]，公开
val_in_range两模式都strict(0,1)，现SVG is_valid预过滤会丢clip连接；冻结时需明确Scope
边界或给renderer共享valid_coordinate加局部clip接线，不能宣称自动parity。
当前等B/C最终notes交付后root读结论冻结D27；仅MIGRATION_STATUS tracked改动，无live
Moon/source工具。

D27已冻结D27-contract-frozen.md（含末尾精确cross-writer fnnames），D27-before是
HEAD78b0b68 archive。Root读完A252/B221/C296；无提前tracked实现。冻结Boolminor子域/
nbins嵌套None、puretickspace与raisingview/minpos/projection、anyprovider bound检测及缺
provider lateerrors；root复用MaxN私有context helpers与延迟raw_step_transform(*23再/24)。
C增Scale::Logit(clipBool)/factoryString maskclip/共享source limiter，sourcegeometry+in-domain
SVG，明确off-domainclip路径与完整tight/default生命周期不在本片；root真实nontight
autoscale与Logitsetlim源branch必须保minpos反常有限结果。原sourceClipPath/tight观察
保JSON/边界，不能伪报完整parity。当前三writer将按合同独占实现，root先MaxN helper。

D27 root主实现已落：ticker/maxn_grid增加optionalraising step-transform与require-space
参数，emptyguard在原rawstep/hook后；maxn_ticks将旧tick/view体真实抽privatecontext函数，
旧public默认无hook；logit_context.mbt提供两个promised methods与step*23再/24。
NamedLogit主次/rawchecked/Axisonlyview/四ctx绑定/secondary ownemptyminpos与rootfactory
导出已接。Axis Logitset_limits/set_view_limits新源finite→locator NS→actualscale limiter
→按原方向排序，不pre-is_valid。backend/ranges raw范围、actualScale limiter与finalize
按namedLogit或ScaleLogit启用，旧Log源ctx仍沿同链。
首staticrootprivatefn首参self被Moon解析deprecated method导致unbound，已改locator；A
对象tuplemut非法由A拆两letmut修复。最新staticJS exit0/8旧warnings/0error；没tests/
info/fullfmt，无liveMoon工具。Aparamssourcegen与--check均0，117generated+4hand=121，
已停tracked现只读rootreview；B/C仍正式refs，当前不能统一gate。root总docs已同步D27
“实现/验收中”，精确限制仍记guide由C交付。

D27 B5files已停写，290dualAST+341phases=629generated+4hand=633；每profile241成功/
47真实error/2budget omissions，actual/math0differences，fallback fullcount证据保留。
C10files停写，114generated+10hand=124，另4tight/2Path仅JSON source-only范围明确。
A121+B633+C124共878；root最后infofmt0/8旧warn，接口diff已审仅预期新增，MaxN/date
public不变。三原源checks root并行复验：params0，grid62175/axis29316 live；JS81493
live，当前未启动alltargets，无writer改tracked。
A104行只读roothelper/publicreview无问题，D27-root-review-notes.md；C/B当前也停写。

D27三source checks root复验全0。首JS81493仅Bhand53裸1e-7非法compile exit1，root
改1.0e-7（不改数值期望），再infofmt0。第二JS40418实跑12001，11996过/5fail，
已exit2/terminal。两个布局sourcefixture只set当前轴.01/.99，另一Logit轴仍0/1，但
生成Moon双轴都.01/.99，导致源全NaN不等输入；C独占修fixture双轴一致并重新原AST
gen/check，不能迎合生产改期望。另3Fixedminor overlap失败是root旧adapter预clip/
exactdup，已只在actualScaleLogit将NamedFixed纳入raw→major/view→true transform overlap
分支，旧helpers/其他Scale合同不动。当前C重写ref期间暂停gates，A/B继续停写；root
暂无其他源数值失败，所有5个目前待修复验收，不能标D27complete。

C fixture修复后sourcegen/check0并再次停写，root readonly --check复验0。旧双轴输入不等价
NaN观察保留JSON source-only，正式两布局输入双方均.01/.99。Root Fixedminor新路由初
用ticker私有eager_prefix跨包不可见，info compileerror后改为公开view(0,1,min100k).to_array
（未暴露新API），再infofmt0；最新JS30690已exit0，12001/12001，全5fail已修。
finalgate95932 live(checkall→testall)，D27-final-*.log，所有writer停写，三source已0，
接口仅预期新增MaxNpublic不变。接下来等待alltarget并收尾docs/本地commits。

D27 finalgate95932已exit2：checkall99tasks/8旧warn/0error；JS12001全过，其他三目标
各11993/11994，只有gridcase200首点差1ULP。B完整AST/Fraction+root真实stage73479
native/JS均exit0已闭环：旧MaxN scale_range @math.pow(10,-4) nonJS低1ULP；正确scale
4547007122018943789，nonJS4547007122018943788，传播best_min由.4成nextdown(.4)。
Root仅两处decimalpow改已有log_grid_numpy_power，NaN/Inf保wrapper；补1standaloneMaxN
回归，总879newtests，临时ticker/d27_investigate_wbtest.mbt已删除，合同调整存ignored
D27-contract-frozen.md末尾。B独占generator/JSON/generatedWB更新数学profile边界并重gen/check，
C独占guide同边界；A只读复核。无liveMoon，不再轮询95932/73479；等待writer停写后
infofmt/接口/四目标及改动sourcecheck重新验收，未commit，未标complete。

B数学profile更新完成停写，两个10**power AST原位置才替换Fraction primitive；original
profile保原fn；290双profile结果与341phase/629test body全不变，仅metadata/comment。
C guide数值边界已同步并停写。Root infofmt0/8旧warnings，接口审仅预期Logit新增，
MaxN/date公共签名不变；finalall77638 checkall→testall与grid-source71661现live，
所有tracked writers停止，A只读wrapper复核不影响gates。

D27 finalall77638已exit0：wasm/wasm-gc/native各11995/11995，JS12002/12002，全零失败；
checkall31tasks/8旧warnings/0error。grid-source71661 exit0；params/axis此前root复验0后
未变化，三source有效。infofmt0/接口已审，MaxN/date公共不变；A只读boundedpow安全复核
通过并停写，无live工具。总新增879=A121+B633+C124+root1。实际三目标1ULP旧pow缺陷已
按完整AST/Fraction/真实Moonstage证据修正，原期望bit全保持；临时probe已删除。
C正在唯一guide验收状态更新，root总体docs已标accepted。待C停写后featurecommit（排除
checkpoint）及checkpointcommit；goal仍active，下一D28仅定向基础formatter原源/现有体。

D27已最终验收并提交feature524b673（44files）；C最终guide停写后总体docs/guide已全部
标accepted，约46%/80%工程估计不因测试数量机械变动。当前仅本checkpoint待提交；无
remote/push，无live工具/agents writer，goal仍active。下一D28准备命名基础Formatter的
Null/Fixed/Func对象与基类set_locs/axis/call/format_ticks生命周期；先原源+现有体定向notes，
再冻结typed/ownership范围，不提前混入完整默认scale生命周期或复杂formatter。

D27 checkpoint04909a0已提交，随后Gitclean。D28准备已派原三独立agents只读ignored notes：
A D28-formatter-params-notes.md（TickHelper/Formatter/Null/Fixed/Func对象参数状态），
B D28-formatter-batch-notes.md（完整批量算法/回调/错误顺序），
C D28-formatter-axis-notes.md（Axis/secondary/shared/SVG全tick格式化与可视过滤接线）。
未授权tracked实现；root定向读ticker/formatter.mbt与axis/backend formatting路径，
待三notes交付再冻结typed合同与文件所有权。无liveMoon/source工具，不复跑D27门禁。

D28 root初读：旧ticker/Formatter是immutable公开enum，所有format_values/value/offset纯API；
Axis与Secondary setter/getter经Formatter.copy，named可沿Locator.copy模式保live分支。
Primary render_panel原有完整raw主刻度在append_grid visibility之前format，但其查询/format
顺序当前跨XY先alllocs再minorlabels后majorlabels，与源每Axis major.loc→format→minor.loc
→format不同；raising/mutablecallback使此可见。当前minor只有date formatter槽，无numeric
minor。Root与C已明确需checked labels链，不能静默吞新Func错误；没有冻结typed策略。
原Formatter.format_ticks先self.set_locs(values)然后enumerate，Fixed(None)空、negativeindex
沿Python序列、Func原样传pos。无unicode_minus rc，是否本片新增待notes/contract。

D28准备补充：A已93个完整原类/真实deprecated descriptor probes，最终notes待交。
源Fixed seq无复制/验证，posNone先短路len，负pos遵循Python索引；fresh对象共享class
默认_locs空list，copy.copy共享seq/locs/axis/callback但slot重绑独立。Root建议Base动态
privatekind+三wrapper共用state/as_base保虚派发，尚未冻结；Array[Double]的locs需保live
append shape，TickValues仅固定shapeview，不能不说明混同。旧pure formatter helper是否
沿Locator空结果兼容映射、新checked路径直达SVG尚待合同；不能让render吞新error。
无liveMoon/source sessions，A/B/C只读ignored notes仍在执行。精确下一步等三份notes交齐
后root全文读并freeze，未提前分配tracked文件，不重跑D27已有效checks。

本goal回合承接前回合分类为progress：D27 feature524b673/04909a0已验收提交，D28只读准备
cc2c537已提交，当前Gitclean。A325行params notes已全文读，93原类/真实deprecated helper
观察有效并停写。完整deprecation.py当时内存从固定官方tag读取，SHA364d069a9bcdf2b10f2f
641220717baaa4e5c9b8e25fbe150cd9895f2f8542d2；正式reference需保存ignored pinned源并校验，
不能用fake descriptor。B57原AST观察/C38原AST观察仍在写最终notes，无Moon sessions。
root moon ide doc Array::iter已确认固定bounds，不能用于Python list live-append batch。
D28合同尚未冻结：pos倾向Int32?typed，locs Sequence(Array[Double])|NdArray(TickValues)，
copy浅共享容器但slot独立，Base动态kind+三wrapper保virtualcall，axis拟opaqueidentity而非
发明无实际读取的四provider；动态rawPython/完整Dummy API为明确边界待notes汇总。

## D28执行顺序（命名基础Formatter）

- [x] D28-01 原A325/B239/C281定向notes全文读，冻结D28-contract-frozen.md及HEADcc2c537 snapshot。
- [x] D28-02 独占并行实现对象/批量算法/真实source refs及rootchecked integration；四目标验收待下项。
- [x] D28-03 三source/四目标/infofmt/接口与生成测试警告清理后复验通过，最终docs/feature53ed70d提交；本checkpoint紧随。

D28已冻结：Base私有dynamic kind+Null/Fixed/Funcwrapper livebase，locs SequenceArray动态
length或TickValues固定shape/liveget，共享classdefault；浅copy容器/provider共享但slot独立。
posInt32?，Func(Double,Int32?)->String raiseCore，错误直传，原序/reentrant/func重绑保留；
Base.fix_minus动态Boolrc，无batch100000cap。Axis身份opaquebinding+dummyminposmetadata，
完整动态TickHelper/DummyAPI与rawPython位置信息明确typed边界。独立namedsetter/getter槽
保旧Formatterenum所有purehelper/copy合同，不新增吞error桥；primary/shared/secondary主次
checked源perAxis顺序，rawFixed formatter-aware获取与真实overlap，legacyhelperclip不全改。
A负责formatter_base/named与params/shared真实descriptorloader，B named_batch与batchrefs，
C axisrefs/tests/guide，rootconfig与所有integration。A真实deprecation缓存pin核sha，C正式
不能沿只读fake descriptor。当前无liveMoongates，三writers正式工作中，root先config。

D28 root主体已落：config unicode_minus字段/snapshot/reset与独立gettersetter；Axis稳定
binding+独立named主次槽/安装warning/checkedlabels/liveoffset，Scene shared requester重绑与
removal存活owner重绑、Secondary同槽、IR参数/借用locationsproviders、SVG按每轴major→minor。
C正式源probe发现额外alias要求：Fixed/Linear preset owner在callback0修改影响callback1，
minor overlap=false同view，true boolmaskfresh。Root已用FormatterLocations贯穿raw采集→
format_ticks_view→batch后Tickposition snapshot，不能先.to_array；Secondary IR也保view且
majorformat先于display inverse。合同末尾已记证据细化。16root文件单stdinmoonfmt parse0，
非Moongates；root补config snapshot1test。A停写85tests/gencheck0，B停写196/gencheck0；
C仍独占增加alias refs/tests并生成。无liveMoon工具；下一等C停写后统一static/infofmt。

D28 A/B独立rootreview发现3真实缺口，root正在修并让C新增原AST回归，尚未Moongates：
secondary IR增加live formatter/nullgroup provider，回调换minor locator/formatter或major
formatter后offset取current handle；raw Multiple直接对象call不能fallthrough旧clip/catch；
newnamed fullFixed/Linear preset运输移除100000 cap（其他locator已接受primitivecap不改）。
C先前60tests暂时已停，现独占补slot替换/Multiple/full125001 profile；A/B正式refs停写，
root --check复验两份均exit0。显式date/category按原清legacy点同步清named避免复活；不宣称
完整隐式defaultreset。A128/B124只读review notes已交，无liveMoon工具；下一C再停后static。

D28 root三缺口修正已落：IR formatter_provider(Bool)->Base? 与null_group_provider(Bool)->Bool
从Scene live获取nextstage slots；legacy Secondary fastbranch不再earlyreturn，允许其major回调
安装namedminor后commonminor阶段看见；手工IR无provider保snapshot。newraw Multiple主次
直call对象；全Fixed/presetview运输无cap，secondary overlap=true NamedFixed/Linear也不再
截断（oldnonNamed acceptedprofile保持旧cap）。显式date/category原清formatter点同步清
named主次；set_tick_labels成功也清namedmajor，legacyinstall清warning snapshot。Root8个
修正文件单stdinmoonfmt parse0；A128/B124只读reviews已全文读，未见其余具体缺陷。
C仍独占新增10原源cases（secondary x/y slot替换6、Multiple2、full125001 transport2），
旧expected会逐键比对不变。A/B与root其余writers已停，无liveMoon工具；下一C停后gates。

D28 C补10回归后再次停写，70=62generated+8hand；旧期望逐键对照完全不变，sourcegen/check0。
Root三source --check复验均exit0（D28-{params,batch,axis}-source-check.log），info&&fmt0，
8旧warnings/0error；D28-interface.diff已全文审仅预期新Base/3wrapper/locations/binding/
unicodeMinus/checkedAxis/Scene/IR；旧Formatter enum/purehelper签名完全不变。
New352=A85+B196+C70+rootconfigsnapshot1，期望nonJS12347/JS12354。全部tracked writers停写。
唯一live工具29320运行checkall→testall，D28-check-all.log/D28-test-all.log，root负责轮询；
不再轮询D27旧sessions。仍未accepted/未commit，待全目标结果后更新docs/guide并本地提交。

D28 allgate29320已exit0：wasm/wasm-gc/native各12347/12347，JS12354/12354，全0fail。
checkall131tasks/16warnings=8旧Ref+8新增generated samples空[]互比未定类型；不是生产
缺陷。B已获独占授权只改batchgenerator/generatedtest：if samples非空才emit比较，空情况
已有actual labels.length()==0等真实断言，全部事件/状态/非空样点断言保留，JSON不改。
当前无liveMoon，B仅这两tracked文件在写。停写后root infofmt/checkall回8旧warn，并只
重跑该192generated×四目标，生产与其余测试没改，首次全suite证据继续有效。

D28最终qualitygate1325已exit0：info&&fmt0，checkall24tasks/8旧Refwarnings/0error，batch
192generated各四目标全过；B仅省略8空samples恒真断言，其余实际query/length/events/状态/
非空样点断言逐字保留，JSON字节不变。root B source-final复验0，A/Csource此前root复验0
后均未改；D28-interface.diff final逐字比较相同。原fullsuite29320(12347/12354各全过)证据
有效，生产未改不重复全suite。D28实现与验收均完成；C唯一guide更新accepted中，其余
writers停。root总体docs已accepted，待guide停写后featurecommit排除checkpoint，再checkpoint
commit；整体goal仍active，约46%/80%工程估计不机械变化。下一D29字符串命名formatter
仅定向source/oldengine准备，不重survey/不提前混入复杂Scalar或完整default/Text生命周期。

D28最终guide已accepted并停写；feature53ed70d已提交46files。全部code/refs/docs均完成本片
验收，Git只剩本checkpoint；无remote/push，无live工具。Goal仍active，不能因本片完成
标整个v3.11.2迁移complete。接下来D29候选命名FormatStrFormatter/StrMethodFormatter，
先定向原完整类与旧formatter_printf/string/numeric引擎的参数/格式/轴引用notes，沿D28
Base状态与checked管线复用，不提前改已验收D28 API或重开全项目survey。

D28 checkpointf70da14已提交，之后Gitclean。D29只读准备按三个大独立块派发原agents：
A对象/fmt slot/浅copy/继承Base兼容，B原旧式% engine，C原StrMethod/_UnicodeMinusFormat
engine；精确notes名见head。必须完整原AST/真实Python格式算子独立观察，不用port作oracle，
不提前tracked实现、不Moongates、不为容易过测试保留错误literal fallback。Root只读必要
原类与旧engine接口；下一notes全文读后freezeTyped/所有权/完整数值与String格式范围。
整体goal active；D28所有sessions terminal，无liveMoon/source工具，仅三agents只读notes。

D29 root定向初读完成：原FormatStr.call只fmt%x，StrMethod.call每次新建_UnicodeMinusFormat
并format(fmt,x=x,pos=pos)；helper只在format_field结果上fix_minus，literal不改。旧printf
明确bounded literal-fallback，旧StrMethod接受value别名/按g6，不能直接复用冒称新named源合同。
C已独立证实{x:d}在Double域原ValueError而旧helper接受，默认{x}原shortest含1.0的.0，
旧g6不同；正完成更多真实AST probes。Root仅读旧engine接口/共享decimal helpers清单，
A/B/C notes仍运行，无tracked生产、无liveMoon/source session；等最终三notes全文读后freeze。

D29 readonly阶段已完成：A67、B2299完整原ASTpercent、C470原StrMethod/Helper/真实stdlib
观察，三notes全文读；独立scope/ownership见D29-contract.md。新增privateNamedFormatValue
PythonFloat/NumpyFloat64/NumpyInt64，newnamed view保dtype和exactInt64，D28Func转换不改。
Root105656finite Pythonrepr vsNode重排shortestdigits零差异；coreRyu为ECMAScript算法，
共享numeric复用旧exactlowerhelpers不继承precision100clamp，emptytypeprecision cutoff
与g不同；fixedPython追加实证。新named真实errors映射Core.InvalidTicks含源classprefix；
非scalar fmt/dynamicreflection/locale变更/unpairedsurrogate是独立typed边界，不假称source
error parity，Source-valid width/precision不旧100/1000cap，StringInt32addressability独立。
A已落Base2kind/新wrappers/显式load_string_formatters，保持旧loader hashes不变；root
formatter_named_numeric/batch初稿单parse0。B/C正式engine在写，A正式paramsrefs在写。
没有Mooncheck/info/fullfmt/test/interface/commit，不提前gate；下一root加共享numeric源refs与
axis/SVG完整AST验收，等writers停后统一gates。整体goal仍active，无需用户澄清。

D29实现中期：A已停写7files，61generated+2hand=63，215observations/18source-only，
newgen/check0且oldD28paramscheck0、旧loader6class/4hash不变；B首交5files2874generated+
4hand，2874source=2563success/303errors，8surrogate边界另列、3巨型allocationomissions不
执行不冒sourceerror。B正式gen/check0后经A只读review找到NumPy无consumed的plain/empty/%%
实际应成功，以及正plus/space须在巨大integerpadding前计入地址长度；B获独占修这两处并
加无巨型分配Resource测试，JSON旧expected不改。A继续只读percent独立review，B修完再
继续只读numericreview。C3method生产主体960行parse0，formalgen首轮完成文件但仍自审/写
guide，不gate。Root新numeric source4767断言/162groupedtests（含4Int64maskgroups），
axis32success+16error完整originalbatches→64tests，rootmaskhand1；两新gen --check0。
Root发现次刻度重叠筛选从Int64降Double，已加TickValues.select_mask保dtype/freshcopy，
primarymask共享谓词，secondarynamed用rawviewmask且majorfullview；publicSVG原源Int64:d
和np !r cases覆盖。Rootnumeric取消places+1080保守cap，改nearInt32真实outputlength预检；
nonalternate超1075有效位后的零可按binary64精确十进制终止性质省略计算，scientific阈值仍
按原precision，不假改valid格式。当前所有Moon项目gates尚未运行，source新checks均exit0。
下一：等C最终停写与A/B只读复核，root统一check/infofmt/interfaces/sourcechecks/testall。

D29 C首交已停写8files：3method production/1generator/JSON/1922generated+4hand/guide，
1911parity=1491success+420realerrors，4fullbatch/view含125001Int64、7typedboundaries独立，
1allocationomission。gen/check0；guide pending集成。A独立percentreview153行已全文读，
实际93focused+19987finite%-s probes；B已修NumPy no-consumedliteral、integerpositiveSign
与priorliteral remainingpreflight，2874原cases/expected structurehash不变，2881=generated+
7hand；metadata补2合法巨宽skip→5omissions，gen/check0。B再次停写，仅readonlynumeric
review。C获独占同类remaining资源预检修补：rootcommonfloatdigits新增可选available~:Int64
(defaultMAX)，precision>=1075时exact十进制expo可先算真实outputlen再分配；所有短结果也
按actualbudget检查。C传outerwriter当前UTF16剩余容量到field/padding/float、groupingzero
二分后先算groupedsize，保证源错误先于Resource。C此修补完成前不Moongates。
Root原source numeric/axis --check均再次0，无liveMoon/source工具。下一C再次停写后统一gate。

D29首次统一checkall已terminal exit255，log D29-check-all-initial.log，非live：299errors实际
两根因=rootnumeric generator tuple循环误作index/value（298重复类型错误，已改tuplepattern
并重gen0），C MethodFormatValue::Scalar与legacyFormatter::Scalar歧义1处（C独占修）；
root重复largeprecision测试名也已加bits区分；C另修4新增deprecatedcalls，NoneValue未用为
歧义连带推断。没有开始fullsuite/infofmt。A只读methodreview原源发现hexGrouping a-f漏扫、
decimal token前缀overflow被allNd预检遮蔽、explicitNUL在float与int/string差异、unknown
nonASCII/control typecode消息escape；C获独占同次修正/补sourcecases，旧1911expected不改。
Root实证Core Char.is_printable并非固定Python15（unassigned/version字符quote会不同），新增
私有formatter_unicode_printable.mbt及独立generator/JSON，实际fixedPython1114112codepoints
分类为712nonprintable ranges，供Cquote调用；不复用近似predicate冒称source字符串parity。
B readonlynumericreview114行已全文读，217新实际原AST观察、反向Int64alltrue/empty freshdtype
证据，无额外具体缺陷。C最后预算修补已新增2WB→1928首交后再次源review修正，当前唯一
trackedwriter C；root本次numeric/Unicode sourcefiles完成，无liveMoon/source工具。
下一C停写后统一checkall→infofmt/interface review→sourcechecks→四目标fullsuite。

D29 C source/Unicode/hex/token/NUL修复再次停写，新增56原源queries，旧1911records逐字不变；
现1967parity=1496success+471errors，4batch+7boundary→1978generated+6hand=1984。root已
全文读C独立integrationreview96行，无新缺陷且4原ASTInt64 aliasprobes通过。第二checkall
70561 terminalexit255：生产0error，3942重复errors全是Cgen错误假定config.snapshot/restore
不存在（各1971）；C已fixture-only改现有unicode_minus getter/setter+defer，JSON字节不变。
另A9处method保留字warnings已只改Moon变量method_formatter，JSON SHA前后完全相同。
六新source root并行复验均0（D29-{params,percent,method,numeric,axis,unicode}-source-check.log）；
C/A最后fixture变量更正也各自gen/check0。全部trackedwriters再次停写，A仅收尾readonly。
唯一liveMoongate18090：checkall第三轮→info→fmt→interface diff，root负责；之前全部sessions
已terminal，不再轮询70561。无fullsuite结果，不提前accepted/commit。下一static0后审完整
D29-interface.diff，运行四目标testall。预计新增5155=63A+2881B+1984C+162rootnumeric+1mask+
64axis（Float数字4767assertions是group内容，不另作testcount）；nonJS17502/JS17509待实际。

D29第三统一gate18090 terminalexit0：checkall24tasks/8旧Refwarnings/0error，info0/fmt0。
Root完整审接口diff：仅2new namedclasses18methods各、Base2downcasts、TickValues.select_mask，
无其他公开包改变、旧Formatter enum/purehelper签名逐字保留。Allwriterstopped；new5155=
A63+B2881+C1984+rootnumeric162+mask1+axis64已逐文件count确认，预期17502/17509。
唯一live13440运行moon test --target all，log D29-test-all-initial.log；root负责，不轮询
旧18090/70561等terminal。下一观察fullsuite失败则只修真实差异/保expected，成功则最终
source --checks/guide与全docs accepted更新、本地feature+checkpoint commits。整体goal active。

D29 fullsuite13440 terminalexit2：四目标均仅3个完全相同fail，root新增U0378/U1C89/U1FAE9
invalidspec源actualexpected是literal char，而port method_quote造转义。Root确认之前ascii
(str(exc))误读，实际membership证明源msg含字面codepoint、不含反斜杠u；另原KeyError反之
确实repr转义。因此保fixedPythonprintable供method_quote(KeyError/转换)，只将spec_error
改rawsinglequote拼接。C独占定向修并加6sourceerrorcases（3unicodeunknownkey+3含quote
invalidspec across float/int/string），旧1967expected/原3fail不改；其余全suite17502/17509
中全部通过。A method独立review178行已全文读，88probes+68Ndblock全表验证无遗漏；所有
readonlyagents停写。当前无liveMoongates，唯一trackedwriter C此修补，root负责最终gate。

D29最后C私有spec_error已按rawsinglequotes修复，KeyError仍真repr；新增6原源errorcases，
旧1967parityrecords与boundaries/batches逐字未改。C现1973parity=1496success+477errors，
4batch+7boundary→1984generated+6hand=1990；新总5161，预期nonJS17508/JS17515。
最终gate38939仍live：info0/fmt0/checkall83tasks8旧warnings0error、接口finaldiff cmp逐字相同；
正在fulltestall(D29-test-all-final.log)。六新source root final再次各exit0，日志D29-{params,
percent,method,numeric,axis,unicode}-source-final.log；git diff --check0。所有tracked生产/
referencewriters停，下一fullsuite0才docs accepted与本地feature/checkpoint commits。

D29最终gate38939 terminalexit0：wasm/wasm-gc/native各17508全部过、JS17515全部过；
new5161。6sourcefinal各0，infofmt0/checkall83tasks8旧Refwarnings0error；接口final与docfinal
逐字cmp同。修正原Invalidspec rawquote，KeyError保真repr并新cases验收；原1967expected
全部保持。首full13440每目标3失败仅这消息已修，所有旧sessions终止无live。Rootdocs与guide
accepted已更新，numeric/Ryu/exactInt64/typed动态Python/固定C locale与Unicode15边界明确；
工程估计继续约46%/80%，不机械按5161测试推升。下一本地featurecommit排除checkpoint、
再checkpointcommit；整体goal active，D30候选命名PercentFormatter只做定向notes准备。

D29 feature0b4f8c5已提交43files，工作树仅本checkpoint；最终验收与docs全部完成，没有
运行时外部依赖。Goal仍active约46%/80%，无remote/push；不因D29完成标full迁移complete。
D30 PercentFormatter定向readonly notes已派回原3agents：A对象参数、B数学/dtype、C真实
view/dummy/shared/secondary/provider；精确notes名见head。先保持D28/D29已有public/legacy
合同，不能拿旧purepercent或伪axis作原源oracle。Root下一只读必要原类/旧helper/AxisBinding，
待三notes全文读后freeze；无D30 tracked生产、无liveMoongates/source会话。接着checkpoint
本地commit，保持恢复入口清晰。D29全部旧session已terminal，不再轮询。

D30冻结：PercentXMax保Python/NP标量origin，PercentDecimals保late int转换；symbol动态TeX
rc，旧purehelper不改。A参数103观察，B数学/precision274行与693threshold原源/独立profile
输出一致，C轴75+2实际默认frame源timing；全文notes读毕。Root先加binding provider与dummy
view再交A独占base，防写冲突。新before快照HEADff9e7de含所有接口+tracked archive。
下一Root liveprimary.set_limits缓存/可见性与secondary存view/layout+childdraw先于parentcallbacks；
agents分别独占对象/数值/原源axisrefs文档。实现未gate，整体goal active，暂无用户阻塞。

D30实现中：A已首交7files停写，257observations/92generated+4hand=96tests、10source-only，
newparamsgen/check0、旧D28/D29paramscheck0，base仅kind/copy/getoffset且保rootbinding。
B两新engine文件初稿和numeric原源1803首gen0（693thresholdpair0profile差），仍加有限Unicode
与integer-range证据；C正式actualaxisrefs/guide在写。Root12filesstdinparse0，无项目Moon gate。
Root接线：config.text_usetex默认false/copy/reset；primary绑定NdArrayFloat，set_limits与
set_view_limits在activeframe更新缓存；secondarystoredown初值、apply_aspect finite前置/NS后
不再finitecheck以保NSoverflow；IR live sync回调，prelayout一次、childdraw位于primary之前，
预备namedsecondary完整bundle，XML后append；primary最终range用于可视筛选/映射。
A独立review已发现默认Dummy原Python整数range与rawInteger/Bool0+NPbatch错误消息不同；
已修合同：新增FormatterViewInterval(Sequence Double/Integers BigInt/NdArray)专供binding，
旧FormatterLocations/NamedFormatValue不改；dummy默认Integers[0,1]。B正在加一般精确int/int
range入口PercentDisplayRange，旧percent_format_pct薄封Scalar；Root已改base/batch/Scene，
A一处handcallback改新enum。C已补14真实_set_lim NS/finite病例，parentlog初始化再定向核实。
当前没有liveMoon/source工具，唯一trackedwriters B/C及Root，A只读crossreview。
下一等writers停后统一gates；先完成secondary函数log默认view与NS/clip必要证据，不能用
直接forward(parent)伪装stored ownview；所有实施尚未验收，整体goal active。

D30数值/对象最终首交：A96tests（92gen+4hand）、B2079（2076gen+3Resourcehand），
B2076actualsource=1606success/168ZeroDiv/154Overflow/148Value，264nativeRuntimeWarnings单列，
693thresholdpairs0source/math差异、3unsafealloc omissions。A/B新gen/check0、独立reviews
175/96行已全文审，唯一Dummyinteger缺陷已通用type/ratio修正。A一处purecallback改arrow去
潜在unusedraise警告，无源expected变化。A/B均停止tracked写入。
C正式axis首gen113=77原病例+14真实_set_lim NS/finite+8真实parentlogctor/apply+6完整batch/SVG
+8rawInteger/Bool0与rangeorigin；只剩sourcecheck/guide。Root新增Scene bigint testimport。
Root已按原父logconstructor空data/_set_axes_scale/autoscale_view最小链补ownstored初始化：
NS1..10→inverse/logclip变换→创建时x/y rc margin→pow/forward逆变换→Logview_limits/NS/clip，
不安装或改旧secondary locator采样；复用既有Log geometry math profile。父linear仍初0..1。
Primary cachedview显式limits变化实时更新；render_panel先刷新前panel共享mutation，完整
secondarynamedbatch先于primarycallbacks，primary最终view用于可视筛选。当前仅C/Root还写，
无liveMoon/source工具，所有生产未gate。下一C停写后Root静态→infofmt/interface→新source
checks→四目标fullsuite，预计新增2289但以最终实际count为准。整体goal active。

D30全部tracked agent writers已停，C最终117gen/check0（原113+lateprovidererror/3unpack），
6secondarynonfinite断言已与新API保精确ValueError消息的InvalidTicks匹配，JSON原期望字节不变。
总new2293=96A+2079B+117C+1config；预计nonJS19801/JS19808。Root全文审guide与sourcegen，
2独立reviews已审无其他缺陷。所有旧source会话terminal。唯一liveMoongate16571运行
`.moonagent/checkpoints/D30-gate.sh`：checkall→info→fmt→interface.diff，root负责。
日志D30-{check-all,info,fmt}-initial.log，interface D30-interface.diff；未有fullsuite结果。
下一static0后审完整接口（应新增Percent及rawtypes/ViewInterval/bindingview/config/secondarysync
和IRoptional callback，旧pure Formatter与旧locs接口不变），新3source root复验并全suite。

D30首check gate16571 terminalexit255（无liveMoon）：生产0errors，8重复错误全Cgen的
tiny/maxfinite x/y identity inverse被stdin formatter误识record；20warnings=8旧Ref+6新Ref
+4ambiguousblock+2constantforward unused。C获独占fixture-only修identity return/ref constructors/
constant参数 `_`，并补shared删除fixture显式Axis级local limits防delaxes真实provider重新绑定
后空auto范围替代受控Bbox。原117sourceJSON/expected/count不改。Root未infofmt或fullsuite。
下一C再次停写后统一check→infofmt/interface→3新source rootcheck→testall，旧16571不轮询。

D30 C fixture-only修补已gen/check0、117count与原JSON SHA不变；所有trackedwriters停写。
唯一live68518第二次执行central gate（checkall→info→fmt→interface）；旧16571 terminal。
生产还未fullsuite验收。

D30第二central68518 terminalexit0：checkall24tasks/8旧Refwarn0error，info0/fmt0。
168行接口diff已全文审，仅Percent wrapper/rawtypes/Base downcast、独立ViewInterval与binding
view方法、config.text_usetex、secondary.apply_aspect及IRoptional sync；旧Formatter enum/
pure helpers/FormatterLocations签名未变。三新source rootcheck各exit0，logs D30-{params,
numeric,axis}-source-root.log；axis sourceoverflow RuntimeWarning为实际观察非失败。
全部writers停写；已启动full Moon suite，live session见下一条，结果待验收。

唯一live fullsuite17167：moon test --target all→D30-test-all-initial.log；root负责。
check68518与所有source sessions已terminal，无别的live工具。预期nonJS19801/JS19808待实际。

D30首fullsuite17167 terminalexit2，四目标均相同14fail；wasm/gc/native各19787/19801、
JS19794/19808，其余全过。6数值/参数失败共两根因：Number/NPFloat normalize -0+0被
Moon优化保-0，需显式zero canonicalization；B引用旧formatstrgen moon()误将literal\\uXXXX
改为\\u{XXXX}，影响FEFF/180E错误expected生成（JSON原源正确）。8axisfail全Cfixture在
set_log之前留有0..4旧limits触发现有严格校验，未进入secondary；只需先设1..100再set_log。
B获独占新normalize/gen/WB修；C获独占gen/test顺序修；JSON源期望保持字节不变。当前无live
Moon/source工具，所有之前sessions terminal。Root不同时改B/C文件，下一停写后final gate
check/infofmt/interface/sourcechecks/testall。未提前accept或commit，整体goalactive。

D30 B/C失败修补全部停写，原JSON SHA/expected/count不变。B仅constructor显式zero为+0、
新gen quoting按JSON反斜杠run奇偶；C8logfixture先设正limits再set_scale。唯一live finalgate
16019：info→fmt→checkall→finalinterface与已reviewed diff逐字cmp→fulltestall。
日志D30-{info,fmt,check-all,test-all}-final.log；三sourceA此前root0、B/C修gen后final复验
见相应log；所有旧sessions terminal。整体goalactive，未提前accepted/commit。

D30最终16019 terminalexit0：wasm/wasm-gc/native各19801全过、JS19808全过；new2293。
infofmt0/check79tasks8旧Refwarn0error，finalinterface逐字cmp reviewed168lines同；三新source
root检查全0（A rootlog，B/C final）。修正Number/NPFloat ctor显式+0、newgen literal\uXXXX
quote及C8log正limitsfixture；原sourceJSON期望完全不变。guide/README/COMPAT/PLAN/依赖/
notice已accepted更新；fullGUI/Text/defaultscale lifecycle与几何数值profile明确。
整体工程估计仍约46%/80%，不按新增测试数机械推升。下一最终doc infofmt/cmp/gitdiff检查后
feature+checkpoint本地commits；无remote/push。D31仅readonly notes，整体goal仍active。

D30 feature11112e9已本地提交39files，最终doc infofmt0/interface cmp同；本checkpoint
记录最终验收与接续。完整suite16019及三source全0，所有Moon/source工具terminal。D31候选ScalarFormatter
只读3分片已重派（A/C曾capacity但无tracked影响，最后3agent running）。C初步证据：主
set_locs批次只需view，format_data_short真实X/Y轴还读display±1像素逆变换；Dummy才
用span/1e4，不能拿tickspace伪替。B初步风险：Int64 extrema先比不同后转Double可能塌
在同数，_compute_offset count-search潜在不终止；必须有独立原执行trace预算中止记录，
不能裸跑/伪SourceError；np.round算法与D29精确fixed decimal不同，不可直接替换。
这些仅未冻结准备，待notes完整后Root决策。整体goal仍active约46%/80%，无remote/push。

D31 A重派已正常启动，完整ScalarFormatter/必要真实_val_or_rc依赖在核对，B/C亦只读进行；
不再等待容量错误，无需用户介入。无D31 tracked实现、无liveMoon/source长会话。

D31冻结实施：完整contract与A/B/C源notes已全文审。ScalarNumber保6scalar origins，rawlimits
保4容器；set_locs先存原对象且分阶段late view读/partial state，empty保cache；offset全checked。
NumPy round按multiply/rint/divide，Python round独立；fractional固定order支持。原Int64 collapse
死循环和locale负repeat停滞仅按已证明条件Unsupported，源trace预算独立记录，不造源异常。
Root新增config/scalar_formatter.mbt、numeric_locale.mbt及Rc字段；locale processglobal不随rc
reset，3getter与借用grouping已通知C。A已新Scalar对象/checked Base/copy骨架落盘；B数值与
C完整stdliblocale流程仍实现中。没有D31Moon gate或验收结果；唯一原3agents并行、禁止各自
项目check/info/fmt/test/commit。Root下一完成扩展%引擎、namedbatch与轴物理/offset集成。

D31实施进展：Root18个生产文件stdinparse0，已接Scalar direct/Array/view/data/short派发和
checked batch准备、旧D29%薄wrapper保原NamedFormatValue3variants，新ScalarNumber6origins/
scalar-or-single-tuple%引擎；独立native%882refs gen0（354success/528真实errors），未Moongate。
新rc/locale getters与借用limits/grouping就绪。主轴binding像素geometry保origin/length/正逆
变换，frame缓存bottom-up origin；secondary初始物理figurebounds/direct apply恢复与frame
parentbbox分离。named所有类型NullLocator后offset仍checked读取，接到SVG；原便捷pure未改。
C六actual np.linalg.inv与独立Fraction inverse系数双证据已补（native系数有差但6label一致），
Root采用portable diagonal affine数学profile并保持From→To→pixel±1→inverse乘加步骤，不宣称
Darwin LAPACKbitclone；已追加contract，guide待明确。所有Root新增仍未项目gate。
A完整首交停写：7files，181观察/76gen+4hand=80tests/17sourceonly，新gen+check0，旧3params
checks0，sharedloader严格append字节prefixTrue。A现只读复核Root%/config/batch，ignored
D31-root-crossreview.md；不得tracked写。B五entry/4newkernelfiles落，正式numeric/mathrefs在写，
Rootreview已请核实offset捕获旧locs-before-view与format尾len动态读取/非终止Unsupported分类。
C完整stdliblocale3134refs首gen0（2333success/801真实error）+3trace预算非终止边界，正式
141axis与6inverseprofile在收尾，并核实secondary inverse visibility与lateoffset读取顺序。
无liveMoon/source长会话，项目门禁必须等B/C停写后由Root独占执行。整体goal仍active。

D31 B最终已停写：8files（4prod+gen/JSON/genWB/handWB），1313gen+2hand=1315tests，
2229actualsource observations，0actual/math差异且双值全保；120seededfractional与647phasepow、
120NumPy-round、5BigIntlog、完整200001locs尾点、12single+hugeview objectdtype、2重入。
原offset先捕获locs/format尾len动态读取已核实修，Int64 collapse单列Unsupported、BigInt
证明位地址Resource分开；gen→check0/单parse0，无项目gate。60808 terminal0，无live。
A Rootcrossreview138行已全文审，156追加native%证据，无格式/API缺陷，唯一newdeprecated
Ref构造已修；A停写。C最后143源stage+6inverseprofiles预计149axis tests，3134locale+3
boundaries在收尾；仍唯一agent trackedwriter，Root gate等其停写。Root新IR ownview provider
保证secondary完整batches→view/tick inverse变换→lateoffset；minor转换随bundle预备，XML
不再晚调用inverse。C2真实ownAxis.draw证据已确认offset最终from-inverse。Root882native%
refs与2resource手测、1configlivegrouping/reset隔离测试已落；BigInt::from_string已校正。
C正在修相同fixture API，不改原JSON。无liveMoon/source工具，下一C停后D31-gate.sh。

D31 B停写后发现并已由其独占修正short临时list元素origin：Sequence在view前捕获Python
Number，NdArray保NPscalar；后才np.asarray promotion，>=2分支不变。正式巨大view objectdtype
原error类型float/np.float64分别保持；1313generatedexpected/JSONSHA不变，90663 check0/parse0。
C143source stages+6mathinverse已gen0；Root全文locale审新发现最终Stringtuple stage需支持原
regex未捕获但native有效的%a，例如%a%f应先消费字符串后missingargs，不应unsupported'a'。
C已收到追加源case/实现复核请求，仍唯一agent trackedwriter；暂不开始项目门禁。

D31所有tracked agent writers已停。C正式交付10files，3426tests=3270locale源query
（2343success/927error）+3negative-repeat boundary+4resource/stage hand +149axis
（143actualstage+6inverseprofiles→129Scene+20WB）。%a最终stage真实新增9raw组修正，原
rows未弱化；中间raw/localize与最终remaining预算分离，巨分配不执行。两gen→check0，无live。
总new5706=A80+B1315+C3426+Root885，预计nonJS25507/JS25514，最终以gate为准。
唯一live项目gate64375执行D31-gate.sh：checkall→info→fmt→interface.diff，Root独占；
日志D31-{check-all,info,fmt}-initial.log与D31-interface.diff。生产尚未验收/未commit；下一
静态结果与完整接口审查，必要精确修复后再fullsuite。整体goal active，无用户阻塞。

D31首static64375已terminalexit255，无live工具。9errors仅4处科学数字面量1e写法需
1.0e、locale if表达式后直接.to_int解析及其3级联type、state offset_threshold未用mut；
另1新unusedraise warning为纯strip_padding标raise。Root独占修为合法literal/独立split64
转换/readonly capturedthreshold/纯helper不raise，语义与原JSONexpected不变；不回滚实现。
未info/fmt/fulltest。所有agents仍停写，下一重跑central gate；8旧Ref warn基线尚等完整check。

唯一live58178正在第二次central check/info/fmt/interface；初次64375 terminal不轮询。

D31第二static58178 terminalexit255：生产check已全过，仅421条重复fixture错误都因
numericgen直接改readonly offset_threshold。Root修fixture prelude为保存rc→设threshold4→
构造capture→恢复rc，不新增生产setter或允许无用mut；删private state setup。gen0，JSONSHA
逐字仍ec175ced...293c6c5，全部1313expected/count保持；第二失败log已保存D31-check-all-second。
上一8旧Refwarn/无新warning已确认。下一第三central，未fulltest/未accepted。

D31第三central16259 terminalexit0：checkall24tasks/8旧Refwarnings/0error，info0/fmt0。
261行interface diff全文已审：仅新Scalar/rawtypes/config/locale/physicalbinding、Basechecked新法、
Axis/Secondary checkedoffset加raise与IR可选ownview provider，旧pure Formatter/legacy helpers
公共签名不变。所有writers停写。Root5source checks：params0、percent0；numeric65611/
locale3066/axis58538尚live。唯一Moon fullsuite38228执行moon test --target all→
D31-test-all-initial.log；预期25507nonJS/25514JS，尚未验收。下一收三source/tool terminal
结果与fullsuite，若fail按实际源值修，不能改弱原JSONexpected。整体goal active。

D31 fullsuite38228 terminalexit255：Wasm ticker.whitebox模块init函数70789个locals，
运行器报local count too large，尚未进入行为用例；非实现断言失败。五新source root检查全0，
三source65611/3066/58538均terminal0，无live。Root/C做仅测试组织修复：3270locale与882native%
case改私有逐case函数（保原body/defer隔离与全部断言）→每32case注册1test；3locale边界/
4手写和Root2resource保持。原JSON cases[]必须逐项深度相等，新registered_test_count单列，
不能删case降覆盖；C临时独占localegen/WB/metadata/guide，Root独占native%gen/WB/metadata。
Root882case已改28registeredtests并验证cases深度相等；下一C停写后重新static/infofmt/interface
不变检查及完整四目标，重新以framework实际count报告，源case总5706不变。未accepted/commit。

D31测试组织修复完成，C已停写。3270locale query→103groups+3边界+4hand=110registered，
882native%→28groups+2Rootresource；所有逐case原body/defer与断言保持，两个JSON cases[]已
逐项深度相等。Root另把C每case失败字符串改单个公共错误helper+运行时id，避免3270条新
静态String再消耗initlocals。C全部259registered，Root31（28+2+1config），A80/B1315不变。
预计新增1685registered→nonJS21486/JS21493；5706验证案例保持，不按注册组数声称覆盖减少。
下一finalgate info/fmt/checkall→接口与已审261行逐字cmp→两变动source --check→fulltestall；
此前所有sessions terminal，无live，旧行为expectations不改。

唯一live finalgate11338：D31-final-gate.sh；所有agents已停写，旧gate与source sessions均terminal。

D31 finalgate11338 terminalexit255，info/fmt/checkall130tasks8旧warn0error与interface261cmp
同、locale/percent sourcefinal0。Wasm init组织问题已解，wasm/gc各21473/21486、JS21480/21493，
同13fail；native在Scene invalid BigInt fixture SIGABRT，未完成全suite。12个Scene病例
6/7/8,15/16/17,24/25/26,33/34/35构造Number1000000.0误编码成BigInt::from_string("1000000.0")；
C仅独占axisgen/两Scene生成测试修，原JSONexpected不改。另唯一numeric case264原NumpyBool
True在Dummy Floatview[0,0] short：port17digits vs原5digits，疑_g_sig_digits np.spacing输入
origin丢失（NPbool ufunc浮点域），B仅独占必要numeric/mathprod核实修。其余全部测试已过。
当前无liveMoon/source工具；A停写、B/C为这两精确修复writer，Root不改其文件。下一停写后
统一finalgate，保持源期望与注册1685/验证5706不变，未accepted/commit，整体goal active。

D31精确fail修复全部停写：C浮点ctor编码Number明确分支，12fixture修正，gen/check0且
原axisJSON逐字cmp同。B实际原NumPy spacing probe证实Bool/NPBool选择float16 ufunc（True
2^-10/False2^-24），新私有scalar_math_spacing保origin并在原delta0分支调用，非标签特判；
sourcecheck0，numericJSONSHA仍ec175ced...293c6c5，无新测试/无expect变化。Root已保存上一
失败test/check日志为D31-*-before-spacing-fix.log。下一finalgate重跑，接口仍应261行cmp同。

唯一live最终复验93879运行D31-final-gate.sh；所有agents已停写，旧11338等sessions全部terminal。

D31最终93879进展：wasm与wasm-gc各21486/21486全部过；JS/native仍待。261接口cmp同；
仍唯一live门禁，所有agents停写；上一12fixture+1boolspacing fail已全部在两Wasm目标消失。

D31最终93879 terminalexit0：wasm/wasm-gc/native各21486/21486、JS21493/21493全部通过。
新增1685registered承载5706原细分案例；grouping前后cases逐项相等，Wasm init46663locals。
infofmt0/check130tasks8旧Refwarn0error，接口261行全文审且cmp同；五新source root0，locale/
percent重组final0，B/C spacing/ctor修后各自check0。12错误fixture原JSON逐字未变，唯一Bool
spacing按真实float16 ufunc修，numericJSONSHA不变。所有tools terminal/agents停写。
README/COMPAT/PLAN/guide/依赖/notice已accepted更新，整体估计仍约46%/80%不随testcount变；
下一doc-final infofmt/interfacecmp/gitdiff检查，然后feature+checkpoint本地commits，无remote。

D31已完成本地feature38505e5（59files），accepted docs和doc-final infofmt/interfacecmp
全部0。新增1685registered=80A+1315B+259C+31Root，承载分组前5706细分案例；原source
JSON cases逐项保持，full四目标93879全部通过，无live工具。D32 EngFormatter定向只读
准备已派原3agents，分工/精确notes路径见head；未D32tracked/未冻结/无Moon gate。后续
大型参考矩阵优先每32case组registeredtest，每case私有函数保独立defer与明确caseid，避免
Wasm testdriver initlocals；源query/casecount与framework registeredcount必须分开记。
整体目标未完成，不标Goalcomplete；用户多commit与多独立subagent授权持续有效。

D32 contract freeze：Eng含同一ScalarState，as_scalar live派发Eng call/data/setlocs/offset，short继承。
raw unit/sep String、places六ScalarNumber?延迟消费；默认offsetFalse与显式None capture区别；
动态class/instance prefix映射保插入顺序、原keyorigin、numeric hash61mod门和NaN handle身份。
原源完整Eng class hash08220e46...342e09；不改旧pure helper，不扩GUI/default生命周期。
A/B/C已正式接实现任务；Root已保存D32-before e473b88。尚未运行D32门禁/未commit。

D32实现进展：A newstate/wrapper+Base/Scalar虚派发/显式loader与prefixhash已落；B math/numeric/
round3生产已落，stdinparse0，正在正式源/数学矩阵；C108正式原source已gen/check0（88Scene+
20physical→4groups），正在fixture自审。Root named_batch Eng call/data/short/viewdtype已接、
3独立公共dispatch黑盒已落，独立原Eng sourcegen0/JSON保actualobservations；总guide初稿未
标验收。未跑项目Moon。Root只读审发现prefix线性lookup遗漏CPython dummy重用：N=2^120,
P=2^61-1，d={N:A,N+P:B};del d[N];d[N-P]=D，keys顺序[B,D]但get(NPfloatN)=D，copy同。
A独占扩正式refs+真实hashprobe/resize/delete/copy，不允许以线性insertionorder伪装dict。
六查改prefix方法真实hashcollision可Overflow，已统一raiseCore。仍无live工具/未accepted。

D32 C已停写：108actualsource（93success/11Value/3Overflow/1Attribute），88Scene+20physical
独立privatecases→4registeredgroups，gen/check0且与readonly案例逐项同，仅增rc/warning元数据。
Root/C同时新总guide路径重叠已发现并协商Root接手合并完成，无其他生产或fixtures冲突。
Root新增99builtin-dict traces/6200steps→4groups，覆盖hash相等非传递weakEq、delete/reinsert/
grow/copy及errorpartialstate；为原NaN地址hash不稳定域剔除交错NaN insertion/query，隔离
NaN identity/copy由A负责。NaN portable hash0与nativeaddresshash差异明确hostboundary。
A真实combined-table probe/resize/copy已落，继续参数refs；B1163cases/37groups sourcegen0
（1609observations），数学/原源差异与RuntimeWarning分别保留，完整label/error无差异。
当前Root sourcegen51557 live（其他77893/98466 terminal0）；无项目Moon工具，未accepted。

D32 B已停写：1163cases→37groups+2hand=39registered/1165validation，1609原sourceobs；
6原/数学primitive差异与7仅nativewarning差异分列，完整label/error0diff；新source及D31
旧numericcheck0，JSONSHA09843990793d90b4399a568749ea4adc1be17173d076c1c01216e88d4fbcdd23。
C对B独立readonly crossreview已停：精确source stage/NPclip/partialstate无新可证问题；2925
额外review模型比较最终label/error0diff，模型不冒充正式原源oracle、不计正式覆盖数。
A params最终补copy/rc/emptyoffset/NaNprofile sourcepair与guide中；Root tracekeys改共享构造fn
每case新建避免重复静态String，原99/6200expected不动，sourcegen67415待terminal。无Moon工具。

D32全部tracked writers已停：A431obs/365privatecases→12groups/54sourceonly，gen/check0，
旧Scalarparamscheck0、旧sharedloader完整byteprefix相同；numeric store fullprobe与NaNhash0
profile真实双值证据已落。B39registered/1165validation，C4registered/108validation，Root
3dispatch+4trace（99cases6200steps）=7registered/102validation；总新增62registered承载
1740validationcases（365+1165+108+102），sourceobs/steps另分列。所有source sessions已terminal。
下一Root独占D32-gate.sh checkall→info→fmt→interface diff；未accepted、未commit。

D32初static38265 terminalexit255（无liveMoon）：1066errors=1051重复numericfixture写只读
threshold+3missingAPI(BigInt.to_double/两UInt64.from_int)+1prefixwhile return+nestedif未括号
及级联11。A独占prefix3处编译修，B独占math/numeric3根因+numericgen/WB构造前capture4
fixture修；必须原JSONSHA098439...dd23不变，不给capturedthreshold加mutable。四新source
Rootchecks0，trace3511也terminal0；共五全0。尚无info/fmt/行为test，下一停写后二static。
B独立prefixreview已停：原dictsource逐段同，无具体漏洞；9999hash及60000transitions/
180000get只读诊断0diff（不当正式oracle/不计覆盖）。Root暂不改A/B独占文件，无用户阻塞。

D32精确编译修复全部停写：A两UInt64转换及while nobreak明确返回；B BigInt转换、
if表达式分离与1051fixture构造前capture4，JSON字节SHA098439...dd23保持；sourcechecks0。
stdinmoonfmt不做语法验证（无效fn也exit0），不以其exit0声称parse通过，实际以centralcheck。
下一第二static，之前38265/3511/67415/33489全terminal，不轮询旧sessions。

D32第二static9633 terminalexit255：生产代码及A/C/Rootdispatch均已check，408errors全为Root
tracegroup `0.to_string()`字面量被当Double解析的级联，已改 `(0).to_string()`生成；原99/6200
JSON与expected不动。B960unusedstate warnings因去readonly写后仅data病例不再用state，B独占
按最终body是否有state.scalar删多余声明；其余仅8旧Refwarnings。下一全部停后二次精修后的
第三static，未info/fmt/full行为；无liveMoon，Rootgen23808已terminal0（待此段实际确认）。

D32第三static36719 terminalexit0：checkall28tasks/8旧Refwarnings/0error，info0/fmt0。
80行接口差异已全文审：仅ticker新增EngFormatter/EngPrefixes/EngPrefixKey与Base downcast；
旧pure/Scalar/Scene公共签名不变。已存D32-interface-reviewed.diff。全部writers停写，
原JSONexpected/case counts保持，下一完整四目标fullsuite（预期21548nonJS/21555JS）。
tracefinal77619尚live source --check；其余源检查均0，不重跑已过旧D31gate。

D32 full13738 terminalexit2：四目标完整执行，wasm/gc/native各21546/21548、JS21553/21555，
同2fail；其余case全部过，包括99dicttraces6200steps、431参数obs映射365cases和108Axis。
B独占精确NPInt64 view fixture与npclip -0 tie修，原JSON期望不变。旧log保D32-test-all-before-
clip-fix.log。无live工具，无用户阻塞；等B停后统一finalgate。所有source checks已terminal0。

D32两精确fail修复B已停写：仅D32local viewcode保uniform NPInt64/NPFloat64列表元素origin
→typedNdArray；不改D31gen。onlylower max strict<保phase+0，onlyupper >=保bound−0，
双bound strict保phase+0；原72clipfixtures独立全部dtype/bits/error0diff。newsourcecheck0，
numeric JSON byteSHA098439...dd23仍同，无新增case/expected改动。下一Rootfinalgate。

D32最终95004 terminalexit0：wasm/wasm-gc/native各21548/21548，JS21555/21555全过。
info/fmt0、check31tasks/8旧Refwarnings/0error，80行接口全文审且final逐字cmp同；五新source
Rootchecks全0（numeric final98664与tracefinal77619也terminal0），所有writers停写、无live。
新增62registered承载1740validationcases=365A+1165B+108C+102Root；Root99dicttraces含
6200steps，framework分组不减任何case/assert/defer。原numeric JSON byteSHA098439...dd23
始终不变。首2behaviorfail按真实NP dtype和单边signedzero修复，未改弱expected。
README/COMPAT/PLAN/总guide/依赖/NOTICE已改为accepted。整体goal仍active约46%/80%，
非全目标完成；下一doc-final infofmt/interfacecmp/diff检查和feature+checkpoint本地commits。

## D32 已验收交付

- [x] 命名EngFormatter、同一Base/Scalar live继承和独立浅copy、raw unit/sep/六数值places。
- [x] 动态class/instance EngPrefixes、opaqueNaN identity、hash61门、真实combined-table
      probe/dummy/resize/copy与source checked collisionerrors。NaN hash0/宿主地址hash明列profile。
- [x] 原log10/3阶数、NumPy clip原始bounds与signedzero tie、单步promotion、round3 midpoint、
      分别round的ln/span比值、cached call/data/short/offset与locale/math/wholeminus阶段。
- [x] Base/namedbatch/Scalar derived dispatch和NP viewdtype；实际Axis/shared/secondary
      沿已验收checked fullbatch/visibility/lateoffset链，新Scene生产无需改动。
- [x] 62registered承载1740validationcases；A365/12groups、B1163/37groups+2hand、
      C108/4groups、Root3dispatch+99dicttraces/4groups（6200steps）。五新sourcechecks0，
      独立source/math及NaNprofile差异保双值，source-only/资源/非终止边界不伪装原源错误。
- [x] final95004四目标全部过；infofmt/check/80行接口审与final/docfinal cmp0；
      README/COMPAT/PLAN/总guide/参数与数值guide/依赖/NOTICE已accepted。
- [x] feature497212a本地commit35files，458902insertions主要为完整refs/tests；无remote/push。
- [x] D33三agent只读准备、Root全文读必要原类、scope/API冻结及实现已完成；验收见后续D33记录。

D32主生产变更为ticker/formatter_{base,named_batch,scalar_named,scalar_math}.mbt与
新formatter_eng_{named,prefixes,math,numeric}.mbt；新Scene仅两个参考fixture；五新generator
和testdata JSON/guide保原源证据。D32最后所有sessions均terminal，无码write工具live。
D33仅readonly notes工作已派原三agents，不改tracked、不跑Moon、不先实现公开API。
整体goal仍持续，不把本片验收等同全目标完成。

D33本回合起始已重读checkpoint，git HEAD5f9cfcd clean；上回合为已验证实现/提交的真实进展。
Root已完整读LogFormatter4classes与必要_nonsingular/strip_math/_setattr_cm/_is_close_to_int，
定向读现Base/Axis/Secondary/config接线，写ignored D33-root-glue-notes.md。首个必要差异：
Log set_locs完全忽略locs且不写_loc s（empty也prepare），需Base赋值前specialdispatch；
Mathtext/Sci directcall不读axis，plain/Exponent在门控后读view；getoffset恒空、short无context。
C已找到optional transform.linthresh真实探测需求（secondary非父symlogthreshold），仍等待三notes
完整后freeze，未D33tracked实现/未snapshot/未Moongates，无live工具sessions。

D33 contract freeze：4class named Log/Exponent/Mathtext/Sci；不继承Scalar。Base Log-kind
set_locs入口在存locations前prepare/return，empty同prepare；call/data/short分派与ignorelocs
保原协议。新增optional transform_linthresh provider（ScalarNumber? raiseCore），仅probe阶段
吞AttributeError，primary liveSymlog/secondaryNone。LogValue Numeric(ScalarNumber)/Text/
NoneValue；LogMinorThresholds Tuple(opaque immutable)/Sequence(ArrayLogValue)/NdArray/
Raw(LogValue)，constructorNone defaulttuple，rawsetterNone真实None；readonly cache snapshot。
Root负责log_text_float helper+完整nativefloat corpus，min_exponent liveBigInt配置+batch；
A/B/C任务已明确文件独占（C不碰base.mbt，A初始化providerfield），所有矩阵32case分组。
D33-before HEAD5f9cfcd已保存，无生产/fixture门禁尚验收。原D32工具全terminal，goalactive。

D33实现进展：Root已落min_exponent liveBigInt配置/snapshot/reset+1test、Log kind公共
call/data/short/typedbatch接线、nativefloat Textbase helper。新增独立builtin float(str)
sourcegen/json/WB：2152nativecases=2077success/75error→68registeredgroups，含660UnicodeNd、
精确midpoint±1e-1200、overflow/underflow、5000digit输入、signedNaN/zero与完整invalidrepr；
gen0，尚未项目编译/行为验收，不能据此宣称实现通过。C交付7files停写：linthreshBinding
3methods、primaryaxis livecurrentScale、200actualobs逐项深等readonly（174success/18Value/
8Attribute）→7groups+2hand=9registered；gen/check0、无live工具。A公开接口/params与B
numeric/fullmath仍写，Root不运行centralMoon。C获派仅readonly复核Bprepare/cache，无tracked写。
B首轮4productionfiles已落含genericfractionalpower精确rationalroot+directedlnexp，待正式refs。
本段无liveRoot工具session，无新commit/未接受D33；下一Rootreview numeric/math、补总guide，
待A/B停写后centralcheck/infofmt/interfacesource/full4target。仍同一整体goalactive。

D33 A交付11files并停写：Basekind/copy/ignorelocs/providerfield、rawtuple+4namedwrappers、
newloader与paramsgen/json/WB/guide。892actualobs/469privatecases→15registeredgroups，
21sourceonly/0extra hand；newparams gen/check0、旧Engparamscheck0、loader旧HEADbyteprefix同。
set_locs(locations?) labelledoptional/set_locs_view positional已确认。B首轮正式gen0：1567
numericcases→49groups、109primitive/geomcases→4groups；125001/200001/200001完整实际源数组
已执行，8labeldiff/3warningdiff/3geompointbitdiff双值保留。B正在guide/hand/check收尾，C仅
readonly复核cache，Root总guide/依赖/NOTICE已pending。Root float check0/C axis check0；
尚无centralMoon live session，下一B停写后统一D33-gate.sh。

D33 gate前定向review发现2真实边界，未改弱任何旧期望：B自审arange index先Double再+1
在2^53附近有代表值缺口，改全logicalmonotone binarysearch+directcase，并补负stop<-2^63
实际sourceMaximumsizeerror；B尚写。Root实际AST probe确认A threshold1DNdArray empty/
len1索引错误当前漏原IndexError而抛TickValues内部消息：[]→index0size0，[100]→index1size1，
[0]可成功；A获派精确bounds消息+formaladdedcases，原deferredlen协议保持。C680actualprepare+
98base×2profile完整geom/10492membership/196snapshot未见新差异，仍readonly审resourcebound。
暂无centralMoon；Root总guide的numeric脚本CLI已改真实无TICKER。

D33 A精确NdArray indexfix已完成停写：增31cases，934actualobs/500privatecases→16groups，
21sourceonly；旧469case JSON整体SHA a87b868...fe1c7/sourceonlySHA fc196afa...f92a逐字同。
newgen/check0，index错误按原index/实时length，不做eagerlen2。C发现B全域geom邻jump2^14
证明反例（base nextdown2^61邻jump18944），未发现Resource行为反例；B已撤回该证明，
替换base>2^40的小coefficient前缀邻jump<.345→rint邻差≤1→unique超Array地址域论证，
待guide与hand收尾。Root同意用coeff≤2^32+1界避免prefix跨点遗漏。C只读复核替代证明，
A恢复只读numeric/mathreview，无tracked写；仅B仍写，无centralMoon tool live。

D33 C只读review完整135行Root已全文读：680actualprepare、196fullgeom snapshot、10492
membership/1264smallarange模型核对无新差异（独立review不算Moon验收/不计正式coverage）。
全域2^14反例已收；最终prefix proof用base>2^40,n≥2^39,L<19，保守phasegap
20/(n−1)+20·2^-52·n/(n−1)+2^-48<2^-34，coeff≤2^32+1内powgap<.577<1，
rint邻差≤1，必经1..2^31+1→unique超地址域。C独立确认此替代式有效，已停所有写无live。
B仍handoff收尾；A只读numeric/math，Root central尚未启动。

D33首central32828 terminal255：只有1error，Bgeneratedfixture误用TickValues.from_int64
（真实from_int64_array）；B获派仅gen/WB拼写修，JSONSHA588d3326fc9e9a0d598e4860a5a2351d2b1ed16411e63bb9dd24278422b87a0a不动。
12warnings=8旧Ref+3A unusedself+1A fixtureunusedraise，A精确修ownedproduction/gen/WB后
停写。尚未info/fmt/behavior，不能accept。B实际10files/1589numeric→50groups+109math→4+
4hand=58registered/1702validationcases，actual4389/math4376obs；source--check10869已0，
Rootparamscheck0。总新预计152registered/4557validation=16A500+58B1702+9C202+69Root2153。
Root已全文读Bguide/hand，guide从误置root移入testdata；总guide仍pending。下一allwriters停
再第二static，所有RootMoon/source sessions terminal，未commit，goalactive。

D33第二static24149 terminal0：checkall84tasks/8旧Refwarnings/0error，info0/fmt0。
251行完整接口已Root全文审：config仅3min_exponent API；ticker仅4namedLog/LogValue/
thresholdtuple/thresholdcarrier/downcasts与3linthresh Binding方法，旧pure/Scene签名不变；
已存D33-interface-reviewed.diff。BfixtureAPI精修与Aunusedwarning精修均已停写；所有原JSON
保持，params整fecd0208...c641/numeric588d3326...87a0a/axis0226199a...cec3/
float06779465...5b80已记录。Root numeric源复验82142尚live（readonly --check），其他三新源
checks均0。下一完整4targetfullsuite预期21700nonJS/21707JS，未accepted未commit。

D33 full4suite25520 live，log D33-test-all.log，目前编译warnings输出阶段；不可改tracked源码/
fixtures。numeric source复验82142已terminal0，四新source全0。A只读math发现exactoracle边界：
.25**537.5=2^-1075最近偶数0，真实Python0；Decimal pow180/320/640转Double分别1/0/1。
当前formalprimitive未含此值、原expected未受影响，生产rationalroot路径可精确化为.5**1075。
A只写ignored证据，B知悉不写；待fullterminal后加在现rational手写test内exactbits断言及guide
说明；若无生产变动只补受影响四目标test，不重跑已过其他suite，若有行为fix再统一full。
当前不允许任何tracked writer，goalactive未accepted未commit。

D33 full25520仍live但已明确3目标全过：wasm21700/21700、wasm-gc21700/21700、
JS21707/21707；native尚运行。Root2152nativefloatcases与152新registered在3目标均过，
无behaviorfail；未改tracked源码/fixture。待native terminal后补exacthalf手写assert/guide，
仅该相关四目标test补验；再最终infofmt/check/interfacecmp与accepted docs/分批commits。

D33 full25520最终terminal0：wasm/wasm-gc/native各21700/21700、JS21707/21707全部过，
152newregistered承载4557cases，四新source checks全部0，251行接口已审。A191行独立math
review Root全文读，无新已证生产缺陷；已精确展示Decimal finiteprecision不是通用tie证书。
Root在现有rational hand块补2个Fraction exacthalf+2个邻exponent bits断言，仅test+guide改动，
生产/原JSON均不动，过滤四目标补验82978 live（D33-rational-midpoint-test-all.log）。
原Python/Fraction独立inline已确认0/0/1/0 bits。下一该testterminal→finalinfofmt/check/
interfacecmp、accepted README/COMPAT/PLAN/总guide，分Root基础功能与家族feature/checkpoint
本地commits；无需重跑未变的完整suite。goalactive，不把本片验收当全目标完成。


## D33 已验收交付

- [x] 完整命名LogFormatter/Exponent/Mathtext/SciNotation四类；live Base与父类view，
      独立浅copy、六数值/Text/None、immutable默认thresholdtuple与显式borrowedlist/view。
- [x] set_locs忽略locations且empty也prepare，Base checked入口不覆盖_loc s；batch独立
      枚举原typedvalues；Null跳过整batch、direct保stale cache；getoffset恒空/short无context。
- [x] individually rounded ln比值、Py/NP指数origin、nextafter、isclose/round原顺序，
      generalpositivefractionalpow exactrationalroot+adaptive directedlnexp；原8label/3warning/
      3geompoint/2primitive bit差异保双profile，不伪装Darwin libm bitclone。
- [x] 内部完整logicalarange/geomspace cache、fullshape source错误、binarysearch membership，
      plateau跳跃完整snapshot与已独立审查smallprefix addressability证明，无100000cap。
      arange2^53缺点、负shapeoverflow与NdArrayempty/len1原IndexError均在fullsuite前精确修。
- [x] 当前actual transform.linthresh liveprimary接线，secondary/dummyNone；只在probe阶段
      吞AttributeError。完整actualAxis/fullrawbatch/shared/removal/draw/latecurrentoffset保源协议。
- [x] 152registered承载4557cases：A500/16groups（934actualobs/21sourceonly）；B1589/50+
      math109/4+4hand=58registered/1702cases；C200/7+2hand=9registered/202cases；
      Rootfloat2152/68+config1=69registered/2153cases。原source/mathobs计数独立。
- [x] Full25520：wasm/wasm-gc/native各21700/21700、JS21707/21707全过；四newsource全0。
      补4个exactFraction halfminsub/邻exponent bits断言只改现hand块，过滤82978四目标各1/1。
      没有生产变动/原JSONexpected变动，不重复已过无关suite。
- [x] Final80311：infofmt0/checkall28tasks8旧Refwarn0error；251行接口全文审，finalcmp同；
      README/COMPAT/PLAN/总guide与三独立guide/依赖/NOTICE均accepted。无live工具。
- [x] 两个功能commit：f92729d基础8files/21070insertions，6dea404家族36files/
      514467insertions（绝大多数为完整源参考JSON/tests）；master本地，无remote/push。
- [x] D34三agent只读notes回齐，Root全文读必要原类/helper后冻结scope/API与分片。
- [ ] D34实现与正式参考完成后统一验收；当前未通过Moon编译/行为门禁。

A/C independentreadonly review无新生产缺陷：680actualprepare/196completegeom snapshot/
10492membership及数学interval/root终止证明。已修原全域jump2^14错误论证，使用有效小前缀；
Decimal180/320只是样本参考非通用tie证明，精确Fraction反例和新增hand已记numericguide。
JSON整SHA：params fecd020881edbe6a7e500f8a1e325c89980cf8159f561c28050e45afa422c641；
numeric 588d3326fc9e9a0d598e4860a5a2351d2b1ed16411e63bb9dd24278422b87a0a；
axis 0226199a54374da1f87af2652e2506c2ad73cb5173c82ee94277c4f9fe22cec3；
float 06779465056b646f07ebf10b5de8e25a2b5fcdcb9b3cf0af8eb836d4d66a5b80。
所有旧D33/D32 source与Moon sessions terminal，不轮询。目标仍为完整迁移，未complete。


用户指出旧46%整夜未重估：Root确认该数最初见D19 baseline1b61c4b，D20–D33后仍照抄，
已明确承认并撤回，旧80%严格核心兼容说法也撤回。重读SURVEY/COMPAT/PLAN与实际interfaces/
包目录后新增MIGRATION_PROGRESS.md：明示9能力组权重100和成熟度区间；全目标算术范围
45.75–60.60%，日常约50%；严格静态2D前7组权重85，53.82–70.41%约55–70%。权重/成熟度
为工程judgment，非已测API覆盖率，也不能用新旧口径计算昨晚精确涨幅。C独立readonly已指出
图表/配置/units上界乐观风险，不把宽区间缩为已证50–55。上游AST__all__/继承与mbti核对
确认12/12具体Locator、12/13具体Formatter已接入（剩Logit）；D19二者具体命名对象均0，
不是D19完全无相关便利功能。D34只读不算实现。PLAN当前数同步更新，后续每slice附capability
增量/估算依据，不重复引用旧46/80。纯docs改动，D33生产/gates未失效，不重跑Moon。
D34 A299行339obs、C251行147obs notes已回，B数值notes仍整理；Root尚未freeze/实现。

进度重估独立review进一步确认：固定Artist enum/许多绘图返回Unit，无通用mutable对象层、
tight/constrained求解器、font/mathtext；另显式补polar/geographic投影缺口。采用相同权重
更保守成熟度的敏感性检查40.20–55.95，故对外整体报告约50%（40–60，至少±10点误差），
不把原模型中点53.175或狭窄50–55当已测结论。MIGRATION_PROGRESS.md/PLAN已同步。

D34实现检查点：Root已全文读A299行339sourceobs、B268行6022source阶段、C251行147sourceobs
及168行独立进度review。公开raw LogValue五参数、四source setter；新增LogitKey与NumericArray
保原numeric origin、Sequence键identity/ndarray每读fresh scalar；FormatterLocations新增Typed与
get_value。浅copy共享可变labelled holder，prepare先copy snapshot再clear，禁止借用D33 cache。
A独占named/input/loader/params，B独占numeric/math/prepare/arrays与numeric refs，C独占精确
CPython3.12.14 powersort与actualAxis refs；Root独占Base/batch/2Scalar穷举/keys-set与总文档。
Root新增builtin set正式源：103traces/6521steps→4groups+1个80000unique growth test；gen0，
check未跑。源setobject SHA e633e7ae4e427ecead8879965910e27427d34ae0fc5b956142bc337f741a367c、
listobject SHA 5f33dd1d97bfcc33e60495011fad7d9d02587a966999f28c159971f31aa91531；本地仅行为参考。
C sort248builtin cases/8groups、3完整大数组全索引RLE断言gen/check0，原70734已terminal；
C仍写Axis正式refs。B首轮4production files已落，正式refs仍写；A named/input已落仍写params。
当前无Root live tool，无centralMoon启动；stdin moonfmt只是格式非语法/类型验收。目标active。

D34 Root builtin set补3个精确hashgate overflow traces：总106traces/6536steps仍4groups+1growth，
gen/check0；BigInt.to_uint64已从当前core API确认。LICENSE-CPYTHON已从固定3.12.14官方取回，
13936bytes SHA3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf；67512已0。
Root总guide/setguide/DEPENDENCIES/NOTICE已pending；A交付7files停tracked，最终1222obs/
637cases20groups15sourceonly，gen/check0/loader旧byteprefix同，无live。A获派仅readonly审set。
B/C仍写各自formal refs，不可启动central Moon。D34-gate.sh已备，尚未运行。

D34 Root source复验：params1222obs/637cases/20groups已0；sort248cases/8groups78919已0；
set106traces/6536steps/4groups+1growth已0。Root README新增pending示例，总guide仍pending；
MIGRATION_PROGRESS只更新D34为实现中，不计入已完成。无Root live工具。A仅readonly setreview。

D34 Root审B新generator发现旧通用moon serializer误转literal\\frac，B仅新gen的字符串转用
accepted逐char serializer，原数值路径保留；C字符串自有quote不受影响。B首轮2386numeric/
75groups+26primitive/1group、9568source/9566mathobs，2个large-source阶段真实200001全量；
另发现UInt64 JSON snapshot旧num降Double metadata，Root已要求纠正为exact Integer projection
并保dtype，列出仅snapshot paths变化，原label/error/选集expected保持。尚未停写/未central。
A readonly核CPythonset未见生产反例，已明确nativeNPNaN与portablehash0×hugeQ原生差异。
Root新增其正反向正式源cases后set最终109traces/6548steps→4groups+1growth，gen/check0，
原106旧case同观测/新增steps明确。完整license与guide已落，Root无live工具。

D34 C原9files已交付停写：sort248cases/8groups、Axis147cases/5groups（128success10Overflow9Value，
70fullDraw+两个200001完整batch），两gen/check0且147原调查JSON深等；无live。
A独立numeric审找到真实Objects np.sort反例：含巨大整数使dtype Object时NaN非恒尾，原
[2^64,.2,nan,.2001]→0.2、[.2,nan,.2001,2^64]→ValueError、[nan,.2,.2001,2^64]→Overflow。
现O(n)NaNlast secondminimum只适用普通浮点结果，不能用于Object；已要求修且不sourceonly。
新增分工冻结：C独占新formatter_logit_object_sort.mbt与独立NumPy object-sort参考，API
logit_object_sort(ArrayScalar)->ArrayScalar raiseCore，按固定2.3.5 genericquicksort/heapsort/
OBJECT_compare；B仅Objects分支调helper且新增完整类原sourcecases；A只读核源码/反例并审数学。
Root已官方web读NumPy quicksort/heapsort，补NumPy license/notice与总guide。尚未centralMoon，
D34继续实现未accept，原sourceexpected不弱化。

D34 Root已全文读固定NumPy npy_quicksort/heapsort/OBJECT_compare/PyArray_Sort fallback关键体，
C新object helper亦全文读，cmp-beforebounds/depthouter-only/pop/heapInt64child与原源一致，
尚无Moon验收。B Objects分支已接logit_object_sort后取second，原numeric O(n)路径保留。
B serializer-only整JSON bed50a...4eeb2不变；随后UInt metadata修正JSON e91f0a...ac7a9，
仅cases2067..2111的source/mathematical.snapshot.values[0]共90路径由Double记录改exactInteger。
列表/tmp/d34-uint-snapshot-paths.json；所有label/error/成员集及其余期望逐项同，后续新增
Object源cases会另给最终SHA。LICENSE-NUMPY官方固定1543bytes SHA1be1df33863f97a7bc1c4d67980bd6c69c9a6fef0a5ee76e6ad6cb91e56e8491。
Root旧loader prefix19872bytes逐字同；paramsSHA4586f18b4c9bfa905e91c618d7879b25bd4f07a7ff2a334c7fe23a7302bd0316，
AxisSHAeabae21ba977be245434a42466641993b9c8d76613e46a1dd7be9612f1fc6933。
当前Root无live工具，B/C仍新owned写，不能centralMoon。

D34 B最终10files已停tracked：2389numeric/75groups+26primitive/1group+2hand=2417cases/
78registered，9574source/9572math；完整gen15960/check96092均terminal0，原2386cases只90个
授权UInt snapshot metadata路径变化、26primitive原样，追加3Object反例，不弱化旧labels/errors。
最终numeric JSON SHA33ee17ed0d86678f5e6965fe2cf924a5f2d63776eb015430b14921ac903256dc。
Bguide Decimal180/320改evaluated matching bits，非全域certificate。A142行numeric只读report
Root全文读，仅Object缺陷已明确修复承接，未见另一个未解决具体反例；A已全部停。
Root Axis source复验67845 terminal0。C新objecthelper+formalrefs仍写，Root已提醒其packed
WB解析用真实@string.parse_uint64与Iter.to_array（非不存在的UInt64.parse），等C最终停写。
Root无live工具，central门禁还未启动。下一C正式交付→D34-gate.sh，不再扩大scope。

D34 C新object生成58635 terminal0：220cases/7groups；最终packed bits decoder已改为真实
@string.parse_uint64(StringView) raise，直接遍历split Iter并push Array。C立即readonly check/
guide收尾，尚未明确停tracked。原9files仍停。Root将复验B最终numeric source，预计全片
123registered/3779validationcases（另外set6548steps），仍不能当Moon通过或API百分比。

D34所有tracked writer已明确停写（A/B/C及Root暂停生产改动），C新增5files最终220cases/
7groups（110quick110heap；213success7原Overflow），6origins逐bit/error，125001/200001/
131073完整数组，JSON大buffer无损BEUInt64 base64保全部原位形。gen58635/check71775都0，
无C live。原C9files不动。Root numeric source复验84915 terminal0，现六源已有五Root0+object C0。
统一D34-gate.sh已启动，结果/Root session ID下一条记录；未验收，预计123新registered/
3779validationcases，full目标预计nonJS21823/JS21830。不得同时启动第二Moon或改写sources。
D34首central session29145 live，输出日志D34-check-all.log/info.log/fmt.log；Root尚未读接口。

D34首central29145 terminal255：2errors（A minor无setter故mut unused；B fixed-format参数
String"f"应Char'f'），加A downcast保留字3warnings与C单行packed bits>65535列2warnings。
A/B/C已精确派owned修：A去unusedmut/变量改名、BChar、C按1024完整UInt64文本项分块join。
三JSON原source期望必须逐字不变，C需gen/check。注意日志含巨单行，后续只截每行最多500字符，
不可直接tail原log导致MB输出。info/fmt尚未运行，未读接口，未行为验收。Rootobject source
10897已terminal0；现六新源Root全0（后C生成器改需补check），无Rootlive session。

D34 static精修进度：B仅Char'f'已停，numeric JSON33ee...56dc未变；A去minor mut/测试变量
family_view后gen/check0且paramsJSON4586...0316逐字同，已停。C新objectfixture仅按1024完整
tokens分块.join，JSON原期望不动，重新gen13466尚live；之后check停写。未再启动Moon。

D34 C精修完成停写：gen13466/check58412 terminal0，packed256blocks最长20487列，保全量。
object JSON abc8fcce62412bb4fec42607a674dfdfb797c2f5af81ff1d49c65cdb9b62ca83逐字未变。
全部writers停，第二central D34-gate.sh启动，session ID见下一段；尚未Moon行为验收。

D34第二central99754 terminal255：原A/B/C精修已消问题；新增Typed变体让三个旧穷举需适配，
backend/svg/numeric_axis_bundle两helper+basic_formatter_batch_wbtest旧view断言。Root已补Typed
Double几何materialize（Axis providers仍仅Seq/NdArray）和旧测试拒Typed分支，原期望不改。
第三central启动，ID下记；无其它writers/live，尚未info/fmt或行为验收。

D34第三central80611 terminal255：143同类错误均为新Scene Axis黑盒测试调用TickValues私有
is_int64，另4unusedaxis warnings，生产类型已过。Root新增公开readonly
FormatterLocations.dtype()->String?（SequenceNone/NdArray int64或float64/Typed实际dtype），
让empty snapshot dtype亦可公开检验；不为tests导出TickValues私有方法。C只改Axisgen/WB
使用公开dtype并保isNdArray/原emptydtype断言、消4unusedaxis，JSON原期望必须同。
等C停后第四central，尚未info/fmt/接口或行为验收；不能把累计编译尝试算为passed。

D34 C Axis精修gen2413/check28193均0并停写：143个dtype用公开locations().dtype()+isNdArray，
含emptyint64；4ignoreaxis消warning，JSON SHAeaba...6933逐字同。第四central启动，session下记。

D34第四central26643 terminal0：checkall84tasks/8旧Refwarn/0error；info5tasks0/fmt25tasks0。
完整93行接口Root已全文审并存D34-interface-reviewed.diff：仅ticker新增LogitFormatter/
LogitKey/NumericArray、Base downcast、FormatterLocations Typed/dtype/get_value，旧签名不变。
所有writers停，完整moon test --target all已启动，输出D34-test-all.log，ID下一段记录；
尚未behavior验收/未新commit。六source各已有Root0或最新ownedcheck0，原JSONexpected保持。
D34完整suite Root session32763 live；不得改生产源码/fixtures，允许readonly新source复验。

D34首次完整32763 terminal2：wasm/wasm-gc/native各21823 total/21814pass/9fail，JS21830/
21821pass/9fail，四target相同。8tuple组皆RLE尾singleton误多1（真实sourceorder无错），
1setgroup3物理identity失败。其余D34包括numeric/params/Axis/objectsort/largegrowth全部过。
Root实际Python probe唯一alias(50,22) np.bool_(False) singleton；setgen新增真实key_aliases
metadata并复用同MoonKey，gen/check0；移除该新字段后与旧JSON整体深等True，全部source步骤/
errors/retainedkeys不改，newJSONSHAa后记。C已修WB RLE并全case展开恒等及随机5000校验，
Root进一步要求纠正34条已知错误的派生JSON expected_runs，仅实际builtin sourceorder原样。
等待C停后仅两相关fixture文件四目标补验，不重跑已通过无关suite；无生产变更/接口不变。
六source final各0：params/set quick0，numeric59991/axis47154/sort36459/object49542均terminal0；
后Root setgen已复验0，C新sort需最终check。无Rootlive tools。AGENTS新用户版本已明确commit授权。

D34 fixture修复已齐：Root set仅加key_aliases[[50,22]]，去新字段后旧JSON完全深等，newSHA
0a7a1260fe0e7791a48505c01f7e693187c4505c45da3bf8bb1c3933d6344972；WB复用实际NPBool singleton。
C tuple gen78768/check84135都0停写；仅34个/cases/id/expected_runs派生路径纠正，全部实际
pessimistic_bits/sum_bits/expected_order/sourceextra/metadata逐项同，newSHA
15a0fb0f99170abe2dc5107e365e362aa5a893f8458243b8d390f9bf13a3dc0c。全部248编码展开恒等。
仅两相关fixture文件四目标补验已启动D34-protocol-fixture-test-all.log，预计各13tests，ID下记。
无生产/原sourceexpected变化，不重跑已过无关suite。下一补验terminal→final infofmt/check/
interfacecmp→accepted docs/feature+checkpoint本地commits；goalactive。
D34两fixture补验session25631 live；Root新tuple source final复验启动，ID后记。不得改源码/fixtures。

D34两fixture四目标补验25631 terminal0，各13/13全部通过；原完整suite其余未变项目均已过，
故当前累计wasm/wasm-gc/native21823、JS21830全部验证覆盖，未重复已过无关suite。
Root tuple finalsource61356 terminal0，六源最新均0；实际sourceexpected未修改，只有明确的派生
RLE/alias元数据及fixtures修正。最终info→fmt→checkall→93行接口逐字cmp脚本已启动，ID下记。
生产持续停写，下一final0→accepted README/COMPAT/PLAN/PROGRESS/六独立guides→feature+checkpoint
本地commits。D34验收不代表整体goal完成；下一候选default scale安装生命周期。

## D34 已验收交付

- [x] 命名LogitFormatter/raw五参数四setter/活Base视图、独立slots浅copy共享可变set；
      prepare先复制dtype快照再clear/update，失败分阶段保留实际状态，fresh默认list不同emptyndarray。
- [x] LogitKey显式identity与六origin，Sequence同key/NdArray每读新NPscalar；readonly Bool/
      UInt64/Object NumericArray与FormatterLocations Typed/dtype/get_value，UInt64桥精确投影。
- [x] 完整CPython3.12.14 tuple powersort/真实numeric set probe、NumPy2.3.5 object introsort/
      heapsort，NaN部分序/identity/hashgate；完整arrays无100000cap。native NaN地址hash与portable0
      引起真实conversion-error差异明示，未冒称nativeclone。CPython/NumPy许可证与来源保留。
- [x] prepare/call/data/short原阶段、NumPy lnratio/rint/isclose、Int64wrap/Bool与UInt64向量、
      exactPythonintpow先乘再读len、原完整secondrank与precision；无新数学 primitive/runtime。
      独立审发现Object NaN排序缺陷已修并补三个完整class原source反例。
- [x] actualAxis fullraw/overlap/visibility/Null/shared/removal/secondary/lateoffset，未新增provider。
- [x] 123注册测试/3779validationcases：A637/20；B2417/78（2389numeric+26primitive+2hand）；
      Axis147/5；CPtuple248/8；set109traces+1growth/5（另6548steps）；NPobject220/7。
- [x] 首full32763四目标相同9个fixturefails后，仅修RLE尾singleton与NPBool alias构造；
      两文件补验25631四目标各13/13全过，生产及其余已过项目未动。累计wasm/wasm-gc/native
      各21823、JS21830全覆盖，不能伪称原full命令exit0（原exit2/补验exit0）。
- [x] 六source最终全0；Root tuple61356 final0，setaliasgen/check0；其它Root finalsource
      params0/numeric59991/Axis47154/object49542均0，sort36459此前0后补61356。
- [x] final92913 terminal0：info10tasks0/fmt6tasks0/checkall79tasks8旧Refwarn0error，93行
      完整接口已审且final逐字cmp同；旧public签名不变，只新增Ticker类型/getters/downcast。
- [x] accepted README/COMPAT/PLAN/PROGRESS/总guide/六分guide/DEPENDENCIES/NOTICE/license。
- [x] feature c7e47bb已本地提交（49files，绝大多数新增行是完整原源JSON/生成tests）；
      此checkpoint随文档commit保存，后续git log可取hash。无remote/push。
- [ ] 下一D35只读冻结默认scale安装生命周期，尚未派/尚未实现，不预先计入进度。

最终JSON SHA：params4586f18b4c9bfa905e91c618d7879b25bd4f07a7ff2a334c7fe23a7302bd0316；
numeric33ee17ed0d86678f5e6965fe2cf924a5f2d63776eb015430b14921ac903256dc；
Axis eabae21ba977be245434a42466641993b9c8d76613e46a1dd7be9612f1fc6933；
tuple15a0fb0f99170abe2dc5107e365e362aa5a893f8458243b8d390f9bf13a3dc0c；
set0a7a1260fe0e7791a48505c01f7e693187c4505c45da3bf8bb1c3933d6344972；
objectabc8fcce62412bb4fec42607a674dfdfb797c2f5af81ff1d49c65cdb9b62ca83。
所有Root/agent tools均terminal，无需轮询。Goal仍active，整体约50%(40–60%)宽估算；
具体命名numeric类已12/12Locator、13/13Formatter，不等于整库/整个ticker完成。

D34 feature已提交c7e47bb，49files（绝大多数行是完整JSON与生成WB）；最后仅清Axisgen三条
空行trailing whitespace，Root source20226复验0且actual Axis JSON不变，未触及生产/测试期望。
4份全局文档独立checkpoint提交，之后工作树应clean。所有sessions terminal，goalactive。
用户新AGENTS已明确允许coherent verified local commits，无需再次请求确认；无remote/push。

## D35 继续工作检查点

用户再次明确：测试失败应自主排查/修复/复验，不是停止理由；不要把阶段交付当作整体goal
结束。Root get_goal实际读到blocked（与先前无阻塞的检查点矛盾）；现有工具无active/resume
参数，用户已明确继续，Root按同一任务持续执行，不伪称接口状态已恢复或创建重复goal。
D34已c7e47bb/3f6a9b3，工作树原clean。D35 A/B/C已派独立readonly：A固定scale六种默认安装/
构造与rc；Baxis_set_scale/shared/secondary/isDefault四flags；C现实现改点与旧tests影响。
全部只ignored notes，不改tracked/不跑centralMoon。Root只先实现独立config minorvisible：
config/config.mbt新增x/yBooldefaultsfalse与snapshotcopy、新minor_ticks_visible.mbt和test。
上游rcsetup1298/1321 validate_bool、matplotlibrc519/541均false；typedBool桥不承诺rawPython
validator任意输入。D35-before HEAD3f6a9b3 tracked.tar/41mbti已保存（43628 terminal0）。
Root targeted four-target config test已启动，session下记；全片scope/API尚未freeze/未实现默认安装。
D35 Root minorvisible31042已terminal0，四目标各1/1；下一config infofmt/checkall在运行，ID下记。
A/B/C仍readonly，不涉及tracked并发。用户继续指令已即时恢复工作，失败只进入修复链。
D35 Rootconfig20424 terminal0：info/fmt/checkall通过（8旧Refwarn0error），config仅3newminorvisible
API接口全文审。独立config feature已提交，hash下一段；其余D35默认安装尚未freeze/未实现。

D35 scope/API已冻结，三notes A244lines312obs、B267lines53stages、C253lines29codefacts均Root全文读。
Root config基础978f271已提交（四目标1/1，infofmt/checkall105tasks8旧warn0error，3newAPI已审）。
D35主体：显式numeric Axis/Axes.set_scale五现有geometry映射真实4defaults、same-value重装、
source顺序/成功才4flagsTrue与shared同holder/handles/末Grouperowner；constructor/clear/units/
secondaryfunction完整default化D36后续，不宣称本片已完成；旧Scale纯sampler/formatterhelper保留。
A独占new scene/axis/default_scale.mbt+AsinhSubsTuple immutable carrier与3Asinhproduction变体适配/
new scale-default param refs。B独占new lifecycle sourcegen/json/Axis WB/guide。C独占Scene
scale/shared_axes/axis_data/lifecycle与new shared refs。Root独占Axis8existingfiles+newdefault_tickers。
Root已落AxisNumericTickers小holder，7numeric/legacy槽+4flags，125fieldrefs迁移8files，
public share_numeric_tickers无rebind/不改geometry、is_default_locator/formatter(minor~)、
locator_default_limits()checked。Axis.set_scale写geometry→Ainstaller→mark4true；移除对被替换的
旧limits/fixedticks/linearlocator无关验证，date/category继续单独typedbridge。source没有同scaleguard。
Root set_tick_count作为明确legacy采样请求仅清defaultmajor槽/标nondefault；不替换用户显式locator。
clear_locator/formatter/minor保现明确fallback/disable语义并标nondefault，manualset对应flagfalse。
全部主体尚未编译/验收，A/B/C tracked实现中，Root不跑centralMoon。当前无Root live工具。

D35 A正式交付9files并停：新installer/immutable AsinhTuple/3Tuplebranches+gen/json/WB/guide；
145sourceobs/112cases/4groups，24ordering诊断不伪动态用户hook，gen/check0；JSON
 ebe87d674b43e89d538035b05a4e2a8fcbd74c1782a6bba048ec99847c61a719。
B正式交付4newfiles并停：180cases/6groups（80slotmaskrepeat/50switch/25oldcontext/20holder/
5legacy），12source-only诊断，gen/check0；JSON818b63540bfc1cbf0decb9c1f4b966851f89ba33038e33923ed014b83acd9fc1。
Root全文读A/B完整生成逻辑及Aguide，新增default_tickers_wbtest一条实际兼容采样/customlocator
行为回归，未编译/未验收。C仍owned shared参考收尾，Root无live工具，不能centralMoon。

D35 C已全部停写6files，66cases/3groups/174source stages（36shared×4+10draw+20schedule），
gen/check0，JSONc173da9de29d83677172c2ca15946798c07d3b46b3bb9408f3e8640e809fc0cc。
Root已全文读三正式generator/guide及productiondiff；Root新A/B --check均terminal0。
所有tracked writers停，A另仅ignored Root独立review。D35统一gate已启动，ID下一段；
预计主体新增14registered/359validationcases，含此前config总新增15。尚未编译/行为验收。
D35 central Root session35187 live，log D35-check-all/info/fmt；不得改tracked源码/fixtures。

D35首gate35187 terminal0：check88tasks/710warnings0error（702new WB缺BigInt import+8oldRef），
info7tasks0/fmt20tasks0；105line接口Root全文审，含config3newAPI、Axis4newAPI/5旧公开mut字段
移入private共享holder（getter/setter保持）、AsinhTuple新增variant/type/defaultgetter。
Root补scene/axis/moon.pkg wbtest BigInt import；误用test的23723 terminal0仍711warn已纠正，
最终第三gate同步terminal0，check warnings结果见log（不把前两高warnings当最终）。
三newsource Root final全0，C30210已terminal0；所有writers停，无live源工具。
现准备四目标完整suite，预计nonJS21838/JS21845，不按generated私有函数算registered。
D35完整suite Root session53288 live；最终静态check32tasks/8oldRefwarnings0error，105line接口reviewed已保存。

D35首完整53288 terminal2：wasm/wasm-gc/native21838 total/21832pass/6fail，JS21845/
21839pass/6fail，四target同。失败：2旧Scale label旧便利文本预期；D34Logit secondary source
fixture先Null再scale，新默认major多画标签；2AutoMinor ownertrace原source只变受控scale.name
保major，[20,24]上下文需Moon显式恢复；1removedsharedaxis legacyfixedlabels offscreen绘制。
A已授权精修2AutoMinor fixture/gen保JSON；C原probe证实removed Ticker仍alias（source也如此），
但真实Axis.draw raw100/view[5,15]应visible[]，故C修筛选并正式源回归。Root修其余fixtures。
无Root live门禁；必须全部停后补验。A114line Root独立review全文已读无新实质缺陷。
D36 B272line constructor/clear与C219line autoscale notes已完成（尚待Root全文读），均只ignored。

D35六fail已按源逐项修复，全部tracked writers再次停：A恢复2AutoMinor fixture原受控majors，
Root把2旧Scale label改实际SciNotation源标签，D34Logit helper把Null隔离移到scale安装之后；
C确认offscreen筛选本来正确，实际旧ten断言假设Ticker删除后隔离与源冲突，改为真实alias并
新增x/y formal detached cases，旧66sourcecases逐项同。C现68cases/182stages/3groups，JSON
79a92607c8b413cbd995bda75621dcd2e2a16fe9e6d24f1625e905f04df6f9a9；总361validationcases/14registered。
无production行为变更，因此只补验五相关fixture文件，不重复其余已过全suite。
Root旧gen遇NumPy binary signing drift：新b11f1ef3534cc6bb0a9c8141206350b27cadf48632c34acfcfc97ca6e700363e，
旧44无本地副本，不伪称恢复。官方PyPI macOS14 arm64 wheel SHA612a95a17655e213502f60cfb9bf9408efdc9eb1d5f50535cc6eb365d11b42b5已下载核验；
core96ce8cda1e4f1a3107e5c945b68bcd970c3de09019fc19beda4cc0319609de09与新b11在3423488前仅6bytes
不同，均loadcommand尺寸；code/data完全逐byte同，其余差异仅codesign区，currentOpenAI Oct22签名。
Root严格保旧44并新增已核b11 exactpin，不接受任意hash；nullJSON仅numpy_binary_sha256一处真实
runtime元数据变化，所有原观察深等；D34Logit actualJSON保持byte同。nullgen/check都0；Logitgen64658
terminal0，check72377尚待poll。签名审计ignored D35-numpy-codesign-audit.json已落，无共享runtime改动。
D35补静态93473 terminal0：check28tasks/8oldwarn0error，infofmt0，105line接口cmp同。
五文件四目标补验29437 live，log D35-fixture-test-all.log；不能改源码/fixtures。尚未验收。

D35五相关文件四目标补验29437 terminal0，各61/61全部通过；原full其余未变项目此前全过，
故当前累计wasm/wasm-gc/native21838、JS21845全覆盖。原full53288仍记exit2，补验exit0。
Root Logit sourcecheck72377 terminal0，D34JSON byte同；nullgen/check0且只有runtime hash元数据
一处变动，原实际sourceobservations深等。全部生产/fixtures持续停写；accepted docs已更新，
当前最终infofmtcheck/interfacecmp与三newsource复验待执行，无Root live session。

## D35 最终验收

- [x] 五typed几何显式四named对象安装，repeat/rc/4flags/AsinhimmutableTuple。
- [x] 真实共享holder、原组顺序/finalowner/删除后alias、oldhandle/livecontext。
- [x] 14新增registered/361validationcases：A112/4、B180/6、C68/3（182source stages）、Root1。
      先行config测试另1；测试数不当API百分比。
- [x] 首full53288 exit2：nonJS21838/21832pass/6fail、JS21845/21839pass/6fail。
      6项经原source定位为旧fixtures/契约前提；无后续production行为改动，五文件补验29437
      四目标各61/61全部过，其余首full已过项目未变，累计全部覆盖。
- [x] 最终info4tasks0/fmt1task0/checkall24tasks8oldRefwarn0error，105line完整interface已审
      finalcmp同；五旧public numeric字段移privateholder有明示，原getter/setter签名保持。
- [x] 三newsource Root final全0（C11899 terminal0），旧nullgen/check0、Logit64658gen/
      72377check0；nullJSON仅runtimehash元数据一处变化，实际观察全同，LogitJSON byte同。
- [x] NumPy严格新增已核签名b11 exactpin；官方wheelcode/data逐byte同，未改共享runtime，
      未伪称旧44可得；审计与可复现pin已进testdata/reference_runtime_README.md。
- [x] feature85554c6、参考精修acff948与独立config978f271本地提交，accepted总guide/三分guide/
      README/COMPAT/PLAN/PROGRESS/DEPENDENCIES/NOTICE更新；无remote/push。
- [ ] 下一D36构造/clear仍未实现/未验收；Axis原位holder与view/overlap源差异、Scene clear
      先self后peers/late minorrc=False flag/尾部sharedtargetlimits必须按notes冻结，不当D35完成。

当前无Root/agent live工具，所有writers停。Goal持续，无需用户回答。整体约50%(40–60%)
宽估算不变；本次对象生命周期增量不据测试数量冒报新百分比。

D35 checkpoint commit297078c已提交，工作树clean后D36-before保存其HEAD/tracked.tar/41mbti，勿覆盖。
D36已启动：Axis层freeze真实x/y constructor defaults、sameholder clear保views/inversion/overlap、
本地date/category清理及原稳定context；Root独占axis.mbt生产，B独占new完整Axis init/clear refs。
C先Scene具体design（figure/shared_axes/subfigure/lifecycle），A先实际Axes.__clear/removedtarget
sourceprobe与正式new refs准备；未freeze Scene target provenance前不写production，不跑Moon。
D36尚未实现/验收，当前无Root live工具。D35所有gates/source均terminal0或明确首full2/补验0。

D36 Root Axis主体已落（axis.mbt唯一production改）：axis新增optional horizontal~Bool，intrinsic
方向先定，稳定provider绑好后复用已验收set_scale Linear安装4defaults。clear保持同holder、
limits/auto_view/inversion与overlap，不再断shared/丢view；清typedconverterguard后同installer。
pure签名保，try!只断言linear默认ctors+已清guard无可达error，不catch降级；尚未编译/验收。
B newAxis formalgen/refs进行中；C Scene设计、A完整Axes clear/removedtarget sourcehost准备。
A原sharex尾body已证removed target可重join原Grouper且不回Figure.active，需C具体registry
设计承接，不能仅靠当前figure.axes遍历冒称等价。Scene API未freeze前不写production。
Root已全文读B272/C219notes，当前无live Root工具，不跑centralMoon以免并发writer。

D36 Root已按固定Axis.clear原body纠正2旧测试前提：view_test保inversion，date_autoformatter_test
保overlapfalse；无snapshot/sourceexpected盲改，正式原source矩阵由B新增。未运行Moon。
B正式newloader load(path)->(ns,AxisHarness)已稳定smoke0，完整原Axis.__init__/clear及overlap
property；Root全文读loader，A可复用。A补证tail sharex复制geometry而不重装，removedtarget
旧log可能使clearedaxis回log但peerlinear/sharedtickerlinear；已告C必须承接，不强制全部linear。
当前Root修改axis.mbt与2oldtests，B新refs进行中，C design/A sourcehost，尚无central gate。

D36 Scene已freeze并落C7files（figure/shared_axes/subfigure/lifecycle/axis_data+newaxes_clear/
shared_members），Root全部全文审：真实strong typed成员组/creationtargetRef/Int64注册顺序，
removed独立于Figure、tailjoin与复制geometry，late rc minlocFalse，checkedclear链与Figure/
SubFigure perAxes去重，三creation入口归并2处intrinsicY。Weakref expiry/fullAutoOn/lazyview/
Figure.clear删panel仍各自后续，不伪称完成。C停写，A正式Scene源newgen进行中。
Root新增Axis.inherit_scale_from纯geometry、set_cleared_view_limits checkedLinear尾桥：
finite→majorNS→actualscale.limit_range(ownminpos必读)→原方向sort→storetypedauto/explicit，
privateNS helper被旧default_limits复用。无group传播，Scene按source序控制，不把callback异常
当pure构造invariant。API已告A/C稳定。
D36 B 4newfiles已交396cases/13groups、8sourceonlyclearFalse，gen/check0，JSON
586a33968855d1f79bb8bb4332113c03830d0bf57ca02fe7c7764b3ca3c33200；正在追加可达mixed-meta案例
（原396必须保持），loader稳定不改。B原16query probes明确元数据读取0、所有converter/units
identity保留，原numeric slots决定queries；Root不接受只记mixedpeer边界而不修可达clear。
Root已补Linear set_scale真正安装4objects，privateinstallflag仅绕过默认ctors的单位guard，
numeric_tickers_active/units-for-ticks helpers使新numeric槽优先而保留metadata；checked/raw
numeric/location/labels/offset与minor labels均接，旧date显式numeric定位桥保留；Date configure
仅默认major让出至dateauto，explicitminorDateFormatter清相应named槽。尚未编译/源验收。
C已再次派只读核builtin view provider：A formal清理场景绑stored-view sink隔离了SVG provider，
内建group_limit可能把removed target100..200读取成active peer10..20。需真实回归/证据后
处理semantic vs render view区分，不能直接跳过用户bind_view_interval poison。无Root live工具。

D36 Root mixed-meta查询与内建view接线完成待验：metadata保留，Linear默认实际覆盖并读新named
slots，日期默认启用让出默认numeric major、显式minorDate formatter清旧namedminor；公开unchecked
label/offset/minor入口也读真实named对象，旧calendar显式numeric locator定位桥保留。
B追加16正式原querycases/独立审进行中，原396保持，A原52正在append2 builtin无override案例。
Root/C已定位真实Builtin bug并修：Scene render provider的group_limit首active10..20会盖removed
source自身100..200。新增独立render_view_provider，公开bind_view_interval保useroverride；
view_interval_checked仍layout→user→render→stored，四临时overlay检查改has_any_provider；新增
lifecycle_view_interval_checked优先user→ownstored→缺时render→0..1，不读layout。
C只改axis_data用bind_render_view_interval与clear tail用lifecycle getter后再次停，Root全文审
7Scenefiles/handoff及2行修正。用户callback异常仍可达，不以current_view_limits绕过。
A会正式source升/降两case同时检查x/y且不重绑storedprovider，防controlledfixture掩盖接线。
D36-gate.sh已备，尚未运行Moon，全部writer停后启动。当前无Rootlive工具/无用户阻塞。

D36 A最终54cases/2groups、60次完整clear入口（55success/5lateerrors）已gen/check0并停，
原52逐项同，append builtin升/降2cases同时x/y，无provideroverride；JSON
 eac89a28c9eff3d7c7bee1174a9169cb3f07556da924c1456bffc945f7508dc9。
Root已全文读A完整source/collect/setup/observations及guide，B原396+mixedcollect/render均已读。
C所有production已停，Root所有production暂停，B正在final gen/check/independent review。
预计新增15registered、466cases（B412/13+A54/2），full预计nonJS21853/JS21860；以最终实际
数量和结果为准，不预标通过。D36门禁未运行，Root无live工具。

D36所有writers最终停后首central1029已terminal255：17errors=8个WB timezone assert_eq无Eq/Debug
共16errors（已派B改Option匹配+底层physicalidentity，JSON需byte同）+C Array无first()一处
（已派C length>0+[0]），另SharedAxesGroup missing_priv一处改priv。无Root生产类型错误。
B最终正式412/13，原396/8source-only重构回原SHA精确一致；newJSON
cbdaa338a9e30e2f8c688bb48c7bf884e8d5e4fde0cd9aee0eac0ae5920d9272。
B140line独立mixedmeta review Root全文读，无新证实缺陷；A576line正式gen全文已审。
Root A newsource --check已开始/结果当前tool输出；未Moon行为验收，待B/C精修停后再gate。

D36 B/C编译精修均停写，Bgen/check0且412JSON byte同，C length+[0]/privGroup两点已修。
第二central36667 terminal0：check56tasks/7oldRefwarnings0error，infofmt0，初86line接口全文读后
Root将Figure两个新内部注册counter标priv，避免新公开状态；第三central18355 terminal0：
check76tasks/7oldRefwarn0error、info6tasks0/fmt9tasks0。最终77line接口Root全文审并存reviewed，
仅axis新增horizontaloptional与4lifecycle/provider API，Scene三clear_checked，旧pure方法保留。
完整四目标suite82531 live，log D36-test-all.log；所有tracked生产/fixtures停写，不能并发改。
当前正式cases466/15registered（B412/13+A54/2），预计nonJS21853/JS21860，尚未behavior验收。

D36 Root最终newsource复验46918/1739均terminal0，JSON SHA保持。完整82531已再次poll确认live；
read-only ps见moon进程42114及实际ticker moonrun，非仅文件锁推测。所有tracked写暂停。
Root新总guide initial_clear_README.md已写scope+待完整验收，未改编译源或fixtures。
A正额外独立readonly scene清理审（只ignored），不影响门禁。没有用户阻塞，失败继续修。

D36 full82531前三target已结束同1oldtestfail，15newregistered全部过：nonJS21853/21852pass，
JS21860/21859pass；native ticker实际进程仍live，不能改源码/fixtures。
唯一失败named_numeric_locator_test固定minor旧期望只[1.5,.5]；新真实default NullFormatter使
getter走原raw固定值协议。Root重新执行原完整Axis.get_minorticklocs+Linear/Fixed：三stage
原结果[3,1.5,.5,-.5,nan,inf]、[3,1.5,.5,1,-.5,nan,inf]、[3,1.75,.5,1,-.5,nan,inf]，exit0；
保存ignored D36-fixed-minor-original.json。将等fullterminal后只修这条旧test的getter/draw边界
假设，逐项保raw finite/NaN/Inf及原借用突变/顺序断言，不改production，不重跑已过无关suite。
A独立scene group/clear/provider reviewer初查无新具体缺陷，ignored报告收尾中。

## D36 最终验收

- [x] intrinsic x/y finishedconstructor defaults，Axis原位clear同holder/保view/方向/overlap。
- [x] Axes真实self→peers→late minorrc→children→target/emit tail，checked晚失败保partial。
- [x] 真实ordered成员/creationtarget/removed-rejoin不回Figure列表，末geometrycopy无额外安装；
      Figure/SubFigure单权威checked清理每panel一次，保本项目panel/layout便利合同。
- [x] converter元数据保留却由实际numeric ticker槽决定查询；checked/raw major/minor/labels/
      offset路径均接，真实fullquery源16cases，无metadata访问。通用units更新仍后续。
- [x] authoritative user-view与Scene render projection分开，生命周期读ownstored而不误取
      shared首activeviewport，rawcallback错误仍优先；2builtin无override升/降实际回归。
- [x] 15新增registered/466cases：B412/13 + A54/2（60完整源clear入口55success5lateerrors），
      8internalclearFalse source-only；两newsource final46918/1739 terminal0。
- [x] 首full82531 terminal2：nonJS21853/21852pass/1fail，JS21860/21859pass/1fail，四target同。
      原sourceget_minorticklocs三stage重新执行证实raw位置/NaN/Inf应保留，旧测试把drawfilter
      提前。只修该test并逐项保持完整raw数组/借用突变/顺序，production不改；相关文件24001
      四目标各6/6补验0，首full其余项目未变，累计全部覆盖，不伪称首full exit0。
- [x] 最终info4tasks0/fmt1task0/check24tasks7oldRefwarn0error，77line完整接口全文已审finalcmp同；
      后accepted docs更新再次finalscript0。axis optional方向、4Axis lifecycle/view APIs、三
      Scene clear_checked；注册counter保持private，没有意外public字段。
- [x] A126line Scene独立审/B140line units-query独立审均Root全文读，无新具体残留缺陷。
- [x] accepted README/COMPAT/PLAN/PROGRESS/DEPENDENCIES/NOTICE/总guide与两分guide；
      feature ed34eb0已本地提交，32files；无remote/push。此checkpoint另commit。
- [ ] D37完整autoscale_view状态/范围链与后续units/secondary/其他公开能力继续，不当整体完成。

最终JSON SHA：Axis cbdaa338a9e30e2f8c688bb48c7bf884e8d5e4fde0cd9aee0eac0ae5920d9272；
Scene eac89a28c9eff3d7c7bee1174a9169cb3f07556da924c1456bffc945f7508dc9。
所有Root与agents工具terminal，无需轮询。整体约50%(40–60%)宽估算不按测试数调整。

## D37 正在实现（2026-10-24）

- [x] 复用 D36 的219行 autoscale notes；D37-before 保存59dcb86的HEAD/tracked.tar/41接口。
- [x] 分工/API已冻结：Root独占Axis真实stored_view、auto_enable、stale、shared候选kernel、
  local set_bound最终化；B独占Scene缓存dataLim/relim、tight、sticky policy、request/unstale、
  scale eagerforce/peer接线；C独占SVG同kernel复用、rawdata/minpos/sticky提取；A独占完整原
  autoscale/_request/_unstale/setbound等新source oracle。三个现有独立agents均已继续。
- [ ] Root Axis实现已写入但尚未编译；新增autoscale.mbt，axis/view/default_tickers/context
  接入独立状态与render低优先minpos；所有旧manual setters的strictlog便捷合同保留。
- 源细节已确认：autoscale(enable=None)请求双方向，axis参数不筛；Bbox mutated是当前端点
  相对初始(0,1)比较，回原值恢复false。autoscale_view不enable、不清margin，空mutated直返。
  kernel只产生候选，最终getbound/view方向→local _set_lim→clear组stale→peer再次finalize，
  不合并跨越可失败的source stage。所有5scale都要读shared与ownminpos。
- 当前不跑Moon，等待tracked writers停；无Root live工具，无用户阻塞。验收后本地提交。

D37 Root已落Axis independent enable/pending/storedview及公共query/bind/resolve API，candidate
kernel使用finite raw endpoints（strict比较保first代表）、空mutated earlyreturn、actualmajorNS、
ordered sharedminpos、仅Log过滤sticky、源relative tolerance、actualscale clamp、transformed
margin与非finite padding0、stickyclamp、可选actualmajor.view_limits。候选尚不写view；独立
set_bound_limits_checked做finite→log必要旧endpoint→majorNS→ownminpos→scale clamp→排向/store，
保auto；Scene负责前置view读取和组stale/peer次序。Log默认clip<=0→-1000单独按源补入kernel，
不改变legacyScale.transform。render minpos是低优先fallback，用户/Scene provider及其异常优先。
Root新增6条Axis黑盒边界（空mutated、独立auto、候选/写回分段、tiny sticky、lateerror/provider优先）。
当前全部尚未Moon验收；B Scene、C backend、A newsource仍在写，Root不跑centralMoon。

D37 Root/C/B初实现已相互只读审，新增修正：candidate读原DataBox minpos与namedLog NS/
最终ownAxis.get_minpos是不同stage，现新增bind_autoscale_minpos（B真实cachedgroup）与
bind_render_autoscale_minpos（C rawIRgroup）分开，不能用ownprovider提前触发。C10条handtest
已停写；pureIR pending也改OR全组stale。Root新pyplot autoscale optionalenable/tight与真实
view转发及2条黑盒，Axis6条。set_bound local新增automatic~Bool?=None，仅成功finalize/store
后改开关并同步legacy Option分类；set_autoscale_on只同步分类，真实stored/pending不变。
B清理image_extent两个fit helper的try!，现在raiseCore贯穿既有raising image入口，用户callback
不会被当构造invariant。Scene兼容get_xlim/ylim新真实Some(view)，保legacy x_limits/y_limits。
冻结D37完整范围为installed numeric profile（5scale/11named与legacy数值）；未激活numeric的
日期/类别保持旧typed范围，collection添加前eager unstale callback、任意Artist协议/provenance
stickies仍后续，不把本片当全目标完成。A fulloriginal refs继续，B Scene测试收尾，无Rootlive。

D37独立审C123行已交并Root将读：两真实缺口已修（setscale覆用户provider、image attach早于
extent）。C10hand停；B14hand又加去getter/locatorsetter/remove多余bind收尾，以保用户上下文。
A完整source首稿collect56cases/2groups（48Scene+8cache），5预期lateerrors，仍在render/gen。
Root D35旧sharedscale generator只改4条衍生None假设→空mutated provisional仍保旧view，原JSON
SHA逐字不变；源regenerate3303 terminal0，68cases/182stages/3groups。未改任何原源expected。
Root candidate捕获NS时locator，后rawdata callback换slot也用原对象view_limits，末localfinal
则重新取当前locator；新增第7条Axis hand。deferredraw minpos支持本次Grouper snapshot，显式
raw override优先。当前gate脚本D37-gate.sh已备，尚未运行；无Rootlive。

D37首central36215 terminal0：check88tasks9warnings0errors、info/fmt0；236line接口Root已全文读。
两neweffect警告Root已改arrow，7旧Ref警告保；移除未使用newpublic locator_view_limits wrapper，
kernel private dispatch保留，下一接口预期235line左右需重新生成审。A首正式56cases/2groups
已gen/check0，JSON73206af928bf03ce7df3d1b3a7ed513ce117b8d19218487a811540dae0e0911b。
Root读全430line gen及guide，发现removed/rejoin sticky[200,200]在fixture走validated imshow会
被既有distinctextent typed校验拒；已派A仅改WB sticky host直接播种Image Artist，不改原JSON/
生产图像校验。当前A此精修live无Root工具，B16hand/C10hand/Root7Axis+2pyplot均停写。
C123line独立审Root已全文读，缺陷均已修；原DataBoxminpos/defaultprovider文字以最新deferred
snapshot实现为准。下一A停后重新gate，再四目标完整suite；失败照常排查修复继续。

D37第二central24395 terminal0：check68tasks7旧Refwarnings0error，info5tasks0/fmt7tasks0；最终
228line接口Root全文审并存D37-interface-reviewed.diff（删unusedpublic，其他预期API无变）。
全部tracked writers已停。完整四目标suite45799 live，log D37-test-all.log，不能并发改编译源/
fixtures；本次预期新增37registered（A2/B16/C10/RootAxis7+pyplot2），以实际终态计数为准。
A stickyhost精修gen/check0，原JSON73206a...0911b逐字同；原source值不改。Root全读新正式gen/
guide与C123line独立审。A/C现仅readonly数学stage/Rootkernel复核，不改tracked、不跑Moon。

D37首full45799已terminal2：wasm/wasm-gc/native各21890/21872pass/18fail，JS21897/21879/18fail。
35新hand全部过，两newsourcegroups失败（其中group1是fixture host tickspace未投影，源5而
Moon真实Figure约10；A已固定typed geometry并加case标签，gen/check0，原JSON保持）。
group0 Log差原inverse是exp(x*ln10)，legacyScale.inverse是pow；Root仅新kernel按源exp链修，
不改原expected或泛放宽。A21primitive inputs用Decimal180/320一致且原np全部同bits，SymLog
顺序现已正确。C另实际AST确认late_tight须在NS/rawminpos后读，bothsticky须在x callbacks前
按当时Log过滤；Root已加optional late tight_provider/log_stickies参数，B接源snapshot并加反例。
需重新interface。B已实际完整source证实4旧Scene失败均request/cache假设，将加显式request
或真实viewport断言；C正在source核backend旧失败（rc每render、rawminpos分stage、sharedmanual
等），不得盲改JSON。当前B/C获准各自精修，Root不跑Moon，无Rootlive；失败自主排查继续。

D37 phase2：A geometry5spaces+case标签gen/check0并停（56/2与JSON同）；Root kernel仅新numeric
range的Log inverse改exp(x*ln10)，新增stdlibmath import、late tight_provider、captured Logsticky
policy。B已接双sticky预过滤/live tight，新增2source反例hand共18，并完成4旧Scenefixture源纠正，
Root已全文读其review/probe说明和diff。Root新数学API需重新info/check；C旧backend失败仍诊断/
精修中，不能central并发。README/COMPAT/PLAN/PROGRESS/DEPENDENCIES/NOTICE已标实施/待验收，
尚未记完成，源码expected JSON全部保留。当前无Rootlive工具，无用户阻塞；下一等C停后gate，
先定点source+相关失败文件四目标，再根据production改变跑全量。

D37第三gate59247 terminal255：A新geometry播种把set_tick_layout positionalBool误写label，208
重复compileerrors，全同一fixtureAPI；A核mbti后改位置参数并gen/check0，原JSON字节同。
第四gate同步terminal0：check20tasks7旧warnings0error/infofmt0；228line接口仅candidate新增
late tight_provider/log_stickies两个optional参数，Root已审并更新reviewed，其余逐字同。
C已完成12旧backend失败源分类（107line报告Root全文读）：3repeatframe加显式request、2IR
sharedsetter补完成后的双轴view投影、4Log/Logit原rawDataBox与Axis查询分开；2Logit原profile
补raw provider上下文，所有numeric expected/JSON d7e535...9f1b与scale/Scene生成物byte同；1旧
aspect-error断言源先解析pending再raise，保异常/position断言，改已存view断言。
A/B/C所有tracked已停。定点四目标89801 live，log D37-focused-phase2.log；涵盖全部new39
registered（A2/B18/C10/Root7+2）及全部旧失败文件、sharedscale/adjustable/compat。无并发改源。
待该轮结果：真实productionLog/math顺序已变，相关通过后仍需全量四目标复验；不可仅凭补测
把首full18fail标全过。源expected保留，不用tolerance掩严格float差异。README等文档待验收。

D37 phase2定点89801 terminal2：四目标各237total/236pass/1fail；全部A56sourcecases与所有new39
registered已过，唯一旧Multiple inverted-resume暴露Root standalone lifecycle getter在request清
legacyauto_view后错误回0..1。Root已改无provider fallback读真实stored，并在现有Axis test加两
getter方向断言，旧expected不改。gate7064 terminal0：check36tasks7旧warnings0error/infofmt0，
228line接口finalcmp与reviewed同。当前第二次完整四目标31592 live，log D37-test-all-final.log。
源码/fixtures全部暂停，独立source --check两个93124(新autoscale)、71891(sharedscale) live；
logit首次Root命令漏必填ticker path仅usage exit2，下一条补准确参数重跑（不是源失败）。
第二full已覆盖Root真实生产fallback修，必须等待终态。无用户阻塞，失败继续排查。

D37三个Root独立 --check现全terminal0：autoscale93124=56/2/SHA73206a...0911b；sharedscale71891
=68cases/182stages/3groups；logit补准确path同步0=114registered旧profile，JSON d7e535...9f1b。
只31592第二full仍live，其余工具不轮询。定点237各236pass的唯一问题Root已source真实stored修。
A/B/C继续D38只读准备（单位update_units/_update_axisinfo/set_units与Date/Category接线/取消
legacy范围分支所需条件），各自仅ignorednotes，不改tracked、不跑Moon、不提前freeze；
D37通过验收与提交仍是下一required任务，不能把D38准备当完成或停下整体goal。

D37第二full31592当前wasm已21892/21892全过；其余target尚在跑，不能预标全部通过。
原首full log保留18fail/target事实，phase2定点237/236的旧方向缺陷已在本次wasm全覆盖。
无新源码写，pending只完整suite终态/最终infofmtcheck与accepted docs/本地commit，然后D38。

## D37 行为验收通过（提交前最终门禁）

- [x] 第二完整31592 terminal0：wasm/wasm-gc/native各21892/21892，JS21899/21899，0fail。
- [x] 新39registered = A56原源cases/2groups + B18 + C10 + RootAxis7/pyplot2；共93验证场景。
  A finitebits/state/orderedcallbacks严格保持；源JSON73206af9...e0911b全程不改。
- [x] Root三个changedsource --check全0，旧sharedscale/Logit源JSON与非backend生成物均byte同。
- [x] 全部可达真实缺陷已修：stored/autoon/stale分离；rawDataBox/AxisShared/own分stage；
  Log默认clip与exp(x*ln10)源表达式；late tight与bothsticky早过滤；capturedlocator与deferred
  sharedsnapshot；stableuserproviders；image cache→checkedextent→attach错误partial；emptyrelim
  保旧minpos；standalone请求后方向读真实stored。无盲改原source输出/放宽严格参考值。
- [x] C161line独立核/107line旧backend源诊断/B旧Scene源诊断Root均已全文读。
- [x] README/COMPAT/PLAN/PROGRESS/DEPENDENCIES/NOTICE与新guide已更新accepted范围及边界。
- [x] 最终info4tasks0/fmt1task0/check24tasks7旧warnings0error，228line reviewed接口逐字cmp；完整diff已审，feature c7439eb本地提交（53files/17627insertions，主要是JSON与generatedfixtures）。
- [ ] D38单位update_units/_update_axisinfo/set_units与Date/Category逐slot实际对象接线；A/B/C
  当前只读notes准备中，未freeze/未tracked写。D37提交后读其具体notes，不重项目survey。

31592与所有source工具terminal；当前无Rootlive工具，整体goal继续，无用户阻塞。

D37 feature c7439eb已提交，无remote/push；本次checkpoint/plan/progress另commit。31592及所有
Root/source工具均terminal，无需轮询。下一D38先读即将交付的三份ignoredunits/typednotes，
A已实跑23观察（原units registry/UnitData/DateConverters），B/C仍只读设计，不tracked写。
同registryconverter重复date忽略单独rc变化；首次Category default_units会set_units→axisinfo/
callback后neednew再axisinfo，重复category只append mapping且不重装/不callback。正式API与
实施分工尚未freeze，不能以当前23源观察冒称完成。目标持续、无用户阻塞。

D37 feature c7439eb + docscheckpoint f4dd38b均已提交，工作树当时clean；不重跑已过门禁。
D38-before 已保存f4dd38b HEAD/tracked.tar/41mbti，勿覆盖。Root已读现date_converter.mbt、
CategoryAxis persistent encode及旧DateConverter原class generator前155行；其抽象units host
旧scope不能假装真实registry。下一只读三notes后freeze具体生产，不能重全项目survey。
B214line D38-units-integration-design.md已交，7原slot/callback policy实际观测（另A23原units）；
C67观察含19完整typed autoscale，notes收尾；A23units registry/UnitData/DateConverters收尾。
B待Root判断：set_categories重排legacyextension与rawstring provenance边界、旧atomic
set_date_converter便捷接口与新sourcepartialroute区分、defaultlabel flag是否纳入；合理复用
已授权，Root可按具体代码/来源自行决策，不向用户反复求许可。当前未freeze/未tracked生产，
A/B/C只ignorednotes，Root无live工具，整体goal继续。

D38已freeze并启动production：Root shared4slot角色/typed range kernel；B unitsstate/Scene；C
逐slot queries/backend；A actualsource正式profile。Axis新增AxisUnitState，actualdate字段迁入
共享tickerholder，CategoryUnits live映射独立于旧persistentCategoryAxis。普通emptyarray按list
不选converter；RRuleDateTime明确awareness，旧DateTime plotDate为awareinstants。源append-only
category与旧explicitreorderextension分开；旧atomicdate便利接口保持边界。当前writers都live，
禁止central Moon门禁并发；Root无live工具。下一完成各ownedfiles后统一check定位，失败继续。

D38 Root第一实现已落：AxisUnitState字段与本地defaultlabel；actualDate槽迁共享holder，4独立
kind/flag；默认Date/Category仅eligiblemajor安装，explicitsetter仅自slot；Date/Category同D37
候选/最终NS与继承.001viewpolicy，typedset_limits在setter真实NS扩边。新增Root4handtests覆盖
混合formatter/locator、append保explicit、capturedtypedpolicy跨callback、label/minor保留。
CategoryUnits由B实现独立live，时区unit_equal新typedconstantzone秒等值+ruleidentity。Root已审
B初稿并修producer必须have_units门控/convert-only discovery（B正在落），C补Date共享lastowner
与checkedconcreteerror透传，A正式source90cases实施。所有writers仍live，禁止central工具。
下一等三者明确停写后mooncheckall→infofmt接口审→定点/完整四目标；任何fail需自主定位继续。

D38 firstcentral66429 terminal255（Root Integerpattern括号引起3error已修）；second41904 terminal255
为newfixture Bool结果未ignore与新Integers变体旧exhaustive，已精修，Agen/check0且原JSON
8c756d269c309bcac93caef535c7f331584a2ba09eb3e53e1d8d14b910e5bf37逐字同。third83519
terminal0：88tasks21warn0error（7旧Ref+新unusedtry/effect/deprecated已分类待精修）。
Root独立newsource --check同步0=90cases/3groups（23units49stages+67range），未改原源期望。
晚集成发现Category生成刻度为Pythonintlist，Root补FormatterLocations.Integers+完整整数batch
与StrMethod/Pct/Scalar/Eng/Log/Logit origin通路，C已接backend并源验证{x:d}/{x!r}；C11hand
+B15hand+Root4slot/4integerhand+formal3groups当前未行为验收。B独审原13Integerlistprobes找到
unusedhugeint转换/4300limit/Pct int-int三个可达缺口：Root已修前两，B获准只Pctfile+newtest，
尚livewriter故禁central。C只读独立复核单位/槽内核，A所有tracked停。下一B停后info/fmt/check
与完整四目标，失败继续；无用户阻塞，无Rootlive工具。

D38第四门禁41231 terminal0：info16tasks7旧warnings0error/fmt45tasks0/check104tasks19warnings
0error（剩余12均旧tests的unusedtry，后续对应源契约fail时精修）；324line接口Root已全文审，
含旧date_locator字段收束为共享槽getter、合法setter去raise、新unit/tag/CategoryUnits与Integer
formatter carrier。B13完整原formatter审发现的3缺口全修，Root4integer/B3Pct新tests已入门禁；
Root额外修显式shared category configuration统一live map，新增1Scenehand。C103line单位/槽
独立审、B93lineInteger审Root均全文读。全部A/B/Ctracked停写。
第一完整四目标26686 live，log D38-test-all-first.log，预期new41registered（formal3groups90case
+38hand）而非按sourcecase当test数；不得并发改编译源/fixtures。当前子moonc99%CPU正常编译，
不能把尚空log或耗时当停滞。下一等终态，逐实际fail按source诊断修；整体goal继续，无用户阻塞。

D38首full26686 terminal255：wasm/wasm-gc21933/21917pass/16fail，JS21940/21924/16fail；native
旧presetAuto.unwrap引SIGABRT未完成，不冒称四目标都跑完。源证据分类并修：Root预设count只
显式numeric槽时仍保AutoDate便利快照；旧atomic Date converter/offset/rc配置通过新units桥让
后续producer复用，且不得覆DefaultDate live marker/真正explicitconverter；source Date major/
minor显式locator自带TZ保留（新增1hand）。新minorFixed.5与major重叠是真过滤，fixture关闭
overlap；C修minorDateformatter+legacyFixed绕过Axis overlap flag实际缺陷。Root明确DateFormat
便利入口保manualfixedlabels，真正DateFormatter setter只自己slot。C据10原source补证修旧
formatter拒绝/implicitmajor/Categorymetadata/空无artist标签假设，原source输出不动，95line
报告Root全文读。A 18customepoch旧fixture只改rc但已锁epoch，现复用integration/epoch_2000
既有单注册test隔离，主WB72/3groups+isolated18，原90JSON8c756d...bf37全程byte同。
Root旧Logit formatter轴gen去纯setter多余try!并regen/check0=147cases5groups，旧JSON无diff。
fifthgate89165仅Rootfixture误用Figure.set_x_date编译1error，改axes().set_x_date后sixth66983
terminal0：info/fmt/check24tasks7旧Refwarn0error；324line接口finalcmp与Root全文已审相同。
第二完整44269 live，log D38-test-all-second.log；当前new42registered（formal3groups承载90
原源cases，其中18复用已有isolated注册test；39hand），预期nonJS21934/JS21941，以终态为准。
全部tracked生产/fixtures停写；Root两个final source同步0（new90与Integer13），JSONbyte同。
下一等44269终态，若失败继续诊断；通过后finalinfofmtcheck/accepted docs/分批本地commit。
不能把切片完成标整个goal完成；无用户阻塞。

D38第二full44269 terminal2：wasm/wasm-gc/native各21934/21932pass/2fail，JS21941/21939/2fail；
全部new42registered（90sourcecases+39hand，含18isolatedepoch）已过，全部Integer新/旧均过。
两旧fail仅scene/date_test转DSTrecurrence与pyplot同facade，Root已定真实cause：不能用unit
推断date_timezone_is_default来区分用户显式便利timezone覆盖。新增private timezone_override
默认false（sourceunitinfo清false），仅set_date_timezone/offset或legacyfixedoffsetlocator置
true；DateLocator构造仅受该explicit便利override影响，source推断unit不覆盖locator自带TZ。
这样保手动DateLocator源码独立TZ与旧便利DST配置；原两assert/源数值均不动。
第七门禁18883 terminal0：info/fmt/check79tasks7旧warnings0error；第六门禁66983亦0。当前
定点68537 live（6files四目标：scene/date_test、pyplot/date_test、Axisunits、Dateconverter/
calendarformat、Roottypedslots），log D38-focused-phase3.log。等结果后因生产timezoneflag
改变仍需第三full四目标；不能只定点过就把secondfull2fail标全过。无其它live工具/生产writer。

## D38 行为验收通过（提交前最终门禁）

- [x] 第三完整40394 terminal0：wasm/wasm-gc/native各21934/21934，JS21941/21941，0fail。
- [x] 新42registered=mainformal3groups+39hand；90源cases（23units49stages+67range），其中
  18custom-epoch由已有isolatedepoch注册test承载。原JSON SHA8c756d...bf37全程逐字保持。
- [x] 原源/fixture与真实生产分开诊断：修typed overlap、Date便利配置→units桥、presetauto
  快照、explicit source-locator TZ与legacy convenience TZ override；旧旧expectation按原完整
  source补证修。第二full的同2时区失败已在本次完整四目标重新覆盖。无放宽严格floatbits。
- [x] Integerlist来源、huge-unused/4300decimal限制/精确Pct及错误顺序已实源独审并修，39hand
  与旧Scalar/Eng/Log/Logit/Numeric全过。stable unit callbacks、dataLim/relim只请求事件方向。
- [x] C103line Root/B独立审、B93line Integer独审、C95line旧fixture源诊断Root全文已读。
- [x] Rootnew90 source--check和Integer13实际probe均0；旧Logit轴gen/check0，JSON无diff。
- [x] README/COMPAT/PLAN/PROGRESS/DEPENDENCIES/NOTICE和新guide已更新本次accepted范围、
  源证据及仍未支持的dynamic registry/stringgrammar/无原始Line数据重排边界。
- [x] 最终9195 terminal0：info5tasks/fmt3tasks/check24tasks，7旧Refwarnings/0error；324line接口与Root已审逐字cmp，diffcheck0，feature ad6a895已本地提交（67files/15733insertions，主要JSON与fixtures）；checkpoint/plan/progress另commit。
- [ ] D39 Line原始输入与CategoryUnits重排recache；A/B/C只读准备中，尚未freeze/生产写。

40394与全部Root/source工具terminal，无live工具。下一最终门禁和提交，再读D39具体notes冻结
下一小片；整体goal仍未完成，没有用户阻塞。

D38 final9195已terminal0，feature ad6a895本地提交，无remote/push。40394完整四目标全过与所有
source --check均terminal。D39目前B203line架构notes已交，A实际Line原源准备、C验收notes收尾；
只有ignorednotes，不改tracked生产/不跑Moon/不提前freeze。下一先读三具体notes再冻结最小
Line原始输入capture→recache→CategoryUnits替换重排纵向片，不能重跑D38。整体goal持续。

D38 feature ad6a895 + docscheckpoint 4eb61dc均已提交，当时工作树clean；不重跑已过门禁。
D39-before 已保存4eb61dc HEAD/tracked.tar/41mbti，勿覆盖。Root已全文读B203line
D39-line-provenance-design.md；A真实完整Line方法15观察已跑通，C验收notes收尾。仍未freeze。
scope准备：只真实plot/line入口保各coord Numeric/Category/Date originals sidecar，public
Artist::Line/renderIR不改；Streamplot/Contour生成displayLine不注册（保D37浅alias当前几何）。
unitcallback all registered Lines按artist顺序x→y转换，一Line xy成功后更新pointbuffer；之后
relim→只request事件轴。source readonly15确认晚失败保前Line/新unit与converter discovery，
不预验证全组、不自动update_units。当前只有ignorednotes，无生产writer/无Rootlive工具。
下一读A/C完成notes后freeze具体helper/接线/测试分工，再推进；整体goal未完成。

D39已freeze并开始production：Root新scene/line_units.mbt保私有Numeric/Category/Date逐coord
originals与exactpointbuffer，单Line x→y→broadcast全成功才写回；allLines成功后callback
relim/request事件方向。只true plot/line producers注册，生成displayLine/Collections不反推；
显式set_categories仍旧extension。B负责figure/category/units/axis_data/contour/Axisunits接线；
A负责actualsource正式15records（lazy publichandle未迁移部分明确source-only）；C负责独立
Scene/backend回归及复核。内部WB可controlledoriginals测试错误/1Dsingletonbroadcast，不新增
publicLinehandles。所有writers live，禁centralMoon门禁。Root下一完成kernel手测、等停写后
统一check→诊断→infofmt接口→四目标测试；无用户阻塞，整体goal继续。

D39 Root kernel已落并补4hand（forcedrecache不relim/request、singleton/emptybroadcast、
晚shapeerror保双coord转换副作用、physicalprune）；B6productionfiles与C2newtestfiles均停写，
C13hand=Scene11/backend2。B75line producer/date-copy独审Root已全文读，无新具体bug；
step/masked/stairs只保当前expandedNumeric，不冒称sourceStepPatch协议。A正式generator/JSON/
WBfixture尚livewriter，C只读审Root/B，B转D40secondary窄范围只读准备。Root无live工具，
下一A停写后centralcheck；当前不能把代码已落/格式化当行为验收。

D39所有tracked生产/fixture writers已停。A正式4files已交，24真实sourceobservations /
19controlledtypedcases /5source-onlylazyAPI /1registeredgroup，原15观察字段逐字同；新JSON
SHAb55b8a16cd844a1dea8833fc3469214175969e63b9c10f3a99a927a019b65b70，旧D38JSON不改。
C86line独审Root全文已读，无新productionbug；contour几何fixture已精修后停写。Root开始
firstcentralcheck3455（D39-check-first.log）与独立source--check36324
（D39-source-root-check.log），均live；预期新增18registered=1formal+17hand，不按24观察
误当新增tests。B/C仅D40secondary只读notes，无tracked writer。下一读终态，失败自主修复；
通过后info&&fmt/接口审/四目标full。整体goal持续，无用户阻塞。

D39 firstcheck3455 terminal255：3compileerrors（Root LineOriginal两mut字段仅WB使用触
unused_mut-as-error；C backend line_units_panel漏raiseDataError）。Root移除x/y mut，kernel
fixtures用controlledattach+已有Array变更表达pendingraw，不加假生产setter；补helper raises。
独立Rootsource36324 terminal0，24records/19typed/5source-only/1group，JSONb55b8a...65b70
不变。当前second40660 live，依次info&&fmt&&checkall，log
D39-info-fmt-check-second.log；全部trackedwriters停，B/C仅D40readonly。下一读second结果，
通过后审41mbti与D39-before差异、完整四目标行为；不能把compile修完当tests通过。

D39 second40660 terminal0：info9tasks/fmt11tasks/check58tasks，7旧Refwarnings/0error。
41份mbti逐字对D39-before比较全同，D39-interface-reviewed.diff为0行，公开API不变。
完整四目标first12510 live，log D39-test-all-first.log；新增18registered=1formalgroup
承载19typedcases（全部24原observations另含5source-only）+17hand。全部trackedwriters停，
无生产/fixture并发改动。Root下一等full终态，失败具体定位修；期间只读D40两份notes，
不冻结下一片/不提前写accepted，不重跑D38。D40 B21原installer/C28控制流观察各独立范围。

D39 full12510仍live，已完成wasm21952/21952、wasm-gc21952/21952、JS21959/21959，0fail；
native待终态。Root独立逐字段比较原15准备records与正式JSON，全部旧fields相同；D38
JSON8c756d...bf37再确认字节同。D40 B212line integrationdesign（23actualinstaller）与
C174line acceptance（28controlflow）均Root全文读，无tracked写；A只读source准备仍进行。
下一等12510 native/exit终态，通过后更新accepted docs/finalinfofmtcheck与commit；不能在
native未完成时声称四目标已过。不重复已过checks，Root当前仅full12510live。

## D39 行为验收通过（提交前最终门禁）

- [x] firstfull12510 terminal0：wasm/wasm-gc/native各21952/21952，JS21959/21959，0fail。
- [x] 新18registered=1formalgroup承载19controlled源案例+17hand；全部24源观察含5source-only
  lazyLineAPI。Root独立比较原15观察全部旧fields未改，D38JSON逐字同。新JSONb55b8a...65b70。
- [x] 单Line x→y转换/broadcast后commit；早Line/newunits/converter sideeffects保留，
  allLines后relim/request仅event方向；输入copy/physicalbuffer/clear/detach/contourprune、
  generatedStreamplotalias和数值IR/SVG已四目标覆盖。
- [x] B75line producer/datecopy窄审与C86line Root/B独审Root全文读，无新具体生产缺陷。
- [x] Rootsource36324 terminal0，24observations/19typed/5source-only/1group；41mbti初审
  对D39-before逐字同，公开API不变。初始3staticerrors均精修后full全过，无放宽源期望。
- [x] README/COMPAT/PLAN/PROGRESS/DEPENDENCIES/NOTICE及新guide已更新accepted与边界。
- [x] finalinfo4tasks/fmt1task/check24tasks terminal0，7旧Refwarnings/0error；41mbti final逐字同，diffcheck0；feature d179515本地提交（18files/14363insertions，主要JSON/generatedfixtures），本checkpoint另commit。
- [ ] D40 secondary默认/ownstoredview/parentnamecache；B212line/C174line notes Root已读，
  A readonlysource准备中；尚未freeze/production写。整体goal未完成，没有用户阻塞。

12510与其余Root工具均terminal，无live工具。下一final门禁和提交，不重跑full。

D39 feature d179515已提交，无remote/push。最终门禁terminal0（info4/fmt1/check24，7旧
warnings/0error），41mbti finalcmp全同；Root清理新Python脚本5个空行尾空格后finalsource
2294 terminal0、JSON和WBhash均原样。12510完整四目标全过，不重跑；全部工具terminal。
下一checkpointcommit后保存D40-before，等A D40source具体notes后freeze；B212line/C174line
已读，23actualinstaller与28controlflow范围分开，尚无D40tracked生产。整体goal继续。

D39 feature d179515 + docscheckpoint48a8316均已提交，当时工作树clean；D40-before已保存
48a83165f97cc4da40ac9cc2d847b873420b2029 HEAD/tracked.tar/41mbti，勿覆盖。不重跑D39。
Root已全文读D40 B212line/C174line notes与必要4secondaryfiles、Axis default_scale/autoscale/
view/context及IRproviders/backendbundle具体sections。A40numeric-stage原源观察已跑通，
notes收尾中（完整原Secondary ClassDef+实际function安装/Axislimits/D37autoscale；图形super
为明确storagehost）；Root尚未freeze/生产写。拟最小架构：Secondary保稳定private child
Axis作为真实四slot/flags/ownstoredview/formatterowner，Root提供窄function/functionlog
geometry/name上下文使原Axis默认安装和范围内核可复用；B四secondaryfiles薄适配，C区分
aspect-only与draw-preparation hooks并live locator/fixedrole transport。既有显式count/clear
采样为单独extension，ownerlessIR纯数值合同不冒constructor。B/C只读窄审此方案，A尽快交
最终sourcehost/constructor结果，全部仅ignorednotes无tracked生产/无Moon/live工具。
下一先读A notes+B/C具体疑点再freeze helper与文件归属，不重项目survey/不重D39门禁。

D40 A185line source notes Root已全文读，42actualnumericstage观察（41success/1真实ValueError）
与B23installer/C28control分开计数；A probe JSON992ae46c...5404d8。完整SecondaryClassDef
含init，Base graphicalsuper明确numericstorage/stylehost；真Bbox/Axis/functionscale/D37
autoscale。确认非log ctor own[0,1]；log fwd2x+5 emptydata ctor[5,5.234401174884448e50]；
namechangingdraw先oldFixed NS constant4→[3.8,4.2]再reset，NaN错误在reset前。DPI72 320×240
constructor/directaspect spaces x10/y11，positionedframe x4/y7；y239.999999...来自按bbox
origin/end分别转换inches后相减，不能单用height/20。B/C正在窄审Rootstable childAxis方案。
C具体placement风险Root同意：每ownedchild bundle需自己已安装transform/ownstoredlimits
normalize，不能用global parent scale快照；前childcallback改parentname影响后child的drawprep，
constantforward经NS后的ownlimits也不能用parentbounds逆映射代替。ownerlessIR保explicit
numerictransport旧extension。尚未freeze/生产写，全部仅ignorednotes，无live工具。
下一接B/C最小helper/provider协议后一次freeze，Root Axis functioncontext、B Scene childstate、
C render hooks/layout snapshot、A正式source各独占推进；不重D39。

D40已freeze并production：Root已读A185/B281/C174/IR166全部notes；stableprivate child
Axis为secondary四槽/flags/view/bindings唯一authority，旧pubmutabletickerfields收束getter，
接口变化须审。Root新Axis::configure_function_scale(forward,inverse,logarithmic~)只装context/
共享默认（B负责oldNS→install→newNS→conditionalownemptyautoscale）；coordinate_scale_name/
coordinate_transform/coordinate_inverse为installedsnapshot；set_source_ticks先rawownview
expand保inversion/auto/stale再NamedFixed。函数context跳过primary-onlylegacyLogguards，
保普通主轴旧严格合同。Root接autoscale composedtransform+sourceexpinverse、functionlog
finalizer、shortpixelgeometry与一次snapshot minoroverlap，新增4Axis hand。
B独占secondary4files+newlifecycle/test；C独占SceneSVG/IRmodel/backendsecondary/render+
newbackendtest，区分aspect与drawprepare，bundle用childownlimits/transform归一并缓存；
A独占新formalgen/JSON/WB/guide。只有显式count/clear走旧samplingextension，ownerlessIR
保explicitnumerictransport，无publicset_functions扩scope。当前所有writers live，禁止central
Moon/info/fmt/test，只有singlefile stdinformatter。Root代码首版已落7files（含newhelper/test），
尚未编译或行为验收。下一全体停写后check→诊断→infofmt接口审→full四目标，失败继续。
无Rootlive工具/无用户阻塞，整体goal持续；D39已验收勿重跑独立旧门禁。

D40 Root当前helper首版：scene/axis/function_scale.mbt + function_scale_wbtest.mbt，另改Axis
axis/autoscale/default_tickers/formatter_geometry/named_numeric共7files；单stdinmoonfmt均0，
未central编译。4hand含immutabletransform快照、真实emptydata区间5..5.234401174884448e50、
sourceTicks倒置raw扩张/保auto-stale/callerArraycopy、ordinaryLogguard保留。B审出FixedLocator
构造borrowArray，Root已改values.copy并手测caller mutation，B ticks()用currentFixed projection
bool不留Arraymirror，historicalticks_set独立。A实际证physical公式必须乘Affine reciprocal：
((origin+length)*(1/72)-origin*(1/72))*72，不是除72，y240才得239.99999999999997/space11；
B已采用，42源期望不变。C数值IR/bundle接线生产中，B Scene生产中，A正式gen/JSON/WB中。
全部trackedwriters仍live，禁centralMoon门禁/禁止此时commit或误写accepted；Root无live工具。
下一所有writers明确停后统一check定位真实错误，源期望不调松。

D40 Root新增第5hand：sqrt composedminoroverlap使用变换后span，而非rawspan，全部Root5hand
仍未Moon行为验收。C first稿5files+8backendhand曾STOP；Root审固定TransformedBbox.get_points
发现decreasing transform归一错，C已修为transformed min/max后按rawBBox inversion复原，
加2hand→10backendhand并再STOP；原42sourceexpected不动，A补2truechild.transData positions。
随后Root明确授权C/B必要cross-x/y创建序：Secondary private draw_order=创建时两列表len之和，
C传IR optionaldraw_order并统一ordered entries用于earlyaspect、每childdrawprep/bundle、最终
append（ownerless无metadata保旧xtheny）。C恢复owned写此1项；B加privateorder。A新获独占
NEW backend/svg/secondary_placement_reference_wbtest.mbt，可将两sourcepixelrecords投影真实
Axisfunctioncontext/IRplacement/privatebackend而非复制renderer算法；另MainSceneWB仍核ownview。
A正式scope原50obs/20case/1group将小扩decreasing/creationorder，最终计数以后报为准，不能
与B23/C28相加冒93parity。仍有B/C/Atrackedwriters，Root无live工具，禁central门禁。
下一等待明确停写；Ccreationorder后只读核childcallback改parent时primary/data全局scale旧快照
是否具体Source不符（先原source证据/最小修法，不盲重算preparedchild，不扩GUI）。

D40 B已STOP：5production+newSceneWB8hand，Root全文读全部5production+8tests，未见具体新错。
parent_scale_name/ticks_set/source_ticks_current/legacy_sampling私有、draw_order全方向创建序；
currentTickValues恢复保dtype/borrow；原nonfiniteSecondary错误仍InvalidTicks前置validation。
C完成creationorder后同5files/12backendhand STOP；随后只读确证更邻接的childcallback改parent
scale后primary/data旧enum bug（原Axes.draw稳定序/Axis._set_axes_scale立即_update_transScale/
liveTransformedBbox），Root授权只修child全部prepare后刷新primary ownbounds+实际scale enum，
不recompute_scales、不重child；最终data用此新局部context。C恢复此1修并加manual[1,100]
Line x1/10/100中点应.5的新hand，明确不冒更一般x/y primary callback互改全dynamicRenderer。
A正式source/gen仍livewriter（约50+2positions+少量creation序，最终数待报告），Root/B已停
tracked，B转只读独审Root7Axisfiles。Root现无live工具，禁止central直到A/C明确STOP。

D40所有trackedwriters已STOP。A正式5newfiles交付，gen→--check0：53actualsourceobservations，
22Scene scenariofuncs/1group+2backend positionfuncs/1group（复用2records）=新2registered；
1creationorder原source row链接B现hand，不重复注册。原42每旧fields same，D39JSONsame。
新JSON SHAf08b4dd86ace16cba9b00b787e3334501e85c09cf608c819f27bd53d64776c5c。C定向
primary/data刷新已STOP/now13backendhand，Root全文读其117line独审与78linehandoff；Root
5hand+B8hand+C13hand=26hand，加A2groups=预期new28registered。Root启动firstcentral31323
live（D40-check-first.log）与独立source--check20161live（D40-source-root-check.log）；
禁并发改生产/fixtures。B仅readonly functioncontext独审，C/A当前idle无tracked写。下一
读工具终态，失败按具体编译/真实Source定位修，不退回/不停；通过后infofmt/interface审/
full四目标，当前尚未行为验收D40，整体goal继续。

D40 firstcentral31323 terminal255：4compileerrors（C3hand调用prepared参数需Some，Root
sqrt应value.sqrt）；已精修并3files stdin格式0。Rootsource20161 terminal0，53源观察/
22Scenecases/2groups+2复用positioncases/1handlinked，JSONf08b4d...76c5c原样。B独立实际源
审发现2真实order差异，Root授权修：set_source_ticks非空时getview→rawexpand→第二次getview
→才Fixed，Root已补secondread并第6hand证明secondprovider失败保expandedview/oldlocator；
Root现6hand。B独占named_numeric/named_formatter+newfunction_minor_order_wbtest，修minor
capturetransform→minor→major→lateview→bounds，保持dtype/fullset与Date/Null一致、不加
viewreads。B当前livewriter，此时禁止central；Root/C/A停，Root无live工具。
下一B停后secondcheck→源/旧tests按实际Source诊断→infofmt接口审/full；不因fail停滞。

D40 B已STOP，Root全文读112line function-context独审与3files minor修正/6hand；原完整源
6stage观察独立于53formal。Root另补sourceTicks rawBbox getter（public projectedview不作
rawsetter输入）、equal旧区间走反向分支、callback清空输入先min错误、Python strict
min/max保首equal/NaN/signedzero；Root当前8hand。Root/B/C/A全部STOP，预期new37registered
（Root8+BScene8+Bminor6+C13+A2groups），尚未运行行为不冒pass。secondcentral30157 live，
log D40-check-second.log；下一读结果，精修实际问题后infofmt/interface审与完整四目标。

D40 secondcheck30157 terminal0：72tasks/7旧Refwarn/0error；info9tasks/fmt22tasks terminal0。
41份mbti对D40-before产生111line diff，Root已全文审：internal IR增加可选draw/placement/
live role/order hooks与immutable SecondaryPlacement；Axis新增functioncontext5helpers；Scene
secondary移除4个旧pubmutable ticker镜像字段（getter/setter保留），新增prepare_draw，预期。
fullfourtarget19512 live，log D40-test-all-first.log；new37registered待runner核，不能先称过。
所有trackedwriters停。A/B/C仅只读准备D41 public secondary.set_functions（不扩transform布局），
分别ignored source/integration/render notes，无Moon/无tracked写。Root下一诊断full实际结果。

D40额外Root原完整_sourceTicks probe exit0，ignored D40-source-ticks-root-probe.py/.json，
projectedgetter/equalraw/signedzero/firstcallback清空4观察；前三精确同新hand。第4原实际
runtime错误字面是`min() iterable argument is empty`，Root目前生产/hand仍为旧记忆字符串
`min() arg is an empty sequence`，必须full19512终态后两处精修并定点四目标验证，不能
在fulllive时改tracked。该4diagnostic不加入53formal计数。当前full19512仍live。

D40 firstfull19512 terminal255：wasm/wasm-gc各21958pass/21989，JS21965pass/21996，同31fail；
native在C新backendXMLfixture未startsvg触writer第二root错误SIGABRT，无native全过结论。
Root已精修sourceTicks错误字面与原runtime一致。A接旧五类reference fixtures/generators与
numeric_axis_context两hand；B接secondary_lifecycle/secondary_axis/auto_minor_axis/log_axis
四handfiles；C仅NEWbackendWB两Writer补svgroot。所有修法须实际源证据，不改JSON期望，
production缺陷先回报。当前agents各独占写，禁centralMoon；下一各STOP后check/infofmt/
定点诊断及完整四目标重验。失败正在排查，不是用户阻塞。D41只读暂停。

D40 B4Scenehandfiles已STOP，Root全文审72line diagnosis与diff；完整源4diagnostic+C独立
2labelrows均0，确认MaxN3步预期、Scalar精度、aspect前own0..1、draw旧LogNS均为fixture
假设，无新增production反例。C两XMLroot已修STOP；随后Root读actual legacyformatter
桥确认owned仍forward(parentbounds)而非真实ownstoredNSview，是具体D40production缺陷，
授权C仅render helper ownedplacement分支用existing formatter_view_interval，ownerless保持，
加第14backendhand；B只读独审此1修。A仍旧reference/physicalfixture写，增加授权numeric
generator同步。此时禁止centralMoon，待A/C明确STOP再full。当前无Rootlive工具。

D40 C已STOP：owned legacyformatter仅Some分支读existing storedviewprovider一次，不调用
placement/forward；named/Null/None及ownerless原行为保持。Root全文读B独审与C精修/第14
hand，完整原Percent+DummyAxis证labels0.10%/0.50%，poisonforward次数0。newregistered
现在38=Root8+BScene8+Bminor6+C14+A2groups。C63line failure notes与D41render140line
notes落盘（D41未实施）；A旧reference模板/生成物修与6sourcechecks收尾仍writer。下一
A明确STOP后centralinfofmt/check、审final接口diff对111line基线、完整四目标重验。

D40 A12files已STOP，Root全文审106line fixture诊断与12files diff：old原sourcehost录
aspect/positioned阶段显式进入；Log rawsetter/screcordhost改controlled Axis provider，保原
view/Infminpos/space4与所有原断言；6旧JSON逐字未改，6source--check全0，D40formal未改。
third49659 terminal0：info7tasks/fmt15tasks/check50tasks，7旧warn/0error；41mbti 111line
diff逐字同已审基线。secondfull92966 live，log D40-test-all-second.log（新38registered）；全部
trackedwriter停，无并发生产/fixture更改。下一读full实际终态，失败继续精修，不重D39。

D40 secondfull92966 terminal2：wasm/wasm-gc/native各21988/21990，JS21995/21997，同2fail
only numeric_axis_context physical2hand；其余含38newregistered均四目标通过。Root确认非
margin（manualrect无padding且Figure无marginsetter），真实reciprocal affine240@origin0
→239.99999999999997，source旧numeric host除72为240，导致space3/owner3ticks。不能改
生产回除72。A仅对这2fixture/template做完整原Bbox/sourcegetspace平移几何probe；拟xorigin
120、第一ybottom24/top96令长度240/120原实际空间仍4/3，保原所有expected/JSON，原
sourceprofile只规定长度。92966已terminal可写，A此两files独占，其余STOP。修后仅单文件
四目标补验（production未变），通过即可累计全suite验收；不再无理由thirdfull。无Rootlive。

D40 A完整原Affine复验纠正Root简式推断：ybottom.1仍space2，.25才space3；first
parentrect(.25,.25,.5,.5)、second(.25,0,.5,.5)保actual240/120/source4/3及owner5ticks。
采用完整原source而非简式公式；ignored D40-old-physical-affine-origin-probe.json保正负例。
A仅numeric2files收尾/check，待STOP后Root `moon test scene/numeric_axis_context_test.mbt
--target all`；不要误用旧版-f filename（当前-f是测试名glob）。

D40 A两fixture/template平移已STOP；Root全文读完整原Affine12rows正负例和新26line说明，
numeric --check0/JSON原样。单file四目标补验52805 live，log D40-test-numeric-supplement.log。
production自secondfull未改，其他alltests既有四目标通过可保；此次只补剩余fixture文件，
下一看52805终态，再accepted docs/finalinfofmtcheck与分批本地commit。A继续D41仅readonly。

## D40 行为验收通过（提交前最终门禁）

- [x] secondfull92966：wasm/wasm-gc/native各21988/21990、JS21995/21997，仅2旧物理
  fixture；真实原Affine证平移几何后单文件52805 terminal0，四目标各86/86全过。
  production自secondfull未变，累计nonJS21990/JS21997全覆盖，不重thirdfull。
- [x] 新38registered=2formalgroups+36hands（Root8/BScene8/Bminor6/C14）；53formal
  sourceobs（22Scene funcs承载52directobs，2backendfunc复用positions，1obs链接既有hand）。
- [x] 所有旧JSON原值保持，6旧source--check全0，numeric平移后再check0；新formal最后
  Root --check terminal0，log D40-source-final.log，JSON f08b4d...76c5c未变。
- [x] Root全文审A106+26line旧fixture证据、B72line手测诊断/C63line诊断与独立legacyview
  审查；sourceTicks4/minor6/labels2/physical12诊断均单独口径，不混53formal计数。
- [x] README/COMPAT/PLAN/PROGRESS/DEPENDENCIES/NOTICE/newguide已更新能力/验收/边界。
- [x] 最终85961 terminal0：info4tasks/fmt1task/check24tasks，7旧warn/0error；41mbti
  111line finaldiff逐字同已审基线，diffcheck0。清newPython1空行尾space后sourcefinal0，
  formal53/JSON f08b4d...76c5c保持。
- [x] 分批feature本地提交ffe5ec9（Axis10files/591insertions/71deletions）、d950312
  （Scene/IR/backend/source/docs39files/20746insertions/771deletions，主要JSON/fixtures）；
  本checkpoint另commit。整体goal未完成，无remote/push。

当前无Rootlive工具/全部trackedwriters停；A只读D41源矩阵，B181line/C140line D41notes
Root均已全文读。下一最终静态门禁与commit，勿重复已过D40行为测试。

D40 feature ffe5ec9+d950312已提交；85961 finalstatic0，52805 numeric86×4补验0，
92966除这2fixture外完整四目标通过，累计nonJS21990/JS21997全覆盖。只有本checkpoint
待commit，全部toolterminal无live。D41仅ignored设计：B已191line实证修正NaNforward
postinstall其实成功（sourceLogview_limits回退[1,10]，非猜测失败）；唯一已证typedsetter
partial是CURRENT Log query x/y pair/None4cases。A40actualobs=26typed+14source-only
terminal0，最终notes收尾。下一checkpointcommit→D41-before snapshot→读A最终source/
修正后的B19line→freeze并授权独占实现。当前无用户阻塞，goal继续，不重D40门禁。

D41-before已保存b243999bd4182e8c0fa2dc9e3e2af01f8fc56563 HEAD/tracked.tar/41mbti，勿
覆盖。Root已全文读A173/B191/C140notes与原setter/_set_scale，freeze typed pair
set_functions(forward,inverse)+reset_functions()；源码40obs=26typed/14source-only，16
operationerrors（10invalid、4currentLog、2lateraspect）。NaNpostinstall成功[1,10]保留。
Root首版2prod已写：secondary_axis forward/inverse改privmut并保getters；NEW
secondary_functions.mbt先assignboth再复用synchronize_parent_scale，reset identity；不
invalidatenamecache/不先mapparent/不eager执行。单stdinfmt0，未central编译/行为未验收。
A独占NEW formalgen/JSON/guide/SceneWB；B NEWsecondary_functions_wbtest；C NEW
secondary_functions_render_wbtest（Scene实际IR/SVG callback时序），无新backendprovider。
当前三agents都writer，禁止centralMoon/info/fmt/test/commit；Rootprod停，无Rootlive工具。
下一全体STOP后central静态→独审接口→完整四目标，失败继续按实际Source排查。

D41 Root最小2prod获B只读独审，无新具体缺陷；B6Scenehands首版已落但仍自审/格式，Aformal
与Crenderhands都writer。未运行D41central编译/行为，不将Root实现当验收。get_goal只读仍
返回历史blocked（updatedAt1792744279）；用户已反复明确继续且当前无实际阻塞，继续执行
已授权迁移，不据旧工具状态停止/重复标blocked/创建重复goal。Root无live工具。

D41 B已STOP，Root全文读NEWsecondary_functions_wbtest296lines/6hand与handoff；覆盖old
getter/same-name4slotsflagsviewctx、sampling/emptylatch、CURRENTInt64双向alias、CURRENT
Logfailure新pair旧state、NaNnamechange成功再lateraspect、same-nameNaN无eager执行。
A正式预计27scenario funcs/1group（26typed+6nonlinear sequential；最终counts待交付），
保40旧recordfields；Crender4hands收尾。A/C仍writer，禁止centralMoon。Root无live工具。

D41全体trackedwriter已STOP。Root全文读C190line/4renderhands（4处sqrt freefn已精修
value.sqrt method）与145line formalguide，B6hand已审。A4newfiles gen→--check0：46obs
=40参数（26typed/14source-only）+6nonlinear，27private scenarios/1registeredgroup；
新11registered=A1+B6+C4，尚未Moon行为验收。Root独立比较40参数records全部exact equal，
C6所有旧fields subset exact，仅加实际endpointtransform；JSON SHA
b00f07536f7b7192eccf8006d09520c82bbf83d3c167db880328d75a24a0e6d1，D40原样。
Rootfirstcentral30972与independentsource--check启动，logs D41-check-first.log/
D41-source-root-check.log，等具体终态后精修或infofmt/interface/full；所有writers停。

D41 firstcheck30972 terminal255：2编译error均formalold_fixed.call不存在（Fixed对象需
as_locator().call），另C StringView.to_string新增弃用warning。Root精修generator投影
为as_locator().call并重生成WB/--check12259 terminal0，JSON原SHA b00f075...0e6d1不变；
C改to_owned消新warning。独立Rootsource--check terminal0，46obs/27scenario/1group。
second info→fmt→check已启动，log D41-info-fmt-check-second.log；所有writers停，等结果
后审41mbti对D41-before差异并完整四目标。当前行为未验收，失败继续精修。

D41 second(info/fmt/check) terminal255：info5tasks/fmt5tasks成功，check仍2samefixture
errors；Root首修误以为Locator wrapper有call，查正式mbti/locator_fixed.mbt后确认对应
源__call__的是FixedLocator.values()。已改generator为values().to_array()，重gen/check
59025 terminal0、JSON原样；thirdcheck live，log D41-check-third.log。无production改动，
新C warning已消（to_owned）。下一third终态、审接口后full，不能把sourcecheck当Moonpass。

D41 thirdcheck terminal0，Root全文审41mbti对D41-before仅21line变化：Scene移除forward/
inverse两个公开readonlyfield（getter保留，私有mutable存储），增加set_functions/reset。
其他40interfaces逐字同，无backendprovider/API变化。完整四目标first8825 live，log
D41-test-all-first.log，新11registered=1formalgroup（27scenario/46sourceobs）+B6+C4；
全体trackedwriter停，无并发生产/fixtures写。下一读full终态，失败继续诊断精修。

D41 firstfull8825 live，所有trackedwriters停。B只读独审Aformalgen/fixture映射，A/C仅
ignored只读准备D42 secondary location/alignment+numeric位置（不含Transform参数，未
freeze/未实施）。Root发现新Python10空行尾space，等8825终态后清并source--check；这
仅hygiene不改source输出/期望。下一读8825实际结果，失败继续诊断，不以时间推断进度。

D41 full8825仍live：wasm/wasm-gc各22001/22001、JS22008/22008，0fail，native待终态；
不能先称四目标全过。Root全文读B83line formal独审，无新投影/oracle缺陷，typed/source-only
边界已审。A/C仍只ignored D42notes，B全部STOP；新Python10blank尾space待终态清。

## D41 行为验收通过（提交前最终门禁）

- [x] full8825 terminal0：wasm/wasm-gc/native各22001/22001，JS22008/22008，0fail。
- [x] 新11registered=1formalgroup（27scenario，46obs含14source-only）+6lifecyclehands
  +4renderhands；Root独立40原records exact与C6oldfields subset exact，正式JSON
  b00f075...0e6d1保持，D40 f08b4d...76c5c保持。
- [x] Root全文审A145lineguide、B296linehands/C190linehands与B83line独立formal审；
  21line接口已审（2newmethods、2readonlyfields收私有mutable/getters保留），无新backendAPI。
- [x] 首轮2Fixedcall编译错误经Rootvalues().to_array精修，newdeprecatedhelper改to_owned；
  生成物/--check0且原JSON不改，full0后Root清Python10blank尾space，accepted docs已更新。
- [x] final17646 terminal0：info4tasks/fmt2tasks/check24tasks，7旧Refwarn/0error，source
  final --check0/JSON原样；41mbti final21line逐字同已审基线，diffcheck0。
- [x] feature e2be84b已本地提交（15files/7690insertions/6deletions），包含2prod/interface、3testfiles、sourcegen/JSON/guide与6docs；
  本checkpoint另commit。整体goal未完成，无remote/push。

A/C只ignored D42 preparation（source43records/11operrors；actualBase.draw x/y2records
证第二apply_aspect），没有tracked写/没有D42freeze。下一先完成D41final与commit，勿重full。

D41 feature e2be84b与最终门禁已完成，所有Root工具terminal无live。full8825四目标0fail，final
17646 info4/fmt2/check24/source0，21line interface final逐字同，JSON b00f075...0e6d1不变。
C D42只读189line/12actualobs已STOP，A43locationrecords/11operationerrors notes收尾；
Root尚未读最终D42notes/未freeze。下一checkpointcommit→D42-before→读必要notes决定
稳定orientation/rawposition/alignment与完整superdraw第二sync最小接线，不重D41门禁。

D41 feature e2be84b + checkpoint c7aee5e均已提交，当时工作树clean；D42-before已保存
c7aee5e09a6f140fbccce2188caac486d5e05604 HEAD/tracked.tar/41mbti，勿覆盖。Root已全文读
A184line source notes（43obs/36Double-named候选+7dynamic/11operrors）与C189line
render notes（12actualobs=10geometry+2完整Base.draw）；都仅ignored资料/全部STOP。
确认后set_location不改alignment/view/tickers/cache，constructor仅初次pos<.5选style，
numericNaN/Inf原接受，deferred NaNbbox无setterfiniteerror；完整Base.draw新阶段在reset后
再次locator→apply_aspect→_set_lims，constant4最终[1,10]而D40superdrawsink阶段[3.8,4.2]
仍正确旧profile。D42尚未freeze/无生产写。拟现Location加Position(Double)、稳定private
orientation、私有mutrawlocation与独立alignment、position派生getter；具体IRframe/style
capture与真实thinbbox1e-10算术仍待设计窄审。下一只读必要现Scene/IR/backend位置段，
与B/C定最小边界后一次freeze独占实现；不重D41门禁。Root无live工具/无用户阻塞。

D42后续窄审（仍无tracked实施）：Root读必要Scene构造/locationhelpers/SceneSVG/IRmodel/
backend early+perchild+append与transforms affine方法，B/C同意原/active normalizedBBox
为authority（派生1Dformatter geometry，不添mirror），新positioned_aspect(frame)在limits
成功后commit先capture候选，directapply回original，pubprepare_draw保持D40低层阶段。
IR拟optional positioned_aspect_provider与immutable SecondaryDrawingContext四screenedges+
alignment；early调用newhook替同owned旧sync，perchild oldmap/reset后再newhook，fullbatch
及owntransform后capture drawingctx入bundle，append只cached。parentFrame沿现render固定
rect，任意parent-position callback动态layout不扩scope。独立pubAlignment四edgeenum，
Location新增Position(Double)，numericAlignment仍typed不可表达而source-only。
Root核Moon Affine.then(self,other)=self*other（other先应用），故figureFrom.then(parentTo)
正确，存normalized后单独figureTo。B实际source逆矩阵probe证generic determinant inverse
1ULP差异，采用直接1/W,1/H或现BBoxFrom diagonal，不改全局Affine.inverse。B另source
probe证forward内set_location后metadata新而本次active仍hook入口旧capture。旧53source
与新完整BaseDraw先oldNS[3.8,4.2]再secondNS[1,10]各保独立profile。等待B最终helpers/file
handoff后一次freeze；A/C只ignored准备，无Rootlive工具。

## D42 已冻结，三路独占实施中

Root已全文读最终B148line设计、A184line源记录、C288line真实geometry/fullBaseDraw证据。
用户再次明确继续；freeze已分别发给现有A/B/C，全部writer，尚未central编译/行为验收。

- B独占Scene: secondary_axis/newsecondary_position/secondary_numeric_context/
  secondary_lifecycle、scene/moon.pkg、toptypes、新positionhands；另旧Scalar/Eng/lifecycle
  fixtures与Scalar/lifecycle templates共5files只机械formatter_geometry() getter适配，旧JSON不改。
- C独占SceneSVG/IRmodel/backendsecondary_formatter/render与2newpositionrenderhands。
- A独占NEW positionformal generator/JSON/guide/SceneWB，tracked自包含，旧source期望不改。
- Root独占checkpoint/docs与后续central gates/interfaces/commits，无生产写，无live工具。

公共Location增加Position(Double)，独立四边Alignment；orientation固定，rawlocation私有mutable，
position派生。constructor只一次pos<.5选style；set_location只raw，set_alignment只style，跨向
先error，任意Double含NaN/Inf位置接受。private原/active normalizedBBox唯一authority，入口
capture候选后map/store成功才commit；directaspect回original；prepare_draw保持D40低层阶段。
newpositionedhook early替owned旧sync，perchild oldmap/reset后再positionedaspect；fullbatch/
transform后capture immutable四screenedge+alignment，append只cached，ownerless旧fallback。
figureFrom.then(parentTo)存normalized，再单独figureTo；thinbbox pos+1e-10先算，不改global
inverse；fixedparentFrame边界保留。下一等各STOP与handoff，全文审后central静态、接口、四目标，
若失败按具体source排查修复。不要并发centralMoon或重复已验收D41门禁。

D42 B/C生产首版已落，仍各自writer写新hands。Root已全文读B Scene5prod/newposition与
C IR/adapter/backend4prod diff及bundle/append数值段：固定orientation、原/activeBBox、
入口capture/成功commit、true thinbbox两阶段、bottomup formatter、cachedfraction使用最终
activeframe均未发现新具体缺陷；尚未Moon编译或行为验收。A最终formal拟56records=
原43setter+C10geometry+C2fullBaseDraw+B1capture，41scenario funcs/2groups待正式交付。
43profile真实parentwidth128.00000000000003而Scene便利rect128，fixture显式传actualframe，
这是incomingframe宿主边界，不冒完整Scene布局bitparity。全部writer未STOP，禁止centralMoon。
Root无live工具；下一继续handoff独审、全部STOP后central门禁。

D42 B/C已全部tracked STOP，Root全文读B333line8hands、C两newfiles11hands与全部生产diff。
C两个StringView helper已精修to_owned，Root进一步要求fullDrawhand删提前prepare_draw，避免
earlyhook掩盖缺失perchild第二hook，C补强后STOP。B旧Scalar/Eng/lifecycle三source
--check session7167 terminal0，原3JSON SHA保持（D40 f08b4d...76c5c）。B仅ignored只读独审A。
Root独立原43+C10+C2+B1的56完整records exactequal通过，新JSON e71b2a...40252；最终
counts43参数=36typed/7source-only，10geometry、2fullBaseDraw、1capture，41func/2groups。
A仍guide/--check收尾writer；等待A STOP后centralcheck→infofmt/41mbti审→full4target。
新注册预计21=2formal+B8+C11，未Moon行为验收；无Rootlive工具，不把sourcepass当Moonpass。

D42全体tracked STOP，Root已全文读A459line gen/4951line WB主要投影与157lineguide，B/C
新hands与生产均已审。firstcheck80513 terminal0：76tasks/7旧Refwarnings/0errors；Root
独立source84375 terminal0，56records/41func/2groups/JSON e71b2a...40252保持。info10tasks
及fmt17tasks terminal0，diffcheck0。Root全文审41mbti对D42-before仅3files/预期变化：
Scene rawlocation只读字段收私有（getter保留）、Position(Double)、独立Alignment及4methods；
顶层Alignment reexport；IR immutableDrawingContext+2optionalproviders/methods。已保存完整
D42-interface-reviewed.diff，其他38mbti逐字同。四目标firstfull已启动，log
D42-test-all-first.log，下一记录liveID/读具体终态；失败继续按原source诊断修复。新21registered
=2formal+B8+C11，未行为验收；B只ignored独审A投影，A/C全部STOP。
D42 firstfull live session3809（D42-test-all-first.log）；不可中央并发编译/写生产或fixtures。

D42 full3809仍live：wasm/wasm-gc各22022/22022、JS22029/22029均0fail，native待终态。
Root全文读B84line正式独审，未发现新source/projection缺陷；source-only7与incomingframe
边界、41func唯一调用均复核。README/DEPENDENCIES/NOTICE已补实现/source边界，尚未宣称
四目标验收。A/C只ignored只读D43候选locationAffine参数：原nonseparable directAffine
失败发生rawlocation更新后、oldlocator保留，需区分rawmetadata和installedlocator快照；
不是D42已冻结范围内缺陷。D43未freeze/未实施，先读3809终态，最终静态/source与commit。

## D42 行为验收通过（提交前最终门禁）

- [x] firstfull3809 terminal0：wasm/wasm-gc/native各22022/22022，JS22029/22029，0fail。
- [x] 新21registered=2formal（41private场景）+B8Scenehands+C11Scene/backendhands；
  56source profile records=43参数（36typed/7source-only）+10geometry+2fullBaseDraw+1capture。
- [x] Root原43+C10+C2+B1 complete records exactequal、B84line正式独审无新具体缺陷；
  source --check0/JSON e71b2a...40252保持，旧Scalar/Eng/lifecycle --check0且JSON不变。
- [x] Root全文审生产/新hands/157lineguide，预期3mbti变化全文审/其余38逐字同；
  README/COMPAT/PLAN/PROGRESS/DEPENDENCIES/NOTICE/newguide已补能力、验收与边界。
- [x] 最终info4/fmt1/check24全部terminal0（7旧Refwarnings/0errors）；source74829
  terminal0/原JSON e71b2a...40252保持；41mbti finaldiff逐字同reviewedinterface，diffcheck0。
- [x] 分批本地提交48d1c3c（生产/19hands/旧getter适配21files）与b8ee64a（formal/source/
  guide/6docs，10files）；本checkpoint另commit。整体goal未完成，无remote/push。

A/C仅ignored D43候选read-only，C187line设计已STOP待Root读，A实际矩阵收尾；D43未freeze。
全部tracked writer停，未再改production/fixtures，不重D42 full。

D42已完整验收并提交48d1c3c+b8ee64a，Root无live工具/全部tracked STOP。full3809四目标
各22022（JS22029）全部通过；final info4/fmt1/check24/source74829全0，7旧warn0error，
接口final逐字同，旧JSON保持。下一本checkpointcommit后保存D43-before，读C187line设计与
A34条actualTransform最终notes后一次freeze；当前只有ignored只读资料，D43无tracked实施。
Affine-only桥拟复用现Affine2D且不宣称mutable/nativeWrapper/Generic图；原nonsep失败后
metadata新/oldlocator旧、defaultNoneclear、lazy mutabletransform证据必须明示，不误推广
D42eager候选为任意liveTransform协议。无用户阻塞，继续整体goal，不重D42测试。
