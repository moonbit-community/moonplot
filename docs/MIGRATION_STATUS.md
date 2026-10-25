# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力/场景对齐，不复制Matplotlib完整API/Python动态协议，不恢复D55或编造完成百分比。
- 用户要求“一直往后对齐”；M1至M11及0.3.0提示片已完整验收交付，继续M12填色等值区。
- 已授权合理复用、独立subagents、小步verified local commits/push至moonbit-community/moonplot；明确允许实际Mooncakes发布，前缀Lampese/，统一Lampese/mathplotlib module。
- 根facade api.mbt；consumer tests/api，global tests/integration，owning implementation/wbtests；维护mbt<2000行，结构检查必跑。

## 当前切片：M12 ContourF（核心与真实 UI 已集成，组合验收中）

- 范围 [M12](MILESTONE_M12.md)，目标 0.13.0；Root/consumer 已 bump 候选 0.13.0，正式分发仍 0.12.0，未发布候选。正式旧基线 `ae1ce6b4c45d17fd2c1fbee388525f5c7f713307`。核心与最终 tests/guide Root `f6b46f9`（production last14a），真实 UI commit `994c536`、consumer `0454960`，origin/master `0f84972`。
- 完整合同 `.moonagent/checkpoints/M12-contourf/active-scope.md`；只补 existing contourf/tricontourf/wrapper，保生成/union/ContourSet getter 算术、签名、Container、legend、颜色与旧 SVG。单 Polygon 真实 nonzero，Compound 真实 evenodd，一 band artist 一完整 region；孔洞与分岛空白不填，孔洞可透选更早 paint。两 mode 仅 plot 内 physical fill；旧 margin paint 静态保留，不虚构 axes clip。
- `FilledRegion` opaque，factory/getter 两层 deepcopy，private 预验证 cache；`ContourF`/`FilledRegion` 新 kind/shape。interval 是真实有限 clip pair，value 保旧有限代表值，仅端点相加溢出 safehalf；series 原 call，point_index 原 logical band/color slot，含 requested 空 extension/band 洞。默认 Range/Representative，产品不显示几何 XY，无伪 BandInfo/ContourFInfo。
- actual writer 成功后捕获过滤后的全部 loops；非零按 mapped screen edge。有边交 plot：data 为 clip 前真实边 safe midpoint，screen 为 visible clip midpoint。无边交 plot：同一 opaque Region 一次中心 containment 证明覆盖后用 plot center，data 取首真实非零边中点；是两种几何锚点，不是 inverse/grid/pointer 配对样本。known slot、outer/inner identity/content 每 artist/frame 一次；unknown/mismatch prepared 静态，无 generic fallback。线性 cursor 维持 image/inline/remove/clear 及 Contour/Barbs，O(total generated geometry + artists)，pointer O(relevant edges)。额外只修空 filled call 串改前 series。
- [x] primitive `cc0e34e` → Root `26e78d5`；Root mixed 有效 square+collinear ring 反例 before Native54236 误 hit，fix `4aa63ea` → `8a3e65f`，per-ring 非共线 mask 保 bowtie/getter。owner Drawing Native54186 53/53、Root 同公开 probe after14085 terminal0。证据 `primitive-root-counterexample.json`。
- [x] actual Scene/IR/backend 捕获 `1f7f82a` → Root `4721d92`，已逐段审 source：owner Native16445 7 项、all-target check42904 119 tasks/0errors；Native 两完整旧 SVG33980 terminal0，与精确旧基线逐字相同。不是全套或正式发布。
- [x] 独立极远 collinear ring/BBox 反例 Native4422 terminal134：未填 ring 污染 bbox 与 left+width 消差。fix `c02c12c` → Root `5af344b`，仅有效 ring 范围与实际 extrema cache；owner Native/JS68202 各6/6，独立 exact c02 Native/JS 各8 边界组通过。旧失败和修复后证据均保留。
- [x] 真实 UI 七文件已验证并 commit `994c536`：rabbita/cmd/filled_contours、filled-contours.html/css、filled_contours_browser_test.cjs、assets/filled-contours.png。实际隔离 build95498/info terminal0；Chrome72778 terminal0、14/14、0pageerrors，24真实整数事件，整 Path 原生 fill oracle、孔洞/分岛 gap/静态 margin、737真实 before-mask DOM 样本、原槽1/2/3、图例/重挂载/CSS/375px 均过。PNG1280×1034/60561bytes/SHA6231fbc25bdd294584259eca606c3f87e3294d0bb1b7bbe775c8c79bcd58e777 已 Root 目视。冻结七文件 SHA 在 draft/FINAL_HANDOFF.md；不当作0.13正式交付。
- Root public consumer 已接线真实 regular/tri fixtures、facade immutable region 和交互卡；Native8673 terminal0，初 JS58831 和最新 bounds/state JS rebuild 均 terminal0。new release consumer runner 实际 Chrome17558 terminal0：41组、10个填色真实整数事件、0pageerrors；最终 consumer info/fmt terminal0、实际两个 mbti byte unchanged，已 coherent commit。报告 public-browser/report.json，未重跑已过检查。
- 独立 reviewer exact c02 新语义 Native/JS/XML/source 组合验收运行中。实际 provenance blocker Native3796 terminal2：把 enabled ContourF metadata 附到实际 Line，raw 和 unproven prepared context 都错误产生3个 generic Line targets，预期[0,0]却[3,3]。最小 probe/log 在 reviewer own M12-contourf-review/contourf-c02c12c/backend/svg/；producer fix `14a09c2` 已 source-review 合 Root `8bd1f93`：统一 capture gate 仅允许实际 Polygon/Compound，保静态输出/provider completion；owner Native10/JS7 定向组及精确14a受影响四目标34167各184/184、adapter46/46通过；最终静态8SVG36662也terminal0，exact ae1两fixture×四target逐字且Drawing/static同。final tests/guide f91已合f6b46f9，31owner文件含18production/3interfaces SHA与Root全同，producer own clean/no live。独立 exact14a Native87190/JS67121 各3/3：原反例、Step/Scatter/Bar、legacy controls、P/C与provider完成均过，IR blocker 已解除。c02 public Native57883/JS各9/9、Scene Native11108/JS36128各5/5、query Native54815/JS均过；实际XML/18旧SVG/数学oracle与最终manifest仍在收表，未提前宣称完整独立通过。
- 三 delegate：m3_donut own codex/m12-contourf 负责 core/IR/Scene/backend/Drawing/tooltip/own tests/CONTOURF_INTERACTION.md，先 blocker SHA，再 bounded 四目标/adapter/guide；m4_area own worktree 独立精确 c02 新语义/实际 XML/旧 SVG，保反例与 source manifest；m3_browser 七文件验收已完成 freeze，现仅 own ignored M13-tripcolor-prep 只读下一片准备：immutable ae1 的既有三角面 oldSVG/value/slot，不改 Root tracked/当前实现或视作新能力验收。均不 Root tracked/版本/中央 docs/consumer/full/push/publish/新 agent。
- 精确下一动作：Root prelude16307实际info/fmt+13JS terminal0，无额外mbti。唯一中央full30284已开始，对稳定14a生产与独立收表并行（尚未通过）；reviewer精确delta已通过，实际XML/18旧SVG与最终 no-blocker manifest仍需闭环后才能发布。full若过再13Chrome/static/docs/结构，实际结果写入最终候选文档并commit/push→clean实际发布/registry/GH整下载闭环。不要重跑已通过 M11 交付或旧调查。
- Root live full30284；有意预览8765/session43005/PID70622。M11 release-live.json complete/source_frozen=false。M12 还未进入正式 tracked freeze；delegates 各自记录 own 会话，不擅自归为通过。

