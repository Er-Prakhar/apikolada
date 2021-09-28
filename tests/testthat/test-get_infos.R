kpis <- c("N02904", "U28116")
cities <- c("Helsingborg", "Askersund")
years <- c(2019, 2013)

test_that("cities has valid city names", {
  expect_error(get_infos(kpis, "invalid_city", years))
  expect_error(get_infos(kpis, NULL, years))
})

test_that("kpis has valid kpi IDs", {
  expect_error(get_infos("invalid_kpi", cities, years))
  expect_error(get_infos(NULL, cities, years))
})

test_that("year is valid", {
  expect_error(get_infos(kpis, cities, 1970))
  expect_error(get_infos(kpis, cities, NULL))
})
