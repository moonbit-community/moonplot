# MaxNLocator、AutoLocator 与物理 tick-space

D22 对齐固定 Matplotlib `v3.11.2`，commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`。参数、数值核、Auto 和实际轴接线已通过
切片验收：wasm/wasm-gc/native各7250项，JS7257项全部通过；九份原源参考检查通过。
验证记录与下一任务见 [执行检查点](../docs/MIGRATION_STATUS.md)。

| 固定来源 | SHA-256 |
| --- | --- |
| Matplotlib `lib/matplotlib/ticker.py` | `49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad` |
| Matplotlib `lib/matplotlib/transforms.py` | `109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8` |
| Matplotlib `lib/matplotlib/_api/__init__.py` | `7e262cedd8ce1a1660c2e2caa63adeb078c29e36bd541b8e6f773cfed4c3c782` |
| Matplotlib `lib/matplotlib/axis.py` | `f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0` |
| Matplotlib `lib/matplotlib/font_manager.py` | `d0e464bd1aff8e1815d375aa8bfc6dd32869979b348d8ec3b82edd61b8288788` |
| Matplotlib `lib/matplotlib/axes/_secondary_axes.py` | `b2aaaae077e03ff6538d1a4bf8a69c3476eed0e27120aa567de138c794599a93` |
| Matplotlib `lib/matplotlib/mpl-data/matplotlibrc` | `8b76e138ce9dc944a843dc6aa1ef9ee0e88638358b10baf227cd248d271b5f5a` |
| Matplotlib `lib/matplotlib/rcsetup.py` | `a052eac4af21ce8cdb58ee49c3ab952af4c2ff5e18f36cc8b741793fa79b5f59` |

参考固定 Python **3.12.14** / NumPy **2.3.5**。原源 class/helper 与 `_api` 校验执行固定
AST，不导入已安装 Matplotlib。NumPy arange 采用 D21 已记录的 Darwin arm64 binary fill
profile，二进制 SHA `44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305`；
生产为纯 MoonBit 实现，不把该 profile 泛称所有平台 NumPy 的位形。

## 对象、参数与更新

`MaxNLocator::new(nbins?, steps?, integer=false, symmetric=false, prune?, min_n_ticks=2)`
默认 `nbins=MaxNBins::Count(10)`，表示最多十个间隔；`MaxNBins::Auto` 使用轴空间预算。
Count 与 min_n_ticks 为 Int32，flags 为 Bool，prune 为 String/None，steps 为一维Float64或
Int64 TickValues。Python动态int/string/bool转换、任意其他dtype/多维和反射协议不在本typed域内。
零/负 Count 可以构造，错误按源延迟；min_n_ticks 夹到至少1，可大于10。

默认 steps 为 `[1,1.5,2,2.5,3,4,5,6,8,10]`。校验比较差分、首值和尾值，缺1/10时补齐；
NaN按原比较语义处理，不能加有限值guard改变源状态。输入若无需补端点，`steps()` 保留
原始 owner/正负/嵌套/零stride借用；补端点则创建新buffer并保留输入Int64/Float64类型。
`extended_steps` 始终由当时steps生成独立Float64 staircase快照，修改借用steps不自动重建。
getter返回该快照的独立数组副本。

`TickValues::from_array(Array[Double])` 借用Float64，`from_int64_array(Array[Int64])`
借用真实Int64 buffer。Int64的Double赋值按源向零截断，负零写成整数0，NaN/Inf或超出
`[-2^63,2^63)`的Double写入抛checked DataError且不修改旧值。view与copy保留储存类型，
copy仍复制独立buffer；`get` / `to_array` / adapter输出保持Double接口，大整数读取会按
binary64转换精度表示。MaxN的Int64差分与staircase尾部`10*steps[1]`保留原NumPy整型
环绕语义，补1/10时复制原始整数值，不经Double往返；其他dtype与动态dtype系统仍是额外边界。

`set_params` 的步骤固定为 nbins→symmetric→prune→min_n_ticks→steps→integer，失败可以
留下早先的更新。`steps? : TickValues?` 与 `prune? : String?` 区分省略/显式None：

- 省略保持旧值；`steps=None` 恢复 MaxN 默认steps，`steps=Some(view)` 使用该view。
- `prune=None` 清除；`prune=Some("lower"|"upper"|"both")` 设定删除规则。
- 非法prune/steps不会撤销本次调用中已写入的nbins/symmetric等字段。

对象 `copy()` 浅共享steps、captured staircase和当前providers，参数替换独立；generic
adapter的 `copy()` 则保留同一个live对象。主/次adapter、shared/secondary及getters复用
`NamedMaxN` / `NamedAuto`；直接tick和bound call按源生成升序，generic checked_tick_values
遵循项目输入方向约定，minor继续裁范围并去主刻度。邻接点保留供范围和formatter布局使用，
SVG再按既有view容差过滤绘制。

## 网格、浮点顺序与输出上限

选择过程使用完整的原候选数和in-view nticks，按源逐级放宽step/integer以达到min_n_ticks。
`scale_range` 的均值、差值、大offset与十次幂保持原操作顺序；Edge的容差随
`abs(offset)/step` 增大并封顶0.4999，不能只用D19/D20的零offset容差。
对称模式保留Python max的NaN参数顺序差异。

共享nonsingular保留三种策略：tick用expander `1e-13`/tiny `1e-14`，view_limits用
`1e-12`/`1e-13`，继承nonsingular用`.05`/`1e-15`。这些不同入口不能合并成同一常量。
NumPy arange fill复用纯Moon精确单舍入kernel；后续 `*step`、`+best_vmin`、`+offset`
按原数组表达式分别舍入，不能融合成一次FMA。

prune先删除完整raw序列首/尾，之后才取最多 **100000** 个前缀；upper/both不误删截短
前缀末项，lower可取足够的额外raw点。`round_numbers` 的 view_limits 返回未prune的
完整raw首/末坐标，不把前缀末端当视图上界。`data` 模式只做本类normalize，因此
nbins=0时view可能成功，而tick仍报源错误。

不可安全枚举的原源预算事件独立记录，不能当成上游异常或用预算替身生成预期。
typed计数/Double范围、100000前缀与完整Python无上限物化是不同边界。

## AutoLocator 与 providers

`AutoLocator::new()` 只构造一个私有MaxN状态，`as_maxn_locator()` 返回live句柄：
classic_mode=false捕获Auto bins与 `[1,2,2.5,5,10]`；true捕获Count9与 `[1,2,5,10]`。
两组原默认分别是Float64和Int64；classic steps写入1.25会变成整数1，modern保留1.25。
浅copy仍共享原buffer，不能只修copy的返回值或把经典默认统一转成Float64。
后续仍能使用完整继承参数；`steps=None` 恢复MaxN默认steps，不重建Auto构造steps。
classic只在构造读取，`axes_autolimit_mode`则每次tick/view读取当前值。
`config.classic_mode` 默认false，setter/rc快照getter/reset共享现有config链路。

Auto bins未绑轴回退9；绑定后读tick-space并按NumPy clip限制在
`[max(1,min_n_ticks-1),9]`，保留NaN与下界大于上界的源行为。classic Count9查询不读取
tick-space provider。`bind_tick_space(()->Double)` 与raising
`bind_view_interval(()->(Double,Double) raise DataError)`独立绑定；copy保留旧callback，
后续rebind只替换本对象。`call()` 读取view并委托tick，未绑view时报checked错误。
Scene checked panel_view/range/aspect错误沿callback传播，不通过try!变成panic。
contour levels也调用checked_tick_values，使named Count0等原错误保持为DataError；旧legacy
locator的安全返回协议保持原行为。

## 真实物理空间与字号

上游XAxis/YAxis.get_tick_space将plot矩形从display pixels换算为inches，再乘72：
x使用 `floor(width_in_points/(3*labelsize_points))`，y使用
`floor(height_in_points/(2*labelsize_points))`。这是源启发式，不是测量标签字符串，也不读取
项目旧tick_count。D22使用固定 **SVG dpi72/user-unit profile**，实际plot宽高与实际
渲染tick字号采用相同单位，默认字号10。物理换算保留原`length/72*72`的binary64顺序，
不将比例静态约分后改变临界floor结果。

`Axis` 与 `SecondaryAxis` 的 `set_tick_label_size(Double)` 按FontProperties数值规则将
小于1的值夹到1；NaN和+Inf保留，-Inf夹1。get_tick_space中NaN size不满足`size>0`，
返回2147483647；+Inf与有限plot长度得到0。实际SVG主/次label使用同一配置字号。
完整FontProperties字符串/rc继承、独立复杂字体状态和可变dpi仍待字体/后端切片，不能
把当前固定profile称作所有宿主的physical实现。
非有限字号参考仅核对tick-space估算及定位数值，不宣称完整glyph渲染行为。

渲染先注入初始plot尺寸供autoscale，再在所有panel位置/aspect解算后设置active尺寸，
最后查询ticks，避免shared locator owner取决于绘制顺序；结束恢复临时layout标志。
tickspace callback只读geometry，不递归查询view。shared最后绑定owner、copy-provider与
删除后重绑沿D21真实Grouper登记顺序。

secondary x的位置为父transAxes下 `[0,pos,1,1e-10]`，因此使用父plot宽；secondary y使用
`[pos,0,1e-10,1]` 的父plot高。主方向不取tiny厚度，字号使用secondary自己的配置；其view
由父view经forward映射并按原方向调整。完整非仿射/custom transform宿主仍是后续范围。

## 参考与重现

- 参数：51 constructor、40 steps验证、12 updates、10 alias×4阶段、3 provider，共146观察组；
  103 generated tests，另4个hand。
- Auto：308 grids×5查询=1540查询观察，16更新阶段、8 copy/provider阶段；312 generated
  tests，另4个hand和1个checked doc。包含classic捕获、clip、provider读次数、部分失败、
  shallow-step写回、copy/rebind及dynamic rc的逐bit结果。
- 数值：314 cases、1574观察组，315 generated tests与4个hand；16条cap查询完整枚举
  原源124999–166668项后保存头8/cap末4/full末4，另3次Int32.max请求独立标预算省略，
  85个实际源查询错误按真实异常记录。Index共享fill提取后原参考仍可复查。
- 物理轴：79个font/length profiles（含11个ULP临界案例）、10个layout fixtures、2条owner
  trace各3阶段；86项scene测试和3项backend测试，共89项。
- 整型：17个scalar写入、7个真实view/copy alias、10个MaxN dtype/环绕/端点案例、2个Fixed
  精确phase案例，共36项参考。经典默认写1.25截1的原失败断言保留；Fixed最小Int64与
  大于2^53的精确phase由写回owner的位置验证，不用浮点打印值替代。
- 另有2项root集成回归，核对contour的checked locator错误和detached轴的自动view/copy。

```sh
python3 scripts/generate_maxn_params_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_maxn_grid_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_auto_numeric_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_numeric_axis_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_integer_tick_values_reference.py /path/to/pinned/ticker.py --check
moon info && moon fmt
moon check --target all
moon test --target all
```

旧 `maxn_locator(count=7)` 的可见tick请求、内部裁范围与nice-step扩展保持原协议；其余
legacy helpers也不改名冒充新类。3D的axis raw-step修正、动态Python轴/字体对象、完整rc
和其他后端不在当前二维SVG typed slice验收内。无新增运行时Python、NumPy、外部库或C。
未显式安装locator的默认数值Axis仍沿旧scale/tick_count原型；切换隐式默认Auto需与日期
units、scale及clear的默认定位器生命周期一起迁移。完整dataLim缓存/relim边界仍见D21指南。
