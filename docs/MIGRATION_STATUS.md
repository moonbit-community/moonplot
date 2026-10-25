# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复会话先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用 MoonBit 画图库，能力与场景对齐，不要求完整 Matplotlib API 复刻，不恢复旧 D55 清单。
- M1 基础二维 SVG、G2.1 首批 Rabbita DOM、后续 UI 整理均已验收与交付。
- 代码组织、M2资源隔离、0.3.0提示、M3/0.4.0图表扩展、M4/0.5.0统计交互均已交付；用户要求持续往后对齐，M6/0.7.0现亦已交付，下一片离散曲线。
- 用户授权合理复用、独立 subagents、小步本地commit与正常push至 moonbit-community/moonplot；本地commit授权日期2026-10-23。
- 用户已于2026-10-24明确授权实际发布Mooncakes，前缀Lampese/，并要求核心与Rabbita合并单一Lampese/mathplotlib module。
- 不用历史API指数或未经调查的估算表示整体完成率。

## 当前切片：M7 离散曲线（已开工，0.8.0未发布）

- 继续用户“一直往后对齐”，范围MILESTONE_M7.md；Root候选版本/consumer已准备0.8.0，公开正式版本仍0.7.0。
- [x] Step首实现efd9d07abf82253adf083cc0981777a4a4de5972已合b27f6a9：三mode原sample/interval、same-write valid-run source_start、同一私有IR载体/实际context guard、默认tooltip。
  原source Point精确命中优先，合成corner后edge/incoming；重复source坐标后原序Point胜出。Stairs/Ecdf仅enum与fallback提示预置，source尚未接，不是已实现。
- [x] Step验证c0353987ce9d4a9b26a8b71326e94f7a001079c4已合5f010cd，仅adapter与facade两测试文件。
  owner54589 checkall terminal0/77tasks；36295 native11/11（8Step/IRguard/callback/14整SVG控制），86447专项四目标各95/95，adapter32/32，info/fmt/结构通过。
  native93210曾10/11：set_color("none")转生成rgba透明却生7目标；new discrete gate已修生成格式alpha，后续全部通过，不改旧静态或全局统计gate。
- [x] Root Step仓库外演练20649 terminal0：dirty包静态4目标+真实Chrome19项全过。初55348只失败于Root新helper缺Unit返回注解，已修并保留首日志。
  证据step-rehearsal-fixed/；这不是正式包，绝不可上传。实际Stairs/Ecdf接入仍待源实现。
- [x] Root两组组合回归19233 terminal0，四目标各2/2：Step/Area、Step/Hex两paint顺序与两HitMode；scene/discrete_overlay_wbtest.mbt。
- [x] m4_area固定efd9d07独立复审与16ae5ab bounded复核已交：Native15/JS15公开消费、各4个guard白盒、14实际XML路径/14旧源SVG字节控制均过；证据已复制Root step-review/。
  真实阻塞：原Point经meet client往返有55/810误选incoming；401×257/full axes,limits[-1.7,4.8]/[-3.2,10.3],pre xs[.2,1.9,4.1],ys[2.3,7.2,4.4]，viewport17.7/5.9/377.7/255.7，1e-6radius回i1而应i0。
  810逆变换有约4e-14误差；Root已新增verify_step_roundtrip_consumer，13936 terminal0：实际dirty包静态4目标+Chrome19通过；12048两组合四目标各2/2亦过，consumer回归已随92e81ea提交。owner精确fix16ae5ab376a93861cc83fdfc3008e59bc2a5351c已合88bf8ad，m4 bounded复核Native810/810、JS810/810，两端各12controls通过，原55误选归零；近点1e-8/1e-6SVGpx仍incoming、同artist/不同artist/旧Line严格规则保留；未重跑已过15/guard/14SVG。
  修复精确SHA与Root一致：drawing/discrete.mbt=ba3dec872177cb008372b429340e4efd2d6c99fab99a7a103eda6cf90a913c73，proximity.mbt=db7b53bb2abd6e46572faa8dcfb91624316f9ebf0335f0c3a674b8c09a223547。
