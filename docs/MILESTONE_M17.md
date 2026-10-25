# M17：极坐标柱形与玫瑰图

2026-10-26启动，基线为已交付0.17.0正式源`cedbf1651a8645fe3b77cce91fdfaa708437bdd0`，
目标0.18.0。当前仅范围与分工已固定，核心、DOM和验收均在推进；不将设计当成可用功能。

## 固定范围

- typed `PolarAxes.bar(theta, radius, width~)`，统一角宽为弧度，中心对齐、零起点填充扇形。
- 原θ/r与输入索引、系列名保持；非有限或负半径保洞，零半径无正面积命中。
- 自动径上限合并所有极坐标系列；显式上限裁掉域外填色，可见部分仍显示原始值。
- 同次SVG绘制收集真实扇形区域；两种命中模式均按面积，空角不因大hit_radius产生柱命中。
- 复用M16圆盘、实际CSS映射与tooltip；完整2π为真圆，方向/偏移、数据更新、图例和375px可用。

角宽首片要求有限且`0 < width <= 2π`，与长度错误在追加图元/推进颜色前原子拒绝。
半径为原值的线性高度，面积自然随平方变化；不自动分箱、归一化或开平方。
首片不含可变宽数组、每柱颜色数组、bottom/堆叠、雷达填面、非线性径轴或通用投影框架。

## 实施与验收

- [x] M16实际交付已核验，正式基线与最小合同固定，三个独立工作区分工。
- [x] Drawing/默认tooltip底层：PolarBar、圆盘门控、扇区面积及laterPolar物理overlay；
  fractional圆实际失败保留，窄舍入修复后Drawing四目标各64、RabbitaJS54通过。
- [ ] Scene/IR/SVG核心、原始数据归属；own四目标及少量旧SVG控制。
- [ ] 独立Native/JS几何与来源核对。
- [ ] 真实RabbitaDOM、hover/click、更新/图例/重挂载和375px。
- [ ] 外部consumer、生成接口/格式/结构、中央相关回归。
- [ ] clean包、实际Mooncakes与GitHub交付。

[执行检查点](MIGRATION_STATUS.md) · [极坐标指南](POLAR.md) · [能力](CAPABILITIES.md)
