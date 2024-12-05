#' Convert range in column to numeric
#'
#' @param column `<chr>` column containing data range in format "NUM-NUM" (e.g., `"32-34"`)
#' @param method a character string specifying method by which to calculate resulting value from range. Prints minimum values (`"min"`),
#' maximum values (`"max"`), calculates average (`"average'`), otherwise (default) (`"middle"`) is used.
#' @param show_output a logical specifying to print output to console, `FALSE` by default.
#' @param round_result an integer specifying the number of decimals (e.g., `"1"`), defaults to `NULL`; no rounding
#'
#' @return numeric vector.
#' @export
#'
#' @examples
#' # Example dataset:
#' data_table <- data.frame(
#'   column = c("28-29", "25-30", "34-38", "22-24")
#' )
#' data_table$column <-
#'   range_to_numeric(
#'     data_table$column,
#'     method = "middle",
#'     show_output = FALSE,
#'     round_result = 1)
range_to_numeric <- function(column,
                             method = "middle",
                             show_output = FALSE,
                             round_result = NULL) {
  # Pull range
  range_values <- stringr::str_extract(column, "\\d+-\\d+")
  if (show_output)
    message("Extracted range: ", paste(range_values, collapse = ", ")) #output/debug purposes, show function does something

  # Grab minimum and maximum convert as numeric values
  min_val <- as.numeric(stringr::str_extract(range_values, "^\\d+"))
  max_val <- as.numeric(stringr::str_extract(range_values, "\\d+$"))

  # Calculate result based on method, defaulting to middle
  result <- switch(
    method,
    "middle" = (min_val + max_val) / 2, # Calculate mid
    "average" = mean(c(min_val, max_val), na.rm = TRUE), # Average
    "min" = min_val, # Minimum
    "max" = max_val, # Maximum
    stop(
      "Error method not recognized. Methods: 'middle', 'average', 'min', or 'max'."
    ) # Error non-available method
  )

  # If round_result = NUM
  if (!is.null(round_result)) {
    result <- round(result, digits = round_result)
    if (show_output)
      message("Result: ", paste(result, collapse = ", "))
  }
  return(result)
}
