# M10：Barbs 风羽图交互

创建日期：2026-10-25。状态：**已明确授权独立实现，尚未验收**。目标0.11.0，当前正式版本0.10.0。
只扩已有barbs及barbs_with_options，不扩Streamplot、一般样式参数或Matplotlib完整API。

## 固定合同

- [ ] 保留旧签名、Unit、实际component顺序和无Container；后项无效数据保留有效前缀，不改为全call原子验证。
- [ ] 仅新增HitKind::Barbs，复用只读VectorInfo U/V，value原V、原输入i、原pivot前x/y及call label；middle/tip位置不冒充tail。
- [ ] shaft/羽枝捕获实际非零Segment；旗面复用真实三角形Quadrilateral(a,b,c,c)，可见描边收三真实edge Segment；calm复用实际filled disk的全Sector，无新Shape或Part。
- [ ] 两mode均physical；无通屏XNearest、虚构风根/端点观测或三角bbox；保留实际component artist身份与索引洞。
- [ ] 共享call表与常数component view，O(N+P)，每part只校验自己的1/2/3点；不能每component全量复制/扫描N，也不能因后项无效移除有效前缀。
- [ ] Line prepared-context匹配source才给语义；变更path/identity或缺context provenance保守static，不退回错误的generic Line/Scatter端点提示。

## 两个已证实修复

- [ ] zero/empty/fill_empty=false无新component时，不串改前一普通Line或旧Barbs的series；保留旧静态auto-legend条目与颜色行为。
- [ ] advanced在to_int与展开循环前拒绝非finite派生magnitude/effective值、不可表示的flag/full/总component计数，复用InvalidQuiver错误。正常计算顺序/正常SVG不变；不新增任意小数量cap。
- [ ] basic有限U/V导致norm溢出时仍保留实际合法shaft；tiny norm underflow、无效scale与calm原行为保持，不修造不存在的羽枝。

## 验收与交付

- [ ] basic/options原数据、tail/middle/tip、flip、flag/full/half/rounded calm、zero/length0和width0的真实几何。
- [ ] 旗面fill/stroke与calm填充分别按实际paint判断；one-vertex polyline无Segment，Log仅羽枝合法、clip/反轴/非线性按实际capture。
- [ ] input副本/identity/content/旧Drawing、samecolor/多panel、图像/contour/Line移除、有效prefix与既有Line行为。
- [ ] 每target旧/新SVG逐字基线、独立实际XML/公开consumer复审、必要四目标与adapter测试。
- [ ] 可运行DOM，真实shaft/羽枝/旗面/圆内触发原X/Y/U/V、独立显隐/更新/重挂载、CSS/letterbox与375px。
- [ ] 中央info/fmt/结构/全套与既有浏览器回归；clean包、实际Mooncakes/registry与GitHub四附件完整下载。

定点只读Native62148保存8SVG及prefix/label/count controls；目前都是旧generic Line/Scatter目标，不能算Barbs交互已验。
高级Inf→Int2147483647仅安全计数probe，未实际运行巨量循环。空Barbs串改前线series已公开复现。
producer从正式0.10精确SHA起新分支实现；Root管版本/中央文档/consumer/UI/全套/发布，独立review与UI先仅准备。
详见[执行检查点](MIGRATION_STATUS.md)、[能力](CAPABILITIES.md)与[安装](PUBLISHING.md)。
