# test_that("multiplication works", {
#   expect_equal()
# })

# Test 1: Replace spaces with underscores and make all letters lowercase
example_df1 <- data.frame(
  `Test Column` = 1:5,
  `Data Name` = 6:10,
  check.names = FALSE
)
example_df1 <- usable_colnames(example_df1, exclude = "", space_to = "_", case_lower = TRUE)

test_that("Test 1: Replace spaces with underscores and make all letters lowercase", {
  expect_equal(example_df1, c("test_column", "data_name"))
})

# Test 2: Remove special characters, replace spaces with spaces
example_df2 <- data.frame(
  `@test col&` = 1:5,
  `data_2_` = 1:5,
  check.names = FALSE
)
colnames(example_df2) <- usable_colnames(example_df2, space_to = " ")

test_that("Test 2: Do not replace spaces (use empty string for space_to)", {
    expect_equal(colnames(example_df2), c("test col", "data2"))
})
