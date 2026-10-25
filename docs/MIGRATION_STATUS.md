# MoonPlot 当前执行检查点

更新时间：2026-10-26（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力/场景继续对齐。用户要求“一直往后对齐”，允许先做简单可用功能；不恢复全部Matplotlib/Python API计划，不编造整体百分比。
- M1至M15及0.3提示片均已实际交付，当前正式`Lampese/mathplotlib@0.16.0`。当前M16目标0.17.0，模块与consumer版本仍0.16.0。
- 已授权合理复用、独立subagents、coherent verified commits/push到moonbit-community/moonplot、实际Mooncakes Lampese/统一module。
- root facade api.mbt；consumer tests/api；globals tests/integration；implementation/own wbtests留owner包；维护mbt<2000行，structure必跑。

## 当前切片：M16 极坐标原始数据提示（B已授权，尚未实现验收）

合同 `.moonagent/checkpoints/M16-polar-interaction/active-scope.md` 和[M16](MILESTONE_M16.md)。基线为实际交付0.16正式源 `99964396315269ebf7765c7437ab7258aa339b8e`。

- 一个HitKind::Polar，不新增PolarInfo/绘图入口。HitPoint/Info的data_x/x为原theta弧度，data_y/y/value为原r，保原panel/artist/i/调用label；Radar category按原call+i快照，不能借可变ticks/legend。默认Theta (rad)/Radius/可选Category，无Cartesian X/Y/atan2反推。
- 两mode均投影后物理近点，无横轴/角度跨圆吸附和弦插值。r0保原角度，缺失保洞，closed不新增i=N，r>max中心保静态不生成目标；只实际正可见marker或非零written chord端点，孤立/同点/零宽线与零marker静态。重合保既有稳定tie，不合并数据。
- 每call一次immutable source/identity/content/category snapshot与每artist一次guard；失效或handmade未证明IR保持静态，不复活generic point。复用同次投影与writer callback、原i/去重closing，无SVG解析/重新layout。clear清source保配置，旧Drawing独立。保M15 unsupported guards。
- Drawing增加可选polar_circles records、一次copy为私有panel map；readonly polar_circle(panel)->tuple?给adapter。已知无效/冲突duplicate及Polar缺合法circle均failclosed。每候选/overlay/legacyfallback按自身panel圆检查，不扩大R、不全widget屏蔽mixednormal/别圆。正常旧构造不变；无可选圆面区域或通用框架。
- Rabbita私有实际getScreenCTM六double inverse，均匀scale下CSS radius换算与viewBox/letterbox拒绝；覆盖容器和SVG-own border/padding，不承诺anisotropic/skew新语义。Polar hover/selected高亮以帧circle/scoped资源裁剪，tooltip仍浮层，普通图接受行为保持。
- producer owns Scene/IR/capture/Drawing/kind、rabbita/tooltip.mbt kind/defaultrows（types仅必要）、own tests/guide/expectedinterfaces。不改view/mainUI/Rootconsumer/central/version/full/push/release。browser先ignoreddraft，coherent core后才明确授权view/privatebridge/highlight+双卡UI实际文件。Root负责consumer/publicdocs/version/一次full/真实发布。

### 已完成准备与分工

- [x] producer24必要源SHA/85行短设计、browser14源+2Rabbita0.16.7依赖与两未执行fixture、独立10源/短数学设计。均为只读准备，无B实现/通过声明；复用M15决定，正式999只刷新必要源。
- [x] M15 finalaudit30f5fc terminal0/2026-10-25T17:28:32.411157Z确认正式999全过程HEAD/gitclean不变并解除freeze；Root现允许M16新工作。
- [ ] m3_donut既有managed own worktree从exact999建codex/m16-polar-interaction，先小immutable旧SVG/普通控制，earlycoherent core+少量Native实际新场景/预期mbti，再bounded四targets/guide/info/fmt/structure；不full/Roottracked/central/version/UI/consumer/push/publish/newagent。
- [ ] m3_browser先Root ignored M16/draft：默认与中文原值提示/点击选择、圆盘与高亮/实际CTM、更新/方向/四legend/remount/375/letterbox/border独立整数事件harness；只能draft/standalonefmt/Node syntax，未获tracked部署/compile/Chrome/PNG授权。
- [ ] m4_area先own ignored exact999必要旧baseline复用/源码SHA和数学harness草稿；不能执行新B语义直到Root给精确coherentSHA授权。不旧大矩阵/full/Roottracked/生产改写。
- Root负责publicM16、consumer、接口审合/实际UI、中央与0.17交付；当前不提前bump0.17，不重跑M15已闭环检查。

