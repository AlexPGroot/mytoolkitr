example_table <- datasets::airquality
example_table_peek <- (peek_table(example_table))

# Test 1: dot_dot_dot gets used
test_that("Test 1: ... sits in the middle of table at pos=7", {
  expect_equal(example_table_peek[7,1],  c("..."))
})

# Test 2.1: General table structure
test_that("General table structure stays consistent", {
  expect_equal(nrow(example_table_peek), c(13))
})

# Test 2.2: General table structure
test_that("General table structure stays consistent", {
  expect_equal(ncol(example_table_peek), c(7))
})

# Test 2.3: General table structure
test_that("General table structure stays consistent", {
  expect_equal(colnames(example_table_peek), c("ID", "Ozone", "Solar.R", "Wind", "Temp", "Month", "Day"))
})

# Test 3.1: Even with 0 head/tail input generates a "table" with just "..."
test_that("Empty table gets generated", {
  expect_equal(nrow(peek_table(example_table, head = 0, tail = 0)), c(1))
})

# Test 3.2: Even with 0 head/tail input generates a "table" with just "..."
test_that("", {
  expect_equal(peek_table(example_table, head = 0, tail = 0)[,1], c("..."))
})
