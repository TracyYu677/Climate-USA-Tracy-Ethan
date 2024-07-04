library(dplyr)

test_that("test 1", {
  y <- estimate_temp_trend(merging, "53878")
  y <- dim(y)
  expect_equal(y, c(1, 3))
})

test_that("test 2", {
  y <- estimate_temp_trend(merging, "26494")
  y <- dim(y)
  expect_equal(y, c(1, 3))
})

test_that("test 3", {
  y <- estimate_temp_trend(merging, "4138")
  y <- dim(y)
  expect_equal(y, c(1, 3))
})

