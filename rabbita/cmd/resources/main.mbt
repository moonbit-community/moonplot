///|
// Browser-only regression fixture: each Drawing intentionally reuses every SVG
// source identifier. Production applications still give each view a unique id.
struct Model {
  version : Int32
  reversed : Bool
  mounted : Bool
  red_clicks : Int32
  blue_clicks : Int32
  red_hover : @drawing.HitPoint?
  blue_hover : @drawing.HitPoint?
} derive(Eq)

///|
enum Msg {
  Red(@plot_dom.Interaction)
  Blue(@plot_dom.Interaction)
  Redraw
  Reverse
  ToggleMount
}

///|
fn update(model : Model, message : Msg) -> Model {
  match message {
    Red(Hover(point)) => { ..model, red_hover: point, }
    Blue(Hover(point)) => { ..model, blue_hover: point, }
    Red(Click(Some(_))) => { ..model, red_clicks: model.red_clicks + 1, }
    Blue(Click(Some(_))) => { ..model, blue_clicks: model.blue_clicks + 1, }
    Red(_) | Blue(_) => model
    Redraw =>
      {
        ..model,
        version: model.version + 1,
        red_hover: None,
        blue_hover: None,
      }
    Reverse => { ..model, reversed: !model.reversed, }
    ToggleMount =>
      { ..model, mounted: !model.mounted, red_hover: None, blue_hover: None, }
  }
}

///|
fn resource_drawing(red : Bool, version : Int32) -> @drawing.Drawing {
  let first = if red { "#b91c1c" } else { "#1d4ed8" }
  let last = if red { "#f87171" } else { "#60a5fa" }
  let inset = if version % 2 == 0 { 0 } else { 20 }
  let clip_x = if red { 20 } else { 160 + inset }
  let clip_width = 140 - inset
  let x = if red { 80.0 } else { 240.0 }
  let source =
    $|<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="root-source" width="320" height="200" viewBox="0 0 320 200" style="--source-root:url(#root-source)">
    $|  <title id="caption">Scoped SVG resources</title>
    $|  <desc id="details">A gradient chain and a distinct clipping region.</desc>
    $|  <defs>
    $|    <linearGradient id="base" x1="0" y1="0" x2="1" y2="0">
    $|      <stop offset="0" stop-color="\{first}"/>
    $|      <stop offset="1" stop-color="\{last}"/>
    $|    </linearGradient>
    $|    <linearGradient id="legacy" xlink:href="#base"/>
    $|    <linearGradient id="paint" href="#legacy"/>
    $|    <clipPath id="cut"><rect x="\{clip_x}" y="40" width="\{clip_width}" height="120"/></clipPath>
    $|  </defs>
    $|  <rect x="0" y="0" width="320" height="200" fill="#ffffff"/>
    $|  <rect id="tile" x="20" y="40" width="280" height="120" fill="url(#paint)" clip-path="url(#cut)"/>
    $|  <rect id="strip" x="20" y="172" width="280" height="8" style="fill:url( '#paint' );stroke: url(&quot;#base&quot;);stroke-width:1"/>
    $|  <circle cx="\{x}" cy="100" r="3" fill="#ffffff" stroke="#111827"/>
    $|</svg>
  @drawing.drawing(320, 200, source, [
    @drawing.hit_point(0, 0, 0, x, 100.0, x, 100.0),
  ])
}

///|
fn chart(
  model : Model,
  red : Bool,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let id = if red { "resource-red" } else { "resource-blue" }
  @html.div(class="resource-card", [
    @html.h2(if red { "Red · left clip" } else { "Blue · right clip" }),
    @plot_dom.view(
      resource_drawing(red, model.version),
      id~,
      on_event=event => emit(if red { Red(event) } else { Blue(event) }),
      hovered?=if red { model.red_hover } else { model.blue_hover },
    ),
    @html.p(
      id=id + "-clicks",
      "Clicks: \{if red { model.red_clicks } else { model.blue_clicks }}",
    ),
  ])
}

///|
fn content(model : Model, emit : @rabbita.Emit[Msg]) -> @html.Html raise {
  let charts = if model.mounted {
    if model.reversed {
      [chart(model, false, emit), chart(model, true, emit)]
    } else {
      [chart(model, true, emit), chart(model, false, emit)]
    }
  } else {
    [@html.p(id="resources-unmounted", "Resources unmounted")]
  }
  @html.div([
    @html.div(class="controls", [
      @html.button(id="redraw", on_click=emit(Redraw), "Redraw"),
      @html.button(id="reverse", on_click=emit(Reverse), "Reverse order"),
      @html.button(id="mount", on_click=emit(ToggleMount), "Mount / unmount"),
      @html.span(id="revision", "Revision \{model.version}"),
    ]),
    @html.div(id="resource-charts", charts),
  ])
}

///|
fn main {
  @rabbita.new(() => {
    let initial : Model = {
      version: 0,
      reversed: false,
      mounted: true,
      red_clicks: 0,
      blue_clicks: 0,
      red_hover: None,
      blue_hover: None,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error =>
          @html.div(id="resource-error", "Resource fixture error: \{error}")
      }
    })
  }).mount("app")
}
