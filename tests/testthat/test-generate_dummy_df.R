# Test 1: generation of dummy df
example_dummy_df_1 <- generate_dummy_df()
test_that("data.frame gets generated", {
  expect_equal(class(example_dummy_df_1), "data.frame")
})

# Test 2: check if class contains all current data.types
test_that("data.frame contains all data.types", {
  expect_contains(sapply(example_dummy_df_1, class),
  c("numeric", "character", "factor"))
})

# Test 3: check if dummy df contains range
pattern <- "^[0-9]+-[0-9]+$"
check_range_column <- function(column) {
  any(grepl(pattern, column))
}
contains_range_expect_true <- any(sapply(example_dummy_df_1, check_range_column))

test_that("data.frame contains range", {
  expect_equal(contains_range_expect_true, TRUE)
})

# Test 4: test custom column and row length
example_dummy_df_2 <- generate_dummy_df(rows_n = 25, cols_n = 50)

test_that("data.frame custom rows and cols works", {
  expect_equal(ncol(example_dummy_df_2), 50)
  expect_equal(nrow(example_dummy_df_2), 25)
})
