# M15 执行与交付历史

下面保留正式源9996439发布前的阶段检查点，发布前措辞描述当时状态；实际交付结果在末尾补记。

# MoonPlot 当前执行检查点

更新时间：2026-10-26（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力/场景继续对齐。用户要求“一直往后对齐”，允许先做简单可用功能；不恢复全部Matplotlib/Python API计划，不编造整体百分比。
- M1至M14及0.3提示片均已实际交付，当前正式`Lampese/mathplotlib@0.15.0`。当前M15目标0.16.0，模块与consumer已升0.16.0候选；实际已发布仍0.15.0。
- 已授权合理复用、独立subagents、coherent verified commits/push到moonbit-community/moonplot、实际Mooncakes Lampese/统一module。
- root facade api.mbt；consumer tests/api；globals tests/integration；implementation/own wbtests留owner包；维护mbt<2000行，structure必跑。

## 当前切片：M15 Polar / Radar（代码与中央验收完成，待正式发布）

合同 `.moonagent/checkpoints/M15-polar/active-scope.md` 和[M15](../MILESTONE_M15.md)。基线为实际交付0.15正式源 `67c095118a45d27f6f3ab3d8fb3d3dff2a0e8877`。

- 选择A：typed PolarAxes/PolarDirection、显式Figure.add_polar_axes，极坐标Line/Scatter与closed outline Radar。静态SVG+RabbitaDOM，应用可更新/legend/remount；整个polar capture禁用，无新HitKind/PolarInfo/Drawingcircle-gate。原theta/r hover与真实圆盘CSSgate留下一片，不冒Cartesian XY观测。
- Scene保原theta/r，现Line/Scatter Artist+可选projectionIR+专用renderer，不新增大批Artist变体或一般projection框架。默认弧度、东零/CCW，offset和typed方向可设；真圆物理R，data/grid/frame/clip用同cx/cy/R；data-only circle clip按panel唯一。
- 线性径域[0,rmax]，显式max finite>0、auto联合有效非负最大、空/零fallback1。nonfinite/负r为missing，line断run/scatter跳过；r0合法，r>max原值保留并实际圆clip。派生不finite保守断run。tick标签错长原子报错，明确unsupported Cartesian设置/图元。
- 投影后相邻点为chord；closed仅整组有效合成首尾，raw原N点不增样本。Radar K>=3/同长labels，同panel多条分类表一致，不偷偷旋转；顶部/CW由应用显式设。无填面/维度归一化/rmin环域/Log径/wedge/插值曲线。
- 先从Cartesian range/shared-minima/aspect/tick-layout路径早分流；普通panels/provider/cache/交互保持。公开方法最小plot/scatter/radar、radiusmax/offset/direction/ticks/title/legend。输入/config复制一次；clear若暴露须保polar身份。Root负责中央接口复审与完整接入。

### 已完成准备与实施分工

