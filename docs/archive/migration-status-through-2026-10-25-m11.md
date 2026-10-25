# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力/场景对齐，不复制Matplotlib完整API/Python动态协议，不恢复旧D55或编造完成百分比。
- 用户要求“一直往后对齐”；M1至M10及0.3.0提示片已验收交付，当前推进M11线等值线。
- 已授权合理复用、独立subagents、小步verified local commits/push至moonbit-community/moonplot；2026-10-24明确授权实际Mooncakes发布，前缀Lampese/，统一Lampese/mathplotlib module。
- 根facade api.mbt；consumer tests/api，global tests/integration，owning implementation/wbtests；维护mbt<2000行，结构检查必跑。

## 当前切片：M11 Contour（源码验收通过，正式交付准备）

- 范围[M11](../MILESTONE_M11.md)，目标0.12.0；Root/consumer已置0.12.0开发候选；正式registry仍0.11.0。首核心4717ae9已审合为Root7f9c8f0，新语义尚未完成验收/发布。
- 从正式0.11源0177b0cd77cc3cb05f108a2af49f561e3a0fd036继续，仅regular contour、tricontour及委托wrapper；filled多环/孔洞独立后片，不扩完整API或重开19图调查。
- 仅新HitKind::Contour，value精确resolved level/callseries；其他cell/vector/band/error/fraction不填，不新增ContourInfo。
- point_index原ContourSet.segments生成path槽，inline两片保留；artist_index实际当前fragment。dataXY实际emitted valid-run边clip前安全midpoint，screenXY可见clip中点；不是grid/input观察或指针插值。
- 实际非零Segment/两modephysical，无Point/全panelXsnap/跨invalid-Log gap连线/闭环fill。actualLine paint和provenance为准，失配保static且不generic回退。
- 保签名、ContourSet复制getters/level/path/stitch/mask/locator、Container/legend/颜色与正常SVG。默认inline原按几何相等擦线范围不变，各已知call独立迁移level/slot/label，不给普通Line/Barbs串贴，失效intent不借新fragment复活。
- O(generated geometry)：共享小lineage、每fragment一次snapshot/guard、每edge O1；prepare cursor保持线性，避免image/inline后交错Barbs反复全扫；不每边扫描path或复制grid。
- 额外仅修两线API无path串改前series，保静态legend/颜色/空Container；不扩大filled行为。
- Root .moonagent/checkpoints/M11-contour/active-scope.md为已明确生产合同，producer-design/{design,handoff,source-manifest}已复制。固定合同可行，技术注意为inline原几何擦线范围和cursor线性。
- m3_donut已从精确0177在own managed worktree建codex/m11-contour生产，拥有core/IR/Scene/backend/Drawing/tooltip/own tests和CONTOUR_INTERACTION.md；不得Root tracked写/版本/中央docs/consumer/UI/全库/push/publish/新agent。先Native与coherent小SHA让UI/review并行，再有限四target/adapter/info/fmt/结构。
  最新coherent提交4717ae9已交（基于0177，18文件，公开仅Contour kind）；首Native6/6，all-target check77tasks/0errors，真实info/fmt/结构/diff过。Root7f9c8f0已审合；56348 terminal0、六公开fixture×四目标共24 SVG与精确0177逐字且Drawing/static一致。producer继续bounded guards/paint/lifecycle/guide及必要四目标/adapter：最新Native15＋geometry/facade6共21专项过，覆盖4096边、NaN/Inf/Log、prepared mismatch、paint/反轴clip/CSS/multi-panel/closedloop/safe midpoint。1e308的默认locator InvalidTicks已在0177/current双实证同旧行为，fixed ticks两边同SVG且新中点finite，无locator改动。最终b71cc1c已Root审合为304d3f8：限定Native199/199、W/WG/JS各198/198、adapter44/44；实际info/fmt/结构/diff过。唯一生产delta为BarbIntent改priv及scene mbti去未用opaque，无Contour行为变化。指南CONTOUR_INTERACTION.md和七专项已合入。
