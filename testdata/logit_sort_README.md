# LogitFormatter 固定排序协议参考

本片已通过项目门禁和四目标行为检查。Python 原源检查与 MoonBit 验收分别记录。

`LogitFormatter.set_locs` 对 `(space_pessimistic[i], space_sum[i])` 两个
NumPy Float64 标量组成的 tuple 调用 Python `sorted`。NaN 的相等与小于都为假，
这种比较不是普通的全序比较。稳定排序的不同比较顺序也可能改变结果，不能把
NaN 统一移到尾部，或用相邻插入排序替代原协议。

`ticker/formatter_logit_sort.mbt` 专门实现 CPython v3.12.14 的必要协议：
严格递减 run 的反转、稳定二分插入、minrun、左右 gallop、merge_lo/merge_hi、
动态 min_gallop、powersort 节点 power 和最终栈合并。所有长度都使用同一协议，
没有小长度边界或100000前缀。只返回原输入索引，不改变两个键数组。

内部输入约定是等长的两个 Double 数组，代表每个索引处不同的 NumPy Float64
标量对象。它不是任意 Python rich-comparison、动态异常或带副作用 comparator
的通用移植。相等字段继续比较下一字段；遇到不相等的 NaN 时，该字段 `<` 为假，
不为其补造全序。Int32 数组地址域以内，power 中间值使用 Int64；gallop 指数步
在越界比较之前夹到搜索上界，避免 Int32 溢出并保留原后续比较顺序。

原代码来源为 CPython v3.12.14 `Objects/listobject.c`，SHA256：
`5f33dd1d97bfcc33e60495011fad7d9d02587a966999f28c159971f31aa91531`。
协议移植需保留 CPython 对应许可证与归属，总依赖和许可清单由主任务合并。

独立生成器使用固定 CPython3.12.14/NumPy2.3.5 的真实 builtin `sorted` 产生期望，
不调用 Moon 代码，也不使用翻译后的排序模型作为 oracle。实际原 LogitFormatter
完整 ClassDef 的 frame trace 另外捕获了会改变 minor 标签的源反例键。

当前248个原排序案例分成8个注册测试，每32个私有 case 一组。语料含 minrun
边界、run 合并、长短相邻 run、连续胜出的 gallop 形态、两字段 NaN、Inf、重复和
signed zero，以及125001、200001、131073元素的合法完整数组。JSON保存每个完整
builtin结果；生成测试只对期望做无损等差 run 压缩，并展开后逐索引完整比较，
不是只验证头尾样本。每条断言包含 case id 与索引。

复现生成和只读检查：

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_logit_sort_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_logit_sort_reference.py --check
```

两条命令均已 exit0；生产文件的单文件 stdin 格式命令 exit0。项目语法、类型、四目标排序行为已通过主任务统一门禁。
初次 fixture 的尾单元素 RLE 编码已纠正；实际 builtin 排序结果保持原样，
所有248案例均检查压缩后再展开与完整原结果相等。
