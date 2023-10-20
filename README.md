
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {cudpalette}

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

<!-- badges: end -->

Create color palette function using model color palette for Color
Universal Design (Color Universal Design Organization, 2018,
<https://cudo.jp/?page_id=1565>) or JIS Z 9103:2018.

## About this package (in Japanese)

CUDO（NPO法人
カラーユニバーサルデザイン機構）により示されている「カラーユニバーサルデザイン推奨配色セット
ver.4」(<https://cudo.jp/?page_id=1565>)
および「カラーユニバーサルデザイン推奨配色セット ガイドブック
第2版」（[PDF](https://cudo.jp/wp-content/uploads/2018/10/cud_guidebook.pdf)）の「比較的見分けやすい組み合わせ（画面用）」をカラーパレットとして利用できるようにする。

同様の趣旨で制定されている[JIS安全色](https://safetycolor.jp/)（JIS Z
9103:2018）も使用できるよう更新。

### Functions :

**`cud_color(colname)`**

CUD推奨カラーパレットの色名（下記）から対応するカラーコードを取得。存在しない色は
NA を返す

    #>  [1] "red"              "yellow"           "green"            "blue"            
    #>  [5] "skyblue"          "pink"             "orange"           "purple"          
    #>  [9] "brown"            "lightpink"        "cream"            "lightyellowgreen"
    #> [13] "lightskyblue"     "beige"            "lightgreen"       "lightpurple"     
    #> [17] "white"            "lightgray"        "lightgrey"        "gray"            
    #> [21] "grey"             "black"

`jis_` の接頭語をつけて `jis_color()` の色を取得することもできる

    #> [1] "jis_red"       "jis_yellowred" "jis_orange"    "jis_yellow"   
    #> [5] "jis_green"     "jis_blue"      "jis_purple"    "jis_white"    
    #> [9] "jis_black"

**`jis_color(colname)`**

JIS Z 9103:2018 で定義されているカラーコードを取得。存在しない色は NA
を返す

    #> [1] "red"       "yellowred" "orange"    "yellow"    "green"     "blue"     
    #> [7] "purple"    "white"     "black"

**`cud_pal(type, size, pal, direction, reorder, warn)`**

「比較的見分けやすい組み合わせ」をパレットとして使用する。可能な組み合わせは下記サンプルを参照。  
隣り合う色の色差を最大化するために色を並べ替えている。出典資料に出てくる順に戻したい場合は、`reorder = F`。

デフォルトはアクセントカラー
6色のひとつ。色が足りない場合は警告メッセージ（`warn = F`
でoff可）を出してループで使用する。

**`jis_pal(direction, reorder, warn)`**

JIS Z 9103:2018
で定義されている色をパレットとして使用。`cud_pal(type = "jis")`
を呼び出すラッパー関数。

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
#> [1] "#F6AA00" "#005AFF" "#FFF100" "#4DC4FF" "#804000" "#03AF7A"

cud_pal(type = "a", size = 5, pal = 2, direction = -1)()
#> [1] "#03AF7A" "#990099" "#FFF100" "#4DC4FF" "#F6AA00"

cud_pal(type = "a", size = 7, pal = 2, direction = -1)()
#> Warning in cud_pal(type = "a", size = 7, pal = 2, direction = -1): 
#> 'size' should be in 1:6. Default (6) will be used.
#> [1] "#03AF7A" "#FF4B00" "#4DC4FF" "#FFF100" "#005AFF" "#F6AA00"

cud_pal(type = "a", size = 5, pal = 2, direction = -1)(6)
#> Warning in cud_pal(type = "a", size = 5, pal = 2, direction = -1)(6): 
#> Requested colors (6) > this palette (5). The palette will be used repeatedly.
#> [1] "#03AF7A" "#990099" "#FFF100" "#4DC4FF" "#F6AA00" "#03AF7A"

cud_pal(type = "a", size = 5, pal = 2, direction = -1, warn = FALSE)(6)
#> [1] "#03AF7A" "#990099" "#FFF100" "#4DC4FF" "#F6AA00" "#03AF7A"
```

### color sample

with parameter `reorder = TRUE` (reorder palettes maximizing color
differences between adjacent colors)

<img src="man/figures/README-sample_graph-1.png" width="100%" />

------------------------------------------------------------------------

# Version history

- :bookmark:[v0.1.0](https://github.com/mokztk/cudpalette/releases/tag/v0.1.0)
  (2023-10-12): impremented the model color palette for Color Universal
  Design.
- :bookmark:[v0.2.0](https://github.com/mokztk/cudpalette/releases/tag/v0.2.0)
  (2023-10-20): impremented the JIS Safety Colors (JIS Z 9103:2018).
- :bookmark:[v0.3.0](https://github.com/mokztk/cudpalette/releases/tag/v0.3.0)
  (2023-10-20): reorder palettes to maximize color differences between
  adjacent colors.
