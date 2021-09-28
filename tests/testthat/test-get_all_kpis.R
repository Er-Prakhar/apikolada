all_kpis <- get_all_kpis()

test_that("all_kpis is a data frame with all kpi groups", {
  expect(is.data.frame(all_kpis), failure_message = "kpis not a data frame")
  expect_true(all(names(all_kpis) == c("id", "member_id", "member_title", "title")))
})
