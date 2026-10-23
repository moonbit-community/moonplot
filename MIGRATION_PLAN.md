# MoonBit mathplotlib 迁移计划

执行入口：[MIGRATION_STATUS.md](MIGRATION_STATUS.md)。其中记录当前切片、逐项待办、
已验证结果和恢复后的下一条动作；上下文压缩后从该文件继续，按需查阅本计划。

最近完成的纵向切片：L03–L08 的 Axes 位置读写、移除/选择、numeric aspect、
anchor、adjustable=datalim 和 box_aspect 完整组合；四目标各 825/825 测试通过。
D01–D20 的 TZif/IANA、缓存迭代、时长/数值序列、自定义日期 epoch、日期格式器/定位器、typed 日期 converter、C locale 格式、通用 datestr2num、默认 timezone 与 typed RelativeDelta 构造/应用/normalized/差值/对象运算、公开typed rrulewrapper/named RRuleLocator（含mutable adapter与DST接线）、AutoDateLocator recurrence复用wrapper及负DST fromutc语义、命名YearLocator与自动年分支/host context、scalar月日/混合回退边界、其余六个命名日历/时间locator及同级clock selector构造相位检查、跨级clock masks检查式迭代/查询/计数及快照cache语义以及命名MicrosecondLocator、fractional interval/精确getter/NumPy mixed/date网格与Auto接线已验收与D20数值MultipleLocator、live主次adapter、共享浮点网格、view_limits/rc及axis/contour/shared/secondary/SVG可视过滤已验收（wasm/wasm-gc/native 各5346/5346，JS5353/5353）。D21已验收命名LinearLocator/IndexLocator/FixedLocator、共享可变signed/nested/0stride TickValues/preset view、固定Darwin NumPy FMA profile、真实data interval与共享最后绑定/删除重绑/secondary空数据以及checked axis/SVG错误链；四目标wasm/wasm-gc/native各6380项、JS6387项与八份source --check全部通过；原Grouper登记顺序、SubFigure行列分组隔离及原始log数据范围已接线，dataLim缓存窗口/relim仍待迁移。D22已验收命名MaxNLocator/AutoLocator、真实Float64/Int64 steps view与经典默认整数profile/partial更新、完整nticks/prune/view端点以及固定SVG dpi72实际plot长度/字号provider；真实Int64写入/环绕diff与末乘、Fixed精确phase已补齐；四目标wasm/wasm-gc/native各7250项、JS7257项及九份source --check通过。D23已验收命名AutoMinorLocator/NullLocator，首次rc/四provider所有权、Int64 unique/diff与任意精度phase/arange dtype、raw/变换后overlap、secondary minor及Null独立skip；四目标wasm/wasm-gc/native各7707项、JS7714项及三份新source --check全通过。D24已验收命名LogLocator参数、完整dtype网格、局部/共享minpos、Axis/secondary/contour/SVG与checked自动范围；新整数pow/decade ln采用跨目标正确舍入数学合同，显式记录Darwin非正确round差异；四目标wasm/wasm-gc/native各9575项、JS9582项与五份source --check通过，见[LogLocator说明](testdata/log_locator_README.md)。D25已验收命名SymmetricalLogLocator、原Float64 arange全负段反转、Int64 subs别名/晚转换、raw overlap与shared/secondary接线；修正源SymLog数值顺序、secondary function显示映射与Inf reference去重，四目标wasm/wasm-gc/native各10055项、JS10062项及三份新source --check通过，见[SymLog说明](testdata/symlog_locator_README.md)。D26已验收命名AsinhLocator与最小Asinh几何，新增1061tests，wasm/wasm-gc/native各11116项、JS11123项与四新source --check通过；采用portable正确舍入数学profile与原平台双值证据，完整shape去重/fallback后才取前缀，raw请求与arange实际shape区分；完整AsinhScale默认安装仍待后续。D27已验收命名LogitLocator与最小Logit几何，新增879tests，wasm/wasm-gc/native各11995项、JS12002项与三source检查全过；仅MaxN scale_range两处十进制幂复用portable正确round修复nonJS一ULP起点误差，其余数值顺序保持；复用MaxN privatecontext helpers并保持源projection与重复space顺序，raw重复/underflow0不去重；完整tight/default生命周期及域外clip路径仍单独待迁移。D28已验收命名基础Formatter对象/批量调用与checked主次/secondary接线，新增352tests，wasm/wasm-gc/native各12347项、JS12354项与三source检查全过，保留真实view alias、动态Array、带位置回调与精确错误传播；完整Text缓存、动态Python子类与隐式默认重置仍在后续。D29已验收命名FormatStrFormatter/StrMethodFormatter及源字符串/整数/浮点格式、原阶段错误、完整batch dtype、精确Int64与主次/secondary/SVG接线；新增5161tests，wasm/wasm-gc/native各17508项、JS17515项与六份新source --check通过。原便利helper和typed动态Python/C locale边界保留，详见[字符串Formatter](testdata/string_formatter_README.md)。D30已验收命名PercentFormatter、raw参数与晚precision转换、Python/NumPy标量与整数view、动态text.usetex/Unicode minus，以及真实primary/shared/secondary ownview和默认childdraw顺序；新增2293tests，wasm/wasm-gc/native各19801项、JS19808项及三份新source检查全过，详见[百分比Formatter](testdata/percent_formatter_README.md)。默认数值Axis/units/scale/clear的隐式定位器生命周期仍待迁移。具体边界见执行检查点、[命名数值定位器](testdata/named_numeric_locator_README.md)、[MaxN/Auto说明](testdata/maxn_locator_README.md)与[AutoMinor/Null说明](testdata/auto_minor_locator_README.md)。

