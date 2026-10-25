# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力/场景对齐，不复制完整Matplotlib/Python动态协议，不恢复D55或编造完成百分比。用户要求“一直往后对齐”。
- M1至M12及0.3.0提示片已验收并实际交付；当前正式Lampese/mathplotlib0.13.0，推进M13三角面着色交互，目标0.14.0。
- 已授权合理复用、独立subagents、小步verified commits/push到moonbit-community/moonplot、实际Mooncakes发布Lampese/前缀，统一单module。
- 根facade api.mbt；consumer tests/api；global tests/integration；own implementation/wbtests；维护mbt<2000行，结构检查必跑。

## 当前切片：M13 Tripcolor（已授权独立实现，尚未验收）

- 精确合同 `.moonagent/checkpoints/M13-tripcolor/active-scope.md`，公开范围[M13](MILESTONE_M13.md)。基线为正式0.13源 `87a3280f31fb3ba043da415f89eab6ad5a8ef59e`；Root/consumer仍0.13.0，不提前bump/发布0.14。
- 只existing tripcolor/tripcolor_triangulation Figure/Axes。保持Unit、0Containers、triangulation/mask、全输入norm autoscale、原face-value优先（即使facecount==vertexcount）、原ordered(a+b+c)/3有限位模式与overflow omission、颜色/legend/旧SVG。无Gouraud或新场插值。
- 冻结新增Tripcolor kind，复用actual成功Polygon callback的单环nonzero opaqueFilledRegion；TriColorInfo{vertices:(Int32,Int32,Int32),vertex_mean:Bool}、factory tricolor_info(vertices,vertex_mean~Bool=false)、HitInfo.tricolor optional/facade。value为原finite面标量或旧vertexmean，point_index原actual validated/generatedmesh face槽保mask洞，artist_index当前Polygon，series原call。vertices给实际mesh有序三元组，含direct自动Delaunay；不伪CellInfo/区间或重算mesh/颜色反推。
- 两mode plot内physicalfill，holes/bbox空角/degenerate/unknown与mismatch静态，保旧marginpaint。默认Value/Vertex mean，不显示geometryXY；custom可读精确tuple/mode。同M12 safe preclipdata/visibleclipscreen或一次center证明wholeplot的锚点；可提取小neutralhelper，但ContourF lineage/metadata保独立不改。
- 三点immutableidentity/content与knownslot禁复活，perartistonceguard/线性cursor，O(artists+faces)，query O(3)；不全mesh perface。Tripcolor intent actualtype只Polygon；Line/preparedStep/Scatter/Bar/Compound与冲突ownedlineage保守静态，保ordinaryNone/providercompletion。维护image/inline/remove/clear和旧Drawing/其他kinds。
- only额外legacy修复：如最小actual回归证实fullymasked/invalid call串改前series，保before再窄修conditionalrecord_series，保静态legend/firstcolor fallback；不做一般legend重构。
- 只读preparation `.moonagent/checkpoints/M13-tripcolor-prep/`：immutable ae1 Native82861 terminal0三旧fixture/XML，面槽[0,2,3]值[10,30,40]，vertexmean[5,7,9,7]，equalcount逐面优先[2,5,11,17]，0targets/0Containers。scoped tripcolor code同当前0.13（SHA d1bf38726eba30dfa188ebe255f687542b35c349beee6db0af1180a43ca3b00c）；不是M13新验收。Browser SOURCE_MAP/HANDOFF/baseline/SVG/manifest已freeze；producer-design两文件已copy。新exact0.13旧基线仍待冻结，不能重标旧结果。
- 分工授权：producer m3_donut own clean managed worktree从精确87a建codex/m13-tripcolor，core/IR/Scene/backend/Drawing/tooltip、own tests及TRIPCOLOR_INTERACTION.md。先3fixture Native/actualoldSVG早coherent SHA，再必要bounded4target/adapter/info/fmt/structure；不Roottracked/版本/中央docs/consumer/UI/full/push/publish/新agent。browser先ignored草稿，reviewer先exact0.13旧baseline；新语义/七filetracked部署等coherent core+Root明确授权。Root版本/中央docs/consumer/UI/全套/实际交付。
- 精确下一动作：分发M13合同与具体授权，producer先早期Nativecoherent core；browser双卡/runner仅ignored草稿、reviewer新exact0.13 actualXML/oldSVG有限baseline准备。Root可并行publicconsumer草稿。新feature编译/测试/新UI/0.14发布均未执行；不要重跑已过M12全套或重新全库调查。
- Root无验证/发布live，M12 release-live.json complete/source_frozen=false、网络audit已明确解除trackedfreeze。有意预览8765/session43005/PID70622：filled-contours.html；defaultJS4709395bytes/SHA28a84c6b4b0b56a37d2faa9ae6e3a679aee2cc96006167f8d965e30ba6556c7a，HTML/JS/三CSS实际HTTP200逐字，open_in_codex queued未声称前台。仅connectionrefused才重启更新session/PID。

