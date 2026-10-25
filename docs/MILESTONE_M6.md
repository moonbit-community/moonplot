# M6：六边形分箱与小提琴分布交互

创建日期：2026-10-25。状态：**语义与六角分箱数学修正已合入；最终全套与浏览器验收已通过；正式包与实际发布验收待完成。**
继续用户要求的图表能力对齐，复用已存在的 hexbin、violin/violinplot 绘制与统计，目标版本0.7.0。
实施中已真实复现旧hexbin归属与轮廓错位、邻格重叠/空隙；将数学修正纳入本版后再发布。

## 六边形分箱

- [x] 按两交错格点最近距离分箱，并由同一sx/sy构造实际六角；每个输入属于真实目标格。
- [x] 邻格不产生正面积重叠或空洞，范围四边/最大边界/tie、稀疏/过滤与轴变换有实证。
- [x] 现有hexbin中心/计数/SVG的必要变化明确记录；其他图静态控制继续保持。

- [x] `Hexbin` kind 与不可变 `HexbinInfo`：原格行列、count、reduction；中心使用原数据坐标。
- [x] 原计数或已计算的 reducer 值在 Scene 写入时保存；不从颜色取值、不重新执行回调。
- [x] 同次实际 Polygon 绘制捕获完整六边形，以两个 Quadrilateral 表示真实区域；bbox 空角不触发。
- [x] `mincnt`、缺失输入、线性/Log颜色、Log/SymLog/反向轴、部分裁剪、原返回索引与旧帧快照。
- [x] 非完全透明的有效填充才有整格目标；marginals=true 暂保留静态、不提供本片 hexbin 语义目标。

## 小提琴分布

- [x] `Violin` kind、不可变统计摘要与部位信息；支持已有 `violin` 和 `violinplot`。
- [x] body 使用本次绘制的密度边界，按屏幕中点吸附最近已有 KDE 估计采样。
- [x] KDE 采样坐标和 density 明确区别于原观测点；原 group、position、横竖方向和统计值不重算。
- [x] mean、median、min/max、range、quantile 使用实际 Segment；后画统计线能在填充上命中。
- [x] side、常量/空组、NaN、预计算非单调密度与非线性轴遵循实际绘制和有效性检查。

## 接入与交付

- [x] 默认 Rabbita 提示和自定义回调可读取完整元数据，公开值不携带可变数组。
- [x] 四图真实 DOM 示例与 Chrome 验收：独立显隐/更新/重挂载、CSS/letterbox、375px。
- [x] 定向四目标/adapter回归、旧SVG字节控制、全套、接口/fmt/结构。
- [ ] clean正式包、实际Mooncakes安装、仓库外静态/DOM消费与GitHub附件回验。

保留已有入口和返回值；不增加 Matplotlib 全参数集，不把六边形 bbox 误称为矩形双分箱区间。
曲线网格、contour 线/区域语义及进一步图类在后续切片继续。
精确执行状态见[检查点](MIGRATION_STATUS.md)。

两实现合入后的组件JS30/30、组合回归四目标各2/2；独立dirty包静态4目标+Chrome17通过。
这些是早期接入/语义阶段结果，不将演练包上传。数学修正已合入且独立相关四目标各1896/1896、外部native14组通过；最终四图/全套/registry仍待完成。

## 最终整合验收

- `moon test --target all` terminal0：Wasm / Wasm-GC / Native 各22452/22452，JS22489/22489。
- 真实编译器接口、fmt与七个Rabbita JS示例构建通过；新增例接口与编译器输出相同。
- Chrome156新分布图13项（含10个原观测点真实SVG包含与mouse hover），网格11、统计14、M3图14、提示14，均0页面错误。
- 三个native静态SVG可解析，preview6886/gallery14246 bytes与已有资产逐字相同。
- Hexbin数学修正的9份必要SVG变化/1空结果不变已单独记录；Violin6份旧SVG不变。
- 当前Markdown本地链接、结构和diff检查通过；正式分发与registry验收仍单独记录。
