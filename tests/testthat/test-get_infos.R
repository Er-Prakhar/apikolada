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

test_that("big query is working", {
  expect(is.data.frame(get_infos(kpis = c("N02904", "U26479", "U26480", "U26481", "U28649", "U28650", "U28651", "U33951", "U33961", "U26420", "U26421", "U26422", "U26423", "U26424", "U26426", "U26437", "U26440", "U26441", "U26442", "U26443", "U26444", "U26445"), c("Malmö", "Göteborg", "Linköping", "Stockholm", "Jönköping", "Uppsala", "Helsingborg"), c(2014, 2015,  2016, 2017, 2018, 2019))), failure_message = "big query failed")}
)
