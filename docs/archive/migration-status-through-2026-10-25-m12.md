# M12 最终交付与执行历史

M12/0.13.0 已于2026-10-25实际交付；正式源 `87a3280f31fb3ba043da415f89eab6ad5a8ef59e`。
actualpublish46591/200，publicAPI64558 buildsuccess/haspackage/notyanked/checksum一致；全新无workspace registry60742四静态/Chrome41、590安装源逐一同正式ZIP。
GHcreate21562及四附件整下载72398通过字节/digest/size/tag；最终audit2026-10-25T14:19:05.947223Z，Root从clean20806至网络闭环HEAD固定87a且gitclean，无tracked写/commit，此后明确解除freeze。
module2503930bytes/590files/SHA7372afea56bda7a91464f507da5bf61495958355914290a0eb4fc4ad947ae3e1；source2551348bytes/615files/SHAec030e46c161077851991d45396dce28d2618bd0803f9f26a75bf5780f8155a4。
[GitHub v0.13.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.13.0)。下方保留正式打包时的执行检查点；其中待分发步骤已由以上真实结果闭环。

# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力/场景对齐，不复制Matplotlib完整API/Python动态协议，不恢复D55或编造完成百分比。
- 用户要求“一直往后对齐”；M1至M11及0.3.0提示片已完整验收交付，继续M12填色等值区。
- 已授权合理复用、独立subagents、小步verified local commits/push至moonbit-community/moonplot；明确允许实际Mooncakes发布，前缀Lampese/，统一Lampese/mathplotlib module。
- 根facade api.mbt；consumer tests/api，global tests/integration，owning implementation/wbtests；维护mbt<2000行，结构检查必跑。

## 当前切片：M12 ContourF（能力验收通过，0.13.0 待真实分发）