- m4_area独立复审已明确授权精确4717，own ignored immutable0177旧SVG/公开consumer/actualXML oracle；旧基线Native97718 terminal0八fixture已冻结，现Native/JS各11public＋4白盒均过，actualXML16/同target旧SVG16与34Contour targets匹配，最大误差1.1368683772161603e-13，无blocker，无live；最终packet待收sourcehash。保留M10最终packet，不重跑旧M10/M9。
- m3_browser从五文件ignored草稿按精确4717完成七文件真实部署；拥有UI而不改core/版本/consumer/中央docs/其他UI，不full/commit/publish。详见下方实测结果。
- 旧只读c9六小公开Native23053 terminal0、六SVG/返回paths/levels/artist顺序已存browser-design/：regular4path/18generic Points、仅末7点series Field/value为几何Y；inline7片series全空；tri仅末path有label；filled evenodd双环0targets。这些只是旧行为，不算新交互通过。
- [x] UI真实七文件已freeze：isolated95259/info/Chrome49823 terminal0，14/14、0errors；31实际整数事件、21边最大.971035CSSpx≤2、真实inline gap4.91008px拒绝；11typedframes与实际SVG/返回path/midpoint一致。真实1280×1015 PNG83701bytes/SHA ddf502eb9151f7d95287e0a494b119e2e00bb661991f5298c5d35ab4b8dcefb4已Root目视。证据draft/FINAL_HANDOFF.md和browser/final-evidence.json。
- [x] Root新publicconsumer Native85615与JS app build71283 terminal0；Chrome80341 terminal0/36项/0errors，四实际contourevents≤.0583CSSpx，默认/自定level、两inline片与tri clip/空白/375px通过；Area前后两mode遮挡行为Native过。最初自己的range/未导出constructor编译错误已修consumer并留原log，非core故障。actual app/static package-info、fmt过且mbti逐字未变。证据public-summary.json。
- m3_browser和m3_donut已转有限只读M12-contourf-prep（两个旧fixture/真实复合Path/孔洞设计），不生产/不改Roottracked/不重开全图调查；M11七文件保持freeze。
- 精确下一动作：producer最终27owner文件含16production/3interfaces与Root逐一SHA相同，证据producer-final/root-match.json；接收独立精确4717全部通过（public Native51301/JS57106各11组、16actualXML/16同target旧SVG、每target34Contour targets；Native48652/JS98320各4白盒、1536边和private identity/provenance/inline/image/remove/clear无blocker，均terminal0）→正式源码提交/push→clean包/实际发布和下载闭环；已过中央full与12Chrome不重复。不得把首6Native当全部验收；继续复用定点资料，不重调查。
- Root中央37734 terminal0：info/fmt/12JS、full268.44s（W/WG22564、JS22615、Native22566）、12Chrome148项/0errors、静态三SVG与preview/gallery逐字、docs/结构/diff全过；无意外mbti。证据central-summary.json和final-validation-progress.json。Root无测试/发布/下载live；UI e3901c3和public consumer/0.12候选925d742已commit。M10 release-live.json已complete，tracked freeze已在完整网络审计后解除。唯一有意预览8765/session43005/PID70622。

## 最新交付：M10 / 0.11.0（2026-10-25）

- [x] Barbs原pivot前X/Y、原i/U/V与value原V，实际shaft/羽枝Segment、flag填三角Quad+三edge、calm全Sector；共享call+常数1/2/3点view O(N+P)，两mode仅physical。原签名/Unit/无Container/静态和有效错误前缀保留。
- [x] 空/zero无component不改前series、高级派生非finite/不可表示总量在转换展开前报错；无任意小cap。identity copy退generic独立反例以known-slot/disabled共享view修复，维护image/inline/remove/clear，普通Line原行为保留。
- [x] producer final7cdaece→Root49f6d75（生产自edb6559/Root7fcb70c不变），Native197/W-WG-JS各195/Rabbita42与32同target旧SVG过；Root29owner文件/16production SHA一致。
- [x] 独立core Native/JS各17组、各10XML/36targets、20同target旧SVG，2048输入→8192组件；identity fix Native98906/JS5376各4组，唯一blocker解除；最终16production与Root一致。
- [x] 中央full54039子步terminal0/266.67s：W/WG各22543，Native22545，JS22592。info/fmt/11JS、11Chrome134/0errors、三SVG/preview与gallery逐字、44MD/509本地链接及结构/diff过，无意外mbti。
  首Node Barbs legend即时count失败原证据保留，真实3→0/0→3异步时序证明runner race；仅状态/DOM等待后retry29449过12项，新runnerf66c575，未改产品/放宽断言/加sleep或重跑已过full。其余十Chrome19741过122项。