- [x] producer-prep/96行A/B设计+31必要source SHA；review-prep/五角度独立公式、非方形真圆、闭合原N及未来圆盘门控要点。仅准备，不当新功能通过。
- [x] M14 finalaudit290642 terminal0已确认正式67全过程gitclean/HEAD不变并解除freeze；M15A精确合同已冻结，Root允许新工作。
- [x] m3_donut首批core335bcb71b376ba614943e549f86f9b4e41d4a48e，Root逐审15production/3expectedinterfaces/1own test后cherry-pick为1b48850。19源SHA、15首批proof复制producer-first并核同；Native85721 terminal0，3tests包含三实际新SVG与两旧SVG控制；新XML/math最大误差2.85e-14，actual info/fmt/structure/diff0。这是首批验收，不代表M15完成。
- [x] producer完成bounded输入/config/clear/publicAxes不支持设置/mixed/huge及四targets、docs/POLAR.md。已发现并修复继承axis-off静默忽略：50ca4ed→Roota0e018d，仅frame_visible guard+debug显式import+3回归，before58048终2/after90727终0且正常三SVG逐字不变。Root指出grid/spine相邻疑点后，Native52483终2实证两者均被静默忽略；65a1bdc已审合为0313aa6：创建时grid/margin signature与内部IR compatible位、固定spine默认guard、tickposition/anchor近邻；Native14632 5/5、正常三SVG逐字同335，actualinfo/fmt0，仅IRmbti预期变更。生产已冻结65a，最终tests/guide401883d已逐审5文件并合为764770c，production保持65a；owner71159 Native103/其余各101/Rabbita50、旧控制11186十二逐字均0，最终26源与71proof均已Root核同，producer-final/root-match.json；旧b29参考19production已Root git核同formal67，12同target旧实际SVG provenance保留。
- [x] 独立旧baseline准备：exact67 Native59670/JS均0，普通Line3anchors/streamplot12targets，4实际SVG。Root核10源SHA、25proof与archive；review-baseline/root-match.json。只作旧控制。
- [x] m4_area完成exact335新Native/JS独立数学/XML复审，三新scene、缺失/零/负/溢出/真圆/闭合原N/零capture/mixed及有限生命周期反例，335独立Native30508/JS40977、extras45928/JS均0，22新XML数学误差5.684e-14；两旧控Native16667/JS的4SVG/metadata逐字同67。50 delta before Native85538终134/JS57242终1，after97247/10933均0。19源/72proof/2archive Root核同、proof复制independent-phase50；65a新delta Native89151/JS均0，controls Native56877/JS均0，12XML数学误差2.842e-14；19源与44增量proof已Root核同复制independent-final，65archive原处SHA核同，与owner16prod+3mbti完全一致，无剩余blocker。无旧大矩阵/full/生产/Roottracked写。
- [x] m3_browser五文件ignored草稿的standaloneMoonfmt/Node syntax均0，未冒充编译/浏览器通过。
- [x] UI1efb4e3真实七文件：build/info/fmt74235f均0、Chrome74155 14/14、33实际整数事件/0errors。7源及servedJS4657775bytes/SHA60a7f20b63a3256de66a05d4124f4b7f79a5dce0959320cb0b12dd576903ef91 Root核同；PNG101640bytes/SHA2963a8131358fc706690558e3ee63a46848e676119c39c85230809012263bbe2已Root目视。ui-root-match.json；CTM类型/float32 reader与runner样式恢复失败保记录，不是core失败。
- [x] Root consumer97f2b78：Native96487/JS6483/axis-off后appbuild145a36/Chrome26756均0，56checks含原51+5极坐标组、两整数事件与真实原SVG栅格circle-clip反例；actualinfo79875/四文件fmt0，两private接口逐字未变。首CSS url引号reader及SVGPoint/AnimatedLength float32 reader失败已保before，仅改harness读实际serialized doubles，原1e-8数学断言和native raster保留。
- Root负责publicM15/版本/consumer/7UI/一次中央全套/真实发布；当前源码0.16.0候选，实际已发布仍0.15.0，不重跑M14已闭环检查。

精确下一动作：producer26源/71proof与独立最终19源/44delta proof已核同，无blocker；Root已bump0.16候选、中央prelude57456 terminal0（actualinfo/fmt、16JSbuild均0，无额外mbti）。最终test/guide已合入764770c，候选02392dc与54MD/594links通过；唯一full93615/264.29s与postlude83376均0，W/WG22644、Native22648、JS22701、16Chrome204、三静态SVG、54MD594links/structure/diff/预期mbti全过；central-summary.json共23step/全部0。下一步提交正式候选、保持HEAD与gitclean冻结，再clean包和实际Mooncakes/全新registry/GitHub完整四附件核验。发布阶段live session/source_commit记在ignored M15-polar/release-live.json；从formal builder到final audit不得写Root tracked或另commit，audit确认后才解除freeze。必要失败留before并排查，不因失败停滞。

Root中央prelude57456/full93615/postlude83376全部terminal0，目前无验证/网络live。0.16候选02392dc；代码不再变化。中央collector首4121ea因旧22唯一步骤计数失败，修23后90defa汇总0；不重跑full。M14freeze已解除。M15 owner/reviewer在各自worktree，UI已冻结；browser只在ignored M16-polar-interaction/browser-prep做B点提示/圆盘门控只读设计，无实现授权。intentional预览8765/session43005/PID70622已可访问polar.html；HTML/3CSS/真实新JS4663158bytes/SHAfc341f7e90daa9ee3df2855c2a5d7e0be1db2aaf89aae115013a7cffd6ad4039实际200同Root，preview-http.json。open_in_codex queued，不声称前台。仅connectionrefused才重启预览。

## 最新实际交付：M14 /0.15.0

