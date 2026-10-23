# 共享轴显式 scale 默认安装参考

本片已通过主任务统一 MoonBit 门禁；完整运行与相关补验的区别见[总指南](scale_defaults_README.md)。范围是现有
Linear、Log、SymLog、Asinh、Logit 五种 geometry 的显式 `set_x/y_scale`。
构造、clear、units 的完整默认安装及 secondary function/functionlog 默认生命周期
仍为后续工作，不能由本片推断已完成。

`scene/shared_axes.mbt` 在创建共享网格时接入真实共享 numeric ticker holder。
Figure 和 SubFigure 原有的共同初始化入口都会执行；四个 locator/formatter
句柄及 default flags 因而共同可见，不靠逐轴复制同步。创建本身仍不安装全套默认。

`scene/scale.mbt` 先绑定每个成员的真实本地数据、物理尺寸与 x/y 方向，再查询旧
major locator 的 `nonsingular(-Inf,Inf)`。随后按已接受的原 Grouper rank 顺序
逐成员安装 scale，查询新的 default limits，仅在两 tuple 不同时请求重新计算
自动范围。不会在末尾把句柄 owner 重新绑到请求者，也不会调用会清掉 explicit
limits 的旧便利 autoscale 方法。完整即时 `Axes.autoscale_view` 生命周期仍在范围外。

成员直接替换某个 named formatter 后，其他成员立即看到相同句柄及 false default
flag。重复设置同一 scale 会创建新默认句柄并恢复四个 flag；删除最后 owner 时沿
既有 Figure 删除规则重新绑定，先前 shallow copy 仍保留旧 owner。

独立参考实际执行固定 Matplotlib3.11.2 的完整原方法体：

- `GridSpecBase.subplots`、`_AxesBase.sharex/sharey` 与真实 `cbook.Grouper`；
- `Axis._set_axes_scale/_set_scale`、实际 Ticker、四 setter/default flag properties；
- 五种完整 scale/default installer、真实 named ticker/formatter；
- `FigureBase._remove_axes` 与完整 `Axis._update_ticks/draw`。

源 namespace 复用两个本片正式 loader；没有用 Moon 实现或翻译的安装模型生成期望。
View、data、tickspace 是明确控制的数值上下文，Text/renderer/layout 是存储型宿主
sink。Source 的 autoscale_view 仅记录调度，未伪造其完整算法。SubFigure 场景复用
原 GridSpec 共享/排序协议并在 Moon 实际 SubFigure 宿主验证；不宣称移植整个原
SubFigure 构造或 GUI。Locator owner 诊断使用各成员不同的受控 view provider，
并持有 Axis 句柄，避免重复调用 Scene getter 重新绑定上下文而破坏该诊断。

68个私有 source cases 分为3个注册测试，保留182个实际 source stages：
36个共享场景覆盖 x/y、all/row/column、五 profile 与 SubFigure log 宿主；每场景
验证首次安装、成员直接覆盖、重复安装、删除 owner 四阶段。另10个完整 Axis draw
场景保持默认 formatter，安装明确 Fixed raw ticks 后检查完整标签与 SVG；20个
old/new nonsingular 调度场景检查自动 provisional view 的失效条件及 explicit
方向不被清除。新增 x/y 两个删除后变更场景各保留四阶段，真实原源确认删除只
解除 group membership，不拆开共享 Ticker：removed scale 改自己的 geometry，
新默认 locator/formatter 却仍被剩余 holder 别名观察；后续 Fixed100 与 detached
标签也共同可见。原完整 surviving Axis.draw 在[5,15]视图对 raw100 的结果为空，
SVG须过滤这个视图外标签。该现象修正了旧“删除后ticks也隔离”的测试前提；
现有生产可见性筛选正确，无需为此更改 renderer。独立标签回归显式关闭 minor。
本批安全 profile 无源异常；晚失败/partial installation 由独立
scale 参数与 Axis lifecycle 语料覆盖。所有实际 source inputs/results 均保存，
没有前缀 oracle 或人为 tick cap。

固定上游 SHA256：

| 源文件 | SHA256 |
| --- | --- |
| `axis.py` | `f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0` |
| `scale.py` | `4800482469b280454eb6e7a48f866ae7b146b27d1395644ffc09df0e91c9d7c1` |
| `cbook.py` | `e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643` |
| `gridspec.py` | `df8395306765d9b93f98d6b2e867836a9b2b0786cf5b39a26103309c4331afde` |
| `axes/_base.py` | `ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b` |
| `figure.py` | `b440ab0a5be03cb39b13529a2fec497d2d96deb083e3e56d6220593e3ec567da` |

Ticker、transforms、真实 API/deprecation/Scalar 宿主依赖的完整 hash 也在 JSON 中。
复现使用固定 CPython3.12.14/NumPy2.3.5：

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_shared_scale_defaults_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_shared_scale_defaults_reference.py --check
```

纯 Scale sampler、legacy immutable formatter/locator helper 仍是明确的便利 API；
本片没有把旧 sampler 换算法，也不把这些 helper 当成真实默认安装的替代品。
项目语法、类型、完整回归与验收状态由主任务检查点记录。