D31已验收命名ScalarFormatter：原始标量/借用参数与rc捕获、checked分阶段准备、完整数组与NumPy数值顺序、locale原多阶段格式、真实primary/shared/secondary像素短格式与lateoffset均已接线；1685新增注册测试承载5706细分验证案例，wasm/wasm-gc/native各21486项、JS21493项及五份新原源检查全过。测试矩阵分组保全部case/断言，避免Wasm driver initlocals上限；旧pure便利接口不变。可移植数学/affine profile与明确宿主边界见[ScalarFormatter说明](testdata/scalar_formatter_README.md)。D32命名EngFormatter也已验收：live Scalar继承、动态前缀表与numeric hash/probe、分阶段工程阶数/精度/offset、真实Axis/shared/secondary接线；62新增注册测试承载1740案例，另含6200步字典操作，wasm/wasm-gc/native各21548项、JS21555项及五份新原源检查全过。数值与NaN hash宿主profile见[EngFormatter说明](testdata/eng_formatter_README.md)。D33命名LogFormatter四类家族已验收：raw参数/默认immutabletuple、完整逻辑arange/geomspace子标签、live父类视图/copy、独立call/data/short与真实Axis transform.linthresh接线；152新增注册测试承载4557案例，wasm/wasm-gc/native各21700项、JS21707项及四份新source检查全过。数学profile/文本底数与宿主边界见[LogFormatter家族说明](testdata/log_formatter_README.md)。D34命名LogitFormatter已验收：raw参数/dtype快照/浅复制共享标签集、scalar身份、CPython排序与集合协议、NumPy Object排序及真实Axis生命周期；123新增注册测试承载3779案例，四目标累计验证和六新源检查通过。完整运行后仅修两份fixture构造，相关13项四目标补验全过，原source输出不改。详见[LogitFormatter说明](testdata/logit_formatter_README.md)。D35已验收五种typed几何的显式默认scale安装、共享ticker holder/四flags、repeat/rc与实际组owner顺序；主体新增14注册测试承载361案例，首次full四目标同6旧fixture/契约失败，相关61项四目标补验全过，累计nonJS21838/JS21845全覆盖。源及接口证据见[默认安装说明](testdata/scale_defaults_README.md)。D36构造/clear生命周期已验收：方向构造、共享holder原位重装、真实group/target/rejoin、checked晚错误与viewprovider拆分；新增15注册测试承载466案例，首full四目标同1旧minor getter假设失败，经原source确认后单文件四目标6/6补验通过，累计nonJS21853/JS21860全覆盖，见[构造与清理](testdata/initial_clear_README.md)。D37已验收numeric autoscale_view独立状态/checked共享范围链、缓存dataLim/relim与源错误阶段，39新增注册测试（56完整原源案例加37定向测试），四目标nonJS21892/JS21899全量通过，详见[testdata/autoscale_README.md](testdata/autoscale_README.md)；D38已验收内建Date/Category单位、四槽独立安装与同一状态链（42新增注册测试、90原源案例/39定向测试，nonJS21934/JS21941完整通过），见[testdata/units_lifecycle_README.md](testdata/units_lifecycle_README.md)；D39已验收Line原始输入与类别unit重排回算（18新增注册测试、19受控原源案例和17定向回归；nonJS21952/JS21959四目标全过），见[testdata/line_units_README.md](testdata/line_units_README.md)。下一D40推进secondary实际默认刻度、独立storedview与parent-scale生命周期；任意registry与公开可变Line句柄仍后续，整体目标未完成。

状态：执行中（2026-10-23）

2026-10-23 D33后重新盘点：v3.11.2 全目标工程估计 **约 50%（40%–60% 区间）**，静态二维/SVG 核心在原工程模型中约 **55%–70%**（亦非已测覆盖率）。旧46%/80%没有持续重估，已撤回。当前权重、成熟度区间、可核实交付与缺项详见[MIGRATION_PROGRESS.md](MIGRATION_PROGRESS.md)。这是透明的工程判断，尚非逐API覆盖率；不从测试数量、代码行数或执行时间换算百分比。

这份计划的目标是控制迁移粒度，让每一个阶段都有清晰的职责、公开 API 和验收条件。当前仓库里的 SVG 绘图代码是一个可运行的原型，不代表最终 API 已经冻结。

## 1. 范围和前提

这里的 `mathplotlib` 按 Python `matplotlib` v3.11.2 的完整公开能力推进：数据、坐标轴、图元、布局、静态/交互后端和生态适配都在目标范围内，但按平台和依赖拆成独立交付物。完整能力的上游盘点见 [UPSTREAM_SURVEY.md](UPSTREAM_SURVEY.md)。

在开始第二阶段前，需要锁定以下信息：

1. 上游基线已固定为 `matplotlib/matplotlib@v3.11.2`。
2. 第一批兼容 API 从 `plot`、`scatter`、`bar`、`title`、`xlabel`、`ylabel`、`savefig` 开始，之后覆盖全部公开 API。
3. 首个目标后端选择可在 Wasm 和 native 上工作的 SVG；其他后端仍属于完整目标，按平台单独交付。
4. 默认先要求数据语义、布局约束和后端结构一致，再为关键输出增加像素级或图像金标准比较。

完整目标不是把 Python 源码逐文件翻译，而是覆盖固定版本的公开 API、语义、测试和后端矩阵。上游版本已锁定后，新增 API 必须进入能力清单并绑定验收测试。

## 2. 粒度规则

迁移按“一个概念、一个包、一个可验证结果”推进。

- 一个包只负责一个稳定概念。公共数据类型放在公共包；扫描器、布局算法和编码器放在 `internal/` 包。
- 一个文件只组织一个责任域，例如 `bounds.mbt`、`series.mbt`、`svg_path.mbt`。不继续扩大单一的总文件。
- 每增加一个公共函数，必须同时增加文档示例、黑盒测试和对应的 `.mbti` 变更检查。
- 优先合理复用已有实现。上层 API 不嵌入后端标签、编码和状态，绘图 API 仍以场景或图元为主要数据边界。`Figure::to_svg` 已通过 `internal/render` IR 调用已有 `backend/svg`，这一便利入口应保留；直接 import 默认后端本身不构成架构缺陷。
- 是否抽取后端选择协议，由实际扩展需求决定。第二个后端需要共享调度、平台依赖需要隔离或出现具体依赖冲突时，再做最小必要调整；不为假想风险重复实现已有能力，也不把抽象层数量计作迁移进度。
- 没有稳定语义的功能先放在内部模块，不通过根包导出。
- 每个阶段只解决一个纵向切片；阶段未通过验收前，不扩展新的图表类型。

## 3. 目标分层

计划中的目录边界如下。目录会在对应阶段开始时创建，不提前堆空包。

```text
mathplotlib/
  core/                 # 稳定的公共数据模型和基础数值语义
  scene/                # Figure、Axes、Artist 和布局结果
  backend/svg/          # SVG 编码器；消费 internal/render IR
  pyplot/               # 面向用户的状态式便利 API
  internal/             # 刻度、文本测量、路径和验证等实现细节
  cmd/main/             # 可运行示例和手工验证入口
```

`core`、`scene` 和 `backend/svg` 是第一阶段的主边界。`pyplot` 等到对象式 API 稳定后再增加，避免同时维护两套不成熟的接口。

## 4. 分阶段路线

### 阶段 0：锁定上游和兼容范围（已完成基线锁定）

**交付物**

- 在本文件和 [UPSTREAM_SURVEY.md](UPSTREAM_SURVEY.md) 中记录上游 URL、版本和许可证。
- 建立 `compatibility.md`，列出支持、暂不支持和明确不支持的 API。
- 为每个要兼容的 API 写一个最小输入/输出例子。

**验收**

- 任何人都能根据文档判断一个 API 是否在当前范围内。
- 上游基线可由 commit `d3ca9172e392048ec242b90e8423e88d1a3000b2` 重现。
- 没有“先实现再决定语义”的公共函数。

**不做**

- 不增加新的图表类型。
- 不承诺完整 matplotlib 兼容。

### 阶段 1：公共数据模型和数值语义（进行中）

**目标**：把数据表示从渲染代码中独立出来。

**计划包**：`core`。当前仓库已经创建第一版 `core` 包，但其公开语义仍需按上游签名和测试补全。

**交付物**

- `Point`、`Series`、`Bounds`、颜色和线型等最小值对象；`core/colors` 已提供第一版 RGBA 解析。
- `Limits` 作为保留方向的单轴范围值对象。
- 数据长度、空数据、非有限浮点数和显式范围的规则。
- 不依赖 SVG 或文件系统的纯函数。

**验收**

