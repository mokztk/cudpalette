#' create palette function using CUD model color palette
#'
#' @param type The name of color category (default is "accent").
#' @param size The number of colors in palette (default is 6).
#' @param pal The number of the palette (default is 1).
#' @param direction Sets the order of colors. If -1, the order of colors is reversed.
#' @param warn a logical (default is TRUE) indicating whether puts warning message for invalid parameters.
#' @return color palette function (closure)
#' @family palette
#' @export
#'
cud_pal <- function(type = "accent", size = 6, pal = 1, direction = 1, warn = TRUE) {
  # parameter checking
  if (!(type %in% c("a", "accent", "b", "base", "accent_base", "ab", "jis", "j"))) {
    stop(
      paste0("type = '", type,
             "' is not available.\n 'type' should be one of: ",
             "'accent' (or 'a', default), 'base' (or 'b'), 'accent_base' (or 'ab'), 'jis' (or 'j').")
    )
  } else {
    type <- ifelse(type == "accent_base" | type == "ab", "ab", substr(type, 1, 1))
  }

  size <- as.integer(size)
  if (is.na(size)) stop("'size' should be a number. ")

  pal  <- as.integer(pal)
  if (is.na(pal)) stop("'pal' should be a number.")

  direction <- ifelse(as.numeric(direction) == -1, -1L, 1L)

  # if non existent values were passed to 'size' or 'pal', use default values.
  if (size < min(subset(list_cud_palette, list_cud_palette$t == type)$s) |
      size > max(subset(list_cud_palette, list_cud_palette$t == type)$s)) {
    if (warn) warning(
      sprintf("'size' should be in 1:%d. Default (%d) will be used.",
              max(subset(list_cud_palette, list_cud_palette$t == type)$s),
              max(subset(list_cud_palette, list_cud_palette$t == type)$s))
    )
    size <- max(subset(list_cud_palette, list_cud_palette$t == type)$s)
  }

  if (pal < min(subset(list_cud_palette, list_cud_palette$t == type & list_cud_palette$s == size)$p) |
      pal > max(subset(list_cud_palette, list_cud_palette$t == type & list_cud_palette$s == size)$p)) {
    if (warn) warning(
      sprintf("'pal' should be in 1:%d. Default (1) will be used.",
              max(subset(list_cud_palette, list_cud_palette$t == type & list_cud_palette$s == size)$p))
    )
    pal <- 1
  }

  # extract color combinations from table and vectorize
  cols <- subset(list_cud_palette,
                 list_cud_palette$t == type & list_cud_palette$s == size & list_cud_palette$p == pal)$colors
  cols <- unlist(strsplit(cols, ", "))

  # return a closure to work as palette function
  if (direction == -1) cols <- rev(cols)
  size  <- length(cols)
  codes <- cud_color(cols)

  function(n = size) {
    n <- as.integer(n)
    if (is.na(n)) stop("'n' should be a number. ")

    # if requested number of colors was over those in palette, use colors repeatedly
    if (n > size) {
      if (warn) warning(
        sprintf("Requested colors (%d) > this palette (%d). The palette will be used repeatedly.",
                n, size)
      )
      codes <- rep(codes, length.out = n)
    }

    return(codes[1:n])
  }
}

