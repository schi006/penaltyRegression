test_that("linear regression works", {
  expect_equal(linear_fit(2,4)$beta, 2)
})
