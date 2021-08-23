#' Plot Missing Correlation
#'
#' XXXX
#'
#' XXX
#' @export
#' @import dplyr corrplot
#' @param data a XXX
#' @examples
#' \dontrun{
#'
#' }
#' @return
#' XXX
#' @author Matt Simmons matthew.joseph.simmons@gmail.com
#'

plot_missing_correl <- function(data) {
  data <- dplyr::mutate(data, dplyr::across(.cols = dplyr::everything(), ~ if_else(is.na(.x), 1, 0)))
  data_cor <- stats::cor(data, method = "spearman")
  corrplot::corrplot(data_cor)
}