- 单元测试覆盖空数据、单点、常量范围、负值和不等长输入。
- `moon check --target all` 和 `moon test` 通过。
- `.mbti` 只暴露已决定的公共类型。

**不做**

- 不做坐标轴、刻度、布局或颜色主题。
- 不在 `core` 中引入 SVG 字符串。

### 阶段 2：对象式绘图场景

**目标**：建立与后端无关的 Figure/Axes/Artist 模型。

**计划包**：`scene`（已建立第一版边界）。

**交付物**

- `Figure` 和独立 `Axes` 面板的生命周期。
- `LineArtist`、`ScatterArtist`、`BarArtist` 三种图元。
- 图元顺序、显式范围和自动范围的确定性规则。

当前版本已经提供默认 Axes、独立多 Axes 面板、规则 `subplots`、带共享轴约束的
`GridSpec`/`subplots_with_grid`、跨行/列的 `SubplotSpec`，以及一个可渲染的
`SubFigure` 纵向切片。SubFigure 通过父 GridSpec 的跨度计算自己的矩形，支持嵌套
`subplots`、标题、清理和从 Figure 重新取得后仍共享 Axes 状态；完整约束布局仍按后续切片实现。

**验收**

- 相同输入生成稳定、可比较的场景结构。
- 图元不包含 SVG 标签或后端状态。
- 每种图元至少有一个黑盒行为测试和一个边界测试。

**不做**

- 不在本阶段增加 3D、动画或交互；SubFigure 的后续约束布局能力单独推进。
- 不实现状态式 `pyplot` 函数。

### 阶段 3：SVG 后端

**目标**：将场景稳定编码为 SVG。

**计划包**：`backend/svg`（已建立第一版边界），文本测量和路径转义放在 `internal`。

**交付物**

- 视口、坐标映射、网格和坐标轴边框。
- 折线、散点和柱状图的 SVG 编码。
- 文本和颜色的 XML 转义。
- 结构化 SVG 测试夹具；必要时再增加快照测试。

**验收**

- 输出包含正确的 `viewBox`、图元数量和颜色。
- 特殊字符不会破坏 XML。
- Wasm 和 native 目标都能生成同一语义的 SVG。

**不做**

- 不在这一阶段支持独立 PNG/PDF 输出、GUI 或字体文件打包；`imshow(interpolation="none")` 所需的内部 PNG 嵌入属于 SVG 图像编码切片。
- 不以像素级复刻 Python 后端为验收条件。

### 阶段 4：最小 pyplot 兼容层（第一版已建立）

**目标**：在对象式 API 稳定后提供小范围的便利函数。

**计划包**：`pyplot`（已建立状态容器和第一批便利函数）。

**首批 API**

```text
figure, plot, scatter, bar, title, xlabel, ylabel, xlim, ylim, savefig
```

当前实现提供 `render_svg`/`savefig_svg` 和 `savefig` 的 SVG 字符串出口；真正写文件的
文件系统 `savefig` 会在文件系统后端和目标平台策略确定后加入。对象式 API 已补齐一组
常用 Matplotlib 命名别名，并保持共享轴和嵌套网格语义一致。

**交付物**

- 明确的当前 figure/axes 生命周期。
- `pyplot.grid`、`pyplot.cla` 和对象式 `Figure::clear`/`Axes::clear` 已加入，清空操作保留图形尺寸与子图位置并重置轴、图例、颜色条和图元状态。
- 每个便利函数到 `scene` 的一一映射。
- 对状态污染、重复调用和空 figure 的测试。

**验收**

- 便利 API 不复制绘图逻辑，只组装场景对象。
- 对象式 API 和 pyplot API 对同一输入产生等价场景。
- 公开 API 文档和兼容性列表同步更新。

**不做**

- 不一次性导入 matplotlib 的全部 pyplot 名称。
- 不把全局状态扩散到 `core` 或 SVG 后端。

### 阶段 5：刻度、标签和图例（线性/类别刻度第一版已建立）

**目标**：增加可读性所需的布局能力。

**交付物**

