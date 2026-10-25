# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复会话先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用 MoonBit 画图库，能力与场景对齐，不要求完整 Matplotlib API 复刻，不恢复旧 D55 清单。
- M1 基础二维 SVG、G2.1 首批 Rabbita DOM、后续 UI 整理均已验收与交付。
- 代码组织、M2资源隔离与独立交付、0.3.0图表提示均已完成。用户已明确要求持续实现后续图功能，当前先完成M3，再按实际缺口继续。
- 用户授权合理复用、独立 subagents、小步本地commit与正常push至 moonbit-community/moonplot。
- 不用历史API指数或未经调查的估算表示整体完成率。

## 当前切片：M4 统计图与区间交互（2026-10-25）

- 用户明确要求“继续往后对齐图功能，一直往后对齐”；持续实现和交付，不停在规划。
- [x] 0.3.0 正式 ZIP 的 19 图、四目标调查已完成并保留于 docs/CHART_COVERAGE.md 与 docs/audits/chart-coverage-0.3.0/。
  不重复调查，不用历史 API 数量估算整体百分比。
- [x] M3.1 nearest 标量 imshow/matshow：真实整格命中、原始 row/column/value/数据范围、默认和自定义提示。
  upper/lower、反向 extent、mask/NaN/透明格、裁剪/图例/CSS/letterbox/更新均有测试。
  none/平滑 PNG、RGB(A)、不规则 mesh 不属于本片 cell 语义。
- [x] M3.2 grouped_bar/stacked_bar：横竖向、组内间距、正负独立累计、非零基线、稳定系列/类别/原值。
  BarSegments 输入先校验再变更状态；整段命中复用实际绘制；保留原 Bar/BarH 路径。
- [x] M3.3 donut：真实透明孔、内外半径和环扇区命中，完整单片环、旋转跨零角与原始占比。
  新 AnnularSector 角边界舍入修正不改变旧 Sector；Figure 本身白色背景保留。
- [x] 五图真实 DOM、默认/中文回调、图例隐藏/恢复、数据更新、重挂载、375px 与实际透明孔像素验收。
- [x] 四目标全套、晚修后受影响回归、接口/fmt/check/结构、旧 SVG 与旧浏览器回归。
- [x] 0.4.0 dirty ZIP 演练：仓库外四目标静态断言 + Chrome 七项通过；仅为 rehearsal，禁止上传。
- [x] clean 正式包、Mooncakes 实际发布/独立 registry 消费、GitHub v0.4.0 四附件回下载核验。
- 精确下一动作：收完整四目标6993的Native最终结果，收五个中央Chrome（下方会话），
  更新最终文档并commit/push，运行clean正式0.5包 → 实际Mooncakes/registry10项 → GitHub附件回验。
  三份M4已合入：ErrorBar9be5098、Area7fa861b、Boxb5b87c8；冲突均保留三种metadata，并用编译器重生接口。

### M3 源码、修复与验证

- 当前版本文件与 tests/consumer 为 0.4.0；实际 Mooncakes/GitHub 均已发布 0.4.0，正式源 2f859ed。
- 已合入并 push：7adb3bc 热图、f210886 真环形、0a91ba6 多系列柱、cca4d28 环角边界、
  4ed3096 Logit 双端越域但区间穿过 viewport 的柱、367d1ad 五图页面与独立消费。
  已 push 的 b5c10d3 修自动 Logit endpoint-only 概率数据的有限范围；仅在默认数据 minpos 路径回退，显式配置保留。
- 已知边界：旧普通 bar 的 Logit 无效端点仍由旧谓词过滤；新 grouped/stacked 完整区间可以正确穿过有效域。
  不把自动视图修正宣称为旧普通柱所有非线性组合都已对齐。
- CellInfo/Heatmap/HitInfo.cell、BarSegment/BarSegments、Donut/AnnularSector 及 facade 接口已生成并审查；
  M3_CHARTS.md、MULTISERIES_BARS.md、DONUT.md 说明新 API 和枚举穷尽匹配迁移。
