# Matplotlib v3.11.2 兼容性清单

这份清单记录 MoonBit 端的真实状态。只有有对应实现和测试的条目才能标记为“已实现”；计划中的条目不能当作已支持能力。

MoonBit 工具链映射：Matplotlib 的 `extend` 参数/属性在 MoonBit 端统一称为
`extend_mode`，用于 `boundary_norm`、`contourf`、`tricontourf` 及返回对象；
默认值与 `neither`/`min`/`max`/`both` 语义不变（`extend` 已是 MoonBit 关键字）。

状态含义：

- **原型**：当前仓库有最小实现，但 API 或语义尚未冻结。
- **设计中**：已确定包边界，正在提取上游签名和测试。
- **计划**：属于 v3.11.2 目标，但尚未开始实现。
- **native**：需要 native FFI 或系统库。
- **宿主**：需要 JS、GUI、Web 或 Notebook 宿主。

## 当前已实现的原型

| matplotlib 概念 | MoonBit 入口 | 状态 | 说明 |
| --- | --- | --- | --- |
| 点数据 | `@mathplotlib.point` / `Point` | 原型 | 已拆到 `core` 包 |
| 显式范围 | `@mathplotlib.bounds` / `Bounds` | 原型 | 自动范围支持默认 5% 边距、显式 x/y margin 和显式范围优先 |
| 基础样式 | `@mathplotlib.style` / `Style` | 原型 | 颜色和宽度的最小子集 |
| 掩码数据 | `MaskedArray`, `MaskedMatrix`, `masked_array`, `masked_matrix` | 原型 | 显式值/掩码复制、形状校验、压缩/填充值、掩码传播和有限值提取；错误为 `MaskError` |
| Figure | `@mathplotlib.figure` / `Figure` | 原型 | 类型和生命周期已移到 `scene`；支持独立多 Axes 面板和 SVG 渲染 |
| 折线 | `Figure::plot` / `Figure::line` | 原型 | SVG 输出 |
| 散点 | `Figure::scatter` | 原型 | SVG 输出 |
| 柱状图 | `Figure::bar` | 原型 | SVG 输出 |
| SVG 文档 | `Figure::to_svg` | 原型 | 编码已移到 `backend/svg`，通过 `internal/render` IR 连接 |

## 核心对象和数值层

