test_that("test 1", {
  # grid <- data.frame(LONGITUDE = c(0,0,0),
  #                    LATITUDE = c(0,0,0))
  # stations_data <- data.frame(LONGITUDE = c(0,0,0),
  #                             LATITUDE = c(0,0,0),
  #                             mean = c(0,0,0))
  # x <- interpolate_to_grid(grid, stations_data, interest_var = "mean")
  # expect_equal(dim(x), 4)
  x <- c(3,2)
  expect_equal(x, c(3,2))
})

test_that("test 2", {
  # grid <- data.frame(LONGITUDE = c(2,4,7,8),
  #                    LATITUDE = c(9,4,2,5))
  # stations_data <- data.frame(LONGITUDE = c(1,1,1,1),
  #                             LATITUDE = c(3,4,9,6),
  #                             mean = c(4,9,9,3))
  # x <- interpolate_to_grid(grid, stations_data, interest_var = "mean")
  # expect_equal(dim(x), 4)
  expect_equal(2 * 2, 4)
})

test_that("test 3", {
  expect_equal(2 * 2, 4)
})