- 确定性的线性刻度生成器（已在 `ticker` 包提供）。
- `ticker/scale` 已提供线性和基础十进制对数变换、逆变换、有效值检查与主刻度生成；`scene/axis` 拒绝对数轴上的非正范围和固定刻度。
- `ticker/date` 已支持 `datestr2num`/`datestrs2num` 与 typed `DateStringParser`/可注入 `DateParserContext`，固定默认dateutil语法、Unicode词法、28位Decimal时间、default填充/月末/weekday/fold、本地TZif/POSIX/采样或显式descriptor、typed未知时区诊断、NumPy首probe/mixed-aware/epoch锁定顺序及scene/pyplot链路；String/flat-array类型边界与宿主能力限制保留，未迁移动态/多维/掩码容器；已支持标准 strftime 的固定 C locale 指令（12h/AMPM、年日、Sunday/Monday week、ISO weekyear/weekday/week、c/x/X），复用本地 Gregorian 日历并以完整400年周期及原formatter逐值参考验证；任意系统locale/OS扩展和flags仍待接入；已支持 typed `DateConverter`/`ConciseDateConverter`、复制隔离的 `DateAxisInfo`、首个日期单位推断与 scalar/flat-array 转换、`date.converter` auto/concise 配置；默认轴首次捕获，shared/scene/pyplot/SVG 与空 plot_date 已接线，保留固定上游 concise 构造的 multiples 覆盖行为；已有 DateTime 无 naive 标记，通用动态 units registry/NumPy masked 数组仍待迁移；已支持命名 `AutoDateFormatter` 的 locator 基础单位、排序 scaled 字符串/typed callable/默认回退与 rc 快照；新日期轴默认使用该格式器，主/次及数值 locator 更换后自动重绑定，日期次刻度标签/去重/可见性/共享轴/scene/pyplot/SVG 已接线；已支持完整 `AutoDateLocator` 对象的七级频率、minticks/maxticks/interval 表、日历选择与 phase、multiples 对齐、typed 诊断、动态单位和 nonsingular；默认日期轴及显式主/次 locator、scene/pyplot/SVG 已接线，旧范围 helper 保留兼容；已支持 `ConciseDateFormatter` 六级批量标签、zero/custom formats、共同小数尾零修剪、show_offset、倒置轴共享日期、scalar/cursor labels 与TeX字符串输出；普通/concise日期formatter可挂载x/y轴并通过shared axes、scene/pyplot和SVG共享offset文本接线，SVG通用TeX排版仍未接入；已支持 `get_epoch`/`set_epoch`、`config.date_epoch` fallback 与首次读取/转换锁定；ISO 原点支持年0、负年、时分秒与微秒，数值转换/时区/recurrence/locator/scene/pyplot/SVG 全链接入，自定义原点下保留相对精度修正与上游微秒原点不对称；已支持 `TimeDelta` 全范围规范化整数时长、标量/数组 `num2timedelta(s)`、`DateTime.add_timedelta`、保留规则时区的微秒级墙钟算术，以及按上游端点/linspace 算法的 `drange`（含 DST/负步长/浮点边界）；已提供 UTC Gregorian 与固定 UTC offset 日期值、微秒精度、Matplotlib 日序转换、ISO 时区后缀/小数秒解析、`%f`/`%z`/`%Z` 日期格式化、`DateFormatter::with_offset` 和按小时/日/月/年/微秒粒度对齐的自动日期刻度；显式日/年/月/星期/时/分/秒/微秒定位器、每月第 N 个星期几定位器和 SVG 日期标签 offset 已接入 `scene/axis`、`Axes`、`Figure`、`plot_date`，并支持复制隔离、排序去重的多值 selector、负月日、日历 recurrence 相位、interval 先步进后筛选、微秒 SVG 标签、首次 `plot_date` offset 初始化以及后续序列的 locator/format/fixed-tick 保留。`business_day_locator` 已补齐默认周一至周五、自定义 weekday mask、显式节假日日期、复制隔离、interval 和固定 offset，并通过 scene/pyplot/SVG 测试。新增显式 transition 时区规则对象，支持 `DateTime`/formatter 转换以及 scene、pyplot、SVG 日期标签在 transition 前后的动态 offset；显式日历/时间 locator 已按本地候选映射 UTC，spring gap 会跳过，fall fold 保留两个 instant。`rrule_locator` 已覆盖 Yearly/Monthly/Weekly/Daily/Hourly/Minutely/Secondly、`wkst`、多值 selector、负月日、`byyearday`、`byweekno`、`byeaster`、`bysetpos`、带 `dtstart` 的 `count`/`until` 动态边界、跨年周号和首个 weekly period 的 DTSTART 语义，并以 100000 tick 上限和无匹配端点回退保持可预测输出。显式 transition 表已接入 recurrence，spring gap 会跳过，fall fold 会保留两个 UTC instant；已支持调用方 TZif v2/v3 数据（历史秒级偏移、缩写、POSIX footer 未来规则及完整日期/SVG/recurrence 接线）；独立 `ticker/date/tzdb` 已捆绑 IANA 2026e 的 598 个标准 Zone/Link 名称与兼容别名，返回现有 DateTimeZone；完整商业日历规则和完整 `dateutil.rrule` 对象语义仍待迁移。
- `ticker/category` 已提供按首次出现顺序的字符串类别转换、重复类别复用位置和空字符串类别保留语义。
- `scene/axis` 已持有范围、标签、tick 数量、类别位置和类别标签；SVG 复用同一刻度绘制链路。
- `scene/axis` 与 `pyplot.grid` 已支持 major grid 的默认关闭语义、`both`/`x`/`y` 轴选择、颜色和线宽，并由 SVG 后端消费同一配置。
- `Axes::set_axis_off`/`set_axis_on` 和 `pyplot.axis` 已接入 SVG；`off` 隐藏边框、刻度、标签、网格和次坐标轴，同时保留图元。
- `Figure`/`Axes` 和 `pyplot` 已支持 Matplotlib tab10 属性颜色循环；显式颜色覆盖循环但不消耗下一项，`set_color_cycle`/`set_prop_cycle` 会校验空数组和空颜色。
- `Axes::set_margins`、`set_x_margin`、`set_y_margin` 及对应 pyplot 入口已接入自动范围；线性轴按数据跨度扩展，日志轴按对数跨度扩展，显式范围仍优先。
- `Axes::autoscale`、`Axes::autoscale_view` 和 `pyplot.autoscale` 已能按轴清除显式范围；`axis("tight")` 使用零边距重新计算视图，`axis("auto")` 同时恢复自动范围和自动 aspect。
- 新增 `config` 包作为 rcParams 的稳定子集：全局 tab10 颜色循环、x/y 自动范围边距和新 Axis 的 major grid 默认值都可读取、替换和 reset；完整主题、字体和其余 rcParams 仍单独迁移。
- `scene/legend` 已支持绘图函数的 `label`、首次出现去重、显式图例覆盖和清除后恢复自动条目。
- `core/colors` 已提供线性 `Normalize`、对数 `LogNorm`、对称对数 `SymLogNorm`、双斜率 `TwoSlopeNorm`、幂律 `PowerNorm`、中心对称 `CenteredNorm` 和统一的 `ColorNorm`，`imshow`、规则网格与 colorbar 可显式传入规范化对象。
- `core` 已提供 `MaskedArray`/`MaskedMatrix` 和 `MaskError`；构造时复制值与掩码并校验形状，映射操作保留掩码并屏蔽无效结果。
- `scene/colorbar` 已提供独立的 colorbar 数据模型；Figure 和 pyplot 可创建竖直/水平 colorbar，SVG 后端绘制渐变、刻度和标签。
- `Figure::pie`、`Axes::pie` 和 `pyplot::pie` 已完成第一版；数据校验、扇区比例、SVG 路径和标签均在独立图元链路中实现。
- `hlines`、`vlines`、`axhspan` 和 `axvspan` 已完成第一版；线段使用现有折线图元，span 使用独立矩形图元和 SVG 填充编码。
- `scene/boxplot` 已完成第一版；统计包计算分位数、IQR 须线和离群点，SVG 后端绘制竖直/水平箱线图。
- `quiver` 已完成第一版；向量输入、自动范围、箭头头部和 SVG 绘制分别位于 scene 与 backend 层。

**验收**

- 给定范围和尺寸时刻度结果稳定。
- 小范围、负范围和跨零范围有测试。
- 文本布局算法与 SVG 编码器保持分离。

**不做**

- 不在没有文本测量策略前承诺复杂字体排版。
- 不加入自动主题系统。

### 阶段 6：扩展图表类型（基础图元第一批已建立）

按需求逐个增加：面积图、阶梯图、误差线、直方图、饼图等。当前已完成面积、水平条形、误差线、直方图、二维标量图、水平/垂直参考线和数据文本的第一批切片。每一种类型都必须经过“数据模型 → 场景图元 → SVG 编码 → 测试夹具”四步，不能直接把渲染分支塞进现有 `svg.mbt`。

### 阶段 7：其他后端和发布

只有 SVG 语义稳定后，才评估 PNG、PDF、Canvas 或 GUI 后端。后端通过统一的场景接口接入；若需要 C/C++ 库，再单独建立 FFI 包和 ASan 验证，不把原生依赖引入核心包。

## 5. 当前仓库对应关系

当前代码可以作为阶段 1 到阶段 3 的原型，但尚未完成正式分包：

| 当前文件 | 计划归属 | 处理方式 |
| --- | --- | --- |
| `types.mbt` | `core` / `scene` | 数据值对象在 `core`，Figure/Artist 已移到 `scene` |
| `plot.mbt` | `scene` | 输入适配已移到 `scene`，根包保留 `plot_svg` 门面 |
| `scale.mbt` | `backend/svg` | 坐标范围和映射已成为后端私有实现 |
| `svg.mbt` | `backend/svg` | XML 编码已拆到 `backend/svg`，根包只保留门面 |
| `mathplotlib_test.mbt` | 各自包的黑盒测试 | 随分包移动，不复制测试 |

当前的 SVG 编码已迁到 `backend/svg`，后续图表类型继续按场景图元和后端编码分层增加。

## 6. 验证和提交规则

每个阶段结束时执行：

```text
moon info
moon fmt
moon check --target all
moon test
```

