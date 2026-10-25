# M16：极坐标与雷达的原始数据提示

2026-10-26启动，目标0.17.0。基线为已实际交付的0.16.0正式源
`99964396315269ebf7765c7437ab7258aa339b8e`。已授权实现，尚未验收。

本片接续M15静态图，补原始角度、半径与雷达类别的点提示，以及与实际圆盘一致的命中范围。
保持现有出图与调用方式，应用可继续更新数据、切换方向/系列和重挂载。

## 固定范围

- [ ] 一个`HitKind::Polar`；原theta弧度、原radius/value、原panel/artist/input索引与调用label。
  雷达类别按该次radar调用及原i快照，不从后来修改的刻度或图例推断。
- [ ] 两种命中模式都按投影后原采样点的实际物理距离；不沿横轴或角度跨圆吸附，不在弦上插值。
  零半径保原角度，缺失保原索引洞，闭合不增加第N个样本，域外中心不生成命中点。
- [ ] 只捕获实际可见散点和非零绘制弦所关联的端点。无绘制线段的孤立点、零线宽、零尺寸等保静态。
  重合点沿既有稳定选择次序，不合并原数据。
- [ ] 同次绘制采集真实cx/cy/R，Drawing按候选panel做圆盘门控；巨大命中半径也不能越过圆盘，
  同图普通面板或另一极坐标面板仍可命中。圆记录随帧不可变，无SVG反推观测值。
- [ ] Rabbita默认提示显示Theta (rad)/Radius及可选Category；可自定义中文/单位。
  私有实际CTM映射处理受支持的均匀缩放、letterbox、容器和SVG自身border/padding；
  极坐标高亮也裁剪到本帧圆盘。375px布局与现有图表交互保持。

本片不含线段插值提示、雷达填面、极坐标柱形、缩放/拖拽、非线性径轴或一般投影框架。
不承诺非均匀或skew CSS变换的新距离语义。具体责任与小接口在执行检查点所指active scope冻结。

## 实施与验收

- [x] producer24源、browser14源/2依赖与独立10源的短只读设计；原theta/r、类别调用归属、
  逐panel门控、CSS viewport及高亮边界已定；草案未当成实现通过。
- [x] M15 actualaudit30f5fc确认正式源999从builder到网络审计HEAD/gitclean不变，已解除冻结。
- [ ] 独立owner从正式999创建`codex/m16-polar-interaction`；早期coherent核心/预期接口和少量实际Native新场景。
- [ ] 原i/theta/r/category、零/缺失/域外/闭合N、旧帧与clear、两mode真实圆盘和混合面板的独立Native/JS核对。
- [ ] 真实双卡DOM提示/选择、数据/方向/四图例/重挂载、中文格式、圆形高亮、整数事件与375px/letterbox/border。
- [ ] 外部consumer、必要四目标/一次中央全套、clean包及实际Mooncakes/registry/GitHub交付。

[当前执行检查点](MIGRATION_STATUS.md) · [极坐标指南](POLAR.md) · [能力](CAPABILITIES.md) · [路线图](MIGRATION_PLAN.md)