## 最新交付：M11 /0.12.0（2026-10-25）

- [x] regular/tri lineContours：value精确level，原callseries/pathslot，inline两片保留，actualSegment双modephysical；clip前data safe midpoint/visibleclip screen midpoint，默认Level。不fakegrid或连invalidLoggap，closedinterior无填面。
- [x] known-slot/guard/linear cursor和Barbs/Line/Area组合、clear/remove/image/inline、oldDrawing；empty/no-path两线API不改前series，保静态输出。首4717→Root7f9c8f0，finalb71→304d3f8，除priv BarbIntent无生产变化。
- [x] producer Native199/其他三目标198/adapter44、24同target旧SVG；Root27owner文件(16production/3interfaces)SHA同。独立Native/JS各11public+4白盒、16actualXML/16旧SVG、每target34ContourSegments与1536edgeguard过，无blocker；16最终production与Root相同。
- [x] 真实UI e3901c3：Chrome14/0errors、31整数事件，21边最大.971035CSSpx≤2、真实inline gap4.91008px拒绝。真实PNG1280×1015/83701bytes/SHAddf502eb9151f7d95287e0a494b119e2e00bb661991f5298c5d35ab4b8dcefb4已目视。publicconsumer925d742：Native/JS/Chrome36过。
- [x] 中央37734 terminal0/full268.44s：W/WG22564、JS22615、Native22566，12Chrome148项/0errors、info/fmt/12JS/三静态SVG与preview-gallery逐字/docs46/522链接/结构/diff，无意外mbti、无full重复。
- [x] 正式源ae1ce6b4c45d17fd2c1fbee388525f5c7f713307/push41390；clean39728 terminal0/dirty=false，四静态/Chrome36。module2433308bytes/581files/SHA ada8b34efaa9e013c285043fba697a7eb5696c16bc4c2f5aed5c5ee050a76666；source2476895bytes/604files/SHA15584bc5159d339d5f23feda5e62e4ec0d4357a835fb0569d7982dc1dae8663e。
- [x] actualpublish40580 terminal0/200、publicAPI38331 0.12/buildsuccess/haspackage/notyanked/checksum匹配；无workspace全新registry28365 terminal0/581源逐一同正式ZIP/四静态/Chrome36过。
- [x] GHcreate39288和整下载61598均terminal0，完整四附件字节/digest/size/tag ae1全过；最终audit ROOTHEADae1＋gitclean，从正式builder至网络闭环无tracked写/commit，随后解除freeze。[GitHub v0.12.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.12.0)。
- 证据Root .moonagent/checkpoints/M11-contour/：producer-final/root-match、final-review/root-production-match、central-summary、browser-final-contours、release-final/artifacts/download-check、registry-consumer/report、release-live phase=complete/no live。原consumer编译错误与巨大坐标旧locator失败保持，不改测试掩盖。

