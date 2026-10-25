# M13：三角网格着色与原始面信息

创建日期：2026-10-25。状态：**已授权独立实现，尚未验收**。
目标0.14.0；当前实际分发0.13.0，正式基线为
`87a3280f31fb3ba043da415f89eab6ad5a8ef59e`。

本轮补已有 `tripcolor` 和 `tripcolor_triangulation` 的交互，支持逐面标量
及原有顶点算术均值。保持既有绘制和参数，不增加场插值或重建三角网格。

## 能力合同

- [ ] 新增 `HitKind::Tripcolor`，复用实际 Polygon 成功写出的单环 nonzero
  `FilledRegion`；两种命中模式均要求 plot 内真实填色，掩码空面、三角形 bbox
  空角、退化面与 margin 不产生误命中。
- [ ] `value` 保原有限逐面值或原有 `(a+b+c)/3` 的运算结果；保留原均值位模式、
  溢出省略、全输入 normalization autoscale 和 face 数量优先规则。
- [ ] `point_index` 为实际验证或生成网格的原面槽，保留 mask/无效值的空位；
  `artist_index` 为当前实际 Polygon，`series` 为生成调用的名称。
- [ ] `TriColorInfo` 提供实际有序顶点三元组和 `vertex_mean` 标志；通过可选
  `HitInfo.tricolor`、factory 和根 facade 提供。自动 Delaunay 结果也保留实际顶点索引，
  不以矩阵行列、颜色或重新计算的网格代替来源。
- [ ] 默认提示显示系列与 Value 或 Vertex mean，自定义提示可读取原面和顶点信息；
  生成边的几何锚点不作为原始观测或鼠标处标量场值展示。
- [ ] 三点身份与内容快照、known-slot 与线性 cursor 维护归属；不匹配或未知 prepared
  context 保守静态，保留 image/inline/remove/clear 和其他图类的既有行为。
- [ ] 保持原签名、Unit 返回、0 Containers、mask/triangulation、normalization、
  图例、颜色及同目标旧 SVG。若实际复现空调用串改前一 series，只窄修该问题。
- [ ] 每面保持常数大小元数据和三点检查，不对每面复制或扫描整个网格；
  preparation/capture 为 O(artists + faces)，每个相关面的包含查询为 O(3)。

## 验收与交付

- [ ] 显式三角面、triangulation wrapper、自动 Delaunay、逐面/逐顶点输入及等数量优先规则。
- [ ] 原面槽洞、同均值不同面、mask、无效值、旧均值舍入/溢出与 normalization-only 重绘。
- [ ] 实际非零三角区域、bbox 空角、重叠后绘制优先、孔洞透选、反轴/Log、plot/margin
  边界与完整覆盖 plot 的几何锚点。
- [ ] 原数组与 getter 别名、跨调用/跨 kind/未知 prepared、image/inline/remove/clear、旧 Drawing。
- [ ] 同目标旧 SVG、独立 Native/JS 实际 XML 与命中 oracle、必要四目标和 adapter。
- [ ] 真实双卡 DOM、默认和中文均值提示、更新/掩码/图例/重挂载/CSS/375px。
  浏览器以实际 Polygon 的 `isPointInFill` 和真实 plot bounds 为独立依据。
- [ ] 中央真实 info/fmt/结构、一次完整回归、既有浏览器示例与静态示例。
- [ ] clean 包、实际 Mooncakes、全新无 workspace 安装、GitHub 四附件完整下载与固定源码审计。

只读准备已用精确旧0.12源运行3个 Native/XML 基线：掩码原面槽0/2/3对应值10/30/40，
顶点均值5/7/9/7；facecount等于vertexcount时仍按逐面值2/5/11/17处理。
这些旧图均没有语义 targets，返回Unit且没有Container。有关tripcolor的完整源码块与
0.13正式源逐字相同；新0.13实际基线仍需单独冻结，不能把旧基线当作新交互验收。

producer在独立工作树负责core/IR/Scene/backend/Drawing/tooltip、own tests和专项指南。
Root负责版本、中央文档、consumer、UI与真实交付；browser先做ignored草稿，reviewer先冻结
精确旧基线，收到coherent实现SHA与明确授权后再执行新语义或tracked七文件部署。

[执行检查点](MIGRATION_STATUS.md) · [当前能力](CAPABILITIES.md) · [路线图](MIGRATION_PLAN.md)
