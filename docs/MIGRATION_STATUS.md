# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复会话先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力与场景对齐，不复制完整Matplotlib API/Python动态协议，不恢复旧D55指数，不编造完成百分比。
- M1至M8及0.3.0提示片已验收交付；用户要求“一直往后对齐”，现在推进M9 Quiver。
- 用户授权合理复用、独立subagents、小步本地commit和正常push至moonbit-community/moonplot；本地commit授权2026-10-23。
- 2026-10-24用户明确授权实际发布Mooncakes，前缀Lampese/，核心与Rabbita为单一Lampese/mathplotlib module。
- 根facade api.mbt；消费测试tests/api；全局配置tests/integration；实现/白盒归拥有包，维护mbt<2000行。

## 当前切片：M9 Quiver（已明确授权独立生产，尚未验收）

- 范围[M9](MILESTONE_M9.md)，目标0.10.0，Root版本仍正式0.9.0；仅Quiver，不扩Barbs/Streamplot，不重开19图调查。
- 固定：HitKind::Quiver；只读VectorInfo{u,v}+HitInfo.vector?；data原x/y、原输入i、通用value明确原v；默认提示X/Y/U/V。
- 实际旧箭头是shaft+双wing三个line（7SVGpx/0.55rad），只收三个实际Segment，无填充三角；两mode都physical，无XNearest fallback。
- 保留静态SVG、旧签名/Unit/单artist与Container、非finite整call报错；zero/scaleinvalid/endpoint overflow/clip跳过保留原i洞。
- points+vectors身份及immutable源/实际prepared-context必须guard；不得用error/band/fraction假装U/V，不改变global finite政策。
- normoverflow可真实发生：x=y=-8e307,u=v=1.7e308在SymLog可画但norm Inf；首片不新增magnitude接口，不截断、不假0。
- m3_donut定点只读packet已收Root M9-quiver/design，16源SHA与正式0.9 Root精确匹配。Native20060 terminal0保存6旧SVG，旧targets0，未来panel交点只作预期9/9/3/1/1/3。
- 已明确授权m3_donut从正式0.9 source95a34c3dc154f48fb3b83b7f37ecad3a0e8273c8在own managed worktree建codex/m9-quiver，拥有核心/API/IR/scene/backend/tooltip/own测试与QUIVER_INTERACTION.md。按固定合同实现、定向4目标/adapter、真实info/fmt/结构后coherent commits；不跑全库全套、不push/publish/新agent、不动Root。
- m4_area已被明确授权own ignored M9-quiver-review独立baseline/oracle准备；m3_browser已被明确授权ignored UI草稿/实际DOM测试设计；review/UI均不可写Root tracked、commit/push或提前生产。
- Root ignored M9-quiver/consumer-draft/static-vector.mbt是未编译草稿：原样本/输入副本/zero洞/actual Segment/反轴/跨视图原起点与u/v，不作为测试通过。
- 精确下一动作：M8实际发布闭环全部完成，交付文档commit/push → M9 producer实际实现/精确commit → Root合入+独立消费/组合与版本/文档 → 精确commit独立复审+显式UI部署 → 中央验收/发布。
- Root无测试/发布/下载live；唯一有意预览8765/session43005/PID70622。producer已授权M9生产，review/UI仅准备，无M8未决blocker。

## 最新交付：M8 / 0.9.0（2026-10-25）

- [x] 实际Stem rod/head携原head/x/y/i与BandInfo(bottom,head,horizontal,false)，component身份、N+2/Unit/静态保留；共享源表/常数view/heads一次guard，双mode只physical。
- [x] owner cf4de322（Root fe9de53）四目标定向各133/133、adapter38/38；10旧Stem+14旧离散SVG逐字；Root三组合四目标各3/3，外部dirty演练4目标/Chrome25（未上传）。
- [x] 独立m4 cf4de322：Native/JS各23公开组、各8实际SVG/23target匹配真实primitive、旧Native8SVG逐字、Scene2+context1全部terminal0，无blocker。4096datum/8192targets两端过；11生产源SHA与Root精确匹配。
  证据Root .moonagent/checkpoints/M8-stem/final-review/review.md/results/geometry/source-manifest与root-final-match，无live。
- [x] 七文件Stem三卡UI292e3b7已freeze，isolated38963/info/Chrome90130首轮12/12/0errors；Root已目视desktop/mobile，actual7head事件匹配canonicalClient。
  asset1280×1755/96620bytes/SHA2b12269986b080c4dcb0c47f11dff11f3fde25b787d01d19dbaad4a55b6cd4d3，JS4504167bytes/SHA3768e880572a77db935bf3cae8293efdc31238b9642b23278b83b1ec6d0dec14。
- [x] Root中央40879 terminal0：info/fmt/9JS builds；Wasm/Wasm-GC/Native各22505/22505、JS22550/22550。
  九Chrome110项/0errors；三native SVG解析，preview6886/gallery14246与资产逐字；40MD/488链接、结构/diff通过，默认/isolated JS与8765实际HTTP200逐字一致。
- [x] 正式源95a34c3dc154f48fb3b83b7f37ecad3a0e8273c8已push19158 terminal0，clean builder21070 terminal0/dirty=false，外部静态4目标+Chrome25。
  模块ZIP2179542bytes/560files/SHA352a7d165124952f0d13bf988e60c9927991c88a1a1d8fbcced6fbfa008562c5；sourceZIP2212594bytes/577files/SHA99934cca03b701938b30fe18acf0a42844b5ffb9fa6509002b3acf26e52d3a39。
- [x] 实际publish84366 terminal0/200；manifest首次queued，随后success/has_package=true/yanked=false、checksum与正式ZIP相同；未重复publish。
  registry51252 terminal0：全新无workspace、560安装源逐一相同、静态4目标/Chrome25全部通过。
- [x] GitHub创建55397、完整下载30349 terminal0；整个gh download完成后逐字比较四附件/远端digest和size/tag源码SHA全过。
  https://github.com/moonbit-community/moonplot/releases/tag/v0.9.0 。formal builder至网络闭环无tracked写入/commit，dirty演练未上传。
- 证据Root .moonagent/checkpoints/M8-stem/：final-validation-progress.json、各browser-final-*、release-final/artifacts/download-check、registry-consumer/report、release-live.json（complete，无live）。

## 早期交付与源码地图

- M7/0.8正式2f7aeb77c70499979b43273d1ea8a0b0504ba040：Step/Stairs/ECDF，中央各22488/JS22531/Chrome98；555安装源/4目标Chrome23与四附件全验。
- M6/0.7真实Hex数学分箱修正与Violin、M5/0.6 meshes/hist2d、M1至M4均已正式交付，无需重验。
- [M8之前实施记录](archive/migration-status-through-2026-10-25-m8.md)、[M7历史](archive/migration-status-through-2026-10-25-m7.md)、[M5历史](archive/migration-status-through-2026-10-25-m5.md)、[早期历史](archive/migration-status-through-2026-10-25-m4.md)保留逐步命令与失败定位，旧tag/附件不移动。
- 当前预览http://127.0.0.1:8765/rabbita/stems.html，实际正式0.9默认JS已构建/验证。服务若connection refused才重启并更新session/PID，不复活旧测试服务器。
- 主master，SSH origin=git@github.com:moonbit-community/moonplot.git；独立分支前缀codex/。
- JS-only接口用tools/update_interfaces.py真实compiler生成；最后info/fmt、预期mbti审查、python3 tools/check_structure.py与适当测试。

[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