- [x] Stairs 2dbf50fa3d62eaf6a7a2628ae81faf05a0afc2e6已合f451acd：outline复用Line guard/edge map；filled只在全原polygon匹配、finite/原与映射strictmonotone后生成真实interval strips。
  Native16/16、8516定向四目标各80/80、adapter34/34、14旧SVG逐字/info/fmt/结构通过；无新公共struct，仅internal datum_count。
- [x] Root Stairs公开消费32702 terminal0：dirty包静态4+Chrome21，横向非零baseline正负值/非等宽源区间全部通过；不得上传演练包。
- [x] m4_area固定2dbf50fa独立Stairs复审冻结：Native/JS各29/29、22实际XML path、5000个point-in-polygon/实际rect并集控制、两个专用Native guard各1/1，全terminal0无阻塞。
  覆盖横竖/正负非零baseline/双轴反向、NaN整面拒绝、Log0删baseline、原/映射回折与退化、双Log/zero-area索引洞、clip及outline有效run。
  Root已复制stairs-review/三个冻结证据，manifest全部7份production SHA逐一匹配；无ECDF验收外推。
- [ ] m3_donut own codex/m7-discrete当前ECDF首production check2545 terminal0/0errors，正在加returned slot/weights/compress/CCDF/zero-weight duplicates与callback定向测试。
  仅builder和共享actual-run capture小改，不改原排序/累加/静态SVG；需定向重验Step/Stairs，Root最终再全套。
  每片专项、adapter/旧SVG/info/fmt/结构后coherent commit交Root；不改版本/中央docs、不push发布。
- [ ] m3_browser Root ignored draft四卡/14组runner/HANDOFF已完成，仅moonfmt/Node语法通过；未授权部署/编译/Chrome/截图。
- Root consumer的Step/Stairs已部署并真实验过；ignored consumer-draft内Ecdf片段待最后源实现，尚未部署。
  三组合回归第三组ECDF/Stairs只在ignored全量草稿，尚未部署；后续补回完整文件。
- 精确下一动作：Stairs源/公开消费已提交且独立复审已收 → 合ECDF/扩完整consumer与第三组合 → 授权UI七文件部署/Chrome14 → 最终全套/正式0.8包/实际发布。
  不重开19图调查；Stem定点设计保留next-stem-notes.md，尚未实现。
- Rootowns合入/公开冲突、consumer、中央文档/版本和实际发布；不新开agent。精确设计Root .moonagent/checkpoints/M7-discrete/design/。
- Root Step源b27f6a9、验证5f010cd、consumer/0.8候选版与两组合回归47d1435已push65503 terminal0。
  Root source fix88bf8ad/public endpoint回归92e81ea已push55820 terminal0。
  Root Stairs源f451acd与consumer/checkpoint419075b均已push70680 terminal0；仅后续checkpoint更新未提交，所有改动均Root自身。
- 无Root测试/下载live，唯一有意服务8765/session43005/PID70622；M6发布与核验都已闭环。

## 最新交付：M6 六边形分箱与小提琴分布（2026-10-25）

- [x] Hex语义c8471c9、Violin语义9f7cbe9、真实Hex数学修正19cb9ba（原1f126e4），四图DOM40bf65b；正式源f5b55cda898e359cc839109c19044d73131e59b5。
- [x] Hex双交错格点加权最近归属与同sx/sy顶点；每格原中心/计数/已算聚合值；实际六角Quad×2；marginals静态。
  原(.1,.1)错归/邻格重叠空隙已真实修正；9旧HexSVG必要变化、1空结果相同，不能报最终Hex字节不变。
- [x] Violin真实密度body与summary线、独立语义槽/paint顺序，只读ViolinInfo/Part。KDE采样不是原输入观测。
  6份旧ViolinSVG不变；统计值来自原计算，UI不重算。
