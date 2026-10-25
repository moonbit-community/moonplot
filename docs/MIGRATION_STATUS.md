# MoonPlot 当前执行检查点

更新时间：2026-10-26（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力/场景继续对齐。用户要求“一直往后对齐”，允许先做简单可用功能；不恢复全部Matplotlib/Python API计划，不编造整体百分比。
- M1至M14及0.3提示片均已实际交付，当前正式`Lampese/mathplotlib@0.15.0`。当前M15目标0.16.0，模块与consumer版本仍0.15.0。
- 已授权合理复用、独立subagents、coherent verified commits/push到moonbit-community/moonplot、实际Mooncakes Lampese/统一module。
- root facade api.mbt；consumer tests/api；globals tests/integration；implementation/own wbtests留owner包；维护mbt<2000行，structure必跑。

## 当前切片：M15 Polar / Radar（A已授权，尚未实现验收）

合同 `.moonagent/checkpoints/M15-polar/active-scope.md` 和[M15](MILESTONE_M15.md)。基线为实际交付0.15正式源 `67c095118a45d27f6f3ab3d8fb3d3dff2a0e8877`。

- 选择A：typed PolarAxes/PolarDirection、显式Figure.add_polar_axes，极坐标Line/Scatter与closed outline Radar。静态SVG+RabbitaDOM，应用可更新/legend/remount；整个polar capture禁用，无新HitKind/PolarInfo/Drawingcircle-gate。原theta/r hover与真实圆盘CSSgate留下一片，不冒Cartesian XY观测。
- Scene保原theta/r，现Line/Scatter Artist+可选projectionIR+专用renderer，不新增大批Artist变体或一般projection框架。默认弧度、东零/CCW，offset和typed方向可设；真圆物理R，data/grid/frame/clip用同cx/cy/R；data-only circle clip按panel唯一。
- 线性径域[0,rmax]，显式max finite>0、auto联合有效非负最大、空/零fallback1。nonfinite/负r为missing，line断run/scatter跳过；r0合法，r>max原值保留并实际圆clip。派生不finite保守断run。tick标签错长原子报错，明确unsupported Cartesian设置/图元。
- 投影后相邻点为chord；closed仅整组有效合成首尾，raw原N点不增样本。Radar K>=3/同长labels，同panel多条分类表一致，不偷偷旋转；顶部/CW由应用显式设。无填面/维度归一化/rmin环域/Log径/wedge/插值曲线。
- 先从Cartesian range/shared-minima/aspect/tick-layout路径早分流；普通panels/provider/cache/交互保持。公开方法最小plot/scatter/radar、radiusmax/offset/direction/ticks/title/legend。输入/config复制一次；clear若暴露须保polar身份。Root负责中央接口复审与完整接入。

### 已完成准备与实施分工

- [x] producer-prep/96行A/B设计+31必要source SHA；review-prep/五角度独立公式、非方形真圆、闭合原N及未来圆盘门控要点。仅准备，不当新功能通过。
- [x] M14 finalaudit290642 terminal0已确认正式67全过程gitclean/HEAD不变并解除freeze；M15A精确合同已冻结，Root允许新工作。
- [ ] m3_donut在既有managed own worktree从exact67创建codex/m15-polar，core/own tests/docs/POLAR.md与actual expectedinterfaces。先少量必要immutable非polar控制与earlycoherent core+Native三实际新场景，再bounded4targets/info/fmt/structure，不full/Roottracked/central/version/consumer/UI/push/publish/newagent。
- [ ] m3_browser仅Root ignored M15-polar/draft五file+standaloneMoonfmt/Node syntax；静态双卡spiral+scatter/五维radar，controls/clip/zero capture/CSS375，不能部署/compile/Chrome/mbti/PNG直到coherentSHA和Root明确7file授权。
- [ ] m4_area仅own exact67旧baseline准备：少量Native/JS普通Line3anchors与一streamplot12targets/sourceSHA；新数学harness可draft，不执行新polar语义，等精确coherentSHA与Root授权。无旧大矩阵/full/生产/Roottracked写。
- Root负责publicM15/版本/consumer/7UI/一次中央全套/真实发布；当前只发布后文档，不提前bump0.16、不重跑M14已闭环检查。

精确下一动作：提交0.15实际交付归档和M15起始文档，核本地链接；收producer首coherent core及actual Native三场景+mbti后逐production审合，明确授权UI7和独立新语义，Root做真实publicconsumer。必要失败留before并排查，不因失败停滞。

Root无验证/网络live，M14freeze已解除；M15owner和browser/old-review在各自own/ignored推进。intentional预览8765/session43005/PID70622仍streamlines.html，HTML/JS4785354bytes/SHAe2f3c76c1f56a0a4f1f6023bbf551d87c8360481ddddf3ddd5fa08d301b21391与三CSS实际200逐字，open_in_codex queued，不声称前台。新polar尚未出图。仅connectionrefused才重启预览。

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

[M14完整历史](archive/migration-status-through-2026-10-26-m14.md)、[M13](archive/migration-status-through-2026-10-25-m13.md)、[M12](archive/migration-status-through-2026-10-25-m12.md)、[M11](archive/migration-status-through-2026-10-25-m11.md)、[M10](archive/migration-status-through-2026-10-25-m10.md)、[早期](archive/migration-status-through-2026-10-25-m4.md)保留既有决定/失败/交付。已完成片不重跑。
master，SSH origin=git@github.com:moonbit-community/moonplot.git；新branch codex/；单module核心不importUI，Rabbita仅JS，pins0.16.7/XML0.5.0不误改。JS-only接口由tools/update_interfaces.py实际compiler生成；最后info/fmt审预期mbti及structure，维护文件<2000行。

[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
