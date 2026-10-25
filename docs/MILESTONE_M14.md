# M14：连续流线与生成场值提示

2026-10-25启动；目标0.15.0，当前正式版本0.14.0。精确基线
`1215721c9e63e7036be9580ecd1560e7eabe0be3`。本轮已授权实现，尚未验收。

沿现有流线的实际连续线段查看双线性采样的U/V与可选颜色标量，保留原种子尝试槽和生成边编号。
复用既有streamplot/mesh/style-grids入口和积分器；不复制完整Matplotlib参数集。

## 能力与边界

- [ ] `HitKind::Streamplot`、readonly `StreamplotInfo`（seed_index/u/v/color_value?）、
  `HitInfo.streamplot`与facade factory；通用value恒为V。默认提示U/V与真实存在的Color value，
  自定义提示可格式化中文与单位。字段表示生成边中点的采样，不冒充原始网格观测或速度模长。
- [ ] 保原seed尝试槽与joined trajectory的原edge槽，包括被拒绝seed与样式空洞；
  artist_index是实际body Line，series为原调用。实际成功写出的非零线段在plot内物理命中，
  两mode不按横轴跨空白吸附；preclip数据采样中点和clipped屏幕锚点分别保留。
- [ ] 保旧有限 `(a+b)/2` 与原双线性采样运算；颜色标量来自同次旧style评估，
  不从色值反推或在鼠标处重采样。无法有限证明的新增语义保持静态，不新增异常。
- [ ] 一份共享轨迹/edge数据，whole-Line一次identity/content检查、split Line只查本段，
  constant offset对齐actual valid runs；保持known-slot/cursor、旧Drawing和全部现有图类。
  geometry/guard/capture保持O(points+edges)，新增场采样仍使用既有线性axis locator，
  lookup成本单独为O(edges*(nx+ny))，不宣称整个构造严格线性。
- [ ] 实际箭头shaft/head/bar（含Set未返回的shaft）统一owned-static，阻断旧generic y Point提示；
  保全部样式/paint/返回Set与一个完整Container。箭头组件语义留后续片。
- [ ] 不匹配或未知prepared context保守静态并保provider completion，不扩LineContext API；
  维护image/inline/remove/clear与跨type/跨kind归属。旧integrator、seeding/occupancy、
  style/norm、签名/返回值、Container与同目标SVG保持。

## 当前实施与验收

- [x] 只读准备：精确121 Native98134/JS27224各三旧fixture、六actualXML/SVG通过；
  旧generic Point目标14/18/17、value为生成y，各1Container；返回数组与实际paint有不同索引。
  不是新语义验收，也没有把旧87a Native重标为121。
- [x] 实证空/拒绝stream调用串改前series：owner beforeNative87412 terminal2；
  窄修09b6353后82399 terminal0（stagnant/过短两子例），保空Set/1Container/静态legend。
  Root将在M13网络audit解除freeze后按coherent step合入。
- [ ] producer首coherent Native core与三个场景12/12/6真实body Segment、原seed/edge/U/V/color及旧SVG。
- [ ] bounded四目标/adapter、独立Native/JS语义与actualXML、alias/生命周期/paint/prepared控制。
- [ ] 双卡真实浏览器、默认/中文提示、更新/颜色可选/原seed空位/箭头静态、legend/remount/CSS375。
- [ ] 外部consumer、实际info/fmt/结构、一次中央全套与既有示例、clean包/registry/GitHub实际交付。

producer在独立managed branch `codex/m14-streamplot`负责core/own tests/专项指南；
Root负责中央文档、版本、外部接入与发布。browser当前只有ignored草稿，reviewer旧baseline已freeze。
接到coherent SHA和Root明确授权后才执行新语义或七UI文件部署。

[执行检查点](MIGRATION_STATUS.md) · [能力](CAPABILITIES.md) · [既有流线输入与积分](STREAMPLOT_PARITY.md)