提交应围绕一个阶段或一个纵向切片组织。一个提交同时改变公共 API、布局算法和后端输出时，需要拆分，除非它们属于同一个不可分割的功能。

测试分三层：

1. `core` 的纯函数和边界测试。
2. `scene` 的结构和行为测试。
3. `backend/svg` 的 SVG 结构测试和少量快照测试。

快照只记录稳定、可读的输出；数值边界优先使用 `assert_eq` 或模式断言。任何快照更新都必须在提交说明中说明原因。

## 7. 当前下一步

三角网格拓扑切片已完成，后续继续推进布局和对象语义的深化：

本轮补齐了 `acorr`/`xcorr` 的可调用 `detrend` 参数，并提供
`detrend_none`/`detrend_mean`/`detrend_linear`；scene 与 pyplot 入口共享样本复制、长度校验和有限值校验。
置信区间、复数数值和 masked array 输入仍待迁移。

1. 为 `GridSpec` 增加更完整的共享轴约束和布局结果消费；当前已支持 `none`、`all`、`row`、`column` 四种共享模式、宽高比例、可动态更新的 `hspace`/`vspace`、SVG 外侧主刻度标签布局和旧句柄隔离；跨行/列、嵌套 `SubplotSpec`、负行主序索引、父比例更新传播和按共享轴传播的 autoscale margins 已完成第一版。
2. 已补齐 `matplotlib.dates.__all__` 的 `num2timedelta`/`drange`；已接入自定义 epoch，继续更完整格式化与转换等公开入口；节假日规则对象为附加扩展，随后评估。继续补齐 `BYMONTH`/`BYWEEKNO` 等组合的完整 `dateutil.rrule` 对象语义以及更细粒度单位转换细节；当前已完成 `business_day_locator` 的默认工作日、自定义 weekday mask、显式节假日日期、复制隔离、interval 和固定 offset 第一版，并补有 locator → scene/pyplot → SVG 测试。新增显式 transition 时区规则对象，已覆盖 `DateTime` 转换、formatter 以及 scene/pyplot/SVG 标签的 transition 前后 offset 变化；显式日历/时间 locator 和 recurrence 已覆盖 spring gap 跳过和 fall fold 双 instant。当前 `rrule_locator` 已完成七种频率、`wkst`、`byyearday`、`byweekno`、`byeaster`、`bysetpos`、跨年和首周期测试，并补齐带 `dtstart` 的 `count`/`until` 动态边界（次数包含可视范围之前的 occurrence，`until` 包含截止时刻）。新增带明确 `dtstart` 的 `RRule` 对象及 `locator`、`between`、`after`、`before`、`xafter`、`all` 查询、固定 offset/transition timezone 复制和保留未指定字段的 `replace`；新增 `RRuleSet` 组合多个规则和显式日期，复用 `RRule` 查询实现包含/排除、UTC 顺序合并、去重以及对象查询。RRule/RRuleSet 可选缓存和原生 lazy iter/iter_after 已接入，派生/失效/交错读取已覆盖；更完整商业日历及其他日期对象语义仍待迁移；已提供独立 `ticker/date/tzdb` IANA 2026e 名称/别名数据库（598 名称），并接入 TZif v2/v3 字节加载、秒级偏移、缩写与 POSIX footer 未来规则。微秒精度和微秒定位器、固定 UTC offset、每月第 N 个星期几定位器、颜色规范化、`BoundaryNorm`/`ListedColormap`、colorbar 以及含多值 selector 的显式日期定位第一版已完成。
3. 继续按“数据模型 → 场景图元 → SVG 编码 → 测试夹具”扩展离散色阶、更完整的日期定位和三角网格高级选项；等值线 `contour`/`contourf`/`clabel`、显式三角网格 `triplot`/`tripcolor`/`tricontour`/`tricontourf`、数据坐标 `annotate`/`arrow`、规则网格 `pcolor`/`pcolormesh`、基础 `barbs`/`streamplot`、`acorr`/`xcorr`/`ecdf`/`hexbin`/`spy`、饼图、基础参考线/跨度、`axline`、箱线图、quiver、violinplot、`matshow`、`step`/`stairs`/`fill_betweenx`/`stem`/`eventplot` 和 `secondary_xaxis`/`secondary_yaxis` 第一版已完成。`pcolor`/`pcolormesh` 现支持显式 `ColorNorm`/`ColorMap`、BoundaryNorm 的 under/over 和 bad 色，阶梯与离散事件图元已拆到独立 `scene/step.mbt` 与 `scene/discrete.mbt`。`streamplot` 已补齐 1D 与 meshgrid 风格二维坐标、严格等间距网格、独立 density 轴、30×30 density 边界优先起点/占据网格、显式起点、积分方向、最小/最大归一化弧长、积分时断裂轨迹占据、按弧长箭头、自适应一阶/二阶 Heun 积分、网格颜色/线宽、显示空间箭头、常用 FancyArrowPatch 样式与 `StreamplotSet` 返回对象；pyplot 样式网格支持 `vmin`/`vmax`。`BoundaryNorm` 已按离散整数索引、颜色数拉伸、clip/under/over 和 extend bin 语义实现，并让 colorbar 使用边界刻度和 extension 三角形；颜色图已支持 under/over/bad 配置，已完成掩码数组的基础传播切片；统计 API 的掩码输入仍按各自语义接入。`secondary_xaxis`/`secondary_yaxis` 当前支持前向/逆向函数、固定刻度、独立 locator/formatter、标签、位置校验、可配置自动 tick 数和 SVG 顶部/右侧（或显式底部/左侧）轴；复杂变换布局和 `transform` 参数仍待迁移。`axline` 当前支持两点或点加斜率、有限值校验、线性坐标范围裁剪和对数坐标下两点形式的显示空间裁剪；`transform` 参数和返回的 Line2D/AxLine 对象仍待迁移。`matshow` 当前使用半整数图像边界、零基整数刻度、顶部/两侧 x 刻度、反向 y 轴和等比例数据区域，并复用 `imshow` 的色阶与 SVG 图元；复杂 `fignum` 生命周期和完整图像 aspect/origin 语义仍待迁移；`matshow` 已转发全部 Matplotlib `interpolation` 名称；`none` 使用原始分辨率 PNG，其他过滤器使用显示尺寸 PNG。当前等值线支持规则和三角网格、显式或自动 levels、缺失值/面 mask、线性坐标、SVG 多边形填充、`extend`、`corner_mask`、共享 crossing 路径拓扑和每个 level 的代表性文本标签；`clabel(inline=true)` 会在多点 polyline 的代表性线段处留出文字间隙。`triplot`/`tripcolor`/`tricontour`/`tricontourf` 当前支持显式顶点索引或自动 Delaunay、三角邻接、face values、面 mask、共享路径拓扑和 SVG 线框/多边形；高级 locator 仍待迁移。`annotate` 当前支持数据坐标文本、相对偏移和可选箭头；复杂坐标变换、连接器和富文本仍待迁移。`pcolor`/`pcolormesh` 当前支持 1D 单调 cell boundaries、线性色阶、显式规范化、`antialiased` 边界控制和 SVG 多边形输出；`pcolor_grid`/`pcolormesh_grid` 已支持非规则二维坐标的 `flat`、`nearest`、`gouraud` 和 `auto` shading，Gouraud 通过带顶点颜色的三角形渐变编码；规则网格的 `antialiased` 边界控制已接入 SVG；`pcolor_grid_masked`/`pcolormesh_grid_masked` 已支持数据与二维坐标 mask 按单元传播。`barbs` 当前支持配对向量、杆线和基础风羽线段；旗标、半风羽和单位换算仍待迁移。`acorr`/`xcorr` 当前支持有限序列、lag 截断、归一化和 vline/line 输出；去趋势、复数数值、置信区间和高级返回对象仍待迁移。`ecdf` 当前支持有限样本、权重、complementary、horizontal 和 duplicate compression；无限值语义、masked array 和高级 step 样式仍待迁移。`hexbin` 当前支持规则六边形计数/均值、`gridsize`、mincnt、线性色阶和 SVG 多边形；对数轴、marginals、边缘颜色和可调用 reduce 函数仍待迁移。`spy` 当前支持规则二维有限矩阵、非零阈值和 SVG 散点输出；图像样式、marker 参数和稀疏矩阵适配仍待迁移。violinplot 当前支持 Gaussian KDE、Scott/Silverman/固定带宽、分位数、空序列统计、单侧绘制和水平布局。
本轮已补齐次坐标轴的独立 `ticker.Locator`/`ticker.Formatter`：locator 在次坐标值域生成刻度，SVG 后端通过逆变换放置刻度，并对非线性前向/逆向函数和 formatter 标签有回归测试；剩余次坐标轴工作集中在复杂布局与 `transform` 参数。

