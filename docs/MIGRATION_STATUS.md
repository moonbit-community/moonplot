# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力/场景对齐，不复制Matplotlib完整API/Python动态协议，不恢复D55或编造完成百分比。
- 用户要求“一直往后对齐”；M1至M11及0.3.0提示片已完整验收交付，继续M12填色等值区。
- 已授权合理复用、独立subagents、小步verified local commits/push至moonbit-community/moonplot；明确允许实际Mooncakes发布，前缀Lampese/，统一Lampese/mathplotlib module。
- 根facade api.mbt；consumer tests/api，global tests/integration，owning implementation/wbtests；维护mbt<2000行，结构检查必跑。

## 当前切片：M12 ContourF（已授权独立实现，尚未验收）

- 范围[M12](MILESTONE_M12.md)，目标0.13.0；Root/consumer仍正式0.12.0，尚无M12合入/验收/发布。基线为正式ae1ce6b4c45d17fd2c1fbee388525f5c7f713307。
- 完整合同Root .moonagent/checkpoints/M12-contourf/active-scope.md；只existing contourf/tricontourf/wrapper，保生成/union/ContourSet getter算术/签名/Container/legend/颜色/旧SVG，不重开全图调查。
- 新kind ContourF/shape FilledRegion(opaque FilledRegion)。filled_region(rings,even_odd~Bool=false)两层deepcopy，rings()返回deepcopy，even_odd()只读；最小factory/type reexport根facade。valid_shape用immutable预验证cache。
- interval实际finite scalar clip阈值，value保旧finite代表值bitwise，只有finite endpoints sum overflow时safehalf；不改legacy layers/segment_levels，不新增ContourFInfo，不伪Area band/cell/vector/fraction/category。默认Range/Representative，产品不展示XY。
- point_index原logical band/color槽含requested空under/over洞，不是layers去空去重索引、segments展平环索引或grid/input观察。series原call，artist_index当前actualPolygon/Compound。
- 单Polygon按真实nonzero，Compound按evenodd，成功writer后一次实际filtered loops回调；一个band artist一个完整region，孔洞/分离岛间bbox空白不填，hole可透选更早paint。两mode只plot内physical fill，margin旧可见paint保持static，无axesclip声明/静态裁剪改动。
- 非零按actual mapped screen边判断。可见boundary：data是实际emitted边clip前safe midpoint，screen是visibleclip midpoint。无边交plot：一次center rule确认覆盖才capture，screen=plotcenter/data=首真实非零finite边midpoint；两个是不同几何锚点，不是inverse/grid/pointer。零/collinear/少点可static，不能仅signedarea0拒绝所有crossing。
- known-slot/outer+inner identity/content每artist每frame一次guard，mismatch/prepared unknown无genericPolygon回退或归属复活；linear cursor维护image/inline/remove/clear及Contour/Barbs。O(totalgeneratedgeometry+artists)，pointer O(relevant edges)，无每ring复制grid/每edge完整Region。额外只条件legend修filled emptylabel leak。
- producer m3_donut已明确授权：复用own managed worktree，从精确ae1建立codex/m12-contourf，负责core/IR/Scene/backend/Drawing/tooltip、own tests和CONTOURF_INTERACTION.md。先两fixture/alias/holes的Native与早coherent SHA，再必要bounded4target/adapter/info/fmt/structure；不Roottracked/版本/中央docs/consumer/UI/full/push/publish/新agent。
- m4_area有限独立baseline准备已授权：own ignored immutable ae1、复用两fixture冻结Native/JS实际XML/旧SVG与oracle；首Native56291/JS30951 live，待实际收取，未授权新语义复审，等coherent exactSHA。
- m3_browser仅ignored五文件UI/runner草稿已授权，future7file部署名rabbita/cmd/filled_contours、rabbita/filled-contours.html/css、filled_contours_browser_test.cjs、assets/filled-contours.png。暂无M12编译/mbti/Chrome/PNG/tracked部署。
- M12只读准备Root .moonagent/checkpoints/M12-contourf-prep/：SOURCE_MAP/HANDOFF、producer-design三文件；独立feasibility packet在m4own worktree可按需复制。正式0177两Native39962 terminal0：regular5loops→3artists/layers.25,1,1.75，tri4loops→1Compound/layer1，两SVG0targets且无clipPath；实际XML孔洞/间隙/band映射已冻结，属于旧行为不算M12验收。两value/anchor决定已独立复核无blocker。
- 精确下一动作：Root先commit/push M11真实交付与M12当前文档；producer独立生产不中断→收到首coherent SHA做source review/审合→明确授权7file UI部署和独立exactSHA新语义复审→Root publicconsumer/组合并行→中央一次全套和真实交付。不要重跑已通过M11验收或旧调查。
- Root无测试/发布/下载live；M11 release-live.json complete/source_frozen=false，最终网络audit已解除tracked freeze。唯一有意预览8765/session43005/PID70622。M12 delegates各自记录own会话，不擅自归为通过。

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
- 正式预览http://127.0.0.1:8765/rabbita/contours.html，默认JS4668239bytes/SHA f0845c3dbee48534ed31ad019723b0b4e98a0801e9c453db55157cfb2138d603；HTML/JS/三CSS实际HTTP200逐字。open_in_codex queued未声称前台，仅connectionrefused才重启并更新session/PID。
- master，SSH origin=git@github.com:moonbit-community/moonplot.git；独立分支codex/。静态core不importUI，统一module Rabbita只JS。
- JS-only接口用tools/update_interfaces.py真实compiler生成；最后info/fmt、预期mbti审查、python3 tools/check_structure.py与适当tests；版本/发布Root统一收口。

[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