- [x] 独立数学复审：12513有理数点/541边界、21786有限域点、外部native14组；无阻塞。
  最终productionSHA与复审一致：hexbin.mbt=3e3bf98f72bb4a7b7ff959e5c17b63c17994a53d39fe005b4935bb1017c19747，
  hexbin_grid.mbt=3fa918907588b5b938f5d67aec85fe544bda371ab2028a496babca7e22dae821。
- [x] 全套85340 terminal0：Wasm/Wasm-GC/Native各22452/22452、JS22489/22489；接口/fmt/七JS例build35183 terminal0。
  默认Chrome35813 terminal0：新分布13（10个源点实际SVG包含+mouse hover）、网格11、统计14、M3图14、提示14，0errors。
  静态60444三SVG可解析，preview6886/gallery14246与资产逐字相同；34份MD453本地链接/结构/diff通过；post-delivery34份456本地链接亦通过。
- [x] 新图实际JS4536157bytes/SHA19599131a9a6a052b4d9bc5650e30330b586f201a307adcc415bdaf1ed952b8c，默认与隔离一致、HTTP200。
  asset97879bytes/SHA1b584d6f32f1a65e19d6b327bb8d961d939eaa5629d100d971ed6d76eac2e66e，Root目视桌面真实输出通过。
- [x] f5b55cd已push93634 terminal0；clean builder85610 terminal0/dirty=false，外部静态4+Chrome17。
  模块1980179bytes/543files/SHA920a2a33c74f2797879ac295e76ccffd9289bb02af8bca6511d2afd6361fc2db；
  source2005511bytes/556files/SHA3b83615a8969d2ae7c8afb93465ae68a49d800af79c6f6461333274ddb210e7e。
- [x] 实际publish10417 terminal0/200；公开0.7.0 buildsuccess/has_package=true/yanked=false，checksum与正式ZIP相同。
  registry87095 terminal0：543安装源文件逐一相同、无workspace覆盖、静态4+Chrome17。
- [x] GitHub创建48804、说明63717、完整下载核验26346均terminal0；脚本等整个gh download完成后才读文件，四附件逐字/远端digest/size/tagSHA全过。
  https://github.com/moonbit-community/moonplot/releases/tag/v0.7.0 。旧tag与附件不变。
- M6证据 `.moonagent/checkpoints/M6-distributions/`，包括hexbin/violin/math-fix/hexbin-review/legacy-binning-audit、browser-final-*、release-final/registry-consumer。
  早期rehearsal-before-binning-fix是dirty旧数学演练，绝不可上传。正式交付只用release-final/artifacts。
- 无未完成M6测试或发布会话；仅有意预览session43005/PID70622，8765根目录服务，distributions.html与default JS已HTTP200。
- m4_area own worktree codex/m6-hexbin已clean/no live；m3_donut codex/m6-violin仅后续ignored设计；m3_browser七文件已交回无live。

## 早期交付与源码地图

- M1/M2、0.2.1单模块、0.3.0常用提示、M3/0.4.0热图/多系列柱/环形、M4/0.5.0统计交互均已交付。
  每片的旧测试、正式commit/摘要/registry与GitHub证据保留在[截至M4的执行历史](archive/migration-status-through-2026-10-25-m4.md)。
- M5网格与二维分箱的完整执行证据保存在[M5历史](archive/migration-status-through-2026-10-25-m5.md)。
- 旧版本tag与附件不移动、不覆盖；M6之前不再有必做验收项，不用旧会话恢复服务。
- 根包facade为api.mbt；消费者tests/api、全局配置隔离tests/integration，内部实现与白盒测试归拥有包。
  详见[架构图](ARCHITECTURE.md)。维护mbt<2000行，生成资源保留来源与复现命令。
- 既有preview6886/gallery14246 bytes的SVG资产保持原输出；运行cmd/preview、cmd/gallery后可直接逐字对比。
- JS-only接口用tools/update_interfaces.py调用真实编译器生成；最后info/fmt、检查mbti差异、结构与适当测试。
- 主分支master，SSH origin=git@github.com:moonbit-community/moonplot.git；新独立分支前缀codex/。

[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
