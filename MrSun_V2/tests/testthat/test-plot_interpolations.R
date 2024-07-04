test_that("test1", {
  dat <- data.frame(LATITUDE = c(1,2,3),
                    LONGITUDE = c(1,2,3),
                    values = c(1,2,3))
  expect_no_error(plot_interpolations(dat))
})

test_that("test2", {
  dat <- data.frame(LATITUDE = c(1,99,0),
                    LONGITUDE = c(3,4,20),
                    values = c(11,100,6))
  expect_no_error(plot_interpolations(dat))
})

test_that("test3", {
  dat <- data.frame(LATITUDE = c(0,0,0),
                    LONGITUDE = c(0,0,0),
                    values = c(0,0,0))
  expect_no_error(plot_interpolations(dat))
})