## 最新交付：M12 /0.13.0（2026-10-25）

- [x] 真正nonzero/evenodd wholeband region、holes/分岛gap/透选、有限clip区间/代表值/原logicalband槽和immutableRegion；actualfilteredwriter/plotonly与两类geometryanchor，保旧静态与API。三实证bug（collinear/BBox/跨kindmetadata）留before并修复。
- [x] owner最终f91已合Rootf6b46f9，31files含18production/3interfaces全SHA同，production自14a不变；四target184/adapter46、8旧SVG过。独立Native/JS各9public/5Scene/3delta、18actualXML/18旧SVG/432query一致、maxdiff2.84217e-14，无剩余blocker，Root18production/3interfaces全同，49证据已SHA核copy。
- [x] UI994c536：14Chrome/24整数事件/0errors、真实mask737样本/原槽1/2/3/legend/remount/CSS375；finalPNG同asset60561bytes/SHA6231fbc25bdd294584259eca606c3f87e3294d0bb1b7bbe775c8c79bcd58e777已目视。consumer0454960 Native/JS/actualinfo/fmt/Chrome41、10填色整数事件、0errors。
- [x] 中央prelude16307/postlude47933全部0；唯一full30284/268.45s：W/WG22589、JS22642、Native22591；13Chrome162/0errors、info/fmt/13JS/三静态SVG/docs48/539链接/结构/diff，无意外mbti、未重复full。
- [x] 正式源87a3280f31fb3ba043da415f89eab6ad5a8ef59e/push68683；clean20806 terminal0/dirtyfalse，四静态/Chrome41。module2503930bytes/590files/SHA7372afea56bda7a91464f507da5bf61495958355914290a0eb4fc4ad947ae3e1；source2551348bytes/615files/SHAec030e46c161077851991d45396dce28d2618bd0803f9f26a75bf5780f8155a4。
- [x] actualpublish46591/200；首API23042因queued/haspackagefalse保留snapshot/log，未冒称完成；后API64558 terminal0 buildsuccess/haspackage/notyanked/checksum一致；无workspace全新registry60742 terminal0，590安装源逐一同正式ZIP，四静态/Chrome41过。
- [x] GHcreate21562、整下载72398 terminal0，四完整附件bytes/digest/size/tag87a全部过；最终audit2026-10-25T14:19:05.947223Z Root HEAD87a+gitclean，自正式builder至网络闭环无tracked写/commit，然后解除freeze。[GitHub v0.13.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.13.0)。
- 证据Root `.moonagent/checkpoints/M12-contourf/`：producer-final/root-match、final-review/root-production-match及49evidence、central-summary/final-validation-progress、release-final/artifacts/download-check、registry-consumer/report、delivery-final-audit与release-live complete/no live。

## 历史与源码地图

- [M12完整历史](archive/migration-status-through-2026-10-25-m12.md)、[M11](archive/migration-status-through-2026-10-25-m11.md)、[M10](archive/migration-status-through-2026-10-25-m10.md)、[M9](archive/migration-status-through-2026-10-25-m9.md)、[M8](archive/migration-status-through-2026-10-25-m8.md)、[早期](archive/migration-status-through-2026-10-25-m4.md)保留既有决定/失败/附件证明。M1-M12与0.3提示片均交付，不重跑。
- master，SSH origin=git@github.com:moonbit-community/moonplot.git；独立分支codex/。静态core不importUI，统一module Rabbita仅JS，pins0.16.7/XML0.5.0不要误改。
- JS-only接口由tools/update_interfaces.py实际compiler生成；最后info/fmt并审预期mbti、python3 tools/check_structure.py与适当tests；Root统一版本/中央与发布。维护文件<2000行。

[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
