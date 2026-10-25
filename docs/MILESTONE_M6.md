# M6：六边形分箱与小提琴分布交互

创建日期：2026-10-25。状态：**范围已确定，两个独立工作区实施中。**
继续用户要求的图表能力对齐，复用已存在的 hexbin、violin/violinplot 静态绘制与统计，目标版本0.7.0。

## 六边形分箱

- [ ] `Hexbin` kind 与不可变 `HexbinInfo`：原格行列、count、reduction；中心使用原数据坐标。
- [ ] 原计数或已计算的 reducer 值在 Scene 写入时保存；不从颜色取值、不重新执行回调。
- [ ] 同次实际 Polygon 绘制捕获完整六边形，以两个 Quadrilateral 表示真实区域；bbox 空角不触发。
- [ ] `mincnt`、缺失输入、线性/Log颜色、Log/SymLog/反向轴、部分裁剪、原返回索引与旧帧快照。
- [ ] 非完全透明的有效填充才有整格目标；marginals=true 暂保留静态、不提供本片 hexbin 语义目标。

## 小提琴分布

- [ ] `Violin` kind、不可变统计摘要与部位信息；支持已有 `violin` 和 `violinplot`。
- [ ] body 使用本次绘制的密度边界，按屏幕中点吸附最近已有 KDE 估计采样。
- [ ] KDE 采样坐标和 density 明确区别于原观测点；原 group、position、横竖方向和统计值不重算。
- [ ] mean、median、min/max、range、quantile 使用实际 Segment；后画统计线能在填充上命中。
- [ ] side、常量/空组、NaN、预计算非单调密度与非线性轴遵循实际绘制和有效性检查。

## 接入与交付

- [ ] 默认 Rabbita 提示和自定义回调可读取完整元数据，公开值不携带可变数组。
- [ ] 四图真实 DOM 示例与 Chrome 验收：独立显隐/更新/重挂载、CSS/letterbox、375px。
- [ ] 定向四目标/adapter回归、旧SVG字节控制、全套、接口/fmt/结构。
- [ ] clean正式包、实际Mooncakes安装、仓库外静态/DOM消费与GitHub附件回验。

保留已有入口和返回值；不增加 Matplotlib 全参数集，不把六边形 bbox 误称为矩形双分箱区间。
曲线网格、contour 线/区域语义及进一步图类在后续切片继续。
精确执行状态见[检查点](MIGRATION_STATUS.md)。
