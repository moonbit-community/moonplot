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

- 用户“一直往后对齐”的授权持续；0.6.0已交付，接续MILESTONE_M6.md，不再重复M3/M4/M5调查。
- [x] 定点只读设计收敛，复用现有 hexbin/violin 的计算与绘制；下一目标0.7.0，Root版本与consumer已准备0.7.0（未发布），xml等依赖保持原版本。
- [x] m4_area Hexbin独立实现已合入c8471c9（原7bad1fa271f5df6e05091009e70c8d38504bb1b8）：原managed worktree /Users/lampese/.codex/worktrees/m4-filled-area/mathplotlib，
  从正式源b563204新分支codex/m6-hexbin，实现HexbinInfo/Reduction/Hexbin kind/可选metadata、实际六角Quad×2。
  原count和reduce结果保留，不重算callback；marginals=true首片静态不生成语义目标，避免误命中边缘条下方。
  独立新增精确16组四目标各16/16；10份b563204旧SVG共10146bytes逐字相同，临时probe已移ignored。
  bbox全外剔除/中心外但面可见/返回index保留已覆盖；相关4包四目标39323 terminal0各1890/1890，adapter28/28；接口/fmt/结构/静态通过。
  证据已复制Root .moonagent/checkpoints/M6-distributions/hexbin/；未宣称整合全套或Chrome。
- [x] Violin原d3aeeb335a31685b13caaa0bc1bb77d68a0f81cc已合9f7cbe9；来源m3_donut：原managed worktree /Users/lampese/.codex/worktrees/m3-donut-charts/mathplotlib，
  从b563204接codex/m6-violin，实现只读ViolinInfo/Part与KDE body/summary真实命中；不把估计采样说成观测点。
  已处理后画mean/median/quantile等Segment在body或hex区域上方的优先级；
  独立定向4目标各86/86、adapter28/28、6旧Violin SVG控制/info/fmt/结构通过，worktree clean/no live会话。
  Root证据violin/已复制；合并api/HitInfo冲突保留两个新字段/类型，mbti由真实编译器重生，merge-interfaces.log exit0。
- [x] m3_browser四图ignored草稿/HANDOFF/12组runner已完成，格式/Node语法通过，尚未部署/编译；
  等Violin及修正后的Hex生产合入、grid语义同步后明确通知部署。
- Root拥有中央文档/合入冲突/consumer/版本/发布；各agent不push/发布、不改中央文档或版本。
  不再开新agent；独立实现只定向检查，Root合入后统一全套与实际消费。
- 精确下一动作：Violin已合入，等Hex数学修正交接；Root已按固定接口准备consumer静态原值/KDE摘要和4项新DOM断言（尚未编译，待合入后检查）；
  解决HitInfo、metadata、callback与public再导出冲突后由编译器更新接口。不能把未合入实现说成已可用。
- Root新增scene/distribution_overlay_wbtest.mbt两个组合回归草稿（尚未编译）：横竖Violin统计线/Hex先后覆盖、Hex上ErrorBar与两HitMode；68166 terminal0：两组四目标各2/2通过（数学修正前）；测试以实际返回中心作布局，数学修正后随全套重验。
- Root consumer格式检查已过，runner node语法通过；新字段尚未Root编译，不等同消费验收。
- M6范围2f6e17c、检查点历史归档cad2245已本地commit；Root的consumer静态/app/runner、0.7版本和两组合回归已验证提交7ceec9b；未提交为rabbita ignore与中央docs；Hexbin与Violin生产已cherry-pick，Hex数学修正仍在独立worktree。
- m4_area从只读调查转入已授权的真实数学修正：旧hexbin数据归属与实际六角可能错位（(.1,.1)归center(1,1.5)但半径1的源六角miny=.5）；
  独立真实probe66077 terminal0证实源点不在所分格、同列邻格正面积重叠、异列邻格空隙。
  Root决定将真实分箱修正纳入尚未发布0.7/M6，先修后交付；此前Hex静态字节不变只是历史阶段证据，不能报作最终承诺。
  m4_area在7bad分支接数学fix：固定本地upstream双交错格点weighted nearest+同sx/sy六顶点，不扩API，保持已算原值metadata。
  grid已冻结：nx=gridsize,ny=max(1,floor(nx/√3))，integer/half两候选按dx²+3dy²，family tie半格；
  row=2*j+parity/column=i，occupied mincnt/首次遇到返回顺序/输入sample顺序保留；已同步UI。
  两hex卡新数据[.8,1.2,2.8,3.1,3.2]/[1.6,2.2,1.6,2,2.2] ->center(1,2)/(3,2)，row1/col0,1/count2,3；
  m3_donut只读独立建立oracle/审查同一partition，m3_browser只更新ignored草稿；待修正后部署四卡，不能把已知错误算法当最终版本交付。
- M5 post-delivery记录9e8a001已本地commit，push45303 terminal0；M5所有测试/registry/下载已结束。
  有意预览仍session43005/PID70622，grids.html与JS已HTTP200；Root adapter合并回归terminal0 JS30/30；dirty consumer演练99492 terminal0：静态4目标+Chrome17通过（旧Hex数学下，只查公开接入、绝不可上传该包）；
  Hex数学修正后只做最终正式验收，不复跑无关调查。

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