- 全套23914 terminal0：wasm/wasm-gc/native 各22321/22321，JS22346/22346；发生在三处晚修之前。
  最终晚修后4128 terminal0：drawing/scene/backend/svg/tests/api 四目标各1798/1798。
  不将早期全套说成晚修后再次重跑；既有 Logit 对比四目标199/199亦通过。
- 最终25518 terminal0：tools/update_interfaces.py（all info + JS-only 编译器接口 + fmt）和新示例 build。
  结构/diff 检查通过；维护文件最大1930行测试、1440行生产，IR1381行。
- 最终 Chrome156.0.8078.47：新图53386 14项、旧提示67802 14项、旧主例31721 11项、资源35593 7项，均terminal0/0pageerror。
  实际新 JS4352045bytes，SHA256 be6afc69354d9aa6d3ed552309a51c0fa1d295ef42185508e9e9a80fd864694a。
- 16715 terminal0：preview.svg6886bytes、gallery.svg14246bytes，均解析且与原资产逐字一致。
- 证据 .moonagent/checkpoints/M3-implementation/；正式 release-final/ 和 registry-consumer/ 已完成。
  30827 rehearsal terminal0/dirty=true 仅作演练证据；所有测试进程已结束。
- 2f859ed691a4c7692341e3f97cc6bf03b1edce36 已正常 push；clean builder86191 terminal0/dirty_rehearsal=false。
  正式模块 ZIP1,659,036bytes/510files，sha256 3c5cd49c8a2f48832e3df2e7f9b44b3ea98c900a1ef21ececf5ec594fdd48512。
  source bundle1,678,776bytes/523files；正式 ZIP 仓库外静态四目标与 Chrome7通过。
- moon publish79378 terminal0/Server200；公开0.4.0/build_status=success/has_package=true/yanked=false。
  真实 registry15907 terminal0：无workspace覆盖，510文件逐一相同，静态四目标和Chrome7全过。
- GitHub82755发布、93791下载均terminal0；v0.4.0 tag指向2f859ed，四附件逐字节与远端摘要一致。
  https://github.com/moonbit-community/moonplot/releases/tag/v0.4.0 。旧tag/附件未改。
  正式交付无残留测试会话；本页后补记录不移动正式tag。

### M4：中央整合中，目标 0.5.0

- [x] 误差棒独立实现/定向验收，原提交：5707f896e52dbdd67d75a246c2458f38740bc9d3。
  ErrorInfo、ErrorBar、Segment；实际中心/误差臂/端帽，范围溢出拒绝、原样本吸附、旧 SVG 不变。
  四目标受影响各1803（JS1823），adapter20/20；info/fmt/结构通过。
  worktree /Users/lampese/.codex/worktrees/m3-multiseries-bars/mathplotlib，现已交回。
- [x] 面积独立实现/定向验收，原提交：b9d7ff9c0b07558189e2f4b9466b12ed748b128e。
  Area/BandInfo/Quadrilateral、fill_between/x 与 stackplot 四基线，stack 原值单独保留；
  真实填充按屏幕主方向中点归最近原样本；非单调/重复位置不生成交互目标，静态照常。
  四目标受影响各1800/1800、adapter20/20；info/fmt/结构通过。
  worktree /Users/lampese/.codex/worktrees/m4-filled-area/mathplotlib，已交回。
- [x] 箱线独立实现/定向验收，原提交：d7c97df062bc11dec1d1fc3284c7df344d8874c3。
  worktree /Users/lampese/.codex/worktrees/m3-donut-charts/mathplotlib，底座含 ErrorBar，本commit仅Box增量。
  复用 BoxStats 与实际箱/须/帽/离群点；精准四目标各49/49、adapter22/22，4份旧SVG14723bytes相同。
  info/fmt/check/结构通过，已交回。
- [ ] m3_browser 只在 ignored .moonagent/checkpoints/M4-statistics/draft/ 起草五图 DOM/runner，
  等 Root 合入 M4 后通知部署；不写 Git-visible 文件，不影响 0.4 正式包的 clean 源。
