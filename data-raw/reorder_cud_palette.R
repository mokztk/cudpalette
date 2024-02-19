library(tidyverse)

#' calculate CIE DE2000 color difference
#'
#' @param col1,col2 color name or hexadecimal color code (#rrggbb)
#' @return CIEDE2000 color difference
#'
calc_ciede2000 <- function(col1, col2){
  # convert RGB to CIELab color space
  lab_col1 <- grDevices::convertColor(t(col2rgb(col1) / 255), from = "sRGB", to = "Lab")
  lab_col2 <- grDevices::convertColor(t(col2rgb(col2) / 255), from = "sRGB", to = "Lab")

  ColorNameR:::ciede2000(lab_col1, lab_col2)
}

#' explore the order of palette with the maximum total color difference
#'
#' @param colors list of colors in the palette (comma separated text)
#' @return reorderd list of colors (comma separated text)
#'
max_sum_cide2000 <- function(colors) {
  # split "color" parameter to character vector
  vec_color <- unlist(strsplit(colors, ", "))

  # compute and sort CIEDE2000 for all permutations of colors
  temp_tbl <- gtools::permutations(n = length(vec_color),
                                   r = length(vec_color))

  tibble(
      id   = 1:nrow(temp_tbl),
      data = map(id,
                 ~ vec_color[c(temp_tbl[.x,], temp_tbl[.x, 1])])
    ) |>
    mutate(
      CIEDE2000 = map(data,
                      ~ sapply(1:(length(.x) - 1),
                               function(i, d) {
                                 calc_ciede2000(cudpalette::cud_color(d[i]),
                                                cudpalette::cud_color(d[i + 1]))
                               },
                               d = .x)),
      sum_DE2000 = map_dbl(CIEDE2000, sum),
      colors     = map_chr(data, ~ paste(head(.x, -1), collapse = ", "))
    ) |>
    filter(sum_DE2000 == max(sum_DE2000)) |>
    head(1) |>
    pull(colors)
}

#' reorder palettes to maximize color differences between adjacent colors
#'
list_cud_palette <-
  list_cud_palette |>
  rename(colors_old = colors) |>
  mutate(colors = map_chr(colors_old, max_sum_cide2000))
