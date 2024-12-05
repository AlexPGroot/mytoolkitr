#' Generate dummy data frame
#'
#' @param rows_n integer value specifying the amount of rows for the generated data frame, default = 10
#' @param cols_n integer value specifying the amount of columns for the generated data frame, default = 5
#' @param col_types character string specifying the column types, cycles through all types by default or chosen types as such: \cr
#' 'col_types = c("numeric", "factor")'. Available types are "numeric", "character", "factor" and "range"
#' @param col_names character vector specifying the used prefix for the col names, defaults to "var"
#'
#' @return data.frame
#' @export
#'
#' @examples
#' set.seed(12345) # for reproducible results
#' example_dummy_df <- generate_dummy_df(rows_n = 12, cols_n = 6, col_types = c("character", "range"), col_names = "column")
generate_dummy_df <- function(rows_n = 10, cols_n = 5, col_types = c("numeric", "character", "factor", "range"), col_names = "var") {
  # Check if input is correct
  if (!is.numeric(rows_n) || rows_n <= 0) stop("rows_n must be int >=1.")
  if (!is.numeric(cols_n) || cols_n <= 0) stop("cols_n must be int >=1.")
  if (!all(col_types %in% c("numeric", "character", "factor", "range")))
    stop("col_types expected: c('numeric', 'character', 'factor', 'range').")

  # Gen repeating cols based on input col_types, by desired output length cols_n
  col_types <- rep(col_types, length.out = cols_n)

  # Gen dummy data objectr
  dummy_data <- lapply(col_types, function(type) { # apply switch to all generated col_types
    switch(type,
           numeric = stats::runif(rows_n, 0, 100), # rand numbers between 0 and 100
           character = sample(LETTERS, rows_n, replace = TRUE), # rand uppercase letters
           factor = factor(sample(c("A", "B", "C"), rows_n, replace = TRUE)), # rand factor levels
           range = paste0( # rand range <chr> format "00-00"
             sample(10:50, rows_n, replace = TRUE),
             "-",
             sample(51:100, rows_n, replace = TRUE)
           )
    )
  })

  # generate and add column names
  column_names <- paste0(col_names, seq_len(cols_n))
  names(dummy_data) <- column_names

  # finish as data.frame
  return(as.data.frame(dummy_data))
}

# Example Usage:
dummy_df <- generate_dummy_df(rows_n = 15, cols_n = 6, col_types = c("numeric", "character", "factor", "range"))
print(dummy_df)
