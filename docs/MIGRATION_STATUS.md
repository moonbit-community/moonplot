# MoonPlot 当前执行检查点

更新时间：2026-10-24（Asia/Shanghai）。恢复会话先读本页，再执行下一条未完成动作。

## 当前范围与用户决定

- 实用 MoonBit 画图库，以能力和完整场景对齐，不要求完整 Matplotlib API 复刻。
- M1 基础二维 SVG 可用版已验收；本轮 G2.1 首批 Rabbita（原 Rabbit-TEA）交互 DOM 也已验收。
- 用户允许合理复用、独立 subagents、本地分批 commit 和正常 push 至 moonbit-community/moonplot。
- 不恢复旧 D55 / 全 API 清单迁移；不以历史 API 指数或未经调查的估算表示整体百分比。

## M1 保留验收

- [x] 默认 both 下的单轴 grid、Bar/BarH 宽度范围错误已修，四角图例与 Gallery 完成。
- [x] 相关四目标各353/353；check/info/fmt与真实SVG/PNG视觉检查通过，原preview逐字一致。
- [x] 文档和实现已提交并同步：f4c0548、36e6710、bfdb503；随后检查点cbc7358同步。
- [x] 历史实现、命令和边界见 MILESTONE_M1.md；不因新DOM功能重算M1。

## 当前切片 G2.1：实现完成

- [x] A：独立 drawing 包，复制的Drawing/HitPoint快照、纯命中、viewport/letterbox/CSS半径。
- [x] B：同次现有SVG绘制收集Line/Scatter/PathCollection原始点锚；Figure::to_drawing checked导出。
- [x] 保留原始索引，steps/gap不重复；隐藏/None/零线宽Line无命中；静态路径不产生sidecar。
- [x] C：独立JS adapter，XML事件转公开Rabbita SVG节点，严格标签/属性/视口验证。
- [x] HTML视口同步currentTarget/自身SVG bbox，typed Hover/Click/ToggleSeries消息、tooltip与选中圈。
- [x] Root：根facade导出、双图reactive应用、响应式HTML、可复现浏览器验收脚本与实际截图。
- [x] 首浏览器失败已定位修复：Rabbita状态与Val.view移入new的组件builder，事件才能更新视图。
- [x] Root全文审实现及生成接口，A另作只读集成审查；所有agents STOP，Root接管交付。

## G2.1：验证完成

- [x] 根check --target all通过，7条既有Ref警告/0 error；四目标相关回归各370/370（新增17）。
- [x] adapter checkJS通过、7/7测试、demo build通过；局部workspace x0.5.1下核心JS同组370/370。
- [x] 根与adapter最终info/fmt通过；4份既有mbti增量及3份新接口已审，核心无UI类型。
- [x] main/preview/gallery native均exit0；preview及gallery SVG与已保存资源逐字相同。
- [x] Chrome155实际9项：真实SVGnamespace/小数、hover/click、双图隔离、legend、data更新、
  三次remount、scroll+wrapper padding/border、letterbox、响应式CSS半径；0 pageerror。
- [x] 桌面1280×900及窄屏截图已视觉检查；正式展示图在assets/rabbita-interactive.png。
- [x] 核心moon.mod逐字未改；Rabbita仅独立module，局部moon.work链接核心，未发布Mooncakes。
- [x] README、能力/路线、运行/依赖/许可/验收文档已同步；89份Markdown/373本地链接初查通过。
- [x] 核心已提交05e9c20，adapter/双图示例/浏览器脚本已提交1d4de2a。
- [ ] 提交最终文档，正常push并核对远端。

## 精确下一动作

核心05e9c20、adapter1d4de2a已分批commit。下一提交最终文档与交付检查点，
随后SSH正常push、核HEAD/远端SHA及GitHub文件对象，更新本页。
G2.1交付后可优先做多图自定义SVG资源ID隔离，再按实际需求增加键盘/触摸或缩放平移；
不要自动恢复旧全API迁移。当前命中为当前帧的数据点锚点，不是持久ID或任意形状轮廓。

## 证据、会话与运行方式

- 本轮基线：cbc7358aea2e5b005a1bb48bf088ed46e4f00e54；master跟踪origin/master，远端SSH。
- 核心中央77401 terminal0；adapter最终19989 terminal0；最终全流程26231 terminal0；
  局部workspace JS81917 terminal0；npm查询28299 terminal0，Playwright1.62.1可用。
- 浏览器首82725 terminal1（builder生命周期），修复后87506及最终26231均terminal0；
  测试HTTP/Chrome均finally关闭，无残留测试服务。
- **有意保留的预览服务：session58626**，http://127.0.0.1:8765 ，根路径和实际JS均HTTP200。
  对应Python PID38768，停止可执行 `kill 38768`；App浏览器打开请求已queued。
- workspace实际JS：adapters/rabbita/_build/js/debug/build/moonbit-community/moonplot-rabbita/cmd/demo/demo.js。
- 日志：.moonagent/checkpoints/G2-2026-10-24/；浏览器report.json/demo.png/mobile.png：
  .moonagent/checkpoints/G2-browser-acceptance/；只读复核G2-browser-env/integration-review.md。
- 实现交接：G2-render-handoff.md、G2-rabbita-adapter-C-handoff.md，均在.moonagent/checkpoints/。
- 旧全套nonJS22233/JS22240为历史结果；本轮370定向回归不冒称重跑旧全套。
- Rabbita固定研究commit c6bbd1b3b649d5f6ea6b21e6c42f8003ec41c367、包0.16.7；
  依赖与限制详见RABBITA_DOM.md和adapter README，不重启已完成的源码调查。

[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [DOM验收](RABBITA_DOM.md) · [M1](MILESTONE_M1.md) · [历史](archive/migration-status-through-2026-10-24.md)
