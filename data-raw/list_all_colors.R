#' united list of CUD and JIS Z 9103:2018 colors
#'

temp <- list_jis_cols
names(temp) <- paste0("jis_", names(temp))

list_all_cols <- c(list_cud_cols, temp)
rm(temp)
