# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复会话先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用 MoonBit 画图库，能力与场景对齐，不要求完整 Matplotlib API 复刻，不恢复旧 D55 清单。
- M1 基础二维 SVG、G2.1 首批 Rabbita DOM、后续 UI 整理均已验收与交付。
- 代码组织、M2资源隔离、0.3.0提示、M3/0.4.0图表扩展、M4/0.5.0统计交互均已交付；用户要求持续往后对齐，M5/0.6.0现亦已交付，下一片M6。
- 用户授权合理复用、独立 subagents、小步本地commit与正常push至 moonbit-community/moonplot；本地commit授权日期2026-10-23。
- 用户已于2026-10-24明确授权实际发布Mooncakes，前缀Lampese/，并要求核心与Rabbita合并单一Lampese/mathplotlib module。
- 不用历史API指数或未经调查的估算表示整体完成率。

## 当前切片：M6 六边形分箱与小提琴分布（2026-10-25）

- 用户要求“一直往后对齐”；0.6.0已交付，接续MILESTONE_M6.md，目标0.7.0（未发布）。
- [x] Hexbin语义c8471c9（原7bad1fa）：只读HexbinInfo/Reduction、原中心/计数/已算聚合值、实际六角Quad×2；marginals保持静态。
- [x] Violin语义9f7cbe9（原d3aeeb3）：只读ViolinInfo/Part、实际密度body与summary线、独立语义槽和实际paint顺序。
  KDE估计采样不是输入观测点；metadata标量快照，不重算统计。独立四目标各86/86、adapter28/28、6旧Violin SVG逐字相同。
- [x] Hex数学修正已合入19cb9ba（原1f126e4b860870d42f0df0c0a8ccc9d2598e7cdc）：真实双交错格点最近距离与同sx/sy六顶点。
  grid1/最大边界/ties-to-even/half tie/输入及首遇顺序/marginals真实格线均覆盖；9旧Hex SVG必要改变、1空结果相同。
  独立相关四包四目标各1896/1896、新6组四目标各6/6、adapter28/28，结构/info/fmt通过。
- [x] 独立数学复审无阻塞：有理数12513点、541边界/21786有限域位置与全格点穷举、实际外部native14组。
  Root与复审精确生产SHA相同：scene/hexbin.mbt=3e3bf98f72bb4a7b7ff959e5c17b63c17994a53d39fe005b4935bb1017c19747，
  scene/hexbin_grid.mbt=3fa918907588b5b938f5d67aec85fe544bda371ab2028a496babca7e22dae821。
- 真实旧bug证据：(.1,.1)旧归center(1,1.5)但源六角miny=.5；同列正面积重叠/异列空洞。已纳入未发布0.7修复，不能报最终Hex字节不变。
- Root consumer/0.7版本与组合回归7ceec9b：横竖Violin统计线/Hex先后覆盖、Hex上ErrorBar两模式，旧数学下68166四目标各2/2。
  consumer演练99492静态4目标+Chrome17全过，但dirty且旧Hex数学，只作早期接入证据，绝不上传。
- [x] m3_browser七文件已冻结并提交40bf65b，隔离JS/info及Chrome13项terminal0，真实截图已Root目视。
  只拥有distributions七新文件；不改中央docs/version/生产源、不commit/push/发布。
- [x] Root最终全套85340 terminal0：Wasm/Wasm-GC/Native各22452/22452，JS22489/22489；full-suite.log。
  接口/fmt及七JS例build35183 terminal0；Chrome35813 terminal0：分布13、网格11、统计14、M3图14、提示14，0errors。
  60444三nativeSVG可解析；preview6886/gallery14246与旧资产逐字相同；34份Markdown453本地链接/结构/diff通过。
- 当前Root文档已准备0.7使用/兼容说明，但PUBLISHING明确仍待实际发布；最终验收后再标完成。
- 精确下一动作：最终文档commit/push后冻结 → clean builder（无allow-dirty）→ 实际Mooncakes publish/公开manifest → 实际registry全部文件+静态4/Chrome17 → GitHub四附件完整下载核验。
  正式clean构建到registry/GitHub结束前不改Git可见文件，live进度存ignored；别上传旧dirty演练包。
