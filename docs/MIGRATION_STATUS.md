# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，以能力/场景对齐，用户要求“一直往后对齐”。不恢复全Matplotlib/Python动态API计划，不编造整体百分比。
- M1至M13及0.3.0提示片均已实际交付；当前正式Lampese/mathplotlib0.14.0，推进M14连续流线body场值，目标0.15.0。
- 已授权合理复用、独立subagents、coherent verified commits/push到moonbit-community/moonplot、实际Mooncakes Lampese/统一单module。
- root facade api.mbt；consumer tests/api；global tests/integration；implementation/own wbtests留own package；维护mbt<2000行，structure必跑。

## 当前切片：M14 Streamplot（首核心已审合，接入与专项验证中）

- 精确合同 `.moonagent/checkpoints/M14-streamplot/active-scope.md` 与[M14](MILESTONE_M14.md)。基线正式0.14源 `1215721c9e63e7036be9580ecd1560e7eabe0be3`，Root/consumer版本仍0.14.0，不提前bump/发布0.15。
- 复用existing streamplot/mesh/style-grids，只连续body实际非零Segment在plot内两mode物理命中。Streamplot kind、StreamplotInfo{seed_index原尝试槽,u,v,color_value?}/HitInfo.streamplot/facade；point_index原joined edge、artist_index实际bodyLine、series原call；value恒V。u/v为原有限(a+b)/2处旧bilinear场样本，color同次旧style原scalar；不换safehalf/色值反推/鼠标采样/magnitude/原网格观测。默认U/V+真实可选Color value，无观测XY；typed缺失安全Value回退。
- 共享轨迹/edge表，wholeLine onceidentity/content、split查两点+constant offset，actual writer validrun source_start对应；geometry storage/guard/capture O(points+edges)，新field构造保旧locator O(E*(nx+ny))成本，禁止虚称整体线性。actual全部arrowpush（包括Set未返回shaft）owned-static不冒generic y Point；保旧积分/seed/occupancy/style/norm/paint/Set/1Container/SVG。preparedSome无proof静态且保completion，不扩LineContext API；维护knownslot/cursor/image/inline/remove/clear及其他kinds。只有actual证明empty relabel才窄修，保静态legend/cycle/空Container。
- [x] 只读准备M14-streamplot-prep/已freeze：immutable87a Native11259三图/XML、1668源未改；producer-design/两文件已copy，三项Root决定（原midpoint与同次color、旧locator成本、preparedSome静态）已冻结。不是M14新验收。
- [x] 精确121旧baseline：producer Native57725三SVG；独立Native98134/JS27224 terminal0，各三XML/SVG，旧generic Line/Point14/18/17、value=生成y、各1Container、normal==Drawing。Native与旧87a Native逐字，JS是真121实跑；Set/paint/未返回shaft/原edge与midpoint rawUV/color已freeze。reviewer own M14-streamplot-review/source-manifest.json含10窄source/22proof SHA。无新语义旧结果重标。
- [x] 首legacy窄fix owner09b6353c916cd8030e54007eafcb7a0d1355500e（Root完整审后合为99ea119）：empty/rejected call actual Native87412 terminal2 before→82399 terminal0/1test2子例；仅conditionalrecord_series，空Set/1Container/staticlegend保留。原log/旧source保留。
- [x] 首核心owner `b29c70ba6a3d809c84981c13c843eb0bfa95aae6`（parent09b）：24files/3expectedmbti；owner全targetcheck291tasks0、Native85727 4/4，3fixture12/12/6真实bodySegment、seed/edge/artist/series/U1V0/同次color、Set/Container、三Native旧SVG与Set嵌套别名/oldFrame通过，actualinfo/fmt/structure0。Root已逐文件审全部production及3mbti并合为59888a2，25ownerfiles SHA全部相同（producer-first/root-match.json）；这不是M14最终验收。
- 分工：m3_donut在managed own codex/m14-streamplot从exact121负责core/own tests/STREAMPLOT_INTERACTION.md，继续boundedguards/lifecycle/holes/paint/adapter/4targets/guide，不full/Root/version/UI/central/push/publish/新agent。m4_area已精确授权b29 ownignored Native/JS新review，先3actualfixtures再有限反例导向控制，不重跑M13大矩阵。m3_browser已在精确b29/Root598基础明确授权实际7files、隔离JS/info/fmt/Chrome/PNG，不碰core/central/consumer/version/full/release。Root版本/centraldocs/consumer/UI/full/真实发布。
- Root consumer-draft两mbt已standalonefmt0，并部署实际tests/consumer及Model/Msg接线；隔离public-workspace已建立，Native65048/JS25542及e85669/Chrome73264均terminal0，51checks/13新流线整数事件/0errors，actualinfo82d8d7/afab8e、fmt dbd96f与两private接口未变：static12/12/6与publicfactory/alias/oldFrame；app更新U1.5/V.25、rawcolor5+x超norm、rejectedseed0→实际seed1/default中文custom。DRAFT.md列Model/Msg接线；三fixture12/12/6、Set alias/oldDrawing、更新U/V、六原edge/rawcolor超norm、真实openhead静态、双mode空白/CSS375通过。Root首consumer算术括号语法失败718fc8与误cwd后重复运行c10f84保记录并修harness，无production改动。
- 精确下一动作：审收UI7真实packet/PNG并commit externalconsumer/checkpoint；收owner bounded四目标/指南与精确独立review后合coherent最终核心；再0.15版本/中央docs和一次中央全套。已过consumer51无需无因重跑。Root0.15/中央full尚未跑，不重复M13已闭环检查。
- M13 Root tracked freeze已在actual finalaudit后解除；现在可以commit postdeliverydocs与后续coherent M14。postdelivery与M14起始b00fe95已push terminal0（79249），Root最新59888a2，origin/masterb00fe95。Root无验证/网络live；agent M14 core/review/草稿各在独立own/ignored推进。intentional预览8765/session43005/PID70622为triangles.html，实际HTML/JS/三CSS200逐字，open_in_codex queued不声称前台。仅connectionrefused才重启。