## 历史与源码地图

- M10/0.11 Barbs、M9/0.10 Quiver、M8/0.9 Stem、M7/0.8离散曲线、M6/0.7 Hex/Violin、M5/0.6 mesh/hist2d与M1至M4及提示片均完整正式交付，无需重跑。
- [M11完整历史](archive/migration-status-through-2026-10-25-m11.md)、[M10](archive/migration-status-through-2026-10-25-m10.md)、[M9](archive/migration-status-through-2026-10-25-m9.md)、[M8](archive/migration-status-through-2026-10-25-m8.md)、[早期](archive/migration-status-through-2026-10-25-m4.md)保留既有决策/失败/附件证明。
- M12候选预览http://127.0.0.1:8765/rabbita/filled-contours.html，默认JS4709395bytes/SHA28a84c6b4b0b56a37d2faa9ae6e3a679aee2cc96006167f8d965e30ba6556c7a；HTML/JS/三CSS实际HTTP200逐字，证据M12/preview-http.json。open_in_codex queued未声称前台，仅connectionrefused才重启并更新session/PID。
- master，SSH origin=git@github.com:moonbit-community/moonplot.git；独立分支codex/。静态core不importUI，统一module Rabbita只JS。
- JS-only接口用tools/update_interfaces.py真实compiler生成；最后info/fmt、预期mbti审查、python3 tools/check_structure.py与适当tests；版本/发布Root统一收口。

[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
