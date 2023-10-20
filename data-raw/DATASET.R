## code to prepare `DATASET` dataset goes here

source("data-raw/list_cud_colors.R")
source("data-raw/list_jis_colors.R")
source("data-raw/list_all_colors.R")
source("data-raw/list_cud_palette.R")

usethis::use_data(list_cud_cols, list_jis_cols, list_all_cols, list_cud_palette,
                  internal  = TRUE,
                  overwrite = TRUE)
