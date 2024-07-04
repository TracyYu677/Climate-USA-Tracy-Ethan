library(dplyr)

test_that("test 1", {
  y <- yearly_cycle(merging, "53878")
  y <- dim(y)
  expect_equal(y, c(365, 2))
})

test_that("test 2", {
  y <- yearly_cycle(merging, "26494")
  y <- dim(y)
  expect_equal(y, c(365, 2))
})

test_that("test 3", {
  y <- yearly_cycle(merging, "4138")
  y <- dim(y)
  expect_equal(y, c(365, 2))
})