- 连续streamplot/mesh/style-grid真实body Segment、原seed/edge、旧有限中点U/V与同次rawcolor；value恒V。保原积分/style/norm/Set/1Container/SVG，全部实际arrow owned-static。源carrier/guard/capture O(points+edges)，额外旧locator采样O(E*(nx+ny))分开记录。唯一legacy窄fix实际empty/rejected串series有before87412→after82399。
- owner最终807→Rootb1acc2e、production精确b29→Root59888a2；34owner/75proof SHA同。Native59/其余各58/Rabbita50及12同target旧新SVG全过。独立Native/JS三fixture12/12/6、六XML/六旧SVG/240物理检查、Scene6+Backend2各8/8，22源接口/46proof、两archive原处SHA、六旧数学块Root核同，无blocker。
- UI41e7977真实14/26整数事件/0errors；PNG56728bytes/SHA36c487d354de33ae74653da8d8292a5511bea524cbbc9e24fe53e27407234e8e已目视，中央同字节；externalconsumer b3ddbc5 Native65048/JS/Chrome73264 51checks/13流线事件/0errors，实际info/fmt/private接口未变。Root最初语法/误cwd与UI证据helper symlink失败均保记录并修，不是production失败。
- central prelude87978、唯一full73204/265.69s、postlude40698全部0：W/WG22631、Native22635、JS22688；15页面Chrome190/0errors、三静态SVG/52MD576links/structure/diff，无额外mbti。
- 正式源67c095118a45d27f6f3ab3d8fb3d3dff2a0e8877/push28357；clean82436 terminal0/dirtyfalse/四staticChrome51。module2636244bytes/601files/SHA57ba9f51b526f162d8efd750dd5207288a5afafca8d267154f2388b96d0d636d；source2691216bytes/630files/SHAc166ac772b66593f4a8a31a2fbfebb638437412222f2ef4c70225f5bb5643c4f。
- actualpublish93030/public首35351、全新无workspace registry16095、GHcreate54326/完整下载40546均terminal0；public success/notyanked/checksum同、601安装源逐一同ZIP/四staticChrome51、四附件bytes/digest/size/tag全同。[GitHub v0.15.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.15.0)。
- finalaudit290642 terminal0/2026-10-25T16:28:26.854860Z：正式builder至网络audit RootHEAD67与gitclean不变，无tracked写/commit，之后解除freeze。首5551clean80513虽过但发布前更正“开发页面在源码包”的事实文字，原artifacts/logs保留且未发布，不为文档重跑full。
- Root证据 `.moonagent/checkpoints/M14-streamplot/` 的producer-final、independent-review、consumer-verification、ui-root-match、central-summary、release-final/artifacts/download-check、registry-consumer、delivery-final-audit/release-live complete；formal-docs-check52/576不被M15后续文档检查重标。

## 历史与工作约束

[M14完整历史](migration-status-through-2026-10-26-m14.md)、[M13](migration-status-through-2026-10-25-m13.md)、[M12](migration-status-through-2026-10-25-m12.md)、[M11](migration-status-through-2026-10-25-m11.md)、[M10](migration-status-through-2026-10-25-m10.md)、[早期](migration-status-through-2026-10-25-m4.md)保留既有决定/失败/交付。已完成片不重跑。
master，SSH origin=git@github.com:moonbit-community/moonplot.git；新branch codex/；单module核心不importUI，Rabbita仅JS，pins0.16.7/XML0.5.0不误改。JS-only接口由tools/update_interfaces.py实际compiler生成；最后info/fmt审预期mbti及structure，维护文件<2000行。

[路线图](../MIGRATION_PLAN.md) · [能力](../CAPABILITIES.md) · [架构](../ARCHITECTURE.md) · [安装](../PUBLISHING.md)

## 实际0.16.0交付闭环

正式源99964396315269ebf7765c7437ab7258aa339b8e；finalaudit30f5fc terminal0，2026-10-25T17:28:32.411157Z。formalbuilder至networkaudit RootHEAD与gitclean不变，无tracked写/commit，之后解除freeze。

clean5127 terminal0/dirtyfalse，四static/Chrome56；module2748140bytes/607files/SHA6da35dc9b69b74c97cee17f62fd8c0753736bf3c3cfa1e6633a67c6a7d08c570；source2806598bytes/638files/SHA9ea092c325ba592c856d2330c6df78fb87e9622255dbbd3b8eb127b3d6d071df。20owner生产/接口/guide与asset逐字，10开发HTML/CSS不入库包。

actualpublish89744 terminal0/200；首public22757f仅queued/无包，未重复发布；第二a46bad terminal0/buildsuccess/checksum相同。fresh无workspace registry61533 terminal0，607安装源逐一同ZIP/四static/Chrome56。GitHubcreate9181与whole4assets47226均terminal0，bytes/digest/size/tag全同。

[GitHub v0.16.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.16.0)。SHA256SUMS279bytes/SHA539786a09c197ca65bd8674dce4aa7256380051d73b97ec53393bee5e26278df；manifest781bytes/SHA5841ff0acf814388c8a48725b06764324cebd29c8dd0a347658c422930360362。Root完整证据位于ignored M15-polar/delivery-final-audit.json、release-live.json和各源/独立/中央/consumer证据目录。