| 上游模块/对象 | 目标 MoonBit 包 | 状态 |
| --- | --- | --- |
| `matplotlib.typing` | `core` | 设计中 |
| `numpy` 数组输入语义 | `core/array` | 设计中 |
| `matplotlib.transforms` | `transforms` | 原型；Affine2D 的平移、缩放、旋转、错切、复合和逆变换，BBox 的范围、相交、并集、布局操作和变换树（bbox/blended/scaled translation） |
| `matplotlib.path` / `bezier` | `transforms` | 原型；Path 的 Move/Line/Curve/Close 基础模型、曲线点包含、包围盒内部极值和矩形内外裁剪，Bezier 二次/三次求值、分割、采样；完整非仿射变换、动态失效传播和全部 Path 细节仍待迁移 |
| `matplotlib.colors` | `core/colors` | 原型；RGBA、基础命名色、十六进制色、`Normalize`、`LogNorm`、`SymLogNorm`、`TwoSlopeNorm`、`PowerNorm`、`CenteredNorm`、支持扩展 bin/clip 的 `BoundaryNorm`、离散 `ListedColormap` 以及 under/over/bad 色彩 |
| `matplotlib.cm` | `core/colors` | 原型；灰度、viridis、plasma、inferno、magma、cividis 和自定义分段色图 |
| `matplotlib.scale` | `ticker/scale` | 原型；线性/十进制对数和对称对数（symlog）变换、逆变换、有效值检查和主刻度生成 |
| `matplotlib.ticker` | `ticker` | 原型；已支持 typed `MultipleLocator` 提供有限正Double base/有限offset、validate-before-update、独立对象copy、live主次adapter、原源升序邻接点与generic方向/错误映射、data/round_numbers动态rc view_limits及axis margin/sticky接线；验收证据见检查点，精确范围见 [固定间隔参考](testdata/multiple_locator_README.md)。已有确定性线性/对数刻度和值标签；MaxN 风格的 nice step、integer/symmetric/prune 选项、LogLocator 的 `subs`/`numdecs` 和自动/固定/对数 minor locator；numeric locator 已可接入 `scene/axis` 与 pyplot；Scalar、Fixed、printf Format、Eng、Percent、Log、Null、函数 formatter 已接入轴和 SVG；Scalar 使用统一布局计算 offset、科学倍率、精度和 viewport，Eng/Percent 边界与自动精度已覆盖，mathtext 使用后端中立的乘号/上标表示；LogFormatter 默认返回数值标签，`label_only_base` 仅过滤非底数幂位置。完整 Log minor 自适应、复杂 formatter 组合和完整 mathtext 渲染仍待迁移。 |
| `matplotlib.dates` | `ticker/date` | 原型；已支持命名 `MicrosecondLocator` 的有限正Double/分数间隔、whole-array awareness/NumPy秒偏移截断、精确interval_value、原源邻接点/年界、Auto/axis/共享SVG接线，旧Int32 helper继续clip且eager最多100000；详见 [微秒参考](testdata/microsecond_locator_README.md)；已支持 `datestr2num`/`datestrs2num` 与 typed `DateStringParser`/可注入 `DateParserContext`，固定默认dateutil语法、Unicode词法、28位Decimal时间、default填充/月末/weekday/fold、本地TZif/POSIX/采样或显式descriptor、typed未知时区诊断、NumPy首probe/mixed-aware/epoch锁定顺序及scene/pyplot链路；String/flat-array类型边界与宿主能力限制保留，未迁移动态/多维/掩码容器；已支持标准 strftime 的固定 C locale 指令（12h/AMPM、年日、Sunday/Monday week、ISO weekyear/weekday/week、c/x/X），复用本地 Gregorian 日历并以完整400年周期及原formatter逐值参考验证；任意系统locale/OS扩展和flags仍待接入；已支持 typed `DateConverter`/`ConciseDateConverter`、复制隔离的 `DateAxisInfo`、首个日期单位推断与 scalar/flat-array 转换、`date.converter` auto/concise 配置；默认轴首次捕获，shared/scene/pyplot/SVG 与空 plot_date 已接线，保留固定上游 concise 构造的 multiples 覆盖行为；已有 DateTime 无 naive 标记，通用动态 units registry/NumPy masked 数组仍待迁移；已支持命名 `AutoDateFormatter` 的 locator 基础单位、排序 scaled 字符串/typed callable/默认回退与 rc 快照；新日期轴默认使用该格式器，主/次及数值 locator 更换后自动重绑定，日期次刻度标签/去重/可见性/共享轴/scene/pyplot/SVG 已接线；已支持完整 `AutoDateLocator` 对象的七级频率、minticks/maxticks/interval 表、日历选择与 phase、multiples 对齐、typed 诊断、动态单位和 nonsingular；默认日期轴及显式主/次 locator、scene/pyplot/SVG 已接线，旧范围 helper 保留兼容；已支持 `ConciseDateFormatter` 六级批量标签、zero/custom formats、共同小数尾零修剪、show_offset、倒置轴共享日期、scalar/cursor labels 与TeX字符串输出；普通/concise日期formatter可挂载x/y轴并通过shared axes、scene/pyplot和SVG共享offset文本接线，SVG通用TeX排版仍未接入；已支持 `get_epoch`/`set_epoch`、`config.date_epoch` fallback 与首次读取/转换锁定；ISO 原点支持年0、负年、时分秒与微秒，数值转换/时区/recurrence/locator/scene/pyplot/SVG 全链接入，自定义原点下保留相对精度修正与上游微秒原点不对称；已支持 `TimeDelta` 全范围规范化整数时长、标量/数组 `num2timedelta(s)`、`DateTime.add_timedelta`、保留规则时区的微秒级墙钟算术，以及按上游端点/linspace 算法的 `drange`（含 DST/负步长/浮点边界）；UTC Gregorian 与固定 UTC offset、微秒精度、ISO 时区后缀/小数秒解析、`%f`/`%z`/`%Z` 格式化、`DateFormatter::with_offset`、自动日期刻度，以及日/年/月/星期/时/分/秒/微秒显式定位器；多值 selector、负月日、每月第 N 个星期几、日历 recurrence、`interval` 相位、`byyearday`/`byweekno`/`byeaster`、`bysetpos`、带 `dtstart` 的 `count`/`until` 动态边界和微秒/offset SVG 标签已覆盖，`scene`/`pyplot`/SVG 已接入。新增带明确 `dtstart` 的 `RRule` 对象，支持 `locator`、`between`、`after`、`before`、`xafter`、`all`、固定 offset 复制、保留未指定字段的 `replace` 以及通过 `replace(clear=[...])` 清除 selector；`RRuleSet` 已支持多个 `RRule`/显式日期的包含、排除、UTC 顺序合并、去重和 `between`/`after`/`before`/`xafter`/`all` 查询；`business_day_locator` 已支持默认周一至周五或自定义 weekday mask、显式节假日日期、interval 和固定 offset，并已接入 scene/pyplot/SVG；新增显式 transition 时区规则，支持 `DateTime` 转换、formatter 和 scene/pyplot/SVG 标签在 transition 前后的动态 offset；显式日历/时间 locator 已按本地候选映射 UTC，spring gap 会跳过，fall fold 保留两个 instant；recurrence 也支持显式 transition 表；已支持调用方 TZif v2/v3 数据（历史秒级偏移、缩写、POSIX footer 未来规则及完整日期/SVG/recurrence 接线）；独立 `ticker/date/tzdb` 已捆绑 IANA 2026e 的 598 个标准 Zone/Link 名称与兼容别名，返回现有 DateTimeZone；已支持 RRule/RRuleSet 可选 occurrence 前缀缓存、独立原生 iter/iter_after、派生规则空缓存和 set mutator 失效/reader 快照；完整商业日历规则和更多 `dateutil.rrule` 对象语义仍待迁移；Minutely/Secondly 跨级不可达clock mask的迭代错误已在checked查询/计数对齐，新增RRuleDateIterator/checked_raw_iter的lazy next错误/终止/快照，occurrence_count补raise DateError；旧raw_iter native扩展及Python线程锁/动态代理边界见clock_iteration参考指南。locator 无匹配回退端点，对象查询返回空结果，输出上限为 100000；默认 `timezone` rc、`get_timezone`、互斥 String/typed zone 参数、num2date 动态/DateFormatter 与 locator 捕获/Auto 与 Concise 文本动态解析、显式 offset0、dateutil TZif 32-bit profile、host/POSIX/可选单名注册和轴原子错误映射已接入；完整 IANA zone 保留原64位/footer语义；Windows registry、dateutil内置bundle和宿主缩写兜底及弃用TZ语法未接入；typed `RRuleWrapper` 与边界 `RRuleDateTime` 已接入 timezone 推断/aware→naive、分阶段set失败状态、host clock默认、None参数、ordinal weekday、缓存/raw stream/count/typed copy和无epoch查询；named `RRuleLocator` 通过calendar扩展/update/shared wrapper接入主次轴/动态单位/自定义epoch/无Node/shared inverted SVG；命名 `MonthLocator`/`WeekdayLocator`/`DayLocator`/`HourLocator`/`MinuteLocator`/`SecondLocator` 已接入原默认/None/typed scalar-array-object、clock与Day前置验证、display rc捕获、共享rule主次轴/SVG/epoch/browser及原源参考；wrapper同级clock selector按gcd筛core并保留raw construct/阶段错误；命名 `YearLocator` 已支持冻结base年对齐、保留微秒/zone/fold、非法对齐日期错误、live scalar构造形态与原端点混合awareness回退；AutoDateLocator年倍数分支亦已接入并支持可选host context；AutoDateLocator其余recurrence分支已复用wrapper，支持原gap/fold0/duplicate coordinates并保留decoded bounds与fraction epoch转换顺序；负DST attach与fromutc双mask按dateutil原行为处理；dynamic代理/pickle/索引协议及pytz适配仍待迁移，typed范围见testdata/rrule_wrapper_README.md；typed `RelativeDelta`/weekday 对象、absolute/relative/Yday/monthend/DST应用、精确normalized、between同/异zone identity、对象加减/TimeDelta/neg/abs/scale/div/zero/Eq/immutable weeks与epoch/SVG链路已接入；年月Int64、其余relative有限Double，Python任意精度/date-only/naive动态混合及字段突变/反射协议仍待迁移 |
| `matplotlib.category` | `ticker/category` | 原型；字符串首次出现顺序映射、重复值复用位置，并保留空字符串类别 |
| `matplotlib.axes.prop_cycle` | `scene.Figure` / `Axes::set_color_cycle` / `set_prop_cycle` | 原型；默认 tab10，基础曲线、参考线/跨度、annotation/arrow、spy、contour/tricontour/triplot、streamplot、violinplot、quiverkey 等单色入口共享循环；显式颜色覆盖且不推进循环，循环项校验 |
| `matplotlib.rcsetup` / `rcParams` | `config` | 原型；全局 tab10、x/y autoscale margin 和新 axes 的 major grid 默认值；D20 增加 `axes_autolimit_mode` 的 data/round_numbers 验证、默认data、复制/reset/getter，供 MultipleLocator 每次 view_limits 动态读取；其他 rcParams 仍待迁移 |