- 独立 ErrorBar 只读复审有两个实证，Root合入后统一修，不在UI绕过：
  bar→errorbar 后画误差线/中心被area-first吞掉；none/transparent仍有不可见端帽目标。
  还需独立mode回归：两真实中心+长横臂中，Nearest按真线段，XNearest仍按中心x而不选须。
  审查证据在 m4-filled-area worktree 的 .moonagent/checkpoints/M4-error-review/review.md，源未改。
- [x] 中央合并后的显式4包回归74931 terminal0：四目标各1841/1841；adapter32147 terminal0，JS24/24。
- [x] Root修统计叠加优先级：drawing/proximity.mbt、shape_hit/hit 与scene/statistical_overlay_wbtest。
  仅实际命中的后画 ErrorBar/BoxPlot 描边/点可压过区域；XNearest按激活系列原中心选择。
  最终45323 terminal0：5组真实 Scene 组合反例四目标各5/5，含顺序/模式/无关系列/CSS/箱线部位。
  初筛9906是部分名字匹配4组，不能混作最终5组；原先 browser 已真实复现该问题。
- [x] none/transparent/零alphahex与零宽统计采集修复9062380已合为1c62dd7。
  独立四目标定向各69/69、接口/结构通过；Box独立fill/可见离群点保留，空心Box只命中真实边框不造裁剪边。
  未识别CSS paint保守保留，SVG写出属性/顺序未改，所有新场景静态=Drawing。
- [x] 新统计五图overlay修正后Chrome70273 terminal0：14组、0pageerror，Root目视实际截图。
  仍等none/transparent合入后最终重build；增加data-*完整字段断言的30012也在跑。
- [x] m3_browser最终65082 terminal0，14/14、0error，7新文件冻结交Root。
  最终JS4,449,616bytes/SHA55b92e48a1ec5e4d256ea3b3c427a485a7572709069c41af2a2b1e65027b2f64；
  assets/statistics.png119391bytes/SHAa47b210fb3348a2302e1c047317a39dd70a7fc311824c290934114cbd4510462。
  data-*核原坐标、Band四字段/原stack值、Box全部部位/原组号/原统计；首轮真实失败留证，生产修后完整通过，无UI绕过。
- [x] 0.5.0版本/独立consumer已准备，dirty演练42977 terminal0：仓库外静态四目标+Chrome10全过。
  增加真实ErrorBar叠Area、Band原范围、stack原值、Box分位/离群点消费；此包不可上传，晚修后必须clean重做。
  新工具按实际browser report统计检查数量，避免硬编码结果。
- Root将overlay激活系列从Array改为Map避免大量series二次查找，check通过；最终全套负责回归。
- [x] 最终完整全套6993 terminal0：Wasm/Wasm-GC/Native各22391/22391、JS22422/22422。包含透明采集与Map overlay。
- 最终97754 terminal0：update_interfaces.py（info all+JS-only mbti+fmt）和五个默认target-dir JS示例build通过。
  公共接口审查只加ErrorInfo/BandInfo/BoxInfo/BoxPart、三个kind、Segment/Quadrilateral、HitInfo三可选字段，旧Scene调用不变。
- [x] 中央五Chrome均terminal0：统计54417 14项、M3图80899 14项、提示21898 14项、主例27928 11项、资源70598 7项；
  输出 .moonagent/checkpoints/M4-statistics/browser-final-{statistics,charts,tooltips,main,resources}/。
  五份report均无pageerror，新统计默认build JS与agent最终hash相同；仅预览8304保留，测试服务finally关闭。
- 22791 terminal0：main native输出2497bytes、preview6886、gallery14246；后两份与原资产逐字相同，三SVG均解析。
- 最终结构检查通过；下一步提交0.5源码和文档，再clean正式打包，不上传dirty演练。
- M4范围见 MILESTONE_M4.md；后续M5定点调查已确定1D flat网格+无权重hist2d计数，m4_area只读设计中。
  m3_donut已在独立worktree接续旧普通Bar/BarH跨Logit有效域遗留修复，0.5发布前不合入。
  M5范围见MILESTONE_M5.md；m4_area在clean独立worktree从1c62dd7实施flat网格+hist2d，已明确委派，不改Root或版本。
  M5网格数据在Scene push处保存，Polygon原数组身份；前置image与inline contour错位需游标+身份校验，不能单索引错误退化。
  Root已完成0.4发布，M4合并和第一轮定向已过，继续上述精确下一动作。