## 最新交付：M13 /0.14.0（2026-10-25）

- [x] Tripcolor原面/tuple/均值与两mode actualfill、mask洞/plot边界；原均值/norm/Unit/0Containers/旧SVG保持。empty调用串series、screen舍入打开共线、共同scale丢异量纲三真实反例都保before并修，最终双stage per-axis纯2幂、不改writer/epsilon。
- [x] owner最终a7→Rootff0663c，36ownerfiles=19production/3interfaces/13tests/guide逐SHA同；a7专项Native23/其余22/adapter2，旧bac7 broader205/204/48仅保未改部分。独立原9702证明+新a7 Native43311/JS94555七delta与14旧SVG全过，Fraction源det3共线/4合法；1120XMLquery、Scene4+IR2各6、两M12 helper控制复用，89proof核copy/4archiveSHA核同，无blocker。
- [x] UI81fc697 build16148/info8afcad/Chrome65892首轮14、29整数事件/0errors；consumer19ce678 Native28910/JS/Chrome81253 46、11三角面事件/0errors、actualinfo/fmt。PNG62757bytes/SHAca496caa102ebc47d430ec46ac48d21cebd268bda545f8a8a9da511f347df764已目视，central最终同asset。
- [x] central prelude94492、唯一full81669/267.69s、postlude29009全0：W/WG22611、Native22614、JS22666；14Chrome176/0errors、info/fmt/14JS/三SVG/50MD562links/structure/diff、无意外mbti，未重复full。
- [x] 正式源1215721c9e63e7036be9580ecd1560e7eabe0be3/push16253；clean72205 terminal0/dirtyfalse、四static/Chrome46。module2576088bytes/600files/SHAad6d8b29519c75f25039e961daa2f9a74127bfc05b510fe1ba11a3d457f8c51f；source2627432bytes/627files/SHAa4700d81c5f3d26fa0912e9dcd9b80090e88a24d6eb62df90435a56dbc60ff76。
- [x] actualpublish41626 terminal0/200；首公开88851 success/haspackage/notyanked/checksum一致；全新无workspace registry45660 terminal0，600安装源逐一同正式ZIP、四static/Chrome46过；GHcreate31266、完整download40683 terminal0，四附件bytes/digest/size/tag一致。
- [x] finalaudit08f63a terminal0/2026-10-25T15:42:13.752634Z：Root正式builder至网络audit HEAD121及gitclean不变，无tracked写/commit；之后才解除freeze。[GitHub v0.14.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.14.0)。Root证据M13-tripcolor/producer-final、final-review、central-summary、release-final/artifacts/download-check、registry-consumer、delivery-final-audit/release-live complete。formal-docs-check.json50/562与postdelivery检查分开，不重标。
- 本轮actual ENOSPC119MiB时保失败，仅清旧42targetcache/10.8GiB与agents own可再生cache，JS/publish/源码/log/JSON/SVG/PNG/ZIP全保；可用恢复17GiB，cache-cleanup-result.json有清单。未因环境失败停止或重跑已过全套。

## 历史与源码地图

- [M13完整历史](archive/migration-status-through-2026-10-25-m13.md)、[M12](archive/migration-status-through-2026-10-25-m12.md)、[M11](archive/migration-status-through-2026-10-25-m11.md)、[M10](archive/migration-status-through-2026-10-25-m10.md)、[M9](archive/migration-status-through-2026-10-25-m9.md)、[M8](archive/migration-status-through-2026-10-25-m8.md)、[早期](archive/migration-status-through-2026-10-25-m4.md)保留既有决定/失败/交付；已闭环里程碑不重跑。
- master，SSH origin=git@github.com:moonbit-community/moonplot.git；独立分支codex/。静态core不importUI，统一module Rabbita仅JS，pins0.16.7/XML0.5.0不要误改。
- JS-only接口由tools/update_interfaces.py实际compiler生成；最后info/fmt并审预期mbti、python3 tools/check_structure.py及适当tests；Root统一版本/中央/发布，维护文件<2000行。

[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
