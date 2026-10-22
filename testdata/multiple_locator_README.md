# MultipleLocator 原源参考

固定 Matplotlib `v3.11.2`，commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`。D20 接入命名数值定位器、动态 rc 范围策略
和现有 axis/render 链路；四目标验收已通过（wasm/wasm-gc/native各5346，JS5353项），证据见
[执行检查点](../MIGRATION_STATUS.md)。

| 固定来源 | SHA-256 |
| --- | --- |
| `lib/matplotlib/ticker.py`：MultipleLocator、_Edge_integer、Locator.nonsingular | `49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad` |
| `lib/matplotlib/transforms.py`：_nonsingular | `109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8` |
| `lib/matplotlib/axis.py`：_update_ticks 的视图筛选 | `f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0` |
| `lib/matplotlib/mpl-data/matplotlibrc`：axes.autolimit_mode 默认值 | `8b76e138ce9dc944a843dc6aa1ef9ee0e88638358b10baf227cd248d271b5f5a` |
| `lib/matplotlib/rcsetup.py`：rc 选项集合 | `a052eac4af21ce8cdb58ee49c3ab952af4c2ff5e18f36cc8b741793fa79b5f59` |
| CPython 3.12.14 `Objects/floatobject.c`：float divmod | `d558f168de7ec864b64ffad7ee2b056bda4efca1ee68ca690189354b893ccc76` |

## Typed 对象与生命周期

`@ticker.MultipleLocator::new(base=1.0, offset=0.0)` 接受有限正 Double base 和有限 Double
offset。分数、subnormal 与大于 Int32 的 base 都在该域中。非正或非有限 base、非有限
offset 在构造时抛 `DataError`；不宣称 Python 动态参数、任意对象协议或非有限构造值兼容。

`base()`、`offset()` 返回当前值。`set_params(base?, offset?)` 先验证候选配置，成功后
同时更新；省略值或显式 None 保留旧值，失败不部分修改对象。`copy()` 返回独立可变配置。

`as_locator()`、`as_minor_locator()` 分别返回 `Locator::Multiple` 和
`MinorLocator::Multiple`，`multiple_locator(base=..., offset=...)` 是主 adapter 便利入口。
generic `copy()`、axis 安装、shared 与 secondary 轴保留 live handle；后续 `set_params`
会影响这些 adapter。要隔离更新，先调用对象 `copy()`，再取得 adapter。
`multiple_locator()` getter 可以从主/次 generic adapter 取回对象。

## 直接网格与 adapter

直接 `tick_values(lower, upper)` 对输入排序，输出升序且包含范围外相邻点；offset 先从
两个端点减去，按 base 求齐格点，最后加回。不能用 `floor(value/base)` 代替 Python/
NumPy divmod，例如 `1.0 // 0.1 == 9.0`。`_Edge_integer.ge/le` 使用零内部 offset 的
`1e-10` 容差，保留 `0.001 * base` 与 `arange` 运算顺序及 binary64 舍入。

generic 主 adapter 按项目约定保留输入方向，checked 失败映射空 ticks；minor adapter
还会裁到输入范围内并去掉与主刻度重合的点。原源 direct 输出与这两项项目 adapter
协议分别验证。contour 使用现有 generic locator 链路。

eager 输出最多保留 **100000** 个前缀；非有限输入端点、alignment 或 tick count 抛
`DataError`。极大有限参数仍可能产生无限刻度坐标，direct 保留其运算结果；不把整个
输出裁成有限值。Python 的超量日志、无上限 NumPy 分配以及宿主 axis 绑定/动态反射
协议不在本 typed 对象范围内。

真实共享内核位于 `internal/tick_grid`，由数值 MultipleLocator 与 D19 MicrosecondLocator
共同使用。原有 Python/NumPy divmod 逐 bit 参考移动到该包，日期入口继续映射 DateError；
日期的 whole-array 转换、epoch、旧 Int32 helper 裁剪和命名对象精确 getter 保持原合同。

## view_limits、nonsingular 与 rc

`config.axes_autolimit_mode()` 默认 `"data"`，setter 只接受 `"data"` / `"round_numbers"`；
RcParams 快照、getter 和 reset 保留这一值。MultipleLocator 在**每次** `view_limits`
时读取当前 rc，不在构造时冻结。

- data：原端点进入 `_nonsingular(expander=0.001)`。
- round_numbers：对原 lower 用 Edge.le、原 upper 用 Edge.ge，加回 offset，再 normalize。
  不预先排序，因此倒置输入可能与交换后调用有不同结果；两端齐格后相等时先各扩 **1**，
  扩展值不是 base。
- 独立 `nonsingular` 使用继承 Locator 的 `expander=0.05`；这与 view_limits 的 `.001`
  不同。两个接口均保留近零/极窄/非有限输入的上游范围回退。

axis 自动范围先对 MultipleLocator 数据边界执行 `.05` nonsingular，然后处理 margin 和
sticky edges，最后执行 view_limits。显式范围、图像暂存视图先于自动策略；倒置方向仍由
axis 保留。shared/secondary、主次刻度和 SVG 复用现有链路，不复制后端编码。

直接网格保留外侧邻接点，SVG 主/次与 secondary 轴绘制则参考 `Axis._update_ticks`：
先用完整 locator 输出计算 formatter 标签/布局，再按变换后的视图筛选绘制，采用
`transforms._interval_contains_close` 的 `1e-10` 相对容差。这样邻接点不会把 tick/grid
画到视图外，direct 与 generic 查询仍保留其合同中的点。

当前 `tight` 通过零边距表达，尚无完整上游 tight 状态机；已存储的 provisional/auto_view
需要现有 autoscale 请求才重算。这不代表全套 Matplotlib autoscale、动态 scale locator、
宿主回调与全局 rcParams 已完整迁移。

## 参考覆盖与重现

`scripts/generate_multiple_locator_reference.py` 从固定源码 AST 执行 MultipleLocator、
_Edge_integer、Locator.nonsingular/raise_if_exceeds 和 transforms._nonsingular，
不导入已安装 Matplotlib。生成以下两个产物：

- `multiple_locator_reference.json`：**198 grids、9 updates、3 constructor errors**，
  生成器主观察计数 **1200**；每个 grid 含正反 direct、data/round_numbers/data 动态切换
  和 inherited nonsingular，有限值与 infinity 按 binary64 位形验证。
- `../ticker/multiple_locator_reference_test.mbt`：**202** 个原源测试；另有四个 typed
  hand 测试覆盖有限参数 guard、live/独立 copy；cap由超预算原源前缀案例覆盖。

覆盖分数/offset、负值/倒置、临界 ULP、极值、参数更新/失败/copy，以及两个 nonsingular
策略。共享轴、secondary、contour、config reset、主次 SVG 另有13个独立集成回归，
以及1个checked constructor文档示例。

原源 NumPy arange 的开发枚举预算为100000；两个超预算 grid 记录原请求 count，只用
原运算表达式求八项 prefix，再与生产100000前缀的开头比较。预算事件单独记载，不冒充
上游异常，也不执行巨量 NumPy 分配。构造参数和所有 grid 运算仍执行固定原源本体。
最终全项目门禁状态以执行检查点为准。

```sh
python3 scripts/generate_multiple_locator_reference.py /path/to/pinned/ticker.py --check
moon info && moon fmt
moon check --target all
moon test --target all
```

仅用既有 Python3.12.14 / NumPy2.3.5 生成开发参考，无新增运行时依赖、Python 或自有 C。
许可沿用根目录 Matplotlib 说明；CPython 源码用于行为核对，不分发 C 实现。
