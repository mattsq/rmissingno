#' Plot Missing Correlation
#'
#' XXXX
#'
#' XXX
#' @export
#' @import dplyr corrplot
#' @param data a XXX
#' @param ... any arguments to corrplot::corrplot
#' @examples
#' \dontrun{
#'
#' }
#' @return
#' XXX
#' @author Matt Simmons matthew.joseph.simmons@gmail.com
#'

plot_missing_correl <- function(data, ...) {
  data <- dplyr::mutate(data, dplyr::across(.cols = dplyr::everything(), ~ dplyr::if_else(is.na(.x), 1, 0)))
  data <- dplyr::select(data, where(~ sum(.x) != length(.x)))
  data <- dplyr::select(data, where(~ sum(.x) != 0))
  data_cor <- stats::cor(data, method = "spearman")
  data_cor[is.na(data_cor)] <- 0
  corrplot::corrplot(data_cor, ...)
}