## Figure、Axes 和图元

| 上游模块/对象 | 目标 MoonBit 包 | 状态 |
| --- | --- | --- |
| `Artist` | `scene/artist` | 原型 |
| `Figure` / `SubFigure` | `scene/figure` | 原型；Figure 支持规则 `subplots`、独立归一化矩形 `add_axes`（允许零尺寸和越界矩形，拒绝负值/非有限值）、`GridSpec` 共享轴约束和 `subplots_with_grid`，`subplots_adjust` 可更新 bounds 与间距并即时反映到已有 Axes；新增 `delaxes` 与独立于绘制顺序的 `gca`/`sca` 选择历史，删除末面板后允许空 Figure 并延迟重建；SubFigure 支持父 GridSpec 跨度、嵌套 `subplots`、标题、`clear`、句柄共享、直接成员 `delaxes` 和 SVG 渲染 |
| `Axes` / `_AxesBase` | `scene/axes` | 原型；每个 Axes 独立持有图元、范围、标签和标题，并可挂载多个次坐标轴；支持 axis decorations 的 on/off 和 clear；位置支持归一化 `get_position(original=...)`、四参数 `set_position(..., which=...)` 和 `reset_position`，auto/equal/numeric 与 SVG 共用范围和矩形计算；`set_aspect` 接受正有限 y/x 比例，`get_aspect` 返回 None(auto)/Some(ratio)，`share` 更新直接共享组并集，支持 transformed spans 与流线箭头显示尺寸；`Anchor::Named`/`Fraction`、`set_anchor`/`get_anchor` 及 `set_aspect(anchor=...)` 支持 compass/有限 tuple（含越界）锚定和 share，clear 保留锚点；允许零尺寸和越界，非法位置原子拒绝。`remove` 同步清理 Figure/SubFigure 列表并隔离共享轴，旧句柄保留数据与来源 Figure，重复/外部移除原子拒绝；GridSpec 手动覆盖在下次 `subplots_adjust` 时恢复；`set/get_adjustable` 与 `set_aspect(adjustable=...)` 支持 box/datalim，`apply_aspect` 和 checked SVG 同步实际视图，自动/显式选择及方向保留；共享 x/y 仅调整非共享轴，numeric datalim 两轴共享在 setter 提前拒绝；原非抛错 getter 失败返回 None，`to_svg_checked` 返回 DataError。固定范围覆盖不提供 Python 日志警告；`set/get_box_aspect` 支持正有限物理高/宽比和省参清除，设置时选择 datalim，清除保留模式；auto 仅缩框并允许两轴共享，numeric 先缩框再调视图，box 模式 numeric 优先，支持 anchor/动态网格/图像/流线单位；locator、twins、自动布局和 SubFigure 局部坐标仍待迁移 |
| `Axis` / `XAxis` / `YAxis` | `scene/axis` | 原型；范围、线性/对数/日期刻度、固定刻度、自定义标签、类别刻度、numeric major/minor locator 和 major/minor grid 可见性/样式；Axes 自动范围支持 x/y margins；D20 SVG 主次/secondary 刻度按变换后的view及上游1e-10容差筛选绘制，先保留完整刻度做formatter布局，direct tick_values仍返回邻接点 |
| `GridSpec` / `SubplotSpec` | `scene/gridspec` | GridSpec 原型；支持规则网格、`none`/`all`/`row`/`column` 共享轴、共享范围/刻度传播、外侧主刻度标签布局、可动态更新的 `hspace`/`vspace`、`width_ratios`/`height_ratios`、跨行列与嵌套 SubplotSpec、负行主序索引和 `Figure::add_subplot`；未显式设置的网格间距可继承 Figure 的 `wspace`/`hspace`，显式 GridSpec 间距优先 |
| `Line2D` / `AxLine` | `scene/lines` | 原型；Line、HLine、VLine |
| `Patch` / `Rectangle` / `Polygon` | `scene/patches` | 原型；Bar、BarH、FillBetween |
| `Collection` / `PathCollection` | `scene/collections` | 原型；`PathCollection` 支持散点颜色/大小广播、复制语义、自动范围和 SVG 圆点渲染 |
| `BoxStats` / `boxplot` | `scene/boxplot` | 原型；分位数、IQR 须线、离群点和 SVG 竖直/水平箱线图 |
| `Text` / `Annotation` | `scene/text` | `Text` 原型；`annotate`/`arrow` 原型，支持数据坐标、`axes fraction`/`figure fraction`、SVG `display`、`offset points`/`offset pixels`、偏移、箭头、`fontsize` 以及 `straight`/`arc3`/`angle` 连接器；复合 transform、完整连接器参数和富文本仍待迁移 |
| `Image` / `AxesImage` | `scene/image`, `scene/image_color`, `scene/masked_image` | 原型；二维标量图、RGB/RGBA 图像、vmin/vmax、`Normalize`/`LogNorm`/`SymLogNorm`/`TwoSlopeNorm`/`PowerNorm`/`CenteredNorm`、命名色图、非有限像素、`imshow_masked`、`origin=upper/lower`、允许反向边界的有限 `extent`、`aspect=equal/auto`、SVG 像素网格、立即贴合图像范围、自动缩放时的图像 sticky edges 和共享轴方向传播；RGB(A) 支持 typed `Rgb`/`Rgba`、三/四通道数组、全局 alpha、有限越界通道裁剪和无效像素透明；`interpolation="nearest"` 使用像素矩形，`interpolation="none"` 在线性坐标 SVG 轴上嵌入原始分辨率 RGBA PNG，`interpolation="bilinear"`、`"bicubic"`、`"spline16"`、`"spline36"`、`"hanning"`、`"hamming"`、`"hermite"`、`"kaiser"`、`"quadric"`、`"catrom"`、`"gaussian"`、`"bessel"`、`"mitchell"`、`"sinc"`、`"lanczos"` 和 `"blackman"` 使用对应的中心对齐预乘 alpha 核，`interpolation="auto"`/`"antialiased"` 按显示倍率在最近邻和 Hanning 之间选择；过滤模式在线性 SVG 轴上生成显示尺寸 PNG，非线性坐标自动回退到像素矩形 |
| `Table` | `scene/table` | 原型；支持文本/颜色矩阵、行列标签、单元格对齐、归一化 bbox、位置和边框模式，SVG 绘制 |
| `Legend` / handlers | `scene/legend` | 原型；显式条目、带 `label` 的自动条目、同名去重、线/点/色块样本和 SVG 绘制 |
| `Axes.margins` / `set_xmargin` / `set_ymargin` | `scene` / `pyplot` | 原型；线性和对数自动范围边距，范围校验和共享轴传播 |
| `Axes.autoscale_view` / `pyplot.autoscale` | `scene` / `pyplot` | 原型；按 x/y/both 清除显式范围，`tight` 视图使用零边距 |
| `Colorbar` | `scene/colorbar` | 原型；线性/对数规范化、竖直/水平渐变条、刻度和标签，SVG 输出 |
| `Container` 类型 | `scene/container` | 原型；`Axes`/`Figure` 可读取复合绘图调用生成的 artist 分组、类型和标签，支持 bar/barh/hist、errorbar、boxplot、stem、contour/tricontour、quiver、violin/violinplot、pie、streamplot、stackplot，并在 clear 时同步清空 |
| `Spine` | `scene/spines` | 原型；四条标准 spine 可读取/设置可见性、颜色、线宽、`Axes`/`Data`/`Outward` 位置和数据 bounds，SVG 后端按 side 渲染 |

