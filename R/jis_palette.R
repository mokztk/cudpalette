#' create palette function using JIS Z 9103:2018 color palette
#'
#' This is a wrapper function calls `cud_pal()` with type = "jis".
#'
#' @param direction Sets the order of colors. If -1, the order of colors is reversed.
#' @param reorder a logical (default is TRUE).
#' If TRUE, the order of colors is reorderd to maximize color difference between adjacent colors.
#' If FALSE, the order is along with the order described in reference documents.
#' @param warn a logical (default is TRUE) indicating whether puts warning message for invalid parameters.
#' @return color palette function (closure)
#' @family palette
#' @export
#'
jis_pal <- function(direction = 1, reorder = TRUE, warn = TRUE) {
  cud_pal(type = "jis", size = 6, pal = 1, direction = direction, reorder = reorder, warn = warn)
}