- 下一片定点设计step/stairs/ECDF正在m3_donut own ignored进行，不做生产实现；待0.7完整交付后接续，不重开19图调查。
- m4_area worktree /Users/lampese/.codex/worktrees/m4-filled-area/mathplotlib，codex/m6-hexbin，已clean/no live；
  m3_donut /Users/lampese/.codex/worktrees/m3-donut-charts/mathplotlib，codex/m6-violin，仅后续ignored设计。
- Root证据 .moonagent/checkpoints/M6-distributions/{hexbin,violin,math-fix,hexbin-review,legacy-binning-audit}/；
  UI draft/HANDOFF与各log同目录。m4原M7-hexbin-audit证据已复制math-fix，实际归属M6。
- 仅有意预览session43005/PID70622，8765根目录服务；正式新示例链接需default build后确认HTTP再展示。
- 分布JS4536157bytes/SHA19599131a9a6a052b4d9bc5650e30330b586f201a307adcc415bdaf1ed952b8c，默认与隔离一致；HTTP200。
  asset97879bytes/SHA1b584d6f32f1a65e19d6b327bb8d961d939eaa5629d100d971ed6d76eac2e66e；Root已目视实际输出。
- Root origin/master=188ba30，上次push8030 terminal0；19cb9ba/40bf65b尚未push。各agent不发布，Root统一交付。

## 最新交付：M5 网格与二维计数（2026-10-25）

- 用户要求“一直往后对齐”；M4/0.5.0已完整交付，现继续MILESTONE_M5.md，不重启全项目调查。
- [x] 冻结范围：1D严格单调边界flat pcolor/pcolormesh、无权重hist2d计数；复用CellInfo，hist新增Histogram2D kind。
  保留原始row/column/scalar或count/x-y区间，不把归一化色彩反推成原值。
  _grid曲线边界/nearest/Gouraud/hexbin/权重密度均明确留后。
- [x] 网格5fe40aa已合为0ea853e；独立worktree /Users/lampese/.codex/worktrees/m4-filled-area/mathplotlib，基线1c62dd7。
  Scene push处保留原始信息、Polygon原points数组身份、同次实际绘制采集；IR小只读MeshHitData，不增root结果类型。
  metadata查找需序号身份校验+连续record游标+fallback；image checked attach和inline contour会使两数组错位，不能只按index或每格从头扫描。
- [x] 旧Bar/BarH Logit跨有效域修复a6cd385已合为eda85a6，生产仅backend/svg/bar.mbt。
  定向四目标各86/86，7新组和12份原线性/Log/合法Logit横竖反向SVG固定快照通过，info/fmt/结构通过。
  原始类别/值/索引、actual rect capture、显式minpos/viewport/CSS保留；Scale与自动范围算法未改。
- [x] m3_browser获授权部署7个新文件并冻结交回；rabbita/cmd/grids、grids.html/css/grids_browser_test.cjs、assets/grids.png。
  初build/定向compiler info通过；实际Chrome66558 terminal0，11项/0error，Root已目视实际截图。
  初JS4,341,955bytes/SHA c6289716bdd256931ca5a1161d8fd44fd7692fccf2ba013062a70fbc936f4c2d；
  asset89442bytes/SHA23732ee4e6c32481c6f8f85d79f9ad15a32d5fc9302ca1b7db568e3b618418ed，与实际截图相同。
- 精确下一动作：M5无剩余必做验收项；记录交付后继续M6六边形分箱与小提琴图。不要重复已通过的完整调查或已完M4检查。
- Root现已合网格0ea853e与普通柱eda85a6，版本/root consumer为0.6.0；正式发布与独立消费现已完整验收。
- 独立网格受影响四目标各1867/1867、adapter26/26；6份基线SVG共6922bytes相同。
  native含创建/两SVG/断言：10k格约47ms，image前置约46.9ms；仅实测，不设脆弱时限。
- m3_donut只读复审无阻塞，Row/Col/alpha/norm/inline-contour错位/default cell=None均看过；Root亦复查真实alpha和polygon校验。
- 中央21093 terminal0：四目标相关drawing/scene/backend/svg/tests/api各1874/1874。
- 独立consumer首轮42887失败，仅Root新增示例Figure::barh误传Point数组；已改双数值数组。
  重演35344 terminal0：静态四目标新增mesh/hist2d/Logit普通柱断言+Chrome13全过；dirty包不可上传。
