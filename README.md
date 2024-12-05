
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mytoolkitr

<!-- badges: start -->
<!-- badges: end -->

mytoolkitr is my personal R package in which I add functions I liked to
use for fun or QoL.

## Installation

You can install the development version of mytoolkitr from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("AlexPGroot/mytoolkitr")
```

## Summary

The current included functions are:

``` bash
ls R/
#> generate_dummy_df.R
#> peek_table.R
#> range_to_numeric.R
#> usable_colnames.R
```

``` r
library(mytoolkitr) #load package
```

## generate_dummy_df

In order to quickly generate a data.frame with random data we can use
`generate_dummy_df`.

``` r
example_dummy_df <- generate_dummy_df()
print(example_dummy_df)
#>          var1 var2 var3  var4      var5
#> 1  21.7960569    V    A 19-94 30.937820
#> 2   0.9293211    Z    A 19-51 93.084869
#> 3  65.7581672    Q    C 12-56 84.860848
#> 4  84.3278336    F    B 26-84 33.833964
#> 5  52.3809200    O    C 25-52  6.351020
#> 6  12.8884543    S    C 49-56 90.406242
#> 7  78.5876147    W    A 41-67 80.903411
#> 8  38.8421427    Z    B 37-69 64.669688
#> 9  18.7313011    J    A 38-82  7.540206
#> 10 21.5563286    K    B 14-67 57.817772
```

## peek_table

Instead of using `View()` to get a global overview of a data.frame or
tibble we can use `peek_table()` for a table containing the head, tail,
row number and an indicator for the middle.

``` r
example_dummy_df_2 <- generate_dummy_df(rows_n = 100, cols_n = 6)
peek_table(example_dummy_df_2, ID = FALSE)
#>                 var1 var2 var3  var4             var5 var6
#> 1   68.2018684456125    O    A 16-98 85.3329262230545    F
#> 2   9.49206526856869    B    A 46-98 11.5254608215764    B
#> 3   67.5477692624554    B    C 46-68 92.0107446145266    I
#> 4   51.0346786351874    Y    C 21-66 78.7265504943207    I
#> 5   68.6314080609009    N    B 42-81 79.8054213402793    O
#> 6   76.6465902794152    Y    A 24-65 2.06078293267637    W
#> 7                ...  ...  ...   ...              ...  ...
#> 95  66.6621674550697    T    C 39-65 32.7843323582783    E
#> 96  25.2807781100273    R    C 23-90 95.9137415280566    F
#> 97  24.1410464979708    Z    C 41-65 44.9487915728241    C
#> 98  52.8786816168576    U    A 30-90 56.3079345272854    E
#> 99  91.4686118019745    A    A 36-76 40.9045382170007    T
#> 100 67.0257798628882    O    A 31-65 10.8997776871547    G
```

Or combined with `knitr::kable()`

``` r
knitr::kable(peek_table(example_dummy_df_2, ID = FALSE))
```

|     | var1             | var2 | var3 | var4  | var5             | var6 |
|:----|:-----------------|:-----|:-----|:------|:-----------------|:-----|
| 1   | 68.2018684456125 | O    | A    | 16-98 | 85.3329262230545 | F    |
| 2   | 9.49206526856869 | B    | A    | 46-98 | 11.5254608215764 | B    |
| 3   | 67.5477692624554 | B    | C    | 46-68 | 92.0107446145266 | I    |
| 4   | 51.0346786351874 | Y    | C    | 21-66 | 78.7265504943207 | I    |
| 5   | 68.6314080609009 | N    | B    | 42-81 | 79.8054213402793 | O    |
| 6   | 76.6465902794152 | Y    | A    | 24-65 | 2.06078293267637 | W    |
| 7   | …                | …    | …    | …     | …                | …    |
| 95  | 66.6621674550697 | T    | C    | 39-65 | 32.7843323582783 | E    |
| 96  | 25.2807781100273 | R    | C    | 23-90 | 95.9137415280566 | F    |
| 97  | 24.1410464979708 | Z    | C    | 41-65 | 44.9487915728241 | C    |
| 98  | 52.8786816168576 | U    | A    | 30-90 | 56.3079345272854 | E    |
| 99  | 91.4686118019745 | A    | A    | 36-76 | 40.9045382170007 | T    |
| 100 | 67.0257798628882 | O    | A    | 31-65 | 10.8997776871547 | G    |

## range_to_numeric

Some data sets provide character data ranges which have numeric values
stored within. In order to extract the numeric values from the character
values so we can use these character values as numeric values, for
example in machine learning using the values as numerical data instead
of factor data. <br> By default it takes the middle point, however there
are also methods for min and max.

``` r
example_dummy_df_3 <- generate_dummy_df(cols_n = 2, col_types = c("character", "range"))
peek_table(example_dummy_df_3, ID = FALSE, head_n = 3, tail_n = 3)
#>    var1  var2
#> 1     F 22-56
#> 2     L 44-85
#> 3     Y 44-87
#> 4   ...   ...
#> 8     B 27-88
#> 9     L 27-63
#> 10    E 13-61

