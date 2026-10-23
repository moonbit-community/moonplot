# 显式 scale 默认刻度安装

D35 将已有五种 typed 几何的显式 `Axis.set_scale` 和 `Axes.set_x_scale` /
`set_y_scale` 接到真实命名 locator/formatter 对象。每次调用都安装四个新对象，
包括重复设置同一几何；成功后四个 default 标志才全部恢复为 true。

| 几何 | major locator / formatter | minor locator / formatter |
| --- | --- | --- |
| Linear | AutoLocator / ScalarFormatter | 按 x/y minor.visible 选择 AutoMinorLocator 或 NullLocator / NullFormatter |
| 十进制 Log | LogLocator(subs=[1]) / LogFormatterSciNotation | LogLocator(subs=auto) / LogFormatterSciNotation |
| SymLog | 按当前几何的 SymmetricalLogLocator / LogFormatterSciNotation | 同几何 SymmetricalLogLocator / NullFormatter |
| Asinh | AsinhLocator(subs=None) / LogFormatterSciNotation | AsinhLocator(subs=(2,5)) / NullFormatter |
| Logit mask/clip | LogitLocator / LogitFormatter | minor LogitLocator / minor LogitFormatter |

默认对象在安装时读取当前 rc。Linear 的 x/y minor.visible 独立，默认为 false；
ScalarFormatter、AutoLocator 和 LogFormatter 的既有 rc 捕获协议保持生效。
Asinh 的 base-ten minor 使用共享、不可变的 `AsinhSubsTuple`，构造与导出数组都复制；
它保留 tuple 身份和数值消费，不提供 Python 可变类字典。

Numeric major/minor locator、formatter、旧便利 fixed ticks/labels/formatter 和四个
默认标志位于同一共享 holder。共享轴上的直接 setter 会更新相同槽与标志；几何、
视图、数据 provider 和显示设置仍各属于自己的 Axis。组安装遵循实际 Grouper 顺序，
最终对象保留最后一位成员的绑定；旧对象被替换后仍能读取原 Axis 的实时上下文。
删除最终 owner 后，现有移除路径按剩余组顺序重绑当前对象，已移出的旧对象不重绑。

显式 scale 安装替换旧自定义 tickers，不再先拒绝即将被替换的旧 fixed ticks 或
旧线性 locator。源顺序保持为：先赋几何，依次构造与安装默认对象，最后恢复 flags；
Asinh 保留三个 kwargs 对象先构造的顺序。当前有效 typed 几何不开放 Python 任意
Scale 子类或 setter hook，原源的受控失败阶段以独立诊断保留，没有制造额外回调 API。

已有 `set_tick_count` 是便利采样入口：它使默认 major locator 让出控制权，保留用户
显式安装的 locator。`clear_locator` 清除对象并回到便利 sampler；`clear_minor_locator`
禁用 minor；这些显式操作将相应 default 标志设为 false。旧 pure sampler/helper 仍独立可用。

Scene 比较安装前后 major locator 的 `nonsingular(-inf,inf)`，仅在默认范围改变时请求
重新计算自动视图，并保留显式 limits。这覆盖默认范围比较与请求分支；完整源
`autoscale_view`、dataLim 缓存和所有强制重算时序仍是后续工作，不能用该请求声称已完成。

本片不包含新建 Axis / `clear` 时的完整默认安装、通用单位转换器的四 flag 更新协议、
secondary function/functionlog 的缓存 scale-name 跟随，也不包含完整命名可变 Scale 类、
任意 Log 参数或 Asinh 自动倍数类表。日期与 category 使用现有独立 typed bridge。
现有 SymLog factory 默认 threshold=1 与验证规则保持；参考显式传入匹配几何，
没有将 Python Scale 的 constructor 默认 threshold=2 混为本项目 factory 默认。

三个独立参考均执行固定 Matplotlib v3.11.2 原源，预期不读取 MoonBit 实现：

- [参数、rc 与 tuple](scale_defaults_params_README.md)：145 次原源观察、112 案例、4 组测试，另含 24 个安装顺序诊断。
- [Axis 生命周期](scale_lifecycle_README.md)：180 案例、6 组测试，另含 12 个 factory / partial-stage 诊断。
- [共享轴、draw 与默认范围请求](shared_scale_defaults_README.md)：68 案例、182 个实际阶段、3 组测试，覆盖独立完整原源安装、Grouper 与 draw 管线。

没有新增运行时依赖或数值内核；参考使用固定 CPython 3.12.14 / NumPy 2.3.5。
主体新增 14 个注册测试承载 361 个验证案例（112 参数、180 Axis、68 Scene、1 便利采样回归），
另有先行独立 rc 配置测试。初次完整运行四目标均出现相同 6 个旧 fixture / 契约假设失败；
按实际源语义修正设置与预期后，相关五文件四目标各 61/61 通过，生产代码未因这些失败改写。
其余初次已过项目未变，当前累计 wasm/wasm-gc/native 各 21838、JS 21845 项全覆盖。
不能将首次完整命令的 exit2 写成 exit0。三新 source 与两份旧 source 复验通过；
完整生成接口差异已审。Axis 的五个旧公开数值字段移入 private holder，访问使用既有
getter/setter；新增四个生命周期查询/共享入口和不可变 tuple API。
签名变化的参考宿主复验见 [runtime 说明](reference_runtime_README.md)。
