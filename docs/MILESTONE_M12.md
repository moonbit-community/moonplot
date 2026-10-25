# M12：填色等值区、孔洞与区间提示

创建日期：2026-10-25。状态：**核心与真实 UI 已集成，组合验收中**。目标0.13.0，当前正式版本0.12.0。
从正式源`ae1ce6b4c45d17fd2c1fbee388525f5c7f713307`继续，补已有`contourf`、`tricontourf`及三角网格wrapper；不重新计算标量场或复制全部Matplotlib参数。

## 能力合同

- [x] 新增`HitKind::ContourF`及`HitShape::FilledRegion(FilledRegion)`。区域值私有保存环和填充规则，构造及getter深复制；Drawing及旧帧不能泄漏可变别名。
- [x] 单Polygon沿真实SVG的nonzero规则，多环Compound沿真实evenodd规则；一次捕获全部实际写出的环，孔洞和分离岛屿之间的空白保持正确。
- [x] `interval`为原标量clipper实际使用的有限上下界，`value`为代表值，`series`为原call名称。保留旧有限layer值；仅有限端点相加溢出时安全平均，不改原ContourSet getter算术，不伪装鼠标处的场值。
- [x] `point_index`为原逻辑band/color槽，保留空band与extension槽洞；不等于`layers()`去空去重后的索引或`segments()`展平的环索引。`artist_index`为当前实际Polygon/Compound。
- [x] 两mode只命中plot内真实填色区域；不把bbox、每个环分别填面、孔洞或XNearest整面板当作命中。旧SVG有可见margin填色，margin保持静态，不虚构axes clip资源或改静态裁剪。
- [x] 有可见实际非零边时，数据锚点取该边clip前安全中点，屏幕锚点取可见片段中点；无边穿过plot时，一次中心containment证明覆盖后，屏幕取plot中心、数据取首实际非零边中点。二者描述区域几何，不冒充原样本或逆尺度配对坐标。
- [x] 默认提示显示Range和Representative，不展示几何XY；保留自定义日期、单位和中文格式入口，不增加ContourFInfo或伪Area BandInfo。
- [x] 保原签名、levels/layers/paths/mask/corner_mask/locator、Container、颜色、静态legend与正常同target SVG。额外仅修空/无band调用串改前一series，复用条件名称记录。
- [x] 身份/内容/prepared context不匹配保守静态，无generic Polygon回退或拆线后归属复活；维护remove/clear/image/inline及已交付Contour/Barbs语义。
- [x] 额外快照、guard、捕获与cursor准备为O(总生成几何＋artists)，pointer查询为相关边数；Region有效性预验证缓存，不每次查询再全量验证或每边复制整区/网格。

## 验收与交付

- [x] 原逻辑槽、有限under/normal/over范围、empty extensions、同值不同band、自动levels及direct/wrapper。
- [x] 实际nonzero/evenodd、多环孔洞、分离岛屿与bbox空隙、孔洞透选更早填色、实际paint顺序和两mode。
- [x] filter后实际写出几何、mask/非线性轴/反轴、透明/零宽填色、plot与margin边界及两类锚点。
- [x] Region输入和两层getter别名、公开Drawing构造、旧帧、identity/content失配、生命周期与有界多边压力。
- [ ] 精确0.12源的同target旧SVG、独立Native/JS实际XML及必要四目标/adapter。（owner四目标、adapter与8份旧SVG已过，独立最终packet待闭环。）
- [x] 真实双卡DOM，默认/中文区间代表值、更新/图例/重挂载、CSS与375px；Chrome以实际Path/Polygon的`isPointInFill`及plot边界作独立oracle。
- [ ] 中央info/fmt/结构/一次全套、既有Chrome、clean包、实际Mooncakes/registry与GitHub完整下载。

只读准备已完成两个正式0177旧fixture的Native和实际XML：规则网格5个返回环绘成3个band artists；三角wrapper的两离散环岛有4个返回环、1个Compound。两孔洞和中间bbox空白不着色；两SVG均无axes clip资源。它们是旧行为资料，不算M12新功能验收。源码与Region设计已独立复核，生产从正式0.12源开始。

producer独立工作树负责core/IR/Scene/backend/Drawing/tooltip、own tests及专用指南；Root负责版本、中央文档、consumer、UI和交付。browser先做ignored草稿，独立review先冻结旧基线，收到coherent精确SHA和明确授权才执行新语义验收。

[执行检查点](MIGRATION_STATUS.md) · [能力](CAPABILITIES.md) · [路线图](MIGRATION_PLAN.md)

primitive 与 actual Scene 捕获已合入 Root `5af344b`，包含 mixed collinear ring 与极远坐标 BBox 两个真实反例修复。真实双卡 UI 首次 Chrome14/14、0pageerrors，图片已目视；外部 consumer Native、JS、实际 info/fmt 与浏览器41项均通过，0pageerrors。

独立 exact c02 组合复审曾发现 blocker：ContourF metadata 配到实际 Line 时，raw 与 unproven prepared context 错误回退为 generic Line targets，预期保持静态。统一 actual artist 类型域 gate 已合入 Root8bd1f93，owner Native/JS 定向回归过，独立14a delta Native/JS各3组均过，原blocker已解除；独立实际XML最终packet、中央全套与正式发布仍待闭环，不能把局部通过视为 M12 完成。

最终producer `f91dab853b214da3b5b5a2c5d45b0a729d4fd86a` 的31文件含18份生产与3份接口已与Root逐字核对；生产自guard修复14a不变。受影响四目标各184/184、adapter46/46及8份同target旧SVG均过。Root中央actualinfo/fmt和13JS已过，唯一中央full30284正在执行；独立delta复审已通过，实际XML最终packet和正式分发仍未闭环。
