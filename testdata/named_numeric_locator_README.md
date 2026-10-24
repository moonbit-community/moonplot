# 命名 LinearLocator、IndexLocator 与 FixedLocator

D21 对齐固定 Matplotlib `v3.11.2`，commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`。三类 direct 对象与公共 adapter/axis/render
接线已通过切片验收：wasm/wasm-gc/native各6380项，JS6387项全部通过，八份原源参考
`--check`通过。[执行检查点](../docs/MIGRATION_STATUS.md)记录验证结果及后续任务。

| 固定来源 | SHA-256 |
| --- | --- |
| Matplotlib `lib/matplotlib/ticker.py` | `49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad` |
| Matplotlib `lib/matplotlib/transforms.py` | `109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8` |
| Matplotlib `lib/matplotlib/_api/__init__.py` | `7e262cedd8ce1a1660c2e2caa63adeb078c29e36bd541b8e6f773cfed4c3c782` |
| Matplotlib `lib/matplotlib/figure.py` | `b440ab0a5be03cb39b13529a2fec497d2d96deb083e3e56d6220593e3ec567da` |
| Matplotlib `lib/matplotlib/axes/_secondary_axes.py` | `b2aaaae077e03ff6538d1a4bf8a69c3476eed0e27120aa567de138c794599a93` |
| Matplotlib `lib/matplotlib/cbook.py` | `e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643` |
| Matplotlib `lib/matplotlib/gridspec.py` | `df8395306765d9b93f98d6b2e867836a9b2b0786cf5b39a26103309c4331afde` |
| Matplotlib `lib/matplotlib/axes/_base.py` | `ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b` |
| NumPy 2.3.5 `numpy/_core/function_base.py` | `413d696e597ff2b7ffdd9b06b4b42801e435392a82a9e006b4c4f33c013523fc` |

所有原源 generator 固定 Python **3.12.14** 和 NumPy **2.3.5**，执行原 class/helper AST，
不导入已安装 Matplotlib。原源预算、typed 边界和 checked 错误与完整 Python 动态协议分开。

## 共享 TickValues 与 adapter

Linear/Fixed 的 direct 结果为 `TickValues`：它保存 buffer、起点、stride 和当时长度，
支持 `length()`、checked `get(index)` / `set(index,value)`；负索引从 view 尾部计数。
写入共享底层 buffer，`to_array()` 物化独立数组，`copy()` 返回有独立 buffer 的 TickValues。
`view(start,stride,length)` 借用同一 owner，支持负起点、负 stride 反向、嵌套组合与零 stride
重复引用同一个值；边界通过 checked API 验证，不先 flatten 后伪造别名。
外部数组增长不改变旧 view 的长度，外部 shrink 后不可达元素的 get/set/to_array/copy
抛 `DataError`，不使用越界 panic 代替 checked 错误。

三个对象均提供 `as_locator()` / `as_minor_locator()`，对应 `NamedLinear` / `NamedFixed` /
`Index` variants；generic `copy()`、轴安装与 getters 保留 live handle。对象自身 `copy()`
则分别按下述源浅拷贝语义执行，不能把两类 copy 混为一谈。

generic 主 adapter 对 Linear 按输入方向反转，对 Fixed 保留位置顺序并忽略 bounds，
对 Index 保留原步长与 bounds 顺序；它们在旧全局 finite guard/sort 前分派。minor adapter
按现有协议裁到范围内并去掉主刻度，保留对象生成的顺序。直接 Fixed/preset views 不截短；
generic 物化最多取100000项前缀。Linear/Index 动态生成的 eager 网格同样最多100000项。

`Locator.checked_tick_values` / `MinorLocator.checked_tick_values` 保留源错误，旧安全
`tick_values` 映射为空数组。`Axis.tick_values_checked`、`Axis.view_limits_checked` 和
`Figure.to_svg_checked` 组成 checked 轴/渲染链，使源 range 或 tick 错误可传播；
实现接线与最终门禁分别记录在检查点。

## LinearLocator

`LinearLocator::new(numticks?, presets?)` 用 Int32? 保存原始数量；
`configured_numticks()` 保留 None，`numticks()` 的有效默认值始终为11。
`set_params` 省略/None 不改原值；`set_numticks(None)` 对应 property reset。
0、1和负数均可构造，负数错误延迟到未命中 preset 的实际 tick 查询。

tick_values 先按 inherited `.05` nonsingular 展开并排序 bounds，随后查精确 preset key，
再检查 numticks 或运行 linspace。因而 preset 可以覆盖负数量或0数量；相等原 bounds
不是直接查表键，须使用展开后的那一对值。

`LinearLocatorPresets` 是共享可变 store：`set(lower,upper,array)` 借用值数组，重复键
替换原值；`set_view` 保留 TickValues 的 signed/nested/0stride，`get` 返回 TickValues，
`clear` 清除 store。命中返回同一 borrowed view，写入
结果可修改 preset。对象 `copy()` 浅共享 store、独立数量；`set_params(presets=...)`
仅更换该对象保存的 store。typed 键按 Double 相等比较，NaN 键不匹配。

linspace 保留 NumPy `delta/divisor`、step 下溢后的 `(index/divisor)*delta`、完整结果
最后端点覆盖及 `±max` 溢出结果；numticks1不误取 midpoint。超大 numticks 保留真实
前100000项，不把截短结果的最后一项改为完整网格终点。

`view_limits` 使用当前 `axes_autolimit_mode`，round_numbers 的 numticks<=2 会按源
在实际查询时抛 DataError；不能借 MultipleLocator 的无错误范围接口隐藏该差异。
data 与 round 的最终 normalize 使用 `.001`，独立 nonsingular 使用 `.05`。

## FixedLocator

`FixedLocator::new(Array[Double], nbins?)` 对应 borrowed ndarray 逻辑 buffer；
`from_view(TickValues, nbins?)` 保留原始 owner 与正/负/零 stride，`from_list` 对应 Python
list 入口，先复制。位置不排序、不去重、不拒绝 NaN/±Inf，`locations()` 返回可变借用
TickValues。tick_values 完全忽略 bounds，`values()` 对应无轴依赖
的源 `__call__`，包括非有限/倒置 bounds。

nbins 保存 Double?，构造执行 Python `max(nbins,2)` 的比较顺序，NaN 保留；
`set_params` 对非 None 值原样保存，不再次 clamp。0 的除零、NaN 转整数、极端 stride
和空候选求 min 的错误延迟到 tick；负数或±Inf 等行为按原源执行。
不能使用 backend fmax 吞掉 NaN，也不能加有限参数 guard 改变已冻结域。

subsample 使用最小绝对值选择 stride 相位，严格 `<` 保留先遇到的平局，NaN min
传播使相应比较为 false。None 结果和 subsample 都是可变共享 view。对象 `copy()`
浅共享位置数组、独立 nbins；修改结果/locations 会影响另一个 copy，更新 nbins 不会。
MoonBit 入口为 flat Array 或一维 TickValues；scalar/多维 NumPy 输入被原 `_api.check_shape` 拒绝的
观察仅记录类型边界，不宣称可通过 typed 入口传入这些对象。

## IndexLocator 与真实数据范围

`IndexLocator::new(base=..., offset=...)` / `set_params` 保存全部 Double，包括0、负数、
NaN和±Inf，不在构造时验证。直接 tick_values 从 `lower+offset` 到 `upper+1e-12`，
按 base 作 NumPy arange；不排序、不从零齐格，负 base 可以输出下降网格。
实际 fill step 为 `(start+base)-start`，保留舍入后的重复值、正比例下溢至0仍有首点、
Inf step 首点及源延迟错误。checked错误映射DataError，不能用Multiple正base规则替代。

固定 **Darwin arm64 NumPy2.3.5** 的 fill 对 i>=2 采用 FMA 一次舍入，与先乘再加可能相差
一个 ULP；i0/i1 仍为原 source 首两点。NumPy二进制 `_multiarray_umath.cpython-312-darwin.so`
SHA-256为 `44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305`。
生产以纯 MoonBit BigInt 恢复该位形，参考有3个独立 Decimal 精确舍入证据；不宣称所有平台
NumPy二进制都采用同样的 fill profile。

`bind_data_interval(callback)` 供独立宿主绑定；`call()` 每次读取当前 provider，没有
绑定时抛 DataError。对象 `copy()` 保留当前 callback，独立参数与后续 rebind。
继承 nonsingular/view_limits 分别采用 `.05`/`.001`。

axis 接线按真实本地 artist data interval 提供 callback；显式 view、margin 或 shared
view union 不能冒充 dataLim。共享 ticker 的 Index ownership 按最后显式安装该 locator
的 axis 绑定；secondary 没有自己的 artist data，不能直接用主 view 冒充。
原始数据范围也不受 display scale 的有效域过滤；log 轴隐藏负值，但保留这些数据对
Index 网格起点的影响，SVG 再按 scale 和 view 筛选绘制。
删除共享轴时，原 `FigureBase._remove_axes` 对 first remaining sibling 的 major/minor
locator 和 formatter 重新 set_axis；外部独立 copy 不在 shared ticker 中，保留旧 provider。
原 `Grouper` 按首次 join 登记顺序选择 sibling。每个新共享 subplot 组的初始相对顺序
为第二成员、第一成员、其余成员；私有 rank 在连续删除后保留。Figure/SubFigure 的
all/row/column 共享按此规则重绑，多个 SubFigure 的组ID独立预留，避免误合并。
secondary 的原 `_set_lims` 只改变 view，空(+Inf,-Inf)data不变，Index查询仍报源错误。
原源证据已冻结，MoonBit public axis/render 集成门禁以检查点为准。
Axis 的数据 provider 属于所属轴的 context，清除刻度配置后保留；旧 Index/copy 在后续
绘图后仍可读取新数据，无需重新安装 locator。当前 Scene provider 按现存 artist 即时计算；
上游 clear 后首次更新前保留旧 dataLim 的缓存窗口、显式 dataLim 修改与 relim 协议仍待迁移。

## 参考覆盖与重现

- Linear：184 ranges、20 preset cases、3 alias stages、6 updates和7组strided preset×4阶段，
  共977观察；213个 generated tests，另4个 hand tests。正/负/负start/empty/nested正反/
  0stride均逐次核对真实owner双向别名，Array入口立即捕获稳定shape。
- Fixed：456参数/位置 cases，各含三组无关 bounds 和一次 values；24个 list/ndarray/
  signed/nested/0stride alias cases，9个 inherited range pairs，4个 typed 外 shape errors。
  共481个 generated tests，另7个 hand tests与1个 checked doc；alias写操作逐次核对整个真实owner。
- Index：232 grids、9 updates、3 providers，共961观察组（含1个独立预算事件、3个FMA证据），
  236个 generated tests，另4个 hand tests。200000项 prefix样例实际完整执行源NumPy后只保存
  八项前缀；另1个超大请求明确标预算省略，不冒充源错误。
- Index axis：`generate_index_axis_reference.py` 执行原 `Axis.set_major/minor_locator`、
  `TickHelper.set_axis`、`IndexLocator.__call__`、`FigureBase._remove_axes` 和
  `SecondaryAxis._set_lims`；4条x/y×major/minor ownership traces含32观察，另6个secondary观察。
  shared Ticker/data容器和group membership为受控fixture，实际binding/rebind方法不替换。
  MoonBit另有8个scene/backend集成测试，最终门禁见检查点。
- Index raw data：4个原 `Bbox.update_from_path`/Index 数据案例、8个数据查询与正反view观察，
  以及4项scene集成回归；另一坐标的log负值也不会删除当前坐标的数据范围。
- Index shared order：60条原 `Grouper`/GridSpec/共享/移除 traces/tests，228阶段、84次移除，
  覆盖Figure/SubFigure all/row/column、连续移除与多个SubFigure隔离；另1项provider跨clear回归。

对应生成器各输出 testdata 同名 JSON 与 ticker 下的黑盒参考测试。超预算观察单独记录，
不把开发时预算错误当成源异常；runtime 没有 Python、NumPy或Matplotlib依赖。

```sh
python3 scripts/generate_linear_locator_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_fixed_locator_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_index_locator_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_index_axis_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_index_data_scale_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_index_shared_order_reference.py /path/to/pinned/ticker.py --check
moon info && moon fmt
moon check --target all
moon test --target all
```

旧 `linear_locator`（默认7、count至少2）、`linear_ticks`（默认6/point单值）和
严格有限递增并裁范围的 `fixed_locator` 继续保留。完整动态 axis 对象、任意ndarray dtype/
多维/任意Python对象、Python任意精度与无上限物化仍不在这些 typed 入口内。
