#' Get CUD color code
#'
#' Get Color Universal Design or JIS Z 9103:2018 color code(s) from color name(s).
#' The color name(s) for JIS color should be specified with a "jis_" prefix.
#'
#' @param colname The vector of color names to convert to hexadecimal color codes.
#' @return vector of hexadecimal color codes (#rrggbb).
#' @family color
#' @export
#'
cud_color <- function(colname) {
  res <- sapply(colname,
                function(x) {
                  n <- match(tolower(x), names(list_all_cols))
                  # if specified color is not exist, return NA with alert
                  if (is.na(n)) {
                    message(paste("undefined color name :", x))
                    return(NA_character_)
                  } else {
                    unlist(list_all_cols[x])
                  }
                })

  return(unname(res))
}
