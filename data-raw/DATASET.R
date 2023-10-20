## code to prepare `DATASET` dataset goes here

source("data-raw/list_cud_colors.R")
source("data-raw/list_cud_palette.R")

usethis::use_data(list_cud_cols, list_cud_palette,
                  internal = TRUE)
