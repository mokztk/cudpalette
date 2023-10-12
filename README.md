
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

### Functions :

**cud_color(colname)**

CUD推奨カラーパレットの色名からカラーコードを取得。存在しない色は NA
を返す

| colname          | value    | sample                                                      |
|:-----------------|:---------|:------------------------------------------------------------|
| red              | \#FF4B00 | <span style="background-color:#FF4B00"> sample text </span> |
| yellow           | \#FFF100 | <span style="background-color:#FFF100"> sample text </span> |
| green            | \#03AF7A | <span style="background-color:#03AF7A"> sample text </span> |
| blue             | \#005AFF | <span style="background-color:#005AFF"> sample text </span> |
| skyblue          | \#4DC4FF | <span style="background-color:#4DC4FF"> sample text </span> |
| pink             | \#FF8082 | <span style="background-color:#FF8082"> sample text </span> |
| orange           | \#F6AA00 | <span style="background-color:#F6AA00"> sample text </span> |
| purple           | \#990099 | <span style="background-color:#990099"> sample text </span> |
| brown            | \#804000 | <span style="background-color:#804000"> sample text </span> |
| lightpink        | \#FFCABF | <span style="background-color:#FFCABF"> sample text </span> |
| cream            | \#FFFF80 | <span style="background-color:#FFFF80"> sample text </span> |
| lightyellowgreen | \#D8F255 | <span style="background-color:#D8F255"> sample text </span> |
| lightskyblue     | \#BFE4FF | <span style="background-color:#BFE4FF"> sample text </span> |
| beige            | \#FFCA80 | <span style="background-color:#FFCA80"> sample text </span> |
| lightgreen       | \#77D9A8 | <span style="background-color:#77D9A8"> sample text </span> |
| lightpurple      | \#C9ACE6 | <span style="background-color:#C9ACE6"> sample text </span> |
| white            | \#FFFFFF | <span style="background-color:#FFFFFF"> sample text </span> |
| lightgray        | \#C8C8CB | <span style="background-color:#C8C8CB"> sample text </span> |
| lightgrey        | \#C8C8CB | <span style="background-color:#C8C8CB"> sample text </span> |
| gray             | \#84919E | <span style="background-color:#84919E"> sample text </span> |
| grey             | \#84919E | <span style="background-color:#84919E"> sample text </span> |
| black            | \#000000 | <span style="background-color:#000000"> sample text </span> |

**cud_pal(type = “accent”, size = 6, pal = 1, direction = 1, warn =
TRUE)**

「比較的見分けやすい組み合わせ」をパレットとして使用する。デフォルトはアクセントカラー
6色のひとつ  
色が足りない場合は警告メッセージ（warn = F でoff可）を出してループで使用

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