## Axes 绘图方法

这些方法按图元和算法拆分，每一组单独实现、测试和发布：

| 方法组 | 代表方法 | 状态 |
| --- | --- | --- |
| 基础曲线 | `plot`, `plot_date`, `loglog`, `semilogx`, `semilogy` | 原型；SVG 后端支持线性、日期和基础十进制对数坐标 |
| 点和区间 | `scatter`, `errorbar`, `fill_between`, `fill_betweenx` | `fill_between`/`fill_betweenx`/`errorbar` 原型；`plot_masked`/`scatter_masked`/`fill_between_masked`/`fill_betweenx_masked` 支持显式掩码断点 |
| 阶梯和离散事件 | `step`, `stairs`, `stem`, `eventplot` | 原型；支持 pre/post/mid 阶梯、垂直/水平 stairs、填充 stairs、竖直/水平 stem 和多组事件线 |
| 条形和统计 | `bar`, `barh`, `hist`, `boxplot`, `violinplot`, `pie` | `barh`/`hist`/`pie`/`boxplot`/`violinplot` 原型；`Histogram` 暴露 counts、edges 和 bar patches；`violinplot` 支持 Gaussian KDE、Scott/Silverman/固定带宽、分位数、均值/中位数/极值线、单侧绘制和水平布局 |
| 面积和附加图元 | `fill`, `fill_between`, `stackplot`, `broken_barh`, `hist2d`, `quiverkey` | 原型；闭合多边形、堆叠面积图（zero/sym/wiggle/weighted_wiggle）、水平断续条、矩形二维直方图和数据坐标向量键已接入 scene/SVG |
| 图像和网格 | `imshow`, `pcolor`, `pcolormesh`, `matshow` | `imshow`/`pcolor`/`pcolormesh` 原型；`imshow`、masked `imshow` 和 pyplot 图像入口支持 `origin=upper/lower`、允许反向边界的有限 `extent` 及 `aspect=equal/auto`，SVG 按像素边界绘制并纳入自动数据范围，图像立即贴合范围且后续自动缩放支持 sticky edges 和共享轴方向传播；RGB(A) 已支持 typed `Rgb`/`Rgba`、三/四通道数组、全局 alpha、有限越界通道裁剪和无效像素透明；`interpolation="nearest"` 使用像素矩形，`interpolation="none"` 在线性 SVG 坐标轴上嵌入原始分辨率 PNG，`interpolation="bilinear"`、`"bicubic"`、`"spline16"`、`"spline36"`、`"hanning"`、`"hamming"`、`"hermite"`、`"kaiser"`、`"quadric"`、`"catrom"`、`"gaussian"`、`"bessel"`、`"mitchell"`、`"sinc"`、`"lanczos"` 和 `"blackman"` 使用对应的中心对齐预乘 alpha 核，`interpolation="auto"`/`"antialiased"` 按显示倍率在最近邻和 Hanning 之间选择；过滤模式在线性 SVG 坐标轴上生成显示尺寸 PNG，非线性轴回退到像素矩形，掩码和 RGB(A) 入口会转发该参数；规则网格 `pcolor`/`pcolormesh` 及 masked、显式 norm 入口支持 `antialiased` 边界控制；`pcolor_grid`/`pcolormesh_grid` 支持二维曲线坐标和 `flat`/`nearest`/`gouraud`/`auto` shading 及 `antialiased` 边界控制，Gouraud 以带顶点颜色的三角形图元编码到 SVG；`pcolor_grid_masked`/`pcolormesh_grid_masked` 支持数据与二维坐标 mask，并按单元传播；`imshow_masked` 使用 bad 色，`pcolor_masked` 省略对应多边形，`pcolormesh_masked` 使用 bad 色；网格支持显式 `ColorNorm`/`ColorMap`、BoundaryNorm 的 under/over 和 bad 色；`matshow` 使用半整数图像边界、零基整数刻度、顶部/两侧 x 刻度和等比例反向 y 轴，并转发全部 Matplotlib `interpolation` 名称；对数坐标会跳过非正网格边界 |
| 等值线 | `contour`, `contourf`, `clabel` | `contour`/`contourf`/`clabel` 原型（规则网格）；filled contour 已支持 `extend=min/max/both`，规则网格支持 `corner_mask`，`clabel` 支持代表性位置、字号和 `inline` 文字间隙；`ticker.Locator` 已支持 linear/fixed/log 自动 levels，LogLocator 支持 `subs`/`numdecs`；规则网格和三角等值线都按共享 crossing 拼接连续路径，filled band 会消除同一 band 的内部共享边并保留 mask 边界，多个边界环通过 SVG even-odd compound path 渲染孔洞；线 contour 支持按 level 循环的 `colors`/`linewidths`，`ContourSet` 提供拼接路径及 levels/layers 读取；高级 formatter 和更复杂的 locator 组合仍待迁移 |
| 向量场 | `quiver`, `barbs`, `streamplot` | `quiver`/`barbs`/`streamplot` 原型（规则网格）；`barbs_with_options` 已支持 half/full/flag 增量、rounding、flip、calm fill 和 tail/middle/tip pivot；streamplot 已支持 1D 与 meshgrid 风格二维坐标、独立 density 轴、显式起点、积分方向、长度限制、积分时断裂占据、按弧长箭头、自适应 RK12、网格 linewidth/color、显示空间箭头、常用 FancyArrowPatch 样式和 `StreamplotSet` 返回对象 |
| 统计辅助 | `acorr`, `xcorr`, `ecdf`, `hexbin`, `spy` | `acorr`/`xcorr`/`ecdf`/`hexbin`/`spy` 原型；`acorr`/`xcorr` 支持可调用 `detrend`、`detrend_none`、`detrend_mean` 和 `detrend_linear`，会校验 detrend 结果长度与有限值；`hexbin` 支持 `gridsize`、`mincnt`、`extent` 裁剪、`marginals` 边际计数柱、线性/对数/对称对数坐标空间、线性或对数色阶、`edgecolor`/`linewidth`、`values` 的 `mean`/`sum`/`min`/`max`/`count` 聚合和 `hexbin_reducer` 自定义聚合；`spy` 支持 `precision`、`markersize`、`origin`、`aspect=equal/auto` 和常用 marker 形状；置信区间、复数数值和 masked array 输入仍待迁移 |
| 几何辅助 | `axhline`, `axvline`, `axline`, `axhspan`, `axvspan`, `hlines`, `vlines` | `axhline`/`axvline`/`axline`/`axhspan`/`axvspan`/`hlines`/`vlines` 原型；这些单色入口使用 Axes 属性颜色循环，显式颜色不推进循环；`axline` 支持两点或点加斜率，线性坐标按数据范围裁剪，对数坐标的两点形式按显示空间裁剪 |
| 坐标和标注 | `text`, `annotate`, `arrow`, `secondary_xaxis`, `secondary_yaxis` | `text`/`annotate`/`arrow` 原型；`annotate` 支持数据坐标、`axes fraction`/`figure fraction`、SVG `display`、`offset points`/`offset pixels`、偏移、箭头、`fontsize` 和 `straight`/`arc3`/`angle` 连接器；次坐标轴支持多个实例、前向/逆向函数、固定刻度、独立 locator/formatter、标签、位置和 SVG 标签；复合 transform、完整连接器参数和富文本仍待迁移 |
| 三角网格 | `Triangulation`, `triplot`, `tripcolor`, `tricontour`, `tricontourf` | `scene.triangulation`/`pyplot.triangulation` 支持显式索引或自动 Delaunay，派生唯一边、邻接和逐面 mask；`triplot_triangulation`、`tripcolor_triangulation`、`tricontour_triangulation`、`tricontourf_triangulation` 可复用网格；`Triangulation::get_trifinder`/`pyplot.get_trifinder` 支持点和批量查询，返回包含面的索引或 `-1`；三角 contour 线按共享 crossing 拼成连续 polyline，filled band 按边界消除拼成外环/孔洞环，非有限 z 值会被拒绝 |

