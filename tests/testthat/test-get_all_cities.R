cities <- get_all_cities()

test_that("cities is a character vector", {
  expect_equal(is.null(dim(cities)), TRUE)
  expect_equal(class(cities), "character")
})
