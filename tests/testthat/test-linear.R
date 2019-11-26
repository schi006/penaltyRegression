test_that("linear regression works", {
  expect_equal(as.numeric(linear_fit(matrix(c(2,3)),matrix(c(4,6)))$beta), 2)
})
