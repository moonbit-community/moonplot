# M15：极坐标折线、散点与闭合雷达

2026-10-26启动，目标0.16.0。基线为已实际交付的0.15.0正式源
`67c095118a45d27f6f3ab3d8fb3d3dff2a0e8877`。已授权实现，尚未验收。

本片先交付可用的静态 SVG 和可组合 Rabbita DOM；应用可以更新数据、切换系列和重挂载。
原始角度/半径的点提示与圆盘指针门控留下一片，不生成笛卡尔观测式提示。

## 固定范围

- [ ] typed `PolarAxes` / `PolarDirection` 与显式 `Figure::add_polar_axes`；
  极坐标折线、散点和至少三维的闭合轮廓雷达，支持标题、图例、角/径刻度标签。
- [ ] 原theta/r数据保留在 Scene；可选投影 IR 与专用 renderer 复用既有 Line/Scatter、
  样式和 SVG writer，不引入一组通用 Artist 变体或投影字符串框架。
- [ ] 角输入为弧度，默认右为零、逆时针；有限 offset 与 typed 方向可设置。
  非方形面板使用同一物理半径，圆心/半径统一决定数据、网格、边框和真实圆形 SVG 裁剪。
- [ ] 线性径域从0到rmax；显式上限有限且大于0，自动取联合有效非负样本最大值，
  空/全零回退1。非finite/负半径作为缺失，折线断段、散点跳过，零半径合法。
  超界数据保原值并由圆盘裁剪；无法有限投影时保守断段。
- [ ] 折线连接投影后样本的直线弦。仅整组有效时绘制合成闭合边，原数组仍为N点；
  雷达不增加额外原样本、不自动旋转面板，同面板各系列分类表须一致。
- [ ] data-only circle clip资源按面板隔离。整个polar分支无命中目标；
  混合 Figure 中普通面板保持原范围、布局、provider/cache和交互行为。
  不支持的笛卡尔设置或图元在checked渲染明确报错。

本片不含雷达填面、维度独立归一化、非零rmin/环域、Log径轴、角扇区、任意图元投影、
插值曲线或新的hover元数据。具体实现责任合同在当前执行检查点所指的active scope中冻结。

## 实施与验收

- [x] 只读准备：producer31必要source SHA与A/B设计，独立五角度公式、方向和真圆/闭合反例要点；没有把准备当新功能通过。
- [ ] 独立owner从精确67建立`codex/m15-polar`，提交首coherent核心/接口及三实际场景。
- [ ] 非方形cardinal/非cardinal、offset/CW、两组五维雷达、缺失/负/零/超界数据的真实SVG/圆形clip与原数组验收；普通面板控制保持。
- [ ] bounded四目标、独立Native/JS精确源数学/XML复审、actualinfo/fmt和结构检查。
- [ ] 双卡真实DOM的数据更新、独立图例、重挂载、资源隔离与375px布局；不出现虚构hover。
- [ ] 独立consumer、一次中央全套与既有示例、clean包及实际Mooncakes/registry/GitHub交付。

[当前执行检查点](MIGRATION_STATUS.md) · [能力](CAPABILITIES.md) · [路线图](MIGRATION_PLAN.md)