- 只有有意预览 session8304/PID74453 保留，根目录服务：
  http://127.0.0.1:8765/rabbita/tooltips.html 与 http://127.0.0.1:8765/rabbita/charts.html 。
  open_in_codex 返回 queued，不宣称已切换用户页面。测试临时 HTTP/Chrome 均 finally 关闭。

## 已完成切片：常用图表命中与提示（2026-10-25）

- 用户截图要求：柱/横柱整个矩形可悬停，折线按x吸附实际样本；提示系列、分类、值，直方图区间/频数，饼图分类/值/占比；调用方可自定义格式/外观。
- [x] Drawing immutable HitInfo/HitTarget/区域与HitMode已落地；保留HitPoint与Interaction；Nearest兼容，XNearest显式开启。
- [x] 同次绘制收集Line/Scatter/Bar/BarH/Histogram/Pie真实几何与metadata；原始点索引/label/category_y/edges/fracs完整。
  B新8组语义+原8组回归四目标各16/16，A只读审查通过；源码提交9996e22。
- [x] Rabbita hit_mode/tooltip回调/visible/class与默认丰富提示已落地，当前17个JS单测通过（原14+新3）。
- [x] C最终真实Chrome156.0.8078.47六图13组通过0pageerror，截图桌面/mobile已由Root目视。
  原主图11项/资源7组也中央跑过；新图真实截图assets/tooltips.png。
- [x] 完整四目标回归、接口/格式/结构/文档与外部消费者演练通过；前三步提交已push。
- [x] 最后复审发现SVG图例覆盖区仍触发数据；已修同次绘制采集真实图例矩形，按panel排除，四目标定向与真实Chrome回归通过。
- [x] 图例修复提交后重新clean构建正式0.3.0包、实际发布与registry独立消费、GitHub附件回验全部完成。
- 责任：A(/m2_svg_scoping)只drawing；B(/m2_package_audit)scene/backend/svg/internal-render与对应tests；C(/m2_resource_browser)新增tooltips示例/页面/runner；Root适配层/文档/交付。
- 现有0.2.1已发布且registry验收完成，旧片全部历史；不重启旧API迁移。
- 基线342713d814dc905a9ba273fcbd9b761d53d50ad2，证据.moonagent/checkpoints/tooltips-2026-10-25/。
- 精确下一动作：本切片实现与发布验收已完成，无剩余必做项；后续按用户新需求继续。旧53e23ed包从未发布，正式源为2fb8bcf。
- A最终drawing四目标19/19，XNearest统一按dx最小/dy tie，nearby Scatter仍优先；反例回归通过。
- B与A已STOP source；C最终13组已terminal0并交回6文件，证据typed-tooltips/browser/。
- Root首次外部ZIP65275静态四目标通过，新增第二图使旧CSS选择器strict失败；已修特定chart selector+滚动。
  演练93621 terminal0：四目标新hist/pie断言+真实Chrome6项（含bar自定义metadata）全部通过。
- Root适配层17/17，新callback收到真实metadata、隐藏不求值/不派事件、旧point-only兼容、stale拒绝均通过。
- Root final-demo-build2771 terminal0；中央info/fmt/check-all通过，full alltest84850 terminal0：wasm/wasm-gc/native各22283、JS22307全部通过。
  info-js95686及main/preview/gallery71378均terminal0，后两者SVG字节相同；主browser42441/资源27922均terminal0。
- 当前Moon info的target只inspect而不改变Wasm canonical；新增tools/update_interfaces.py保留JS-only compiler mbti并fmt，已过。
  mbti审查只新增Drawing类型/可选参数、Rabbita view可选参数与内部RenderMetadata；既有HitPoint/Interaction与SceneAPI不变。
