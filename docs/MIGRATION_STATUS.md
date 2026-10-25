# MoonPlot 当前执行检查点

更新时间：2026-10-26（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，以能力/场景对齐，用户要求“一直往后对齐”。不恢复全Matplotlib/Python动态API计划，不编造整体百分比。
- M1至M13及0.3.0提示片均已实际交付；当前正式Lampese/mathplotlib0.14.0，推进M14连续流线body场值，目标0.15.0。
- 已授权合理复用、独立subagents、coherent verified commits/push到moonbit-community/moonplot、实际Mooncakes Lampese/统一单module。
- root facade api.mbt；consumer tests/api；global tests/integration；implementation/own wbtests留own package；维护mbt<2000行，structure必跑。

## 当前切片：M14 Streamplot（中央验收通过，0.15.0 实际交付待做）

- 合同见 `.moonagent/checkpoints/M14-streamplot/active-scope.md` 与[M14](MILESTONE_M14.md)。正式基线0.14源 `1215721c9e63e7036be9580ecd1560e7eabe0be3`。Root与consumer已改0.15.0候选；尚未发布，当前正式仍0.14.0。
- 既有streamplot/mesh/style-grids只接连续body实际非零Segment，plot内双mode物理命中。Streamplot kind、readonly StreamplotInfo{seed_index原尝试槽,u,v,color_value?}/HitInfo.streamplot/facade；point_index原joined edge、artist_index实际bodyLine、series原call、value恒V。u/v为原有限(a+b)/2处旧bilinear样本，color来自同次旧style原scalar；不换safehalf/反推色值/鼠标处采样/magnitude/原网格观测。默认U/V及真实可选Color value；typedNone安全Value回退。
- 一份共享轨迹/edge表，wholeLine onceidentity/content、split只两点+constant offset，actual valid-run source_start对应；geometry/guard/capture O(points+edges)，新增field保旧locator O(E*(nx+ny))，不虚称整体线性。所有实际arrow pushes（含Set未返回shaft）owned-static，保旧积分/seed/occupancy/style/norm/paint/Set/一个完整Container/SVG。preparedSome无proof静态并保completion，不扩LineContext；维护known-slot/cursor/image/inline/remove/clear及其他kind。
- [x] exact121旧baseline：producer Native57725三SVG；独立Native98134/JS27224各三XML/SVG，旧generic14/18/17/value=生成y，各1Container。旧87a Native只作额外同目标对照，JS是真121实跑；不重标旧结果。
- [x] actual empty/rejected relabel：owner09b6353→Root99ea119；beforeNative87412 terminal2→82399 terminal0/1test两子例，保空Set/1Container/staticlegend/cycle。原失败已保。
- [x] core b29c70b→Root59888a2，Root逐production和3interfaces审；actual全targetcheck291tasks0、Native85727首4/4，三fixture12/12/6body Segment、原seed/edge/U/V/color、Set/Container/三旧SVG、nested alias/oldDrawing过。
- [x] final owner807f27c→Rootb1acc2e仅8owningtests+指南，production仍b29。Native7749 21专项、adapter42657 2过；affected30069 terminal0：Native59/其余三各58/Rabbita50，77504 terminal0三fixture×四目标12次同目标旧新SVG逐字；info/fmt/structure/diff/guide3links过。Root核34owner=19production/3mbti/11tests/guide及75proof SHA全同，producer-final/root-match.json；不重复full或旧M13矩阵。
- [x] precise b29独立复审无blocker：public Native44769/JS67353 terminal0，各三例12/12/6、六XML/六同目标旧SVG、240真实物理检查；Scene6+Backend2 Native1521/JS46768各8/8。变量old sampler、seed/style洞、missingmidpoint、alias/crosskind/prepared completion/ordinaryNone、五kind生命周期、反Log/clip/paint/CSS通过。Root22源接口/46proof SHA核copy、两archive原处核SHA、六旧数学块直接同formal121；independent-review/root-production-match.json。
- [x] UI41e7977精确七files；isolated build63626、info/fmt080f41及最终c87424全0；Chrome首60052/最终93748均14/0errors，最终26整数事件/20callbacks/12geometry/6negative。三位小数仅展示，raw metadata逐值不变；实际PNG56728bytes/SHA36c487d354de33ae74653da8d8292a5511bea524cbbc9e24fe53e27407234e8e已Root目视，ui-root-match.json七SHA相同。Helper误把README symlink当blob的失败保留并修，仅证据helper失败。
- [x] Rootconsumer b3ddbc5：actual Native65048/JS25542和e85669/Chrome73264全0；51checks/13新流线整数事件/0errors；actualinfo82d8d7/afab8e、fmt dbd96f与两private接口未变。3fixture12/12/6、Setaliases/oldDrawing、更新U1.5/V.25、拒seed0→1/六原edge/rawcolor5+x超norm、openhead静态、双mode空白/CSS375过。首Root算术括号语法718fc8与误cwd后重复c10f84有记录并修harness，无production改动。
- [x] central prelude87978 terminal0：actual info/fmt+15JS全部通过，无额外接口diff。唯一full73204 terminal0/265.69s：Wasm/WG各22631、Native22635、JS22688全部通过。
- [x] postlude40698 terminal0：15真实页面Chrome190/0errors、三static SVG/52MD576links/structure/diff过，流线JS与PNG同UI实际产物，无额外mbti。22步骤均0，central-summary.json及central-streamlines-artifact.json已保存。仅发布忽略补齐8个科学图开发HTML/CSS，不改build/test输入，故不重复已过full。
- [ ] 正式clean/发布/public API/fresh registry/GitHub四附件整下载与finalaudit待做。
- 精确下一动作：commit本次正式验收源码并push；确认gitclean，建立release-live.json冻结此HEAD，跑tools/build_release.py正式clean（不用allowdirty），核archive19production/3interface/guide与八开发页排除、四静态/Chrome51，再实际moon publish/publicchecksum/fresh registry/GitHub四附件整下载/finalaudit。整个网络audit前保持Roottracked/HEAD不变；M13不重跑。
- Root tracked freeze目前解除；各agent已收bounded，无production/UI修改或live。当前候选6167df5已push89099 terminal0；本次正式验收文档与发布忽略待commit。Root中央全部已终，无验证/网络live。intentional预览8765/session43005/PID70622已核streamlines.html、JS4785354bytes/SHAe2f3c76c1f56a0a4f1f6023bbf551d87c8360481ddddf3ddd5fa08d301b21391及三CSS全200逐字；open_in_codex已queued。open_in_codex queued不声称前台，仅connectionrefused才重启。

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
