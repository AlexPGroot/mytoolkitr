#' Make column names usable
#'
#' @param input data.frame or tibble
#' @param exclude (string of) character(s) to exclude (e.g., " -_" results in colnames with spaces, hyphens and underscores intact)
#' @param space_to (string of) character(s) to change space to (e.g., "_" excludes space and converts it to underscores)
#' @param case_lower if TRUE converts all uppercase characters to lowercase. FALSE by default.
#'
#' @return character vector containing column names
#' @export
#'
#' @note Currently has a bug when combining `exclude = "-"` with `space_to = "any input"`
#'
#' @examples
#'example_df <- data.frame(
#'  `test!@_option-25` = 1:5,
#'  `dATa &name` = 6:10,
#'  `column@#4$` = 11:15,
#'  check.names = FALSE
#')
#'
#' colnames(example_df) <-
#' usable_colnames(example_df,
#'   space_to = "_",
#'   case_lower = TRUE)
usable_colnames <- function(input,
                            exclude = "",
                            space_to = "",
                            case_lower = FALSE) {
  # allow to rmove all special regex characters with 'exclude'
  exclude <- gsub("([\\^\\$\\*\\+\\?\\(\\)\\[\\]\\{\\}\\.\\|\\-])",
                  "\\\\\\1",
                  exclude)

  # exclude space if space_to is utilized
  # "[^[:alnum:]"] removes everything, which is why exclude is utilized
  if (space_to != "") {
    pattern <- paste0("[^[:alnum:]", exclude, " ]")
  } else {
    pattern <- paste0("[^[:alnum:]", exclude, "]")
  }

  # input data
  input_colnames <- colnames(input)
  # perform regex
  output_colnames <- gsub(pattern, "", input_colnames)

  if (space_to != "") {
    output_colnames <- gsub(" ", space_to, output_colnames)
  }
  if (case_lower) {
    output_colnames <- tolower(output_colnames)
  }
  return(output_colnames)
}