精确下一动作：上述既有agents已派发，producer获own实施、browser/reviewer仅准备；收producer首coherent核心/Native小场景/expectedinterfaces后逐源审合，明确授权browser实际文件与独立新Native/JS，Root推进实际consumer。失败保before并排查，不因失败停滞。

Root无验证/网络live，M15freeze已解除；M16只读准备/owner实施按各自权限进行。intentional预览8765/session43005/PID70622为polar.html；HTML/3CSS/实际JS4663158bytes/SHAfc341f7e90daa9ee3df2855c2a5d7e0be1db2aaf89aae115013a7cffd6ad4039 HTTP200逐字同Root，open_in_codex queued，不声称前台。尚无M16新提示。仅connectionrefused才重启。

## 最新实际交付：M15 /0.16.0

- typed PolarAxes/Direction、极坐标Line/Scatter/outlineRadar，原theta/r与N、线性0..rmax、offset/CW/刻度/标题/legend、真圆data-only clip。M15全部Polar capture禁用，M16接续原点提示。普通面板earlyNone路径保持。
- owner401883d→Root764770c，production精确65a→0313aa6；26源/71proof Root核同。Native103/其余101/Rabbita50、12同target非polar旧SVG通过，旧参考19production已Root核同formal67。实际axisoff/gridspine before/after修复；clear与默认globalgrid/margins旁支通过。
- 独立335/50：19源/72proof/2archives，22新XML/4旧SVG/Line3/Flow12保持；65delta：19源/44proof/1archive，12XML/NativeJS反例和全局配置/clear闭环。Root逐SHA核同，无剩余blocker。
- UI1efb4e3 Chrome74155 14/33整数events/0errors，7源与PNG101640bytes/SHA2963a8131358fc706690558e3ee63a46848e676119c39c85230809012263bbe2 Root核同且目视；consumer97f2b78 Native96487/JS/Chrome26756 56checks/两Polar整数事件/实际nativeSVG圆clip均0。actualinfo/fmt/两private接口不变。harness URL引号/float32/CTM/样式恢复before保留。
- 中央prelude57456、唯一full93615/264.29s、postlude83376均0：W/WG22644、Native22648、JS22701，16页面Chrome204/0errors、三static、54MD594links/structure/expectedmbti。collector旧22唯一步骤计数4121ea失败改23，90defa汇总0，没重跑full；中央PNG逐字同asset。
- 正式源99964396315269ebf7765c7437ab7258aa339b8e/push30930；clean5127 terminal0/dirtyfalse/四staticChrome56。module2748140bytes/607files/SHA6da35dc9b69b74c97cee17f62fd8c0753736bf3c3cfa1e6633a67c6a7d08c570；source2806598bytes/638files/SHA9ea092c325ba592c856d2330c6df78fb87e9622255dbbd3b8eb127b3d6d071df。20owner生产/接口/guide和asset逐字，10开发HTML/CSS不入module，sourcebundle为库+consumer，完整开发页面在Git。
- actualpublish89744 terminal0/200，首public22757f queued/无包仅等待未重复发布，第二a46bad终0/buildsuccess/checksum同；fresh无workspace registry61533终0、607安装源逐一同ZIP/四staticChrome56。GHcreate9181/完整四附件47226终0，bytes/digest/size/tag全同。[GitHub v0.16.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.16.0)。
- finalaudit30f5fc terminal0/2026-10-25T17:28:32.411157Z：formalbuilder至networkaudit RootHEAD999/gitclean不变，无tracked写/commit，之后解除freeze。Root证据M15-polar/producer-final、independent-phase50/independent-final、consumer-verification、ui-root-match、central-summary、release-final、registry-consumer、delivery-final-audit/release-live complete。formal-docs-check54/594不被M16文档检查覆盖。

## 历史与工作约束

[M15完整历史](archive/migration-status-through-2026-10-26-m15.md)、[M14](archive/migration-status-through-2026-10-26-m14.md)、[M13](archive/migration-status-through-2026-10-25-m13.md)、[M12](archive/migration-status-through-2026-10-25-m12.md)、[M11](archive/migration-status-through-2026-10-25-m11.md)、[M10](archive/migration-status-through-2026-10-25-m10.md)、[早期](archive/migration-status-through-2026-10-25-m4.md)保留既有决定/失败/交付。已完成片不重跑。
master，SSH origin=git@github.com:moonbit-community/moonplot.git；新branch codex/；单module核心不importUI，Rabbita仅JS，pins0.16.7/XML0.5.0不误改。JS-only接口由tools/update_interfaces.py实际compiler生成；最后info/fmt审预期mbti及structure，维护文件<2000行。

[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
