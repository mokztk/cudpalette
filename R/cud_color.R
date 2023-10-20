#' Get CUD color code
#'
#' @param colname The vector of color names to convert to hexadecimal color codes.
#' @return vector of hexadecimal color codes (#rrggbb).
#' @export
#'
cud_color <- function(colname) {
  res <- sapply(colname,
                function(x) {
                  n <- match(tolower(x), names(list_cud_cols))
                  # if specified color is not exist, return NA with alert
                  if (is.na(n)) {
                    message(paste("undefined color name :", x))
                    return(NA_character_)
                  } else {
                    unlist(list_cud_cols[x])
                  }
                })

  return(unname(res))
}
