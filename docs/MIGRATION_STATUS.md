# MoonPlot 当前执行检查点

更新时间：2026-10-26（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 用户决定与范围

实用MoonBit画图库，按能力/场景继续对齐；用户要求“一直往后对齐”，允许小步可用功能。
不恢复全部Matplotlib/Python API克隆计划，不编造整体百分比。已授权合理复用、独立subagents、
coherent verified Git commits/push到moonbit-community/moonplot及实际Mooncakes Lampese/统一module。
root facade api.mbt，consumer tests/api，globals tests/integration，implementation/own tests留owner包；
维护mbt<2000行，actual info/fmt/expectedmbti/structure必跑。已完成片不重跑。

## 当前：M16 /0.17.0 本地验收完成，正式交付待执行

模块及consumer源码已0.17.0；实际已公开最新仍0.16.0。
[M16](MILESTONE_M16.md)接续[极坐标指南](POLAR.md)：原theta弧度/r与Radar per-call类别，
原panel/artist/i/调用label；两mode物理近原点，无弦插值或横轴跨圆吸附；零半径保角，缺失保洞，
闭合不增加N，r>max点中心静态。只捕获实际可见marker与非零written chord端点。
每call单snapshot、每artist单guard，失效/未证明source静态，不调Cartesian provider。
Drawing私有panel-circle map/readonly scalar getter，每候选/area/overlay/legacy逐panel gate，
无/无效/冲突circle对Polar failclosed，mixed ordinary/别圆不被全widget屏蔽。
固定4binary64eps×intrinsic坐标量级处理投影边界，与CSS/hit_radius无关，raw径域另严排。
Rabbita私有actualCTM六double→均匀scale映射与CSSradius换算，圆形hover/selected clips，默认
Theta (rad)/Radius/可选Category和自定义中文。无新PolarInfo或通用DOMMatrix框架。

### 已实现与实际验证

- [x] owner early8115655→Root8468eb7；fixaede628→Rootbe3bee7；finaltests/guide5f621c9→Rootb6c9352。
  生产自aede冻结。34owner=14生产+2compiler接口+17tests+1guide，Root逐SHA核同；61proof复制核SHA。
- [x] 真反例保留并闭环：主target_hit缺required-circle before15/16→18/18；closed[A,A,B]漏原0、
  next-up r>max被屏幕舍入收回、fractional circle(200,129,43.8)漏west/south，Native/JS实际2/1/6→3/0/10。
  Root consumer37030/6727终134 before保留，52903 after Native/JS/Chrome全0。不降低期望，不改旧SVG。
- [x] owner37950终0：Native67，其余三目标各66，Rabbita51；12同target旧SVG逐字，旧参考19源/接口SHA
  核formal999后复用，不虚称新old builds。actualinfo/fmt/structure/diff和guide3links均0。
- [x] independent exactaede Native/JS全部0：18actualXML、8same-target旧SVG字节同，数学maxdiff
  2.842170943040401e-14；metadata/hugeθ/r0/clear/mixed ordinary+two polar/circle全路径、六sourceguard
  和poisoned provider0/completion0通过。Root c1b029终0核16源（含811 before Gitblob）、110proof及3archives
  in-place SHA，无剩余blocker。own harness编译/visibility错误已保before并单列，非生产通过声明。
- [x] adapter/consumer8源Root cecdc2b；actualconsumer52903 Native/JS/Chrome59/8实际整数events/0errors，
  info/fmt21032终0，两private compiler接口逐字不变。默认/中文类别、点击、圆clip/375及普通既有接入通过。
- [x] UI7源→Rooted5e4b9（5实际diff）；三adapter源保持预检SHA。Root核70proof引用及10源，目视desktop/375。
  own2803最终runner16checks/38整数请求组/72handler events（55move17click）/0errors；actualborder/padding、
  meetletterbox、圆外bbox近点拒绝、native clip pixels、普通+two polar巨radius两mode通过。
  正式runner无ignored依赖，默认14项；显式temporarymixed另2项。private ChartState compiler stub已审合。
