///|
test "bce epoch matches independent pinned reference" {
  @date.set_epoch("-0001-12-31")
  assert_eq(@date.get_epoch(), "-0001-12-31")
  verify_reference()
}