- 用户交互/UI/六图示例已提交257e619；dryrun77435服务端202明确No changes made，CLI仍误报exit255（既有状态码处理差异）。
- 53e23ed正式源已push；其clean正式ZIP builder74830四目标静态+Chrome6通过，但晚发现图例bug，未发布；该包禁止上传。
- 晚修drawing/model/hit/shape_hit+exclusion_test，backend/svg/drawing/legend/panel与scene/drawing_semantic_wbtest；
  A drawing四目标各23/23；Root82331四目标受影响drawing/scene/backend/svg/tests/api各1752/1752。
  图例同panel排除/其他panel不屏蔽、四角真实legend、SVG完全相等、缩放/letterbox/legacy/非法rect均过。
- 最终JS示例显式启用hist真实SVG图例，Chrome89549 terminal0：14组、0pageerror；新增断言确认图例底下确实是bar再要求noHit。
  54218最初fixture未真正恢复legend而失败，已改clear_legend启用自动图例后通过；未掩盖生产失败。
  assets/tooltips.png已更新并目视。中央interfaces/fmt与check-all94255、structure/diff均过。
- A图例handoff已STOP无live会话；其余agents均STOP。日志与handoff仍在本片证据目录。
- 图例修复源2fb8bcfc54a6a071dec0a83e9ba1d054db823c4c已push。最终interfaces/fmt与adapter17/17通过；
  clean正式builder69942 terminal0：四目标静态+Chrome6项通过，dirty_rehearsal=false。
  唯一正式模块ZIP1,519,916bytes/493files，sha256 cb737aa10e4948ae5e238493550fd0cdccdddc02d0d5bb28f1485d2f31833792。
- moon publish4697 terminal0/Server200；公开0.3.0/build_status=success/has_package=true/yanked=false。
  registry独立安装55986 terminal0：无workspace覆盖、493文件逐一等于正式ZIP、静态四目标+Chrome6全部通过。
- GitHub v0.3.0发布53550 terminal0，四附件下载94879 terminal0并逐字节/远端摘要核对通过；tag指向2fb8bcf。
  https://github.com/moonbit-community/moonplot/releases/tag/v0.3.0 ，https://mooncakes.io/docs/Lampese/mathplotlib 。
  最终source bundle1,537,913bytes/506files；完整manifest/checksums/report及日志均在本片证据目录。
- 无未解决实现/测试/发布失败；临时浏览器与打包HTTP服务均finally关闭，仅保留下方有意预览8304。
- 旧预览服务已不在；新有意保留服务session8304/PID74453，显式服务仓库根：
  http://127.0.0.1:8765/rabbita/tooltips.html ，HTML+JS已绕过环境proxy核HTTP200；open_in_codex返回queued。

## 当前发布片：用户授权Lampese/并合并单模块（0.2.1）

- 用户已于2026-10-24明确授权实际Mooncakes发布，前缀Lampese/；随后要求合并核心与交互适配器。
- [x] 单一模块Lampese/mathplotlib@0.2.1；Rabbita移至rabbita/ JS-only子包，导入Lampese/mathplotlib/rabbita。
- [x] 所有namespace/路径/工具/consumer已同步；51份mbti归一化等价、907份mbt逐字节不变，A只读审查通过。
- [x] 全套四目标test：wasm/wasm-gc/native各22264/22264，JS22285/22285（含14适配器），全部通过。
  all check/API等价、Chrome11+7、实际ZIP独立四目标静态+Chrome5均通过。
- [x] 实际发布CLI9540 terminal0/Server200 OK，registry公开0.2.1/build_status=success/has_package=true/yanked=false。
  真实registry消费者55373 terminal0；486文件与正式ZIP逐一相同，无moon.work或仓库覆盖，静态四目标与Chrome5项通过。
- [x] 文档/提交/版本发布完成；GitHub v0.2.1四附件回下载字节一致，tag与正式源e5393b9一致。
  已发布GitHub v0.2.0保留原源码/附件/tag不修改。
