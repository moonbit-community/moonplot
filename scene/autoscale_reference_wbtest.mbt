// Generated from complete original Matplotlib autoscale methods; do not edit.

///|
fn autoscale_ref_number(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn autoscale_ref_limits(
  actual : @core.Limits,
  lower : Double,
  upper : Double,
) -> Unit raise {
  autoscale_ref_number(actual.lower(), lower)
  autoscale_ref_number(actual.upper(), upper)
}

///|
fn autoscale_ref_group(panel : Axes, panels : Array[Axes]) -> Array[Int32] {
  panel
  .x_group_states()
  .map(state => {
    let mut found = -1
    for index, item in panels {
      if physical_equal(state, item.state) {
        found = index
      }
    }
    found
  })
}

///|
fn autoscale_source_case_0() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621537642612260864UL.reinterpret_as_double(),
    4626463454704697344UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_1() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.log_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621627356168520350UL.reinterpret_as_double(),
    4626521241088681114UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x", "0.x", "0.x", "0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_2() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    13845191154443747328UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    13848403225097084826UL.reinterpret_as_double(),
    4629534787869679514UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    13845191154443747328UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_3() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.asinh_scale(linear_width=1.0))
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    13845191154443747328UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    13847436096494674793UL.reinterpret_as_double(),
    4628560490230262377UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    13845191154443747328UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_4() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.logit_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4591870180066957722UL.reinterpret_as_double(),
    4605380978949069210UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4590788600441128095UL.reinterpret_as_double(),
    4605625406466530368UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4591870180066957722UL.reinterpret_as_double(),
    4605380978949069210UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x", "0.x", "0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_5() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_6() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(tight=false, scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_7() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(tight=true, scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_8() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621537642612260864UL.reinterpret_as_double(),
    4626463454704697344UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_9() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(tight=false, scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621537642612260864UL.reinterpret_as_double(),
    4626463454704697344UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_10() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(tight=true, scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621537642612260864UL.reinterpret_as_double(),
    4626463454704697344UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_11() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(tight=true, scalex=false, scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_12() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale(enable=None, axis="x", tight=true)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), true)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(panels[0].x_margin(), 0)
  autoscale_ref_number(panels[0].y_margin(), 0)
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_13() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale(enable=None, axis="both", tight=true)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), true)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(panels[0].x_margin(), 0)
  autoscale_ref_number(panels[0].y_margin(), 0)
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_14() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale(enable=Some(false), axis="x", tight=true)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_15() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale(enable=Some(false), axis="both", tight=true)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_16() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale(enable=Some(true), axis="x", tight=true)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(panels[0].x_margin(), 0)
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_17() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale(enable=Some(true), axis="both", tight=true)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), true)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(panels[0].x_margin(), 0)
  autoscale_ref_number(panels[0].y_margin(), 0)
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_18() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_19() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    13811459193234742314UL.reinterpret_as_double(),
    4588087156379966506UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_20() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    13811459193234742314UL.reinterpret_as_double(),
    4588087156379966506UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_21() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = fig.subplots(1, 2, share_x=true, share_y=true)
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[1].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[1].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[1].state.val.x_axis.set_tick_label_size(10.0)
  panels[1].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[1].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[1].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[1].state.val.y_axis.set_tick_label_size(10.0)
  panels[1].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  panels[1].state.val.raw_x_data = @core.limits(
    4626322717216342016UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  panels[1].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[1].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[1].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[1].state.val.tight = Some(false)
  panels[1].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[1].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[1].state.val.use_sticky_edges = true
  panels[1].state.val.x_axis.set_autoscale_on(true)
  panels[1].state.val.x_axis.clear_autoscale_request()
  panels[1].state.val.y_axis.set_autoscale_on(false)
  panels[1].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[1].state.val.x_axis.bind_minpos(() => {
    own_reads.push("1.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[1].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("1.x")
    let view = panels[1].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[1].state.val.y_axis.bind_minpos(() => {
    own_reads.push("1.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[1].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("1.y")
    let view = panels[1].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].request_autoscale_view(axis="x", tight=true)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [1, 0])
  autoscale_ref_limits(
    panels[1].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[1].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[1].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[1].data_limits(horizontal=true),
    4626322717216342016UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[1].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[1].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[1].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[1].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[1].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[1].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[1].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[1].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[1], panels), [1, 0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_22() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = fig.subplots(1, 2, share_x=true, share_y=true)
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[1].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[1].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[1].state.val.x_axis.set_tick_label_size(10.0)
  panels[1].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[1].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[1].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[1].state.val.y_axis.set_tick_label_size(10.0)
  panels[1].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(true)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.x_axis.request_autoscale()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  panels[1].state.val.raw_x_data = @core.limits(
    4626322717216342016UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  panels[1].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[1].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[1].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[1].state.val.tight = Some(false)
  panels[1].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[1].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[1].state.val.use_sticky_edges = true
  panels[1].state.val.x_axis.set_autoscale_on(true)
  panels[1].state.val.x_axis.clear_autoscale_request()
  panels[1].state.val.y_axis.set_autoscale_on(false)
  panels[1].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[1].state.val.x_axis.bind_minpos(() => {
    own_reads.push("1.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[1].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("1.x")
    let view = panels[1].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[1].state.val.y_axis.bind_minpos(() => {
    own_reads.push("1.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[1].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("1.y")
    let view = panels[1].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[1].unstale_view()
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621256167635550208UL.reinterpret_as_double(),
    4629418941960159232UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [1, 0])
  autoscale_ref_limits(
    panels[1].state.val.x_axis.stored_view_limits(),
    4621256167635550208UL.reinterpret_as_double(),
    4629418941960159232UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[1].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[1].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[1].data_limits(horizontal=true),
    4626322717216342016UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[1].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[1].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[1].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[1].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[1].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[1].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[1].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[1].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[1], panels), [1, 0])
  assert_eq(own_reads, ["1.x", "0.x"])
  assert_eq(view_reads, ["1.x", "1.x"])
}

///|
fn autoscale_source_case_23() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = fig.subplots(1, 2, share_x=true, share_y=true)
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[1].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[1].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[1].state.val.x_axis.set_tick_label_size(10.0)
  panels[1].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[1].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[1].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[1].state.val.y_axis.set_tick_label_size(10.0)
  panels[1].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(true)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.x_axis.request_autoscale()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  panels[1].state.val.raw_x_data = @core.limits(
    4626322717216342016UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  panels[1].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[1].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[1].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[1].state.val.tight = Some(false)
  panels[1].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[1].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[1].state.val.use_sticky_edges = true
  panels[1].state.val.x_axis.set_autoscale_on(true)
  panels[1].state.val.x_axis.clear_autoscale_request()
  panels[1].state.val.y_axis.set_autoscale_on(false)
  panels[1].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[1].state.val.x_axis.bind_minpos(fn() -> Double raise @core.DataError {
    own_reads.push("1.x")
    raise @core.DataError::InvalidTicks(message="late minpos provider failure")
  })
  panels[1].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("1.x")
    let view = panels[1].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[1].state.val.y_axis.bind_minpos(() => {
    own_reads.push("1.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[1].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("1.y")
    let view = panels[1].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  let raised = try {
    panels[0].unstale_view()
    false
  } catch {
    @core.DataError::InvalidTicks(message~) =>
      message == "late minpos provider failure"
    _ => false
  }
  assert_true(raised)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621256167635550208UL.reinterpret_as_double(),
    4629418941960159232UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [1, 0])
  autoscale_ref_limits(
    panels[1].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[1].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[1].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[1].data_limits(horizontal=true),
    4626322717216342016UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[1].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[1].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[1].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[1].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[1].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[1].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[1].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[1].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[1], panels), [1, 0])
  assert_eq(own_reads, ["0.x", "1.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_24() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].set_xscale(@scale.log_scale())
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_25() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].set_xscale(@scale.log_scale())
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621627356168520350UL.reinterpret_as_double(),
    4626521241088681114UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x", "0.x", "0.x", "0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_26() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].set_xscale(@scale.symlog_scale(linthresh=2.0))
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_27() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4641240890982006784UL.reinterpret_as_double(),
    4636737291354636288UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4626463454704697344UL.reinterpret_as_double(),
    4621537642612260864UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_28() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.artists.push(
    Artist::ColorImage(
      [[@colors.rgba(0.0, 0.0, 0.0)]],
      ImageOrigin::Upper,
      Some(
        (
          0UL.reinterpret_as_double(),
          4621819117588971520UL.reinterpret_as_double(),
          0UL.reinterpret_as_double(),
          4607182418800017408UL.reinterpret_as_double(),
        ),
      ),
      1.0,
      ImageInterpolation::Nearest,
    ),
  )
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4591870180066957722UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4591870180066957722UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_29() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.artists.push(
    Artist::ColorImage(
      [[@colors.rgba(0.0, 0.0, 0.0)]],
      ImageOrigin::Upper,
      Some(
        (
          0UL.reinterpret_as_double(),
          4621819117588971520UL.reinterpret_as_double(),
          0UL.reinterpret_as_double(),
          4607182418800017408UL.reinterpret_as_double(),
        ),
      ),
      1.0,
      ImageInterpolation::Nearest,
    ),
  )
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 13815242216921733530UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4607182418800017408UL.reinterpret_as_double(),
    4621256167635550208UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    13815242216921733530UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_30() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.artists.push(
    Artist::ColorImage(
      [[@colors.rgba(0.0, 0.0, 0.0)]],
      ImageOrigin::Upper,
      Some(
        (
          4427486594234968593UL.reinterpret_as_double(),
          4431990193862339089UL.reinterpret_as_double(),
          0UL.reinterpret_as_double(),
          4607182418800017408UL.reinterpret_as_double(),
        ),
      ),
      1.0,
      ImageInterpolation::Nearest,
    ),
  )
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4427486594234968593UL.reinterpret_as_double(),
    4431990193862339089UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4427486594234968593UL.reinterpret_as_double(),
    4431990193862339089UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4427486594234968593UL.reinterpret_as_double(),
    4431990193862339089UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_31() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.x_axis.bind_autoscale_minpos(fn() -> Array[Double] raise @core.DataError {
    raise @core.DataError::InvalidTicks(message="shared data minpos failure")
  })
  let raised = try {
    panels[0].autoscale_view(tight=true, scaley=false)
    false
  } catch {
    @core.DataError::InvalidTicks(message~) =>
      message == "shared data minpos failure"
    _ => false
  }
  assert_true(raised)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, [])
}

///|
fn autoscale_source_case_32() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(fn() -> Double raise @core.DataError {
    own_reads.push("0.x")
    raise @core.DataError::InvalidTicks(message="late minpos provider failure")
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  let raised = try {
    panels[0].autoscale_view(tight=true, scaley=false)
    false
  } catch {
    @core.DataError::InvalidTicks(message~) =>
      message == "late minpos provider failure"
    _ => false
  }
  assert_true(raised)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_33() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  let view_counter_0_x = [0]
  panels[0].state.val.x_axis.bind_view_interval(fn() -> (Double, Double) raise @core.DataError {
    view_reads.push("0.x")
    view_counter_0_x[0] += 1
    if view_counter_0_x[0] == 1 {
      raise @core.DataError::InvalidTicks(message="view query 1 failed")
    }
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  let raised = try {
    panels[0].autoscale_view(tight=true, scaley=false)
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => message == "view query 1 failed"
    _ => false
  }
  assert_true(raised)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, ["0.x"])
}

///|
fn autoscale_source_case_34() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  let view_counter_0_x = [0]
  panels[0].state.val.x_axis.bind_view_interval(fn() -> (Double, Double) raise @core.DataError {
    view_reads.push("0.x")
    view_counter_0_x[0] += 1
    if view_counter_0_x[0] == 2 {
      raise @core.DataError::InvalidTicks(message="view query 2 failed")
    }
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  let raised = try {
    panels[0].autoscale_view(tight=true, scaley=false)
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => message == "view query 2 failed"
    _ => false
  }
  assert_true(raised)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_35() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = fig.subplots(1, 2, share_x=true, share_y=true)
  panels[0].state.val.artists.push(
    Artist::ColorImage(
      [[@colors.rgba(0.0, 0.0, 0.0)]],
      ImageOrigin::Upper,
      Some(
        (
          4641240890982006784UL.reinterpret_as_double(),
          4641240890982006784UL.reinterpret_as_double(),
          0UL.reinterpret_as_double(),
          4607182418800017408UL.reinterpret_as_double(),
        ),
      ),
      1.0,
      ImageInterpolation::Nearest,
    ),
  )
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[1].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[1].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[1].state.val.x_axis.set_tick_label_size(10.0)
  panels[1].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[1].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[1].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[1].state.val.y_axis.set_tick_label_size(10.0)
  panels[1].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].remove()
  panels[1].join_shared_axis(panels[0].state, true)
  panels[1].state.val.x_axis.share_numeric_tickers(panels[0].state.val.x_axis)
  panels[1].join_shared_axis(panels[0].state, false)
  panels[1].state.val.y_axis.share_numeric_tickers(panels[0].state.val.y_axis)
  panels[0].state.val.raw_x_data = @core.limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  panels[1].state.val.raw_x_data = @core.limits(
    4626322717216342016UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  panels[1].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[1].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[1].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[1].state.val.tight = Some(false)
  panels[1].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[1].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[1].state.val.use_sticky_edges = true
  panels[1].state.val.x_axis.set_autoscale_on(true)
  panels[1].state.val.x_axis.clear_autoscale_request()
  panels[1].state.val.y_axis.set_autoscale_on(false)
  panels[1].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[1].state.val.x_axis.bind_minpos(() => {
    own_reads.push("1.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[1].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("1.x")
    let view = panels[1].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[1].state.val.y_axis.bind_minpos(() => {
    own_reads.push("1.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[1].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("1.y")
    let view = panels[1].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[1].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4622382067542392832UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [1, 0])
  autoscale_ref_limits(
    panels[1].state.val.x_axis.stored_view_limits(),
    4622382067542392832UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[1].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[1].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[1].data_limits(horizontal=true),
    4626322717216342016UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[1].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[1].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[1].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[1].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[1].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[1].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[1].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[1].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[1], panels), [1, 0])
  assert_eq(own_reads, ["1.x", "0.x"])
  assert_eq(view_reads, ["1.x", "1.x"])
}

///|
fn autoscale_source_case_36() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("round_numbers")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(true)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621537642612260864UL.reinterpret_as_double(),
    4626463454704697344UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_37() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("round_numbers")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(true)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(tight=false, scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4617315517961601024UL.reinterpret_as_double(),
    4627730092099895296UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x"])
  assert_eq(view_reads, ["0.x", "0.x"])
}

///|
fn autoscale_source_case_38() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale(enable=Some(true), axis="x")
  ignore(panels[0].get_xlim_checked())
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, [])
  assert_eq(view_reads, ["0.x"])
}

///|
fn autoscale_source_case_39() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].set_x_margin(9221120237041090560UL.reinterpret_as_double())
  panels[0].autoscale_view(tight=true, scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    9221120237041090560UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x", "0.x"])
  assert_eq(view_reads, ["0.x", "0.x", "0.x", "0.x"])
}

///|
fn autoscale_source_case_40() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].set_x_margin(9221120237041090560UL.reinterpret_as_double())
  panels[0].autoscale_view(tight=false, scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    9221120237041090560UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x", "0.x"])
  assert_eq(view_reads, ["0.x", "0.x", "0.x", "0.x"])
}

///|
fn autoscale_source_case_41() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].set_x_margin(9218868437227405312UL.reinterpret_as_double())
  panels[0].autoscale_view(tight=true, scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(true))
  autoscale_ref_number(
    panels[0].x_margin(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x", "0.x"])
  assert_eq(view_reads, ["0.x", "0.x", "0.x", "0.x"])
}

///|
fn autoscale_source_case_42() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(true)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(false)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].set_x_margin(9218868437227405312UL.reinterpret_as_double())
  panels[0].autoscale_view(tight=false, scaley=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.x", "0.x"])
  assert_eq(view_reads, ["0.x", "0.x", "0.x", "0.x"])
}

///|
fn autoscale_source_case_43() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.linear_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(true)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scalex=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4621537642612260864UL.reinterpret_as_double(),
    4626463454704697344UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4576918229304087675UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.y"])
  assert_eq(view_reads, ["0.y", "0.y"])
}

///|
fn autoscale_source_case_44() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.log_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.log_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(true)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scalex=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4621627356168520350UL.reinterpret_as_double(),
    4626521241088681114UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4576918229304087675UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.y", "0.y", "0.y", "0.y"])
  assert_eq(view_reads, ["0.y", "0.y"])
}

///|
fn autoscale_source_case_45() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    13845191154443747328UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    13845191154443747328UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(true)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scalex=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    13845191154443747328UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    13848403225097084826UL.reinterpret_as_double(),
    4629534787869679514UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    13845191154443747328UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4576918229304087675UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.y"])
  assert_eq(view_reads, ["0.y", "0.y"])
}

///|
fn autoscale_source_case_46() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.asinh_scale(linear_width=1.0))
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.asinh_scale(linear_width=1.0))
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    13845191154443747328UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    13845191154443747328UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(true)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scalex=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    13845191154443747328UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    13847436096494674793UL.reinterpret_as_double(),
    4628560490230262377UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    13845191154443747328UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4576918229304087675UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.y"])
  assert_eq(view_reads, ["0.y", "0.y"])
}

///|
fn autoscale_source_case_47() -> Unit raise {
  let old_mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old_mode)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=400, height=300)
  let panels = [fig.axes()]
  panels[0].state.val.x_axis.set_limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_axis.set_scale(@scale.logit_scale())
  panels[0].state.val.x_axis.set_tick_label_size(10.0)
  panels[0].state.val.x_axis.set_tick_layout(150.0, true, active=true)
  panels[0].state.val.y_axis.set_limits(
    4643985272004935680UL.reinterpret_as_double(),
    4645744490609377280UL.reinterpret_as_double(),
  )
  panels[0].state.val.y_axis.set_scale(@scale.logit_scale())
  panels[0].state.val.y_axis.set_tick_label_size(10.0)
  panels[0].state.val.y_axis.set_tick_layout(100.0, false, active=true)
  panels[0].state.val.raw_x_data = @core.limits(
    4591870180066957722UL.reinterpret_as_double(),
    4605380978949069210UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4591870180066957722UL.reinterpret_as_double(),
    4605380978949069210UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4576918229304087675UL.reinterpret_as_double()
  panels[0].state.val.tight = Some(false)
  panels[0].state.val.x_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.y_margin = 4587366580439587226UL.reinterpret_as_double()
  panels[0].state.val.use_sticky_edges = true
  panels[0].state.val.x_axis.set_autoscale_on(false)
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.set_autoscale_on(true)
  panels[0].state.val.y_axis.clear_autoscale_request()
  let own_reads : Array[String] = []
  let view_reads : Array[String] = []
  panels[0].state.val.x_axis.bind_minpos(() => {
    own_reads.push("0.x")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.x_axis.bind_view_interval(() => {
    view_reads.push("0.x")
    let view = panels[0].state.val.x_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].state.val.y_axis.bind_minpos(() => {
    own_reads.push("0.y")
    4562254508917369340UL.reinterpret_as_double()
  })
  panels[0].state.val.y_axis.bind_view_interval(() => {
    view_reads.push("0.y")
    let view = panels[0].state.val.y_axis.stored_view_limits()
    (view.lower(), view.upper())
  })
  panels[0].autoscale_view(scalex=false)
  autoscale_ref_limits(
    panels[0].state.val.x_axis.stored_view_limits(),
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.x_axis.autoscale_on(), false)
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.x_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=true),
    4591870180066957722UL.reinterpret_as_double(),
    4605380978949069210UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=true),
    4576918229304087675UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panels[0].state.val.y_axis.stored_view_limits(),
    4590788600441128095UL.reinterpret_as_double(),
    4605625406466530368UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.autoscale_on(), true)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  assert_eq(panels[0].state.val.y_axis.view_mutated(), true)
  autoscale_ref_limits(
    panels[0].data_limits(horizontal=false),
    4591870180066957722UL.reinterpret_as_double(),
    4605380978949069210UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].data_minpos(horizontal=false),
    4576918229304087675UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].autoscale_tight(), Some(false))
  autoscale_ref_number(
    panels[0].x_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panels[0].y_margin(),
    4587366580439587226UL.reinterpret_as_double(),
  )
  assert_eq(autoscale_ref_group(panels[0], panels), [0])
  assert_eq(own_reads, ["0.y", "0.y", "0.y"])
  assert_eq(view_reads, ["0.y", "0.y"])
}

///|
fn autoscale_source_case_48() -> Unit raise {
  let panel = figure().axes()
  panel.state.val.raw_x_data = @core.limits(10.0, 20.0)
  panel.state.val.raw_y_data = @core.limits(30.0, 40.0)
  panel.state.val.x_data_minpos = 10.0
  panel.state.val.y_data_minpos = 30.0
  panel.state.val.ignore_existing_data_limits = true
  panel.update_datalim(
    [
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ),
      @core.point(
        4613937818241073152UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ),
    ],
    update_x=true,
    update_y=false,
  )
  autoscale_ref_limits(
    panel.data_limits(),
    4607182418800017408UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panel.data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panel.ignore_existing_data_limits(), false)
}

///|
fn autoscale_source_case_49() -> Unit raise {
  let panel = figure().axes()
  panel.state.val.raw_x_data = @core.limits(10.0, 20.0)
  panel.state.val.raw_y_data = @core.limits(30.0, 40.0)
  panel.state.val.x_data_minpos = 10.0
  panel.state.val.y_data_minpos = 30.0
  panel.state.val.ignore_existing_data_limits = true
  panel.update_datalim(
    [
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ),
      @core.point(
        4613937818241073152UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ),
    ],
    update_x=false,
    update_y=true,
  )
  autoscale_ref_limits(
    panel.data_limits(),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panel.data_limits(horizontal=false),
    4611686018427387904UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(horizontal=false),
    4611686018427387904UL.reinterpret_as_double(),
  )
  assert_eq(panel.ignore_existing_data_limits(), false)
}

///|
fn autoscale_source_case_50() -> Unit raise {
  let panel = figure().axes()
  panel.state.val.raw_x_data = @core.limits(10.0, 20.0)
  panel.state.val.raw_y_data = @core.limits(30.0, 40.0)
  panel.state.val.x_data_minpos = 10.0
  panel.state.val.y_data_minpos = 30.0
  panel.state.val.ignore_existing_data_limits = true
  panel.update_datalim(
    [
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ),
      @core.point(
        4613937818241073152UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ),
    ],
    update_x=true,
    update_y=true,
  )
  autoscale_ref_limits(
    panel.data_limits(),
    4607182418800017408UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panel.data_limits(horizontal=false),
    4611686018427387904UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(horizontal=false),
    4611686018427387904UL.reinterpret_as_double(),
  )
  assert_eq(panel.ignore_existing_data_limits(), false)
}

