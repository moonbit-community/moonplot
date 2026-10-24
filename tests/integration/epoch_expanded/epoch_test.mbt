///|
test "expanded epoch matches independent pinned reference" {
  @date.set_epoch("+10000-01-01")
  assert_eq(@date.get_epoch(), "+10000-01-01")
  verify_reference()
}