- 当前账号whoami=Lampese，新两个命名空间初查404；最终只发布一个模块，不发布独立moonplot-rabbita。
- Root拥有源/metadata/工具/consumer/registry发布；B仅当前文档（除本页）；C仅四份HTML/browser runner；A只读API等价审查。
- 本片证据.moonagent/checkpoints/Mooncakes-0.2.1/；基线4d4e38c9a2dfc81fd0fe6033760048a02f7617de。
- all check86739 terminal0（7旧warnings）；两个JS demo build/info-all/fmt37152 terminal0。
- 全套test all38327已terminal0：wasm/wasm-gc/native各22264通过，JS22285通过（含14适配器）。
- C真实Chrome155主37913通过11项、资源68823通过7组，0pageerror；两截图与原验收逐字节相同。C已STOP。
- A等价审查与B当前文档均STOP交回；95份Markdown/463本地链接0broken，结构/diff/工具语法检查通过。
- 生产单包演练86310 terminal0：486files/~1.4MB ZIP在外部显式workspace四目标静态+真实浏览器5项通过。
- dryrun40924：服务端202 Accepted明确Dry run completed successfully/No changes made；CLI错误处理把202当非200而exit255。
  这是已确认的CLI状态码处理差异，未实际发布、不是403权限失败。保留完整日志，不伪报dryrun exit0。
- 正式源提交e5393b9cffacb84105e947adb8c8e81776af083b（合并0d07990），已push；正式builder51394 terminal0，dirty_rehearsal=false。
- 单一Lampese-mathplotlib-0.2.1.zip：1,399,546 bytes/486files；source bundle1,416,348 bytes/499files。
- publish9540 terminal0/Server200，公开模块API与docs页面均HTTP200，独立Lampese/moonplot-rabbita仍404（没有发布第二模块）。
- 首个registry验收67785查出“应用直接使用Rabbita API必须自行声明框架”的要求；文档/验证工具已补齐，不改库实现。
- 最终registry验收55373 terminal0：新static工程只moon add MoonPlot，全四目标SVG通过；新browser工程声明Rabbita框架并add MoonPlot，Chrome5项通过。
  486个安装源文件逐一等于正式ZIP，报告registry-consumer/report.json+installed-source-check.json+browser/。
- GitHub v0.2.1发布45103、下载64720、API/tag/摘要38718均terminal0；四附件与本地正式包字节一致。
  tag仍为正式源e5393b9；其后只修验收工具和接入文档，不重打或覆盖已发布0.2.1。
- Mooncakes：https://mooncakes.io/docs/Lampese/mathplotlib 。GitHub：https://github.com/moonbit-community/moonplot/releases/tag/v0.2.1 。
- 当前namespace发布片已完成，无未处理失败/必做项。验证工具与框架声明补充随交付记录提交，正常push后核远端即可。
  所有agents已STOP，测试临时浏览器/服务关闭；仅保留下方用户预览。旧nested module缓存已清理，仅用根构建与依赖缓存。
- 原38768预览服务已停止（旧目录已迁移）；新有意保留服务session70004、PID77494，根目录serve，URL http://127.0.0.1:8765/rabbita/。
  HTML与JS HTTP200；open_in_codex返回queued，不宣称已导航显示。
- 合并源码已提交0d07990；最后info-all/fmt/完整性已过。下一动作提交发布工具与文档，clean正式打包并push；
  实际moon publish后查API和真实安装验证。
  若publish CLI报非200，先读服务端状态并查registry确认是否实际成功，勿盲目重复不可覆盖版本。
- 初查会话39038已terminal0；没有本片运行会话，旧8765预览服务保留，合并后须更新服务根和页面。

## 当前 M2：交互绘图可用版（用户已要求直接实施）

- 已冻结范围：真实DOM、hover/click、图例/数据更新、基础多图/响应式/挂载、UI示例；已有G2.1/UI实现保留。
- [x] SVG资源按chart id隔离：定义、url本地片段、href/xlink链与根别名，静态Drawing/SVG与公开API不变。
  ARIA内部IDREF可归一化，但Rabbita0.16.7无公开SVG setter，DOM仍明确不支持，不宣称实现。