example_dummy_df_3$var2 <- range_to_numeric(example_dummy_df_3$var2)
peek_table(example_dummy_df_3, ID = FALSE, head_n = 3, tail_n = 3)
#>    var1 var2
#> 1     F   39
#> 2     L 64.5
#> 3     Y 65.5
#> 4   ...  ...
#> 8     B 57.5
#> 9     L   45
#> 10    E   37
```

The fourth method that can be used is average:

``` r
example_dummy_df_4 <- generate_dummy_df(cols_n = 2, col_types = c("character", "range"))
peek_table(example_dummy_df_4, ID = FALSE, head_n = 3, tail_n = 3)
#>    var1  var2
#> 1     S 46-92
#> 2     P 21-69
#> 3     Q 16-65
#> 4   ...   ...
#> 8     Z 31-91
#> 9     H 42-61
#> 10    M 16-74

example_dummy_df_4 <- dplyr::mutate(example_dummy_df_4, var2 = sapply(var2, range_to_numeric, method = "average"))
peek_table(example_dummy_df_4)
#>     ID var1 var2
#> 1    1    S   69
#> 2    2    P   45
#> 3    3    Q 40.5
#> 4    4    K 55.5
#> 5    5    R   69
#> 6    6    X 53.5
#> 7  ...  ...  ...
#> 51   5    R   69
#> 61   6    X 53.5
#> 71   7    X 35.5
#> 8    8    Z   61
#> 9    9    H 51.5
#> 10  10    M   45
```

Average takes a bit of mutate and sapply due to how the function works,
otherwise it takes the average of all rows together instead of the
range.

## usable_colnames

The data set we received in this example has some unconventional
colnames with characters that will make it take a bit more effort to
use.

``` r
table_rds <- readxl::read_xlsx("examples/headertestingxlsx.xlsx")
head(table_rds)
#> # A tibble: 6 × 8
#>   TESTING `!!!IMPORTANT!!@` `'valu-@’a` `>,./path<_67-twelve`
#>     <dbl>             <dbl>       <dbl>                 <dbl>
#> 1     121              9121       52345                  5345
#> 2      54             21535          45                   353
#> 3     121               121         342                 12313
#> 4    9182                54        2121                   432
#> 5     122               121         121                    54
#> 6      55              9182          54                    23
#> # ℹ 4 more variables: `hea!@der|”:}{++-_|”:*&^\\2` <chr>,
#> #   `~\`13-askdj~_` <dbl>, `normal column` <dbl>, `LeSSnOrm-Al_Column` <dbl>
colnames(table_rds)
#> [1] "TESTING"                    "!!!IMPORTANT!!@"           
#> [3] "'valu-@’a"                  ">,./path<_67-twelve"       
#> [5] "hea!@der|”:}{++-_|”:*&^\\2" "~`13-askdj~_"              
#> [7] "normal column"              "LeSSnOrm-Al_Column"
```

We can use `usable_colnames` to roughly automatically clean up those
columns.

``` r
table_rds_clean <- table_rds
colnames(table_rds_clean) <- usable_colnames(table_rds, case_lower = TRUE, space_to = "_")
peek_table(table_rds_clean)
#>     ID testing important valua path67twelve header2 13askdj normal_column
#> 1    1     121      9121 52345         5345      ab     121          9121
#> 2    2      54     21535    45          353      bc      54         21535
#> 3    3     121       121   342        12313      de     121           121
#> 4    4    9182        54  2121          432     asd    9182            54
#> 5    5     122       121   121           54 qowieqw     122           121
#> 6    6      55      9182    54           23    osad      55          9182
#> 7  ...     ...       ...   ...          ...     ...     ...           ...
#> 51   5     122       121   121           54 qowieqw     122           121
#> 61   6      55      9182    54           23    osad      55          9182
#> 71   7     122       122   121          121    kmsa     122           122
#> 8    8    9183        55  9182           54     kal    9183            55
#> 9    9     123       122   122          121    poia     123           122
#> 10  10      56      9183    55         9182     qiw      56          9183
#>    lessnormalcolumn
#> 1             52345
#> 2                45
#> 3               342
#> 4              2121
#> 5               121
#> 6                54
#> 7               ...
#> 51              121
#> 61               54
#> 71              121
#> 8              9182
#> 9               122
#> 10               55
colnames(table_rds_clean)
#> [1] "testing"          "important"        "valua"            "path67twelve"    
#> [5] "header2"          "13askdj"          "normal_column"    "lessnormalcolumn"
```