- 范围 [M12](../MILESTONE_M12.md)，Root/consumer候选0.13.0，当前实际正式分发仍0.12.0。旧正式基线 `ae1ce6b4c45d17fd2c1fbee388525f5c7f713307`。核心最末生产 `14a09c2740a1b639e93a2660ce7744a48e99d76a`；最终owner `f91dab853b214da3b5b5a2c5d45b0a729d4fd86a` 已合Root `f6b46f9`，UI `994c536`、consumer `0454960`、候选文档/版本 `809f878`。
- [x] 只补既有contourf/tricontourf/wrapper，保生成/union/ContourSet getter算术、签名、Container、legend、颜色和同target旧SVG。单Polygon真实nonzero，Compound真实evenodd，一band artist一完整region；孔洞/分岛gap保持空，可透选更早paint。两mode只plot内physicalfill；旧margin paint静态保留，不虚构axesclip。
- [x] opaque FilledRegion factory/getter两层deepcopy、private validity/mask/extrema cache；ContourF kind与FilledRegion shape。interval为真实finite clip pair；value保旧finite代表值，仅sumoverflow safehalf；series原call、point_index原logicalband/color slot含requested空extension/band洞。默认Range/Representative，无产品XY/伪grid观测/伪Area BandInfo。
- [x] actual successful writer后一次捕获所有filtered loops；有实际非零边交plot用clip前data safe midpoint与visibleclip screen midpoint，无边则同opaqueRegion一次center containment证明覆盖后用plotcenter/首真实非零边data midpoint。两者是不同几何锚点。knownslot/outer+inner identity/content每artist/frame一次，unknown/mismatch/prepared静态无genericfallback；线性cursor维护image/inline/remove/clear与Contour/Barbs，O(total generated geometry+artists)。额外只修empty filled call串改前series。
- [x] 三个实际反例均保before并修复：Root mixed square+collinear ring Native54236误hit→4aa/Root8a，owner15897重现后54186 Drawing53/53、Root14085过；独立far-ring/BBox Native4422 terminal134→c02/Root5af，只fillable ring范围与actualextrema，独立Native/JS各8组过；独立3796 metadata配到Line raw/prepared实际[3,3]而非[0,0]→14a/Root8bd顶层只允许actualPolygon/Compound，独立Native87190/JS67121各3组过，provider completion保持。
- [x] owner最终31文件含18production/3interfaces与Root全部SHA相同，producer-final/root-match.json；精确14a受影响34167四目标各184/184、adapter46/46；36662同target正式ae1两fixture×4=8完整SVG逐字、Drawing/static同。owntracked clean/no live，生产自14a未变。
- [x] 独立c02 Native57883/JS各9public、Native11108/JS36128各5Scene白盒、queryNative54815/JS均过；18actualXML/18同target正式0.12 SVG逐字，每target12regions、432独立XML winding/clip查询一致，maxcoorddiff2.842170943040401e-14。加唯一14aPanel delta后无剩余blocker；最终packet已copy至final-review，18production/3interfaces与Root逐字同；49份独立证据逐一验证SHA并本地复制，root-production-match.json，无剩余blocker。
- [x] 真实UI七文件994c536：隔离build95498/info过，Chrome72778 14/14、24真实整数事件、0errors；737真实before-mask DOM样本、原槽1/2/3、holes/gap/margin、图例/重挂载/CSS/375px通过。中央最终同14项过，实际PNG与asset逐字：1280×1034/60561bytes/SHA6231fbc25bdd294584259eca606c3f87e3294d0bb1b7bbe775c8c79bcd58e777，已目视。证据draft/FINAL_HANDOFF.md、browser-final-filled-contours。
- [x] 外部consumer0454960：Native8673、JS初58831/最新bounds rebuild、actual两个info/fmt均terminal0，两个mbti byte unchanged；Chrome17558 terminal0、41项/10个填色整数事件/0errors。public-browser/report.json。统一候选版本0.13后将由clean包与实际registry再实测，不拿workspace过关代替实际安装。
- [x] Root中央prelude16307/postlude47933均terminal0；唯一full30284 terminal0/268.45s：W/WG22589、JS22642、Native22591。20步骤全部0：actualinfo/fmt、13JS、13页面Chrome162项/0errors、三静态SVG（preview/gallery逐字）、docs/结构/diff，无额外mbti。central-summary.json/final-validation-progress.json；未重复full，后续仅文档改动再查links/diff。
- [ ] 精确下一动作：独立最终packet/source manifest已核对，记录最终候选验证并commit/push→gitclean固定正式source→clean builder→actualpublish→公开API校验version/buildsuccess/haspackage/notyanked/metadata.checksum→无workspace全新registry四静态/Chrome41/全部安装源逐一同正式ZIP→GH release四附件整下载/digest/size/tag→Root不变HEAD+gitclean最终audit，才解除trackedfreeze并记录实际交付/下一片。
- Release-live `.moonagent/checkpoints/M12-contourf/release-live.json` 当前ready for clean build，无发布live；启动正式builder后该文件的source_frozen=true为准，直到整网络audit完成不得Root tracked写/commit（ignored证据及own独立worktree只读准备允许）。Root无验收live，唯一有意预览8765/session43005/PID70622。
- 下一片只读准备M13-tripcolor-prep：m3_browser immutable ae1 Native82861 terminal0三fixture/XML，原face槽[0,2,3]/值[10,30,40]、vertex旧均值[5,7,9,7]、equalcounts逐面优先[2,5,11,17]，旧均0targets/0Containers；scoped tripcolor block与当前0.13生产逐字同。SOURCE_MAP/HANDOFF/baseline/SVG/manifest已freeze，无M13实现或新能力验收。m3_donut own ignored最小metadata/ownership设计也已完成，未运行probe或改源；m4_area完成M12收表后不扩大测试。未授权M13生产，等0.13实际闭环后再定精确基线实现。

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
- [M11完整历史](migration-status-through-2026-10-25-m11.md)、[M10](migration-status-through-2026-10-25-m10.md)、[M9](migration-status-through-2026-10-25-m9.md)、[M8](migration-status-through-2026-10-25-m8.md)、[早期](migration-status-through-2026-10-25-m4.md)保留既有决策/失败/附件证明。
- M12候选预览http://127.0.0.1:8765/rabbita/filled-contours.html，默认JS4709395bytes/SHA28a84c6b4b0b56a37d2faa9ae6e3a679aee2cc96006167f8d965e30ba6556c7a；HTML/JS/三CSS实际HTTP200逐字，证据M12/preview-http.json。open_in_codex queued未声称前台，仅connectionrefused才重启并更新session/PID。
- master，SSH origin=git@github.com:moonbit-community/moonplot.git；独立分支codex/。静态core不importUI，统一module Rabbita只JS。
- JS-only接口用tools/update_interfaces.py真实compiler生成；最后info/fmt、预期mbti审查、python3 tools/check_structure.py与适当tests；版本/发布Root统一收口。

[路线图](../MIGRATION_PLAN.md) · [能力](../CAPABILITIES.md) · [架构](../ARCHITECTURE.md) · [安装](../PUBLISHING.md)
