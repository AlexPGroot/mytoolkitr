data_table <- data.frame(column = c("28-29", "25-30", "34-38", "22-24"))

testthat::test_that("range gets converted to numeric", {
  expect_equal(range_to_numeric(data_table$column, show_output = TRUE), c(28.5, 27.5, 36.0, 23.0))
})