本轮还补齐了 `GridSpec::set_hspace`/`set_vspace`：间距更新写入共享布局状态，已创建的嵌套 `SubplotSpec` 会立即重新计算矩形，并覆盖非有限和负间距校验。

本轮新增 `Figure::subplots_adjust` 与 `pyplot.subplots_adjust`：bounds 使用 Figure
归一化坐标，`wspace`/`hspace` 会进入现有 GridSpec 几何计算链，已创建的 Axes 和
嵌套 SubplotSpec 会即时读取新矩形；未显式设置的 GridSpec 间距继承 Figure 值，显式
GridSpec 间距优先。调整参数校验失败时保持布局状态不变。该实现继续复用现有
`internal/render` → `backend/svg` 路径，不为单一后端便利入口预先增加抽象层。

本轮继续加入 `Figure::add_axes` 与 `pyplot.axes`：四个参数使用 Matplotlib 的
Figure 归一化左下角坐标，独立 Axes 直接复用现有 `Rect`、自动范围、图元和 SVG
渲染链；它不绑定 GridSpec，也不会被后续 `subplots_adjust` 移动。零尺寸和越界矩形
按上游语义保留，负尺寸或非有限值会原子地拒绝；无参 `pyplot.axes()` 复用 1×1
subplot，`pyplot.sca` 可跨 Figure 选择附着 Axes，失效句柄会被拒绝。

L03 增加 Axes 位置读写：`get_position(original=false)` 返回归一化左下角
坐标，`original=true` 返回分配位置；`set_position(left, bottom, width, height,
which=...)` 支持 both/original/active，`reset_position` 只恢复 active。
active 在读取或绘制时重新应用 auto/equal/numeric，复用 SVG 的共享范围、margin、图像
sticky edges 和几何计算；SVG 同时返回实际绘制矩形来同步场景状态。现有
`rect()` 保留原始显示像素契约。手动定位保留 SubplotSpec，下一次
`subplots_adjust` 恢复网格位置；独立 add_axes 保持定位。零尺寸和越界被接受，
负尺寸、非有限值与坐标溢出原子拒绝。归一化 getter 的 Option 形状保持兼容，
原有像素别名语义已修正；SubFigure 当前仍使用根 Figure 坐标，
locator、twins 和自动布局按后续切片推进。

L05 增加 numeric aspect：`Axes::set_aspect(Double, share=...)` 设置正有限 y/x
显示比例，按锚点缩小 active box、保留数据范围；`get_aspect` 的 None/Some 分别
映射 auto/数值，equal 为 Some(1)。共享传播使用直接 x/y siblings 的并集，
复用 SVG 的 transformed spans（含上游 1e-30 floor）、margin/图像范围与流线箭头
显示尺寸；原 auto/equal 入口继续可用。Figure 便利入口仍指向首/default Axes。

L06 增加 anchor：Named/Fraction 枚举映射 compass string/tuple，九方向和任意有限
坐标以原始框左下角为基准定位缩小后的活动框。Axes/Figure 提供 set/get_anchor，
set_aspect 可一并设置 anchor；share 同步直接共享组并集，验证失败原子保持比例和
锚点。clear 保留 anchor，auto 暂不缩小，因此只保存锚点；新 Axes 默认居中。
位置查询与 SVG 绘制使用相同位移，图像视口与叠加图元保持一致。

L07 增加 adjustable=datalim 的实际范围调整：复用 backend 原有数据范围、共享范围、
margin 和 scale 变换，按上游 0.5% 容差与数据边界启发式调整 x/y 视图；范围方向与
自动/显式选择保留。共享 x 只改 y，反之亦然；两轴共享在 setter 提前原子拒绝。
Axes.apply_aspect、get_position 和 checked SVG 同步范围，Figure.to_svg_checked 先
预解析所有 datalim 面板再写回；旧 to_svg 保留便利签名。流线箭头的 datalim 显示单位
使用已解析视图，pyplot.axis(equal) 使用 datalim。固定范围覆盖不提供 Python 日志警告。

L08 增加 box_aspect 的物理框高/宽比，使用 `aspect=` 设置、无参清除；设置时选择
datalim，清除/clear 保留既有策略。auto 数据比例只缩框，numeric datalim 先缩框再
调视图，numeric box 模式优先使用数据比例；anchor/共享/非线性视图与 SVG/PNG/流线
尺寸一致。共享限制按实际 numeric 数据调整判断，auto 物理框可两轴共享且不向
普通 sibling 传播设置；无效比例在 setter 原子拒绝，无效组合通过 checked API 报错。

本轮三角网格切片已补齐：`scene.triangulation` 和 `pyplot.triangulation` 支持显式面或确定性的自动 Delaunay，`Triangulation` 暴露复制隔离的顶点、面、唯一边、邻接、mask 和 `get_masked_triangles`；`triplot_triangulation`、`tripcolor_triangulation`、`tricontour_triangulation` 和 `tricontourf_triangulation` 复用同一网格。新增 `Triangulation::get_trifinder`/`pyplot.get_trifinder`，支持单点和批量坐标查询、共享边确定性归属、mask 跳过和 `-1` 外部哨兵；三角线 contour 已按共享交点拼接连续路径，三角 filled band 已通过内部边界消除生成外环/孔洞环，并拒绝非有限 z 值；完整 locator 参数仍待迁移。