///|
fn autoscale_source_case_51() -> Unit raise {
  let panel = figure().axes()
  panel.state.val.raw_x_data = @core.limits(10.0, 20.0)
  panel.state.val.raw_y_data = @core.limits(30.0, 40.0)
  panel.state.val.x_data_minpos = 10.0
  panel.state.val.y_data_minpos = 30.0
  panel.state.val.ignore_existing_data_limits = true
  panel.update_datalim(
    [
      @core.point(
        9221120237041090560UL.reinterpret_as_double(),
        9218868437227405312UL.reinterpret_as_double(),
      ),
    ],
    update_x=true,
    update_y=true,
  )
  autoscale_ref_limits(
    panel.data_limits(),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panel.data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panel.ignore_existing_data_limits(), true)
}

///|
fn autoscale_source_case_52() -> Unit raise {
  let panel = figure().axes()
  panel.state.val.raw_x_data = @core.limits(10.0, 20.0)
  panel.state.val.raw_y_data = @core.limits(30.0, 40.0)
  panel.state.val.x_data_minpos = 10.0
  panel.state.val.y_data_minpos = 30.0
  panel.state.val.ignore_existing_data_limits = true
  panel.update_datalim(
    [
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        9221120237041090560UL.reinterpret_as_double(),
      ),
    ],
    update_x=true,
    update_y=true,
  )
  autoscale_ref_limits(
    panel.data_limits(),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panel.data_limits(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panel.ignore_existing_data_limits(), false)
}

