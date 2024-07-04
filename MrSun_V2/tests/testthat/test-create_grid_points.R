library(ggplot2)
library(sp)
library(dplyr)

test_that("test1", {
  y <- dim(create_grid_points(0.8))
  expect_equal(y, c(1261, 2))
})

test_that("test2", {
  y <- dim(create_grid_points())
  expect_equal(y, c(81513, 2))
})

test_that("test3", {
  y <- dim(create_grid_points(4))
  expect_equal(y, c(47, 2))
})
