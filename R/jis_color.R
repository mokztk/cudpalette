#' Get JIS Z 9103:2018 color code
#'
#' @param colname The vector of color names to convert to hexadecimal color codes.
#' @return vector of hexadecimal color codes (#rrggbb).
#' @family color
#' @export
#'
jis_color <- function(colname) {
  res <- sapply(colname,
                function(x) {
                  n <- match(tolower(x), names(list_jis_cols))
                  # if specified color is not exist, return NA with alert
                  if (is.na(n)) {
                    message(paste("undefined color name :", x))
                    return(NA_character_)
                  } else {
                    unlist(list_jis_cols[x])
                  }
                })

  return(unname(res))
}
