# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复会话先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用 MoonBit 画图库，能力与场景对齐，不要求完整 Matplotlib API 复刻，不恢复旧 D55 清单。
- M1 基础二维 SVG、G2.1 首批 Rabbita DOM、后续 UI 整理均已验收与交付。
- 代码组织、M2资源隔离与独立交付、0.3.0图表提示均已完成。用户已明确要求持续实现后续图功能，当前先完成M3，再按实际缺口继续。
- 用户授权合理复用、独立 subagents、小步本地commit与正常push至 moonbit-community/moonplot。
- 不用历史API指数或未经调查的估算表示整体完成率。

## 当前切片：M3 实现（2026-10-25）

- 用户要求重新看还有哪些图没对齐/没适配，并开启下一个milestone；随后明确“继续往后对齐图功能，一直往后对齐”，授权持续实现，不停在规划。
- [x] 分开核对静态图类、语义命中和便利入口，不重启全API迁移调查。
- [x] 从实际0.3.0正式ZIP在仓库外显式workspace运行19个代表性输入；native/wasm/wasm-gc/JS均成功。
  所有Drawing SVG等于静态SVG，XML解析通过；四目标各图points/targets与SVG长度逐项一致。
- [x] 明确新图缺口：分组/堆叠柱缺宽度/基线/组内布局；环形图缺内半径和环孔命中。
  热图/矩阵、pcolormesh/hist2d/hexbin、面积/堆叠面积、箱线/小提琴、误差棒等已有静态实现，语义交互未适配。
  contour/stem/ecdf等只有生成后的普通线点目标，不能算完整高级语义。
- [x] 已建立docs/CHART_COVERAGE.md及可复现输入/结果，docs/MILESTONE_M3.md定义三项目标和验收标准。
  M3范围：规则nearest标量热图交互 → 分组/堆叠柱（横竖向） → 真正透明环孔的环形图。
  其余科学/分布交互留后续；本轮是调查与范围建立，不宣称功能已经实现。目标0.4.0未发布。
- [ ] M3.1实现：同次cell draw捕获row/column/value/数据范围，扩展Drawing cell metadata与Rabbita提示。
  先nearest imshow/matshow，origin/extent/mask/NaN/多图/缩放；none/平滑PNG、RGB、不规则mesh暂不纳入。
- [ ] M3.2分组/堆叠柱；M3.3真环形图；共同回归/独立消费/版本交付。
- 精确下一动作：收Logit跨域柱修复commit并cherry-pick，自动Logit范围旧bug也由同agent排查；环角边界已修cca4d28。
  根全套23914已terminal0：wasm/wasm-gc/native各22321、JS22346通过。晚修受影响包四目标回归后最终接口/fmt/结构、
  重建新示例验Chrome、clean正式包/发布0.4.0。M4独立工作区同步推进误差棒/面积语义，0.4发布前不合入M4代码。
- 当前实现改动：Root drawing/cell.mbt+target/shape_hit、backend/svg/image_hit.mbt+image/panel、api、rabbita/tooltip与对应新测试。
  CellInfo有row/column/x_range/y_range，HitInfo.cell为可选，Heatmap新kind；仅nearest scalar实际可见有效格采集。
- 首轮check21382因ImageInterpolation未实现Eq失败，已改模式匹配；check93321通过（7既有Ref警告）。
  首轮过滤测试73149暴露两处测试假设（默认upper数据范围、panel索引）错误，已核真实绘制后修断言；非产品失败。
  adapter18/18已过；完整drawing24+新image_hit8四目标各32/32（5914 terminal0），matshow/透明色/图例遮挡均过。
  范围生成info/fmt20981 terminal0，公共变化为CellInfo/Heatmap/HitInfo.cell及root类型alias；现有SVG路径未改输出。
- 责任：Root热图/适配层/交付；m3_bars在 /Users/lampese/.codex/worktrees/m3-multiseries-bars/mathplotlib，
  m3_donut在 /Users/lampese/.codex/worktrees/m3-donut-charts/mathplotlib；两者各自commit不push不发布。
  m3_browser只主workspace的全新rabbita/cmd/charts和charts.html/css/chart_browser_test.cjs，等Root合并后才build与真浏览器验收。
  bars API grouped_bar/stacked_bar(categories,series,labels,colors,horizontal,width,baseline；grouped另gap)；donut(values,labels,colors,start_angle,inner_radius=0.55)。
- 新证据.moonagent/checkpoints/M3-implementation/；基线1ef9c80，当前准备0.4.0，无新publish。
- 热图核心7adb3bc已正常push；Donut a5d6927已cherry为f210886，bars7dfbcaf已cherry为0a91ba6，均自动干净合并。
  agent定向Donut四目标46/46、bars受影响包四目标1764/1764；证据已复制到本片donut/和bars/。
- Root热图阶段受影响包50100四目标各1737/1737；整合check80458通过，整合全套23914进行中。
- 新5图Chrome最终14/14，0pageerror，隔离targetdir新编译，5637 terminal0；实际JS4351013bytes/SHA c86374ec16d8c8f6d318d777bff128667d734bd9c29beaa0b27071cb07615214。
  .moonagent/checkpoints/M3-charts/browser/含report与桌面/mobile，Root已目视assets/charts.png。
  首轮runner图例恢复未等待render，已加DOM等待；文本色/长单位裁剪只在新fixture修复；无产品失败。
- 交叉复审发现并实际复现两处产品角落：环起始射线舍入掉入360已修，新增drawing四目标29/29。
  Logit柱baseline0/value1的双端越域却穿过有效viewport，被原edge helper丢弃；donut agent在独立worktree修复并回归。
  两个agent复审热图/常规柱/环其余路径未见阻塞；不以发现问题为理由停止。
- Root版本与consumer已准备0.4.0（尚未发布）；仓库外ZIP rehearsal30827 terminal0：四目标新图静态断言+Chrome7项全部通过。
  consumer新增热图row/col/value、分组/横堆叠原值、真环孔断言；浏览器实际安装分组整段与热图边缘自定义提示。
  本片rehearsal含dirty标记，不能上传；晚修后必须clean重做正式包。
- M3 browser agent已冻结交回6新文件；Root拥有其后修改。无本轮Root测试残留会话，仅有原有预览8304。
- 用户要求一直往后对齐，M4首片已委派m3_bars在其独立worktree实现误差棒typed范围/实际线段命中，基线cca4d28；
  不编辑Root、不push/发布、不改Root检查点。Root仍优先完成M3交付，不把M4未验代码混入0.4。
- 只读agents m3_chart_gaps与m3_interaction_gaps已完成交回，无写文件/测试/发布权限委派。
- 证据.moonagent/checkpoints/M3-chart-coverage/，native探针52904、四目标25296均terminal0。
  第一次报告汇总把真实tab误按字面量分隔而报assert，已修汇总逻辑；产品运行无失败。
  19图输入/四目标结果另保存docs/audits/chart-coverage-0.3.0/，不把当前分支冒充固定发布源。
- 无本片残留运行会话；后续实现不要重跑旧全项目调查。保留0.3.0的有意本地预览8304。
- 收尾接口生成/fmt、structure与diff检查通过，生成接口无变化；本轮24份当前Markdown/432条本地链接通过。
  只提交调查证据和M3文档，不重复全项目测试；产品0.3.0与已发布tag/附件不变。

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
