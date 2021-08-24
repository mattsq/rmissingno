#' Plot Missing Correlation Clustering
#'
#' XXXX
#'
#' XXX
#' @export
#' @import dplyr
#' @param data a XXX
#' @param ... any arguments to stats::hclust
#' @examples
#' \dontrun{
#'
#' }
#' @return
#' XXX
#' @author Matt Simmons matthew.joseph.simmons@gmail.com
#'
#'

plot_missing_hclust <- function(data, distance = "binary", ...) {
  data <- dplyr::mutate(data, dplyr::across(.cols = dplyr::everything(), ~ dplyr::if_else(is.na(.x), 1, 0)))
  data_cor <- stats::cor(data, method = "spearman")
  data_cor <- data_cor[is.na(data_cor)] <- 0
  data_dist <- stats::dist(data_cor, method = distance)
  clust <- stats::hclust(data_dist, ...)
  plot(clust)
}
