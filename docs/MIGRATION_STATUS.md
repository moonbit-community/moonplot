# MoonPlot 当前执行检查点

更新时间：2026-10-24（Asia/Shanghai）。恢复会话先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用 MoonBit 画图库，能力与场景对齐，不要求完整 Matplotlib API 复刻，不恢复旧 D55 清单。
- M1 基础二维 SVG、G2.1 首批 Rabbita DOM、后续 UI 整理均已验收与交付。
- 当前用户要求：参考 pdf-viewer 整理根目录散乱文件、拆解超大单文件。保持原公开API与绘图行为。
- 用户授权合理复用、独立 subagents、小步本地commit与正常push至 moonbit-community/moonplot。
- 不用历史API指数或未经调查的估算表示整体完成率。

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

代码组织实现、完整验收、维护说明与远端核查均已完成，无未处理失败。
当前交付提交：
2ae2c3c（根门面与消费/隔离测试）、d6672c0（同包职责拆分）、
e20ac8c（完整颜色资源）、07b050d（巨型参考测试数据化）。
维护/架构提交0bc6fa3；已核远端交付HEAD为0bc6fa327e0dc6c06229baddb500a65d337ecf49。
本轮请求无剩余必做项。以后继续新功能或进一步数据化历史参考时，沿用源图谱与结构检查。
所有三个agents STOP，Root接管，没有未处理测试失败。
后续功能按用户需求选择；不要因为整理完成自动恢复全API迁移或扩大M1范围。

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
- **有意保留的预览服务session58626、Python PID38768**：http://127.0.0.1:8765 。
  停止可kill 38768；测试自己的临时HTTP/Chrome均finally关闭。
- master跟踪origin/master，SSH远端git@github.com:moonbit-community/moonplot.git。
  本轮起点70c592514fa1545d68dc350927f621915aaacf87。
- 既有M1见MILESTONE_M1.md，DOM与UI见RABBITA_DOM.md；旧长执行历史在archive/，不重启调查。

[源图谱](ARCHITECTURE.md) · [路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [M1](MILESTONE_M1.md) · [DOM](RABBITA_DOM.md)