## 后端

| 上游后端 | MoonBit 目标 | 状态 |
| --- | --- | --- |
| `backend_svg` | `backend/svg` | 原型；使用 `Milky2018/xml@0.5.0` |
| `backend_agg` | `backend/agg` | native |
| `backend_pdf` | `backend/pdf` | native |
| `backend_ps` | `backend/ps` | native |
| `backend_pgf` | `backend/pgf` | native/宿主 |
| `backend_cairo` | `backend/cairo` | native |
| `backend_webagg` | `backend/web` | 宿主 |
| `backend_nbagg` | `backend/notebook` | 宿主 |
| Qt/GTK/Tk/WX/macOS | `backend/gui/*` | 宿主 |

## 高级系统和生态

| 上游系统 | 状态 |
| --- | --- |
| `pyplot` 状态式 API | 原型；对象式绘图和对应的掩码门面（`plot_masked`, `scatter_masked`, `fill_between_masked`, `fill_betweenx_masked`, `imshow_masked`, `pcolor_masked`, `pcolormesh_masked`）已接入；常用对象命名别名、无参/显式矩形 `axes`、跨 Figure `sca`、无参/显式 `delaxes`、每 Figure 当前面板历史与删除后恢复、`grid`、`cla`、datalim 模式的 `axis("equal")`、`suptitle`/SVG `savefig`、tab10 颜色循环、spine 对象、`stackplot`、`margins`/`set_margins` 和 `subplots_adjust` 已接入；其余状态函数仍为第一版；绘图函数支持 `label` 自动图例，并可读取当前 axes 的图例条目 |
| `animation` 和 writers | 计划/宿主 |
| `widgets` 和事件 | 计划/宿主 |
| `mplot3d` | 计划 |
| `axisartist` / `axes_grid1` | 计划 |
| `style`、主题和 `rcParams` | 原型/计划 | `config` 已提供颜色循环、autoscale margin 和 major grid 默认值；完整主题、字体和其余 rcParams 仍待迁移 |
| Pillow 图像适配 | 计划/native |
| pandas/xarray 数据适配 | 计划/宿主 |
| 测试和图像比较工具 | 计划 |

## 完成标准

条目只有在以下条件都满足时才从“计划”或“原型”移为“已实现”：

1. 公共 API 与 v3.11.2 的目标签名有明确映射。
2. 默认值、形状、范围、异常和图元顺序有测试。
3. 至少一个目标后端有可复现输出。
4. Wasm/native/宿主限制已在条目中注明。
5. `moon info` 生成的公开接口经过审查，文档和示例同步更新。