本轮还补齐了等值线的拓扑切片：规则网格和三角网格的 crossing segment 会按容差合并为连续 polyline，闭合等值线保留首尾闭合点；`contourf`/`tricontourf` 会消除同一 band 的内部共享边，再输出外环和独立孔洞环，并把同一 band 的多个环编码成 SVG even-odd compound path。逐面 mask 或非有限角点会阻止跨越被屏蔽区域的连接，`clabel` 的 inline 间隙可作用于多点 polyline。更完整的 locator 参数仍待迁移。

本轮继续补齐了 `barbs_with_options`：half/full/flag 增量、rounding、flip、calm fill 和
tail/middle/tip pivot 现在在 scene 与 pyplot 共享同一套数据语义；原有基础 `barbs`
入口保持兼容，单位换算和完整 Collection 返回对象仍待迁移。

规则网格切片也新增了 `pcolor_grid`/`pcolormesh_grid`：二维曲线坐标支持 `flat`、
`nearest`、`gouraud` 和 `auto` shading。Gouraud 模式要求与数据同形状的顶点网格，
每个网格单元拆成两个带三色顶点渐变的三角形，并由 SVG 后端编码为
`linearGradient`；`pcolor_grid_masked`/`pcolormesh_grid_masked` 已让数据和二维坐标
mask 按单元传播，规则网格的 `antialiased` 边界控制也已接入 SVG。

`hexbin` 聚合切片已补齐：`reduce` 支持 `mean`、`sum`、`min`、`max` 和 `count`，并在
scene 与 pyplot 入口共享校验、计数和值聚合语义；六边形现在会根据当前线性、对数或对称
对数轴在变换坐标空间中分箱并反变换回 SVG 数据坐标，支持 `bins="log"` 的正值对数色阶、
`extent` 裁剪、`marginals` 边际计数柱和 `edgecolor`/`linewidth` 边缘样式。可调用 reduce
函数仍待迁移。

`spy` 样式切片已补齐：`markersize`、`origin="upper"/"lower"` 和常用 marker 形状在
scene 与 pyplot 入口共享校验和 SVG 编码；`aspect="equal"/"auto"` 现在会同步 Axes 的
等比例布局；插值和稀疏矩阵适配仍待迁移。

前面的纵向能力总览保留了切片开始时的基线描述；以本节后续记录为准，`hexbin` 已补齐
对数轴、`marginals`、边缘样式和内建聚合，并新增 `hexbin_reducer` 自定义聚合；`spy`
已补齐 `markersize`、`origin`、`aspect` 与常用 marker 形状；`annotate` 已支持 `fontsize` 传递到 SVG 文本样式；
annotation 坐标切片随后加入了 `axes fraction`、`figure fraction`、`offset points` 和
`straight`/`arc3`/`angle` 连接器，并通过独立 `Annotation` 图元接入 scene、internal
render、SVG 和 pyplot；随后又加入 SVG `display` 坐标和 `offset pixels`。复合 transform、
完整连接器参数对象和富文本仍待迁移。
`clabel(inline=true)` 已会在代表性线段处留出文字间隙；新增 `ticker.Locator` 的
linear/fixed/log levels 生成，并接入规则与三角 contour 的对象式和 pyplot 入口；LogLocator
已支持 `subs`/`numdecs`；基础 `Formatter` 变体（Scalar、Fixed、printf、Eng、Percent、Log、Null、
函数）已接入 `Axis`、`Axes`、`Figure`、pyplot 和 SVG。ScalarFormatter 已拆成数值舍入、布局、
标签和 offset 职责：同一 `ScalarLayout` 决定可见 tick 的 additive offset、科学倍率和精度，轴
viewport 会传入标签与 offset 计算；固定 power limit、NaN/无穷值、负值、`use_offset=false`
仍保留科学倍率，以及后端中立的 math text 乘号/上标表示均有测试。EngFormatter 覆盖工程
前缀、负指数和 999.9/999.9999/超出 Q 前缀范围的舍入边界；PercentFormatter 按 viewport
自动选择 0 到 5 位小数；printf 子集使用 BigInt 舍入处理负数、大数和科学格式；LogFormatter
默认输出数值标签，`label_only_base` 只隐藏非底数幂位置而保留底数幂的数值标签。完整 mathtext 排版、Log minor
自适应规则和更复杂的 formatter 组合仍待迁移。

本轮继续完成了 locator 纵向切片：`ticker.maxn_locator` 选择 1/2/2.5/5 的 nice step，
支持 integer、symmetric 和 prune；`auto_minor_locator`、`fixed_minor_locator` 与
`log_minor_locator` 生成次刻度。`Axis`、`Axes`、`Figure` 和 pyplot 已可配置 major/minor
locator，SVG 会按 minor locator 绘制次网格；对数次刻度的自适应规则和更复杂的 locator 参数
对象仍待迁移。`Locator`/`MinorLocator` 的固定值数组在写入和读取 `Axis` 时都会复制，避免
调用者修改外部数组或 getter 返回值而改变轴的内部状态；这一复制隔离行为已在轴测试中覆盖。

4. 每完成一层都运行 `moon info`、`moon fmt`、`moon check --target all`、`moon test`，并审查公开接口变化。

本轮已新增独立几何基础切片：`transforms` 包提供 `BBox` 的范围、相交、并集和仿射变换，`Path` 提供 Move/Line/Curve/Close 顶点模型、曲线点包含、包含二次/三次内部极值的包围盒以及矩形内外裁剪，`BezierSegment` 提供二次/三次求值、分割、采样和长度近似。随后补齐了 `Affine2D` 的旋转、错切、矩阵值读取、位移向量和链式构造，`BBox` 增加归一化包含、布局拆分、缩放到比例和旋转包围盒；新增 `Transform2D` 变换树，覆盖复合、BBox 映射、blended 和 scaled translation，并支持点、路径、BBox 应用及逆变换。完整非仿射变换、动态失效传播和全部 Path 细节仍待迁移。

随后新增 `scene/table.mbt`：Table 以独立场景图元进入 SVG，覆盖文本/颜色矩阵、行列标签、对齐、归一化 bbox、位置和边框模式；自动字体缩放、复杂布局和宿主表格对象适配仍待迁移。

本轮继续完成了次坐标轴的多实例容器改造：同一 `Axes` 可以创建多个
`secondary_xaxis`/`secondary_yaxis`，每个实例独立保留变换函数、固定刻度、标签和边缘位置，
SVG 后端按创建顺序渲染；现在还支持独立的 `ticker.Locator` 和 `ticker.Formatter`，
locator 在次坐标值域生成刻度，后端通过逆变换放置位置。并新增 `fill`、`broken_barh`、`hist2d`、
`quiverkey` 及其 pyplot 门面，这些 API 仍是基础语义原型，复杂 transform 和完整返回对象继续留在后续切片。

本轮完成了 `PathCollection` 第一版：对象式和 pyplot 均可创建逐点颜色/大小的散点集合，
集合拥有独立的数据复制语义，自动范围扫描和 SVG 编码已接通；数组广播、掩码集合、路径
变换和完整 `Collection` 子类仍待迁移。

本轮已完成 masked array 独立纵向切片：`core/masked_array.mbt` 与 `core/masked_matrix.mbt` 提供复制、形状校验、填充值、压缩、有限值提取和掩码传播；`scene/masked_image.mbt`、`scene/masked_mesh.mbt`、`scene/masked.mbt` 与 `pyplot/masked.mbt` 提供明确的绘图入口；SVG 图像与网格编码保留自动色阶和 bad 色语义。掩码尚未扩展到所有统计 API、NumPy 广播、二维坐标顶点或 `shading` 变体。