- [x] 唯一中央full9480终0/267.4s：W/WG22658、Native22662、JS22718。full终态后copy UI（库/库测试无delta），
  actualinfo/fmt及16JS53079终0；postlude64089终0，16页面Chrome204/0errors、三static、55MD604links、
  structure/diff均0。collector b2bc9d终0/23steps，无unexpected mbti。Root再核34owner+3adapter+7UI均未被fmt改变。
  canonicalJS4732063bytes/SHA3f9724d5efa5a9c6d3fc5497a7ab638e76183363e1f74d90bf86bc0c56b1c01c，逐字同owner；
  中央真实PNG111141bytes/SHA87ed76f39a5569772846698a353ae1a4843dffe4b9d0ad923f6b012d91017e30逐字同asset。
- [ ] 正式clean包、实际Mooncakes/public manifest/fresh无workspace registry和GitHub四附件完整下载核验。

精确下一动作：所有实现/本地验收已完成，Root无live；完成formal docs link/diff检查及clean正式commit/push，
将精确HEAD记入ignored release-live.json并freeze，才跑clean tools/build_release.py。
clean成功核20 source-inventory文件与archive、四static/Chrome59后实际moon publish；等public success/checksum后
全新registry consumer四目标/Chrome59/全部安装源逐字核包。创建并完整下载GitHub四附件，finalaudit确认
HEAD/gitclean自builder至network全程不变后才解除freeze。正式交付完成前不写tracked/commit新slice。
失败保before、排查、最窄修；网络queued只等待验证不重复发布。已有相关检查无源改变不重跑full。

### Root证据与现场

`.moonagent/checkpoints/M16-polar-interaction/`：producer-core/producer-edge-fix/producer-final、
review-formal999/independent-final、adapter-preflight、FINAL_PACKET/FINAL_HANDOFF/final-browser-proof、
ui-root-match/ui-root-proof-check、consumer-verification/root-summary、central-summary/central-polar-artifact、
source-inventory20、final-validation-progress23。formal前状态历史保preformal-status.md，全部失败/源/日志仍在。

intentional预览8765/session43005/PID70622；central已更新RootJS，尚未做本轮HTTP逐字核验/前台刷新，
不声称当前tab已显示新交互。只有connectionrefused才重启。Root无验证/网络live。

## 下片准备：M17 极坐标柱形 / 玫瑰图（仅草案，未实施）

owner只读77行设计+15必要源SHA，Root已核当前源；Root ignored M17-polar-bars/DRAFT_SCOPE.md。
建议typed bar原θ/r、必填单scalar角宽弧度、bottom0/fill-only、真实扇区/whole2π与PolarBar区域命中，
复用既有Bar/Pie弧和M16圆盘/CTM。无新Info/伪interval、无自动分箱/stack/雷达填面。
正式基线/合同必须等M16 actual finalaudit后确定；此刻无新B实现/编译/验收或新branch。

## 最近已实际交付与约束

M1至M15及0.3提示片已交付，0.16正式源99964396315269ebf7765c7437ab7258aa339b8e。
M15 clean模块607源、实际public success/checksum、全新registry四static/Chrome56及GitHub四附件均通过，
finalaudit30f5fc/2026-10-25T17:28:32.411157Z确认HEAD/gitclean不变后已解除M15freeze。
[M15完整历史](archive/migration-status-through-2026-10-26-m15.md)、[M14](archive/migration-status-through-2026-10-26-m14.md)、
[M13](archive/migration-status-through-2026-10-25-m13.md)、[M12](archive/migration-status-through-2026-10-25-m12.md)、
[M11](archive/migration-status-through-2026-10-25-m11.md)、[M10](archive/migration-status-through-2026-10-25-m10.md)、
[早期](archive/migration-status-through-2026-10-25-m4.md)保留已有决定/失败/交付。

master，SSH origin git@github.com:moonbit-community/moonplot.git；新branch codex/。单module核心不importUI，
Rabbita仅JS，pins0.16.7/XML0.5.0不误改。README.md symlink保持。编译器interfaces由tools/update_interfaces.py生成。
实际Node/Chrome与toolchain见既有证据；不安装替代运行时或在产品流展示实现细节。
[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
