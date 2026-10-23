# LogitFormatter 的实际 Axis 参考

本片已通过编译、接口审查和四目标行为验收。独立排序协议与完整参考见
[固定排序参考](logit_sort_README.md)；对象/identity 和数值细节分别由本片参数、
数值参考说明。此文件只说明实际 Axis 生命周期。

`generate_logit_formatter_axis_reference.py` 使用共享 `load_logit_formatter`
加载固定完整原类、真实 API/deprecation 与 `_is_decade`/`_is_close_to_int`。
实际执行 Axis 安装、`_update_ticks`、完整 `Axis.draw`、secondary `_set_scale`/
`_set_lims`、Grouper 和 Figure 删除体。单位转换、Text/Tick 存储、布局和 renderer
保留已声明的受控 sink；未使用的隐式 Scalar/Log 默认格式器沿用原有最小 fixture。
这不宣称完整默认格式器安装、字体、数学文本排版或 GUI 已迁移。

固定 ticker.py SHA256：
`49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`；
LogitFormatter ClassDef SHA256：
`38685127398f0dd97b97cb053f9fe172c2adff6be9b0d394df16eab869b58194`。
JSON 同时记录 axis/transforms/figure/axes 和共享 loader 依赖的源哈希。

参考共147个原源观察，128成功、10个原 OverflowError、9个原 ValueError；
对应147个私有测试函数，每32个一组，共5个注册测试。这两个数量不能混用。
全部147条观察与只读调查保存的原记录逐项深度相等，没有为实现修改源期望。

覆盖的关键阶段如下：

- direct、prepare、data、short 和 offset 都不读取 axis provider。None、真实
  dummy 和会抛错的 view/transform/pixel binding 均有验证。无需为此类增加新的
  Axis provider 或几何接口。
- `set_locs` 先复制为保 dtype/逻辑顺序的 ndarray，再清除原 mutable 标签 set。
  后段异常可留下新 locs 和已清 cache。浅 copy 共享已捕获 locs 与标签 set；再次
  prepare 只重绑接收者 locs，继续 clear/update 共享 set。原 owner 后续写入不影响
  快照，正/负/嵌套/零 stride 和空 Int64 均有测试。
- 主 ticks 全批次准备/格式化后才查询 minor；minor 先经过源 transform overlap，
  再全批次格式化，最后才筛选显示。视图外邻点影响可见 `.2` 的 `0.200000`
  精度；minor 的原始顺序和全量数量影响自适应选择。不能预先排序、去重或 clip。
- 重复 `.2` 位置保留原零距离造成的 OverflowError，offscreen major NaN 的错误
  在 minor callback 前传播。半值 `.5` 的特殊分支允许完整重复。
- empty Fixed 执行空准备并清状态；Null 跳过该 tick 组并保留旧状态。完整 draw
  对两者仍读取当前 major 的 offset。minor callback 更换 major 后，已完成的
  major 字符串保留，最终 offset 读取新句柄。
- Python/NumPy scalar Sequence 的同一 NaN key 与 NdArray 每次读取的新 scalar
  身份不同。相同数值位形可分别导致 ValueError 或空标签；显式 LogitKey 和
  typed batch 运输保留该区别，不把 NaN canonical 成普通数值集合。
- x/y、linear/logit、共享最后设置者、删除后重绑与 detached copy、secondary
  parent linear/log/logit 都使用原方法观察。secondary 完整 own ticks 先格式化，
  再做 inverse 可见性；该 formatter 不向父轴借范围或 transform。

70个完整 Axis.draw 情形之外，还有两个真实执行的200001值完整 batch：major
重复半值与 minor 全量阈值抑制。测试对全部200001条标签断言，并检查完整 locs
长度；没有100000前缀替代、去重、或将测试预算当成原源错误。

复现：

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_logit_formatter_axis_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_logit_formatter_axis_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

生成和只读 `--check` 均 exit0。字符串使用逐字 JSON 引号编码，数值 helper
不处理格式字符串，`\\frac` 不会被误转成 formfeed。源数学采用固定原 NumPy/math
profile；跨平台数值与完整 Python 动态对象范围由本片独立数值/参数参考说明。
最终语法、类型、接口与四目标回归已通过主任务统一门禁。
