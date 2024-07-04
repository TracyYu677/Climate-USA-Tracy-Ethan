test_that("test1", {
  x <- merging[merging$WBANNO == "53878", ]
  expect_equal(time.extraction(merging, "53878"), x)
})

test_that("test2", {
  x <- time.extraction(merging, "53878", "2024-02-07", "2024-02-27")
  expect_equal(dim(x), c(21, 13))
})

test_that("test3", {
  x <- time.extraction(merging, "53878", "2024-02-27")
  expect_equal(dim(x), c(41, 13))
})

