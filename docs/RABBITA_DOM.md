# Rabbita 可交互 DOM 输出设计

状态：**用户已确定的独立大目标，尚未实现，当前没有 DOM 输出 API。**
本页是基于固定源码的接入设计；接口可行性推断尚未经过实际 JS 浏览器验证。
M1 基础 SVG 可用版完成后，先推进一个小而完整的交互场景。

## 希望得到的使用方式

MoonPlot 接受既有图表数据和状态，返回可直接放入 Rabbita 页面中的 `Html` 节点树。
图内折线、点和文字是正常的 SVG DOM 节点，应用能通过消息更新数据和交互状态。
首个切片支持折线/散点、基本轴与图例，以及：

- 悬停数据点显示 tooltip/高亮，离开时清除。
- 点击数据点将稳定的系列/点标识传给应用；图例按钮切换系列可见性。
- 应用数据更新后节点与显示同步，多个图表分别工作。

缩放、平移、框选、更广图表覆盖和键盘导航可以随后增加；不把这些都塞进首个切片。
最终输出会是实际 DOM 组合，静态 SVG 字符串显示并不算完成这一目标。

## 已核对的 Rabbita 接口

用户提到的 Rabbit-TEA 在官方项目中已更名为 [Rabbita](https://github.com/moonbit-community/rabbita)。
本次固定查阅 commit `c6bbd1b3b649d5f6ea6b21e6c42f8003ec41c367`，其 [moon.mod](https://github.com/moonbit-community/rabbita/blob/c6bbd1b3b649d5f6ea6b21e6c42f8003ec41c367/rabbita/moon.mod) 标为 `0.16.7`；
这只记录查阅版本，不把它称为当前最新稳定版，也尚未向本项目添加依赖。

| 公开能力 | 核对结果及接入用途 |
| --- | --- |
| `svg.svg(..., Array[Svg]) -> Html`、`svg.node(...)` | 可以构造有 SVG namespace 的真实节点树，参见 [SVG 接口](https://github.com/moonbit-community/rabbita/blob/c6bbd1b3b649d5f6ea6b21e6c42f8003ec41c367/rabbita/svg/pkg.generated.mbti)和[构造源码](https://github.com/moonbit-community/rabbita/blob/c6bbd1b3b649d5f6ea6b21e6c42f8003ec41c367/rabbita/svg/svg.mbt) |
| `svg.Attrs` 的字符串坐标/路径属性 | 保留浮点几何，无需为了便捷构造器的 Int 参数而取整 |
| `html.Attrs.on_mousemove/on_mouseleave/on_click` | 回调接受 MouseEvent 并返回 Cmd；[事件桥](https://github.com/moonbit-community/rabbita/blob/c6bbd1b3b649d5f6ea6b21e6c42f8003ec41c367/rabbita/html/attrs_event.mbt)会调度该命令 |
| `html.div(..., attrs?, children)` | 事件容器可组合真实 SVG 子树；[HTML 接口](https://github.com/moonbit-community/rabbita/blob/c6bbd1b3b649d5f6ea6b21e6c42f8003ec41c367/rabbita/html/pkg.generated.mbti) |
| `create_pure_state` / `Val.view` | 供示例应用维护 model、处理消息和重建视图；[主包接口](https://github.com/moonbit-community/rabbita/blob/c6bbd1b3b649d5f6ea6b21e6c42f8003ec41c367/rabbita/pkg.generated.mbti) |
| `MouseEvent.get_client_x/y`、`Element.get_bounding_client_rect` | 可用于根 SVG 视口坐标换算；[DOM 接口](https://github.com/moonbit-community/rabbita/blob/c6bbd1b3b649d5f6ea6b21e6c42f8003ec41c367/rabbita/dom/pkg.generated.mbti) |

这个版本的 `svg.Attrs` **没有公开 `on_*`**，不能直接假设 SVG 便捷函数带事件参数。
首版选择 `Html div + Svg`，通过公开 HTML 事件桥接收 mousemove/click 冒泡，
在容器自身监听 mouseleave，并配合共享几何命中测试。
图例切换可先用正常的 HTML button。此方案是源码推断，事件冒泡与状态更新必须实际验收。

## 与现有画图库的边界

保持现有 `Scene → render IR → SVG` 路径。新增第二后端时，将折线/散点实际使用的坐标映射、
面板矩形和图元几何提取为共享准备结果，静态后端与 DOM 后端消费同一结果。
现在的 IR 已共享数据与图例位置，但最终几何仍有私有 SVG 逻辑，不能声称后端已准备好即插即用。

Rabbita 依赖放在单独的 JS 接入包。优先尝试仓库内可选 adapter；若依赖解析或目标传播无法隔离，
使用独立 MoonBit module。核心数据、Scene 和静态 SVG API 不暴露 Rabbita 类型。
具体公共函数名/参数在最小示例编译通过后再确定，不提前承诺 `Figure::to_dom` 已存在。

接入包负责节点创建和事件到图表消息的转换；应用负责 model/update。
交互事件只携带普通坐标、系列/点标识与选择状态，避免把 DOM Event 长期保存在模型中。
复用已有 `Line2D` 数据与可见性能力时，需要明确外部句柄变化如何触发视图重建。

## 需要先处理的技术约束

- **依赖版本**：Rabbita 查阅版依赖 `moonbitlang/x@0.5.1`，本库当前依赖 `0.4.46`。
  在最小接入试验中确认版本解析与可用性；不能仅为了写路线图升级核心依赖。
- **坐标**：用 client 坐标与实际 SVG 根边界，换算 viewBox、面板和数据坐标。
  `offsetX/Y` 会受实际命中的子节点影响；容器的 padding/border 也不能忽略。
  首版明确固定或匹配比例的视口，测试滚动和缩放尺寸；任意 CSS transform/letterbox 留待明确支持。
- **精度**：通过 SVG 字符串属性保留浮点位置和线宽；不能无声取整。
- **生命周期**：稳定节点身份、多图隔离、移除/重新挂载后的事件数量、hover 清理和数据更新都需要测试。
- **平台**：事件能力在 JS 浏览器中验收。native/Wasm 的 SSR 或编译通过不能证明交互可用。
- **依赖边界**：不直接依赖 Rabbita `internal/vdom`；不以 innerHTML 解析替代节点构造。

## 分步验收

1. **接入试验**：隔离依赖并 mount 最小真实 SVG，检查 namespace、浮点属性及根包使用方式。
2. **首个交互图**：同一组折线/散点数据同时出静态 SVG 与 DOM，几何一致；hover、click、图例切换可见有效。
3. **更新与隔离**：数据更新、多个图表、滚动/尺寸变更、移除再挂载不串状态、不重复发事件。
4. **交付示例**：可运行 Rabbita 应用与明确接入文档；真实浏览器派发 MouseEvent/PointerEvent 并检查 model 与 DOM。

仅完成源码构造器或静态截图不能勾选以上交互验收。第一条未完成动作是最小接入试验，
当前保持独立目标状态；M1 的验收与提交不因此延期。