- Root空Map{}在生产check有ambiguous braces warning，已改Map([])；30450四目标Drawing各41/41通过。
  全套52856在该纯初始化语法清理前启动，主要M5语义已包含；新初始化由上述专门回归覆盖。
- 57821 terminal0：最终接口/info/fmt与6个默认JS示例build通过。52856 terminal0：全套Wasm/Wasm-GC/Native各22410/22410、JS22443/22443。
- 中央Chrome均terminal0：新网格30916 11项、统计93279 14项、M3图29446 14项、原提示50755 14项；均0pageerror，输出browser-final-{grids,statistics,charts,tooltips}/。
  不改已发布0.5.0 tag/附件。M5各agent不push/发布、不改Root版本/主检查点。
- 最终diff发现Root升级版本时误替换xml依赖0.5→0.6；已恢复原0.5，不升级无关依赖，重验adapter/默认build与clean消费。
- 恢复xml0.5后90674 terminal0：adapter26/26、info/fmt与6个JS示例build；四Chrome再次全过：
  71131网格11、25338统计14、12330图表14、23712提示14，均0pageerror，browser-restored-*/。
  最终grids JS4338728bytes/SHA3819b8939be52f2b4fd839b96b48f4e5ee879fd42a2a846d9c666fd2074ec40e。
  77927 terminal0：三native SVG解析，preview6886/gallery14246与旧资产逐字相同；31份当前Markdown437本地链接/结构/diff通过。
- 515f0ef消除Map初始化warning，示例/consumer/0.6文档b563204ab9d021f7660c1ab0166104972ad2e4a8已push。
  clean builder19040 terminal0，dirty_rehearsal=false，外部静态四目标+Chrome13全过；
  模块ZIP1879592bytes/531files/SHAf29da6521079f7dfca8d82bffba7cb96aa040f30ce9fa9c3807c25d8a2afba17，
  source1903028bytes/544files/SHA00e032a676218f017f5f8b43cac92bd4dfc627b73c8c63fe00719c8703fc7030。
  publish58662 terminal0/Server200；公开0.6.0/buildsuccess/has_package=true/yanked=false。
  GitHub36636与download37805均terminal0，完整下载后四附件逐字/远端摘要/tag核验全过；
  首轮误读未下载完文件的预读断言不成立，已等terminal后完整重验；正式tag指向b563204，download-check.json已落盘。
  registry21402 terminal0：531份源文件逐一相同，无workspace覆盖，静态四目标+Chrome13全过。
  https://github.com/moonbit-community/moonplot/releases/tag/v0.6.0 。
- M6后续并行：m4_area在独立worktree从b563204接hexbin；m3_donut小提琴设计已收敛待实施；m3_browser仅ignored draft。
  当前Root无M6生产合入；各agent不改版本/中央docs、不push/发布。
- M5证据 .moonagent/checkpoints/M5-grids/；bar证据已复制ordinary-logit-bars/。
  上述全套/中央浏览器会话均已结束；仅有意预览session43005/PID70622，
  http://127.0.0.1:8765/rabbita/statistics.html ，根目录服务、HTML/JS已HTTP200。

## 早期交付与源码地图

- M1/M2、0.2.1单模块、0.3.0常用提示、M3/0.4.0热图/多系列柱/环形、M4/0.5.0统计交互均已交付。
  每片的旧测试、正式commit/摘要/registry与GitHub证据保留在[截至M4的执行历史](archive/migration-status-through-2026-10-25-m4.md)。
- 旧版本tag与附件不移动、不覆盖；M5之前不再有必做验收项，不用旧会话恢复服务。
- 根包facade为api.mbt；消费者tests/api、全局配置隔离tests/integration，内部实现与白盒测试归拥有包。
  详见[架构图](ARCHITECTURE.md)。维护mbt<2000行，生成资源保留来源与复现命令。
- 既有preview6886/gallery14246 bytes的SVG资产保持原输出；运行cmd/preview、cmd/gallery后可直接逐字对比。
- JS-only接口用tools/update_interfaces.py调用真实编译器生成；最后info/fmt、检查mbti差异、结构与适当测试。
- 主分支master，SSH origin=git@github.com:moonbit-community/moonplot.git；新独立分支前缀codex/。

[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
