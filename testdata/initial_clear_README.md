# 构造与 clear 的默认刻度生命周期

D36 接通 `axis(horizontal=...)`、Scene 的实际创建入口及清理路径。实现和验证状态以
`MIGRATION_STATUS.md` 为准；本片已完成四目标累计验收。

独立参考执行固定 Matplotlib v3.11.2 原源，预期不读取 MoonBit 实现：

- [Axis 构造与原位清理](axis_initial_clear_README.md)：412 场景、13 组测试，另 8 个内部 clear=False 阶段；含 16 个完整数值查询与保留转换信息场景。
- [Axes 清理与共享](axes_clear_README.md)：54 场景、2 组测试，完整源 clear 入口执行 60 次，包含 5 次实际晚阶段错误。

Axis 构造先确定 x/y 方向，再安装真实 Linear 默认四对象，所有 default flags 为 true。
`Axis.clear` 在原共享 holder 中替换对象，保留视图、方向、overlap 设置及稳定上下文；
清理自己的日期、分类与呈现信息。原来把它当作清除 limits 的行为已按原源修正；
恢复自动范围仍使用 `clear_limits`，面板的完整清理由 `Axes.clear` 负责。

`Axes.clear_checked` 先清自己的 x Axis，再给 x 共享成员直接安装 Linear，随后完整处理 y。
当前 rc 开启 minor 时，源代码还有一次普通 AutoMinor setter，因此对应 minor default
flag 为 false，owner 是清理发起者。只有发起面板的图元、标题、边距等被清理。
最后按保留的 share target 复制视图及几何；原 reference 没有 target，重置为 0..1 并向
实际组成员传播。旧纯 `clear` 方法通过 checked 路径执行，签名保持。

共享组拥有独立的有序成员及真实创建 target 引用。删除从 Figure 移走面板并取消注册，
保留 target 和 ticker alias。clear 的末尾可能重新把已移除 target 加入共享组，
但不会把它重新加入 Figure 绘制列表。目标仍有旧 Log 几何时，清理后的成员可能继承
Log 几何，却共用新 Linear tickers；这些反直觉状态来自真实原源，未强制归一化。

生命周期读取目标自身保存的视图，用户 `bind_view_interval` 覆盖仍有优先权并可抛错。
Scene 的绘制投影另用 `bind_render_view_interval`，防止共享绘制范围盖掉已移除目标自身
的视图。两条无 provider 替换的回归分别验证升序与降序，补足受控上下文对照。
checked 失败保留之前已发生的对象、成员、图元和坐标变更，不做原子回滚。

共享 peer 的 converter/units 元数据不会被整体清理；实际新安装的数值对象决定定位、
标签、minor 和 offset。日期/分类元数据仍可查询，既有显式日期位置桥继续可用。
这不等于通用 units 更新与任意 Python converter 回调已全部接入。

Figure/SubFigure 的 `clear_checked` 沿同一个 Axes 路径，每个保留面板访问一次，避免嵌套
面板被重复安装默认对象。它们仍保留本项目已有的面板与布局便利合同，与原 Figure.clear
删除面板的完整语义有区别。Python weakref/GC 到期、完整独立 AutoOn/lazy view/dataLim、
secondary function/functionlog 默认生命周期及完整 GUI/Text 仍是后续范围。

没有新增数值内核或外部运行时依赖。固定 Python/NumPy 来源与签名审计沿用
[参考环境说明](reference_runtime_README.md)。


本片新增 15 个注册测试承载 466 个场景。首次完整四目标运行各有同一条旧测试失败：
旧 Fixed minor getter 断言把绘制可见性筛选提前了。独立重跑原完整 get_minorticklocs 确认
应保留视图外值、NaN 与 Infinity；只修正这条旧测试，生产及其余已过项目未改。
该文件四目标各 6/6 补验通过；当前累计 wasm/wasm-gc/native 各 21853、JS 21860 项全覆盖。
首次 full 命令 exit2、定点补验 exit0 分别保留。两份新 source --check 与最终 info/fmt/check
均通过，77 行完整接口差异已审且最终逐字一致。独立 Scene 与转换元数据查询复核均未发现
新具体缺陷。剩余 7 条 Ref 弃用警告沿用现有代码。