- [x] JS adapter14/14，Chrome155资源七组通过；旧版8重复ID/红蓝误绘真实复现，修复后同页像素证明。
  双图渐变/clip、href链/root别名、独立事件、重绘/改序/三次重挂载通过。
- [x] 0.2.0实际ZIP演练包在仓库外独立消费；静态四目标SVG解析/3hits/相同Drawing断言，真实Chrome5项通过。
  包含LICENSE/样式/README；核心包约1.4MB（原18.8MB），adapter约20KB，无测试/缓存/隐式workspace。
- [x] M2 v0.2.0正式GitHub版本已发布，五份附件回下载逐字节核对通过；安装与验收说明完成。
- 现有Mooncakes凭据账号Lampese；两个原命名空间dryrun经服务端确认403 User mismatch。
  不改名，GitHub v0.2.0源码版本包为本轮交付渠道；Mooncakes明确未上架。
- A/C资源实现与浏览器已STOP交回；B现拥有tests/consumer及tools/verify_release_consumer.cjs。
  Root拥有manifest/打包tools/文档/中央验收/发布；当前版本均已改0.2.0，包内测试/参考数据排除，packed prebuild输入保留。
- 已完成实现/验收/源码提交/正式包/发布/远端核查。registry权限403单独明确记录，未冒称Mooncakes发布。
- 本片证据 .moonagent/checkpoints/M2/；基线7cde6cfb0d96ee87591e05c6b66f34aa83aaa477。

## 代码组织：实现完成

- [x] 根types/plot合并api.mbt；12份消费测试移tests/api，只有注释的空白wbtest删除。
- [x] 18个隔离配置测试包integration移tests/integration；生成器目的路径、当前文档命令同步。
- [x] SVG render4158→136行、pyplot state2353→157行、Scene figure1588→534行，按职责同包拆分。
- [x] 332个完整代码块逐字保留（只忽略块间空白分隔），没有为拆文件增加公开helper。
- [x] 6559行颜色match变6行委托，1163个完整名字/别名及通道bits移internal/color_names。
- [x] 两份最大Logit测试23,473,639 bytes变4,172 bytes测试体+约5KB共享reader。
  220+248个原cases、原15组、完整大数组结果与scalar origins/bits不变；约1.99MB派生fixture独立存放。
- [x] 原独立oracle JSON未改，生成器支持--from-fixture --check；prebuild只生成ignored白盒载入文件。
- [x] 结构规则/检查脚本、架构说明与fixture格式/复现说明已补齐。
  根受Git管理文件23→10；手写生产最大1440行，含测试的手写文件最大1930行。
- [x] 其余大文件主要是旧生成参考代码，已清晰标识、保留原覆盖；未冒称全部源文件都已数据化。

## 代码组织：验收完成

- [x] 中央moon info / moon fmt / check --target all通过，7条既有Ref警告、0 error。
- [x] 完整moon test --target all：wasm/wasm-gc/native各22264/22264，JS22271/22271。
- [x] 源码中22172个具名测试的名称及重复数量逐项一致，区别于runtime总数。
- [x] 根消费18/18和隔离配置18/18，分别四目标通过；公开facade与所有既有公开mbti不变。
  新内部资源/空测试包接口及移动隔离测试包的package名称属于预期变化。
- [x] 颜色39/39各四目标、1163个完整bits断言、颜色生成器完整--check通过。
- [x] Logit15/15各四目标；两份生成器派生check通过，全部fixture值逐项回读等于原oracle。
- [x] main/preview/gallery native全部exit0；preview/gallery与已保存SVG逐字节相同。
- [x] adapter info/fmt/check/test7/7/build通过；生产JS不含测试fixture变量/magic/payload。
- [x] Chrome155真实11项交互/布局全过、0页面错误；最终UI截图与已保存图逐字节一致。
- [x] 结构检查通过；91份Markdown/403个本地链接通过、README symlink保留、diffcheck通过。
- [x] 最后维护/架构提交0bc6fa3已正常push；交付HEAD与origin/master相同，九个关键文件blob/size匹配。
- [x] 整理请求完成；本页最终远端验收记录随后独立提交同步。

