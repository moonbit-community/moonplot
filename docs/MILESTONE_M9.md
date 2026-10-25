# M9：Quiver 向量箭头交互

创建日期：2026-10-25。状态：**核心与外部接入演练通过，独立复审与DOM验收中**。目标0.10.0，当前正式版本0.9.0。
用户要求持续按绘图能力推进；本片复用已有quiver，不增加Barbs/Streamplot、向量长度或一般箭头样式参数。

## 固定合同

- [ ] 保留既有quiver签名、Unit返回、单artist/Container、非finite整call报错与实际SVG。
- [ ] `HitKind::Quiver`，只读`VectorInfo{u,v}`与可选`HitInfo.vector`；原x/y及原输入i不变。
- [ ] 通用`value`明确为原V分量；默认提示显示X/Y/U/V，不把屏幕箭长或溢出的norm当观测值。
- [ ] 复用实际绘制的shaft和两wing三个Segment，不虚构填充三角面；两个mode均只命中实际线段。
- [ ] 零向量、尺度域外、端点溢出和clip保持旧绘制行为与原索引洞；原数据不被clip边界替换。

## 实现与验收

- [ ] points及vectors身份、不可变call源表和实际provider/context守卫，变更后保守静态，无泛化Line回退。
- [ ] 同次实际三线段捕获；共享源表与逐样本O(1)回调，无逐箭全量复制/扫描。
- [ ] 独立旧SVG、原u/v与负值、反轴、非线性、clip、zero与normoverflow有限分量案例。
- [ ] 普通Line/Scatter/其他图层、同色多call、输入副本/旧Drawing、实际paint/clip与component身份不倒退。
- [ ] 可运行DOM示例，真实shaft/wing触发默认/自定义提示，独立显隐、更新/重挂载、CSS/letterbox与375px。
- [ ] 中央接口/fmt/结构、必要四目标与既有浏览器回归；独立公开consumer/实际几何复审。
- [ ] clean正式包、实际Mooncakes全新安装、四目标静态/浏览器消费与GitHub四附件完整下载。

m3_donut负责精确正式0.9源上的生产实现；m4_area准备独立oracle与旧SVG；m3_browser先只写ignored草稿。
Root负责合入、公开consumer与组合测试、版本/文档和实际发布。实现、验证、发布分别记录，不提前标完成。
详见[执行检查点](MIGRATION_STATUS.md)、[能力](CAPABILITIES.md)与[安装](PUBLISHING.md)。

## 准备记录

- [x] 正式0.9源固定；producer定点旧行为packet/6SVG与16源SHA已收，全部与Root一致，实际旧targets0。
- [x] Root独立公开consumer旧Native3SVG保存通过，实际线段9/9/3和手算shaft坐标相符；此项只验证基线，不是M9命中验收。
- [x] producer首核心e475已合4403974：129task check/Native10项/旧6SVG控制/info/fmt/结构通过。
- [x] Root实际外部dirty演练静态四目标+Chrome28项/0errors，三组合四目标各3/3；三个自选旧SVG逐字相同。
- [ ] producer四目标/adapter最终定向、独立复审、DOM专项与中央验收。

UI隔离编译通过，真实Chrome首轮发现runner dataset数字连字键错误，已定位修runner重跑，无生产反例；不将未完成UI标验收。
Root外部fixture已使用真实新接口通过；所有dirty演练只保留开发记录，不上传。