下一条切片继续深化约束布局和后端协议；统计图的掩码输入将在各自数据语义稳定后分别接入。

本轮继续完成了基础属性循环和自动范围边距：默认绘图入口从固定颜色改为 tab10，
对象式和 pyplot 状态式 API 共用同一 Axes 循环；自动范围现在可以通过显式 x/y margin
控制，并在 SVG 缩放前统一应用；显式范围可以通过 `autoscale`/`axis("tight")` 清除并
重新计算；图像 sticky edges 已接入自动范围。`rcParams` 的完整主题、字体、spines/
container 和其他图元的 autoscale sticky-edge 语义仍待后续切片。

随后完成了属性循环的第二个纵向切片：参考线和跨度、数据坐标 `annotate`/`arrow`、
`spy`、规则/三角等值线、`triplot`、`streamplot`、`violinplot` 与 `quiverkey` 的默认
单色样式现在由 Axes 的循环解析；同一调用产生的多个图元共享解析后的颜色，显式颜色
不会推进循环。`text` 和 contour 标签等文本默认样式仍保持独立的文本颜色语义。

随后完成了 `Spine` 的第一版对象切片：`Axes::spine`/`spines` 和 `Figure` 转发入口提供
四条标准边框的可见性、颜色与线宽读写，内部 render model 保留 side 语义，SVG 后端按
配置逐条绘制。spine 已支持 `Axes`/`Data`/`Outward` 位置和数据 bounds；cap/join 和完整
`Spines` 容器协议仍待迁移。

本轮完成了 `Container` 的基础对象切片：复合绘图入口在生成图元后保存稳定的 artist
分组快照，`Axes::containers()`/`Figure::containers()` 可读取类型、标签和分组图元，
并保持返回数组与图元数组的复制语义。`bar`/`barh`/`hist`、`errorbar`、`boxplot`、
`stem`、`contour`/`contourf`、`tricontour`/`tricontourf`、`quiver`、`violin`/
`violinplot`、`pie` 与 `streamplot` 已接入；`Axes::clear()` 会清空容器。专用
`BarContainer`/`ErrorbarContainer` 字段协议、回调、移除操作和完整 live artist 语义仍待
后续迁移。

随后为规则网格和显式三角网格的 filled contour 增加了 `extend` 切片：`contourf`/
`tricontourf` 接受 `neither`、`min`、`max`、`both`，使用数据范围裁剪 levels 外的
under/over 色带，`ContourSet::extend()` 保留该模式，SVG 和 pyplot 门面已接通。`corner_mask`、
`corner_mask` 也已接入规则网格线/填充轮廓并记录在 `ContourSet`；`clabel` 现在会把
`fontsize` 传到 SVG 文本样式；`clabel(inline=true)` 会在多点 polyline 的代表性线段处留出文字间隙，更完整的 locator 语义仍待迁移。

本轮继续补齐三角网格的逐面掩码：`triplot`、`tripcolor`、`tricontour` 和 `tricontourf`
均接受与三角形数量对应的 `mask` 数组，被屏蔽的面不会进入场景图或 SVG；长度校验和
pyplot 转发已有测试。随后 `tripcolor` 增加了按顶点值取三角均值或按面值直接着色的
两种输入形态。三角邻接自动构造已完成，完整的高级 locator 参数仍待迁移。

直方图返回对象也已补齐 `artists()`/`patches()`，返回生成的 bar artist 副本，同时保留
counts 和 edges；数组复制语义有独立测试。

本轮还补齐了 `ticker/scale` 的 `symlog`：`symlog_scale` 提供 `linthresh`、`linscale`
和 `base` 校验，变换/逆变换、对称主刻度、自动范围边距、SVG 坐标映射、日期/类别轴
互斥校验以及 pyplot 的 `xscale`/`yscale` 都已接入。

本轮完成了 `imshow` 的图像坐标语义切片：`scene`、masked image 和 pyplot 的图像入口
现在统一支持 `origin="upper"/"lower"`、四值有限 `extent`（允许反向边界）以及
`aspect="equal"/"auto"`。SVG 后端按 extent 将每个矩阵单元映射到数据坐标，按 origin
调整行顺序，默认无 extent 时使用半像素边界；显式 extent 也会参与自动范围。图像加入后
会立即贴合其范围，后续自动缩放会恢复数据范围并按图像边界抑制外侧 margin；共享轴会
传播方向，`clear` 会重置方向。旧的 `Artist::Image` 入口按 `upper` 默认兼容。随后新增
大小写不敏感的 `interpolation="nearest"`/`"none"`：`nearest` 保持 SVG 像素矩形，
`none` 在线性坐标轴上嵌入原始分辨率 RGBA PNG，并保留 origin、反向 extent、alpha 和
嵌套 SVG 裁剪；非线性坐标轴回退到像素矩形。

本轮继续完成图像插值过滤切片：`interpolation="bilinear"`、`"bicubic"`、`"spline16"`、
`"spline36"`、`"hanning"`、`"hamming"`、`"hermite"`、`"kaiser"`、`"quadric"`、
`"catrom"`、`"gaussian"`、`"bessel"`、`"mitchell"`、`"sinc"`、`"lanczos"` 和
`"blackman"` 在线性 SVG 轴上按显示尺寸生成 PNG，并使用对应的中心对齐预乘 alpha 核；
`interpolation="auto"`/`"antialiased"` 按显示倍率在最近邻和 Hanning 之间选择，保持
大倍率/整数倍率放大的清晰像素语义。标量、掩码和 RGB(A) 图像入口共享该策略，非线性轴
仍回退到像素矩形。

本轮继续完成 RGB/RGBA 图像的独立纵向切片：`core/colors` 增加 `Rgb`、`rgb` 和
`Rgb::to_rgba`，`scene` 增加 `Artist::ColorImage` 与 typed `imshow_rgb`/
`imshow_rgba`、三/四通道数组入口，`pyplot` 只负责转发这些入口；scene、内部 render
模型和 SVG 后端保持分层。彩色图像复用标量图的 origin、extent、aspect、自动范围、sticky
edges 和共享轴方向语义，SVG 按像素输出 RGB/RGBA 颜色并保留 alpha。通道数组的有限越界
值按 Matplotlib 语义裁剪到 `[0, 1]`，NaN/Infinity 像素输出透明色；矩阵和通道数校验、
颜色输出、方向、反向 extent、共享轴、pyplot 转发均有独立测试。随后为标量、掩码和 RGB(A)
入口增加了有限的全局图像 `alpha` 校验，并在 SVG 后端把它与色图或像素 alpha 相乘；非法
alpha 会在 scene 边界拒绝，相关入口和 pyplot 转发均有独立测试。`interpolation="none"`
现已覆盖标量、掩码和 RGB(A) 图像，并通过内部 PNG 编码器嵌入 SVG；全部 Matplotlib
图像过滤器也已接入线性 SVG 路径，非 SVG 后端仍拆到后续图像切片。