///|
fn autoscale_source_case_53() -> Unit raise {
  let panel = figure().axes()
  panel.state.val.raw_x_data = @core.limits(10.0, 20.0)
  panel.state.val.raw_y_data = @core.limits(30.0, 40.0)
  panel.state.val.x_data_minpos = 10.0
  panel.state.val.y_data_minpos = 30.0
  panel.state.val.ignore_existing_data_limits = true
  panel.push_artist(Artist::Line([], @core.style("#000000")))
  autoscale_ref_limits(
    panel.data_limits(),
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panel.data_limits(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panel.ignore_existing_data_limits(), true)
}

///|
fn autoscale_source_case_54() -> Unit raise {
  let panel = figure().axes()
  panel.state.val.raw_x_data = @core.limits(10.0, 20.0)
  panel.state.val.raw_y_data = @core.limits(30.0, 40.0)
  panel.state.val.x_data_minpos = 10.0
  panel.state.val.y_data_minpos = 30.0
  panel.state.val.ignore_existing_data_limits = true
  panel.push_artist(
    Artist::Line(
      [
        @core.point(
          9221120237041090560UL.reinterpret_as_double(),
          9218868437227405312UL.reinterpret_as_double(),
        ),
      ],
      @core.style("#000000"),
    ),
  )
  autoscale_ref_limits(
    panel.data_limits(),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panel.data_limits(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panel.ignore_existing_data_limits(), false)
}

///|
fn autoscale_source_case_55() -> Unit raise {
  let panel = figure().axes()
  panel.state.val.raw_x_data = @core.limits(10.0, 20.0)
  panel.state.val.raw_y_data = @core.limits(30.0, 40.0)
  panel.state.val.x_data_minpos = 10.0
  panel.state.val.y_data_minpos = 30.0
  panel.state.val.ignore_existing_data_limits = true
  panel.relim()
  autoscale_ref_limits(
    panel.data_limits(),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_limits(
    panel.data_limits(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  autoscale_ref_number(
    panel.data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panel.ignore_existing_data_limits(), true)
}

///|
test "original autoscale lifecycle group 0" {
  autoscale_source_case_0() catch {
    error =>
      fail(
        "original autoscale case 0 [complete five-scale linear]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_1() catch {
    error =>
      fail(
        "original autoscale case 1 [complete five-scale log]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_2() catch {
    error =>
      fail(
        "original autoscale case 2 [complete five-scale symlog]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_3() catch {
    error =>
      fail(
        "original autoscale case 3 [complete five-scale asinh]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_4() catch {
    error =>
      fail(
        "original autoscale case 4 [complete five-scale logit]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_5() catch {
    error =>
      fail(
        "original autoscale case 5 [eager view auto False tight None]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_6() catch {
    error =>
      fail(
        "original autoscale case 6 [eager view auto False tight False]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_7() catch {
    error =>
      fail(
        "original autoscale case 7 [eager view auto False tight True]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_8() catch {
    error =>
      fail(
        "original autoscale case 8 [eager view auto True tight None]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_9() catch {
    error =>
      fail(
        "original autoscale case 9 [eager view auto True tight False]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_10() catch {
    error =>
      fail(
        "original autoscale case 10 [eager view auto True tight True]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_11() catch {
    error =>
      fail(
        "original autoscale case 11 [unselected directions still update tight]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_12() catch {
    error =>
      fail(
        "original autoscale case 12 [lazy enable None x]: " + error.to_string(),
      )
  }
  autoscale_source_case_13() catch {
    error =>
      fail(
        "original autoscale case 13 [lazy enable None both]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_14() catch {
    error =>
      fail(
        "original autoscale case 14 [lazy enable False x]: " + error.to_string(),
      )
  }
  autoscale_source_case_15() catch {
    error =>
      fail(
        "original autoscale case 15 [lazy enable False both]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_16() catch {
    error =>
      fail(
        "original autoscale case 16 [lazy enable True x]: " + error.to_string(),
      )
  }
  autoscale_source_case_17() catch {
    error =>
      fail(
        "original autoscale case 17 [lazy enable True both]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_18() catch {
    error =>
      fail(
        "original autoscale case 18 [empty current mutation (100.0, 200.0)]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_19() catch {
    error =>
      fail(
        "original autoscale case 19 [empty current mutation (0.0, 1.0)]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_20() catch {
    error =>
      fail(
        "original autoscale case 20 [mutation reverses to original interval]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_21() catch {
    error =>
      fail(
        "original autoscale case 21 [shared request lazy]: " + error.to_string(),
      )
  }
  autoscale_source_case_22() catch {
    error =>
      fail(
        "original autoscale case 22 [different shared requester unstales with own tight]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_23() catch {
    error =>
      fail(
        "original autoscale case 23 [late peer failure leaves initiator stored and all requests consumed]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_24() catch {
    error =>
      fail(
        "original autoscale case 24 [changed scale force auto False]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_25() catch {
    error =>
      fail(
        "original autoscale case 25 [changed scale force auto True]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_26() catch {
    error =>
      fail(
        "original autoscale case 26 [same default tuple skips force]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_27() catch {
    error =>
      fail(
        "original autoscale case 27 [inversion survives finalization]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_28() catch {
    error =>
      fail(
        "original autoscale case 28 [image sticky positive or negative margin 0.1]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_29() catch {
    error =>
      fail(
        "original autoscale case 29 [image sticky positive or negative margin -0.1]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_30() catch {
    error =>
      fail(
        "original autoscale case 30 [tiny sticky relative tolerance]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_31() catch {
    error =>
      fail(
        "original autoscale case 31 [raw DataBox minpos failure precedes views]: " +
        error.to_string(),
      )
  }
}

///|
test "original autoscale lifecycle group 1" {
  autoscale_source_case_32() catch {
    error =>
      fail(
        "original autoscale case 32 [own minpos fails after both views]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_33() catch {
    error =>
      fail(
        "original autoscale case 33 [bound view failure 1]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_34() catch {
    error =>
      fail(
        "original autoscale case 34 [bound view failure 2]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_35() catch {
    error =>
      fail(
        "original autoscale case 35 [removed rejoined member still supplies data and sticky]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_36() catch {
    error =>
      fail(
        "original autoscale case 36 [round mode tight None]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_37() catch {
    error =>
      fail(
        "original autoscale case 37 [round mode tight False]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_38() catch {
    error =>
      fail(
        "original autoscale case 38 [enable then getter preserves empty mutated view]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_39() catch {
    error =>
      fail(
        "original autoscale case 39 [nonfinite margin nan tight True]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_40() catch {
    error =>
      fail(
        "original autoscale case 40 [nonfinite margin nan tight False]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_41() catch {
    error =>
      fail(
        "original autoscale case 41 [nonfinite margin inf tight True]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_42() catch {
    error =>
      fail(
        "original autoscale case 42 [nonfinite margin inf tight False]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_43() catch {
    error =>
      fail(
        "original autoscale case 43 [vertical complete transform linear]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_44() catch {
    error =>
      fail(
        "original autoscale case 44 [vertical complete transform log]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_45() catch {
    error =>
      fail(
        "original autoscale case 45 [vertical complete transform symlog]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_46() catch {
    error =>
      fail(
        "original autoscale case 46 [vertical complete transform asinh]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_47() catch {
    error =>
      fail(
        "original autoscale case 47 [vertical complete transform logit]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_48() catch {
    error =>
      fail("original autoscale case 48 [x-only first]: " + error.to_string())
  }
  autoscale_source_case_49() catch {
    error =>
      fail("original autoscale case 49 [y-only first]: " + error.to_string())
  }
  autoscale_source_case_50() catch {
    error =>
      fail("original autoscale case 50 [both first]: " + error.to_string())
  }
  autoscale_source_case_51() catch {
    error =>
      fail(
        "original autoscale case 51 [all nonfinite early return]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_52() catch {
    error =>
      fail(
        "original autoscale case 52 [paired invalid consumes ignore]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_53() catch {
    error =>
      fail(
        "original autoscale case 53 [empty Line leaves ignore]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_54() catch {
    error =>
      fail(
        "original autoscale case 54 [nonempty invalid Line consumes ignore]: " +
        error.to_string(),
      )
  }
  autoscale_source_case_55() catch {
    error =>
      fail(
        "original autoscale case 55 [empty relim preserves old minpos]: " +
        error.to_string(),
      )
  }
}
