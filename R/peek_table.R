#' Create small tables for overview
#'
#' @param table_input data.frame or tibble
#' @param head_n integer vector specifying row count for head
#' @param tail_n integer vector specifying row count for tail
#' @param ID TRUE by default, adds a row containing ID = nrow
#'
#' @return data.frame or tibble
#' @export
#'
#' @examples
#' example_table <- datasets::airquality
#' peek_table(example_table, head = 5, tail = 5)
peek_table <- function(table_input,
                       head_n = 6,
                       tail_n = 6,
                       ID = TRUE) {
  if (!is.numeric(head_n) || head_n < 0) stop("head_n must be int >0")
  if (!is.numeric(tail_n) || tail_n < 0) stop("tail_n must be int >0")
  if (ID == TRUE) { # Add ID column
    ID <- 1:nrow(table_input)
    cbind_data <- cbind(ID, table_input)
  } else if (ID == FALSE) {
    cbind_data <- table_input # no ID column
  } else {
    stop("ID must be TRUE or FALSE")
  }

  # generate head/tail of table
  tbl_head <- utils::head(cbind_data, n = head_n)
  tbl_tail <- utils::tail(cbind_data, n = tail_n)

  # get number of cols, generate "table break" with same colnames as data
  ncol_data <- ncol(cbind_data)
  tbl_dot_dot_dot <- data.frame(matrix("...", ncol = ncol_data, nrow = 1))
  colnames(tbl_dot_dot_dot) <- colnames(cbind_data)

  # put everything together and return
  table_fin <- rbind(tbl_head, tbl_dot_dot_dot, tbl_tail)

  return(table_fin)
}

# data_tbl <- base::readRDS("~/r_snippets/data_tbl.rds")
