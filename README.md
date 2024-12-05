
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

## Example

The current included functions are:

``` bash
ls R
#> generate_dummy_df.R
#> peek_table.R
#> range_to_numeric.R
#> usable_colnames.R
```

``` r
library(mytoolkitr)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
