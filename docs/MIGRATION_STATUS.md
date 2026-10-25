# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复会话先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用 MoonBit 画图库，能力与场景对齐，不要求完整 Matplotlib API 复刻，不恢复旧 D55 清单。
- M1 基础二维 SVG、G2.1 首批 Rabbita DOM、后续 UI 整理均已验收与交付。
- 代码组织、M2资源隔离、0.3.0提示、M3/0.4.0图表扩展、M4/0.5.0统计交互均已交付；用户要求持续往后对齐，M6/0.7.0现亦已交付，下一片离散曲线。
- 用户授权合理复用、独立 subagents、小步本地commit与正常push至 moonbit-community/moonplot；本地commit授权日期2026-10-23。
- 用户已于2026-10-24明确授权实际发布Mooncakes，前缀Lampese/，并要求核心与Rabbita合并单一Lampese/mathplotlib module。
- 不用历史API指数或未经调查的估算表示整体完成率。

## 当前切片：M7 离散曲线（待开工）

- 继续用户“一直往后对齐”：下一片step/stairs/ECDF原数据语义，目标0.8.0；尚未升级版本或改M7生产源。
- 第一未完成步骤：收敛m3_donut own ignored设计，建立公共DiscreteLineHitData/实际provider snapshot guard，复用实际valid-run线段。
  step保留原采样项；stairs保留原values/edges与baseline；ECDF保留既有返回值/概率索引，不反推合成转折点。
- 当前stage独立设计，不重开19图调查；m3_donut只读设计step/stairs/ECDF，m4_area只读stem（后续片），m3_browser已完成M6。
- Root拥有合入/公开冲突、consumer、中央文档与实际发布。各agent不push/发布，不改Root版本或当前检查点。
- 精确下一动作：M6已全部闭环，通知m3_donut从f5b55cd起新codex/m7-discrete实现三图及公共捕获；先小步公共IR/guard，再图类与定向四目标。
  建立M7验收范围与UI ignored草稿，复用现有架构，不新增whole-API清单。

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
  静态60444三SVG可解析，preview6886/gallery14246与资产逐字相同；34份MD453本地链接/结构/diff通过（文档新链接后只需重验links）。
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