- [x] 正式source0177b0cd77cc3cb05f108a2af49f561e3a0fd036，push87697 terminal0；clean41056 terminal0/dirty=false，外部四目标静态/Chrome32。
  module2346216bytes/573files/SHA b87b76d3471b185124458e5b992dba1983456d47cde679b0632ef4aae48520e0；source2386461bytes/594files/SHA ab9188c5c881f8c46f4176de83342c904067a289631328750ed44d08087ecc9d。
- [x] actual publish10237 terminal0/200，公开0.11/buildsuccess/haspackage/notyanked/checksum同正式包；registry75023 terminal0，无workspace全新安装573源逐一相同、四静态/Chrome32过。
- [x] GHcreate63983与整下载68272均terminal0；整个下载完成后四附件字节/digest/size/tag source SHA全过。[GitHub v0.11.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.11.0)。正式builder至网络闭环Root HEAD0177不变且gitclean，无tracked写/commit；dirty未上传。
- 证据Root .moonagent/checkpoints/M10-barbs/：producer-final、final-review/root-production-match、central-summary、browser-final-barbs-retry（真实时序与runnerSHA）、release-final/artifacts及download-check、registry-consumer/report、release-live phase=complete/no live。原失败和before保持。

## 早期交付与源码地图

- M9/0.10正式c9eb6bec526a2f6d2b1f6330a60ef616dd83a16a，Quiver；M8/0.9 Stem，M7/0.8 Step/Stairs/ECDF，M6/0.7 Hex与Violin，M5/0.6 meshes/hist2d，M1至M4及提示片均已完整实际交付，无需重跑。
- [M10完整历史](../archive/migration-status-through-2026-10-25-m10.md)、[M9](../archive/migration-status-through-2026-10-25-m9.md)、[M8](../archive/migration-status-through-2026-10-25-m8.md)、[M7](../archive/migration-status-through-2026-10-25-m7.md)、[早期](../archive/migration-status-through-2026-10-25-m4.md)保留失败定位与旧tag/附件。
- 可访问正式预览http://127.0.0.1:8765/rabbita/barbs.html，默认JS4521282bytes/SHA1cc7844347208de0e8776d184a81050b8c91ecc9ac583e40414b47625e2b61aa；HTML/JS/三CSS实际HTTP200逐字。open_in_codex queued未声称前台；仅connection refused才重启并更新session/PID。
- 主master，SSH origin=git@github.com:moonbit-community/moonplot.git；独立分支codex/，静态核心不import UI，统一module的Rabbita子包只支持JS。
- JS-only接口用tools/update_interfaces.py真实compiler生成，最后info/fmt、预期mbti审查、python3 tools/check_structure.py与适当tests；版本/发布由Root统一收口。

[路线图](../MIGRATION_PLAN.md) · [能力](../CAPABILITIES.md) · [架构](../ARCHITECTURE.md) · [安装](../PUBLISHING.md)

## M11最终正式交付（2026-10-25 21:08 Asia/Shanghai）

- 正式source ae1ce6b4c45d17fd2c1fbee388525f5c7f713307，push41390 terminal0；clean39728 terminal0/dirty=false，外部四静态/Chrome36。
- module2433308bytes/581files/SHA ada8b34efaa9e013c285043fba697a7eb5696c16bc4c2f5aed5c5ee050a76666；source2476895bytes/604files/SHA15584bc5159d339d5f23feda5e62e4ec0d4357a835fb0569d7982dc1dae8663e。
- actualpublish40580 terminal0/200；publicAPI38331 terminal0：0.12/buildsuccess/haspackage/notyanked/metadata.checksum等于正式module；freshregistry28365 terminal0，581源逐一相同、四静态/Chrome36过。
- GHcreate39288、整个ghdownload61598均terminal0；四附件完整字节/远端digest/size/tag source SHA全部过，最终audit Root HEAD ae1ce6b且gitclean，正式builder至闭环无tracked写/commit。tracked freeze已解除。
- 独立final packet已复制Root final-review，16production逐一SHA相同；producer27owner/16production/3interfaces相同。中央37734与12Chrome148等前述通过，无full重跑。
- Root .moonagent/checkpoints/M11-contour/release-live.json phase=complete/source_frozen=false/no live；release-final/artifacts/download-check、registry-consumer/report、final-review、central-summary保留完整证据。
- [GitHub v0.12.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.12.0)。M12已明确授权，当前继续见[当前执行检查点](../MIGRATION_STATUS.md)。
