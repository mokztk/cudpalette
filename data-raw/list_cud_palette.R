#' table for Color Universal Design model palette
#'
#' @seealso https://cudo.jp/?page_id=1565
#'
temp <- " t: s: p: colors
          a: 4: 1: red, yellow, green, skyblue
          a: 4: 2: red, yellow, blue, skyblue
          a: 4: 3: red, green, blue, skyblue
          a: 4: 4: orange, yellow, purple, skyblue
          a: 4: 5: orange, green, purple, skyblue
          a: 4: 6: yellow, purple, skyblue, pink
          a: 5: 1: red, yellow, green, blue, skyblue
          a: 5: 2: orange, yellow, green, skyblue, purple
          a: 5: 3: orange, yellow, green, skyblue, brown
          a: 5: 4: orange, yellow, blue, skyblue, brown
          a: 5: 5: yellow, blue, pink, skyblue, brown
          a: 6: 1: orange, yellow, green, blue, skyblue, brown
          a: 6: 2: red, orange, yellow, green, blue, skyblue
          a: 6: 3: red, orange, yellow, green, purple, skyblue
          b: 3: 1: lightpink, cream, lightskyblue
          b: 3: 2: lightpink, cream, lightpurple
          b: 3: 3: cream, lightgreen, lightskyblue
          b: 3: 4: cream, beige, lightskyblue
          b: 3: 5: cream, beige, lightpurple
          b: 4: 1: lightpink, cream, lightskyblue, lightpurple
          b: 4: 2: beige, cream, lightskyblue, lightpurple
         ab: 6: 1: orange, yellow, blue, brown, lightgreen, lightskyblue
         ab: 6: 2: orange, green, skyblue, brown, lightpink, cream
         ab: 6: 3: orange, green, brown, lightpink, cream, lightskyblue
         ab: 6: 4: orange, green, brown, lightpink, cream, lightpurple
         ab: 6: 5: orange, blue, skyblue, brown, lightpink, cream
         ab: 6: 6: orange, blue, brown, lightpink, cream, lightskyblue
         ab: 6: 7: orange, blue, brown, lightpink, cream, lightpurple
         ab: 6: 8: orange, blue, brown, cream, lightgreen, lightskyblue"

list_cud_palette <- as.data.frame(read.delim(textConnection(temp), sep = ":", strip.white = TRUE))
rm(temp)
