# MoonPlot 当前执行检查点

更新时间：2026-10-26（Asia/Shanghai）。恢复先读本页，按下一动作继续。

## 用户决定与范围

实用MoonBit画图库，按能力/场景持续对齐；用户要求“一直往后对齐”。不恢复全部Python API克隆，
不编造整体百分比。已授权合理复用、独立subagents、coherent verified Git commits/push及实际
Mooncakes Lampese/统一module与GitHub交付。root facade/owning tests/mbt<2000/实际info-fmt及结构检查保持。

## 当前：M17 极坐标柱形／玫瑰图实施中

[M17](MILESTONE_M17.md)目标0.18.0，正式基线是已交付0.17.0的
`cedbf1651a8645fe3b77cce91fdfaa708437bdd0`。当前module/consumer仍0.17.0，不提前冒充新版本已交付。

- [x] 必填单scalar角宽弧度、中心对齐、bottom0/fill-only；原θ/r/i/calllabel、单call颜色。
  等长/finite0<width<=2π在append和颜色cycle前原子校验；missing/负r保洞、r0无面积。
- [x] 复用既有Bar/IR圆盘/CTM；新增PolarBar种类与实际扇区面积命中，不增Info或伪interval。
  r>显式max的可见填面可提示rawr，先min后比避免溢出；full2π真圆、hugeθ先约简。
  宽度独立于capture guard可静态画变异typedBar，手工Bar无角宽仍checked unsupported。
  两mode按面积，圆逐候选gate；只窄补newBar上的laterPolar物理overlay，不改旧Pie/普通tie。
- [ ] Producer在独立m3-donut工作区从formalcedbf16建codex/m17-polar-bars，owns Scene/IR/SVG、
  own tests/接口和POLAR.md；先coherent snapshot再affected四目标/RabbitaJS/旧SVG控制。
- [ ] Browser在独立ignored工作区准备既有polar页面接入；owns示例UI/runner/PNG，等coherentcore再实际DOM。
- [ ] Independent在m4-filled-area ignored准备必要数学/源guard核对，等coherentcore再Native/JS；不写生产。
- [x] Root底层Drawing与默认tooltip首步：PolarBar enum、逐候选circle gate、真实扇区面积、
  仅newarea允许laterPolar物理overlay。fractional(cx200,cy129,R43.8)西边界实际before71387
  0/1后窄修通过；旧Pie严格Sector不变。四目标Drawing各64、RabbitaJS54及actualinfo/fmt/
  structure/diff33374均终0，唯一接口差异为HitKind::PolarBar。原自写pattern缺括号编译失败已单列保留。
- [ ] Root owns外部consumer、docs/version/中央、实际分发。已有M16全套不重跑，M17源变化才针对验证。

精确下一动作：Root已接手Drawing/tooltip并通过首步验证，给producer可编译patch以继续Scene/IR/SVG。
等待producer首个coherent snapshot后并行browser/reviewer。M16已交付docs已提交并push373715b（19212终0）。Root已在ignored consumer-draft准备静态/DOM与focused JS用例，
只有JS语法检查通过，尚未编译新API或当作接入通过。根目录不新增杂文件。active scope与draft/15源prep保ignored
`.moonagent/checkpoints/M17-polar-bars/ACTIVE_SCOPE.md`；这里只记实际状态，未验收不勾完成。

## 最近已实际交付：M16 / 0.17.0

正式源cedbf16，clean22726、publish92686、publicsuccess935e50、freshregistry37462、
GitHubcreate44289和whole92054均终0；queued两次只读等待、未重复publish。
612安装源同正式ZIP，四static/Chrome59/8整数events；GitHub四附件字节/大小/digest/tag完整核验。
finalaudit2bb881在2026-10-25T18:36:13.211245Z确认formal builder至network audit全程HEAD/gitclean
不变后解除freeze。0.17.0已公开可安装，不存在M16剩余实现/验收或网络live。

M16本地：owner34源61proof、independent16源110proof3archive、UI10源70proof，Root核SHA；
Native67/其余66、Rabbita51；四目标全套9480：W/WG22658、Native22662、JS22718，
23steps与16Chrome204均0。closed原0/strict r>max/fractional circle实际反例均保before并闭环。
全部源、日志、清洁归档与审计保ignored `.moonagent/checkpoints/M16-polar-interaction/`；
[完整M16历史](archive/migration-status-through-2026-10-26-m16.md)保详细决定/结果及旧历史链接。

## 现场与约束

Root唯一存活session43005/PID70622是8765预览；M16发布/核验均终态，无需重跑。
canonical M16 polar JS/截图已更新；本轮未刷新前台tab，不声称用户当前已看到新图。
三个agent在自己的目录工作，禁止Root tracked互写，Root合并通过SHA和coherent提交。
master，SSH origin git@github.com:moonbit-community/moonplot.git；新branch codex/。
一个module，核心不importUI；Rabbita JS-only，pins0.16.7/XML0.5.0保持；README.md symlink保留。
[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
