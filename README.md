
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {cudpalette}

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

<!-- badges: end -->

Create color palette function using model color palette for Color
Universal Design (Color Universal Design Organization, 2018,
<https://cudo.jp/?page_id=1565>).

## About this package (in Japanese)

CUDO（NPO法人
カラーユニバーサルデザイン機構）により示されている「カラーユニバーサルデザイン推奨配色セット
ver.4」(<https://cudo.jp/?page_id=1565>)
および「カラーユニバーサルデザイン推奨配色セット ガイドブック
第2版」（[PDF](https://cudo.jp/wp-content/uploads/2018/10/cud_guidebook.pdf)）の「比較的見分けやすい組み合わせ（画面用）」をカラーパレットとして利用できるようにする。

## Installation

``` r
remotes::install_github("mokztk/cudpalette")
```

## Example

### basic usage

``` r
library(cudpalette)

cud_color("red")
#> [1] "#FF4B00"

cud_color(c("red", "blue", "magenta", "purple"))
#> undefined color name : magenta
#> [1] "#FF4B00" "#005AFF" NA        "#990099"

cud_pal()()
#> [1] "#F6AA00" "#FFF100" "#03AF7A" "#005AFF" "#4DC4FF" "#804000"

cud_pal(type = "a", size = 5, pal = 2, direction = -1)()
#> [1] "#990099" "#4DC4FF" "#03AF7A" "#FFF100" "#F6AA00"

cud_pal(type = "a", size = 7, pal = 2, direction = -1)()
#> Warning in cud_pal(type = "a", size = 7, pal = 2, direction = -1): 'size'
#> should be in 1:6. Default (6) will be used.
#> [1] "#4DC4FF" "#005AFF" "#03AF7A" "#FFF100" "#F6AA00" "#FF4B00"

cud_pal(type = "a", size = 5, pal = 2, direction = -1)(6)
#> Warning in cud_pal(type = "a", size = 5, pal = 2, direction = -1)(6): Requested
#> colors (6) > this palette (5). The palette will be used repeatedly.
#> [1] "#990099" "#4DC4FF" "#03AF7A" "#FFF100" "#F6AA00" "#990099"

cud_pal(type = "a", size = 5, pal = 2, direction = -1, warn = FALSE)(6)
#> [1] "#990099" "#4DC4FF" "#03AF7A" "#FFF100" "#F6AA00" "#990099"
```

### color sample

<img src="man/figures/README-sample_graph-1.png" width="100%" />