## 精确下一动作与提交

**下述M2记录已完成；当前优先上方0.2.1发布片。** 后续按用户需求选择新场景，不恢复全API迁移。
GitHub正式发布：https://github.com/moonbit-community/moonplot/releases/tag/v0.2.0 。
版本tag指向源提交3af1723f6fdbda83b5083ef4c46030b19db7f7ec；资源修复720a0c7。
master已正常push；本页为随后补充的交付验收记录，不移动已发布tag或替换附件。
旧0.2.0当时因命名空间403未发布Mooncakes；本轮用户已授权Lampese/并在上方0.2.1完成实际发布。

中央root info/fmt/check all99053、adapter info/fmt/check/test14/build49830均terminal0。
核心定向四目标23800各370/370，主Chrome42821通过11项，资源中央62563通过7组，0页面错误。
最后根/adapter info/fmt、结构/diff检查通过，既有公开mbti无变化；94份Markdown/434本地链接0broken。
main/preview/gallery native通过，后两份SVG与原资产逐字节相同。
核心精简publish dryrun53390：解包check通过13warnings/0error，随后服务端403；真实源码check为7既有warning。
第一次演练31320查出root .moonignore影响嵌套adapter归档为空；已修外部显式workspace打包并强验内容。
演练83229、clean正式构建82262均terminal0：实际ZIP/仓库外四目标SVG/Chrome5项通过。
最终manifest的dirty_rehearsal=false，源码提交与关键Git blobs匹配，bundle两个模块的所有文件与原ZIP逐一相同。
最终核心包1,374,007 bytes/474files（原18,782,929）；adapter19,834 bytes/12files；source bundle1,407,764 bytes/499files。
五份附件含SHA256SUMS及release-manifest.json，GitHub返回摘要与本地一致，下载后全部字节相同。
发布20364、下载30277、API/ref/摘要77387均terminal0，证据remote-release.json及release-final/download-check.json。
无M2残留运行会话，三个agents均STOP交回；只保留此前用户预览服务。
详细验收说明MILESTONE_M2.md；最终包/日志/截图在.moonagent/checkpoints/M2/release-final/。
历史代码整理全套验收属于旧片，不混报旧的22264/22271为当前测试结果。

## 文件、证据与会话

- 新源图谱docs/ARCHITECTURE.md；检查tools/check_structure.py；fixture说明testdata/packed/README.md。
- 详尽原始/新文件映射、大小、332块证明、测试名证明、oracle哈希与命令日志：
  .moonagent/checkpoints/repository-organization/。
- Root中央89377、真实输出/DOM27167、生成器派生94011均terminal0。
  交付push77377、九文件远端核查43334均terminal0，记录remote-delivery.json。
  布局60557初因旧@core测试导入失败，修正相同公开DataError别名后9049 terminal0；
  消费/隔离测试14304/3577各terminal0。
- A渲染54434、C颜色87344/57811、B参考96001均terminal0，无agent残留会话。
  三份handoff位于同证据目录，Root已全文审查。
- B原handoff曾误报尚未落盘的额外header/首尾覆盖断言，已只读核实并纠正记录；
  当前实现实际检查magic/count/id、逐byte与单记录bounds、完整vector/record消费；原固定数据由Python逐值核。
- 旧预览服务session58626/PID38768已在0.2.1合并时停止；当前预览session70004/PID77494：
  http://127.0.0.1:8765/rabbita/ ，停止可kill 77494；测试自己的临时HTTP/Chrome均finally关闭。
- master跟踪origin/master，SSH远端git@github.com:moonbit-community/moonplot.git。
  本轮起点70c592514fa1545d68dc350927f621915aaacf87。
- 既有M1见MILESTONE_M1.md，DOM与UI见RABBITA_DOM.md；旧长执行历史在archive/，不重启调查。

[源图谱](ARCHITECTURE.md) · [路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [M1](MILESTONE_M1.md) · [M2](MILESTONE_M2.md) · [DOM](RABBITA_DOM.md)
