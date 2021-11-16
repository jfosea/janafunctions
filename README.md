
<!-- README.md is generated from README.Rmd. Please edit that file -->

**NOTE: This is a toy package created for my assignment for [STAT
545B](https://stat545.stat.ubc.ca/assignments/assignment-b2/) class. It
is not meant to be extensive but rather is used as a practice for
building packages.**

# janafunctions

<!-- badges: start -->
<!-- badges: end -->

## Description

dplyr’s `group_by` and `summarise` functions are often used in
conjuction with each other, specifically, finding the mean of a
quantitative variable by group. In addition to the summary table
provided by these two functions, a boxplot of the quanitative variable
by group is often helpful in showing the distribution of the data. This
package provides a function, `calculate_groups_mean`, that combines the
funcitonality of `group_by` and `summarise` as well as visualization
through a boxplot.

## Installation

You can install the released version of janafunctions from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("janafunctions")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jfosea/janafunctions")
```

## Example

This is a basic example which shows you how to solve a common problem. I
will use data sets from the
[datasets](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html)
package, particularly the *InsectSprays* data set. Here is a preview of
the data.

``` r
library(janafunctions)
library(datasets)
head(InsectSprays)
#>   count spray
#> 1    10     A
#> 2     7     A
#> 3    20     A
#> 4    14     A
#> 5    14     A
#> 6    12     A
```

I want to look at the mean number of *counts* grouped by *spray*. And so
I will run the following into my function `calculate_group_means`

``` r
calculate_group_means(InsectSprays, spray, count)
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

    #> # A tibble: 6 x 2
    #>   spray  mean
    #>   <fct> <dbl>
    #> 1 A     14.5 
    #> 2 B     15.3 
    #> 3 C      2.08
    #> 4 D      4.92
    #> 5 E      3.5 
    #> 6 F     16.7

The results show a `tibble` summary table that contains the means by
groups. In addition, the function outputs a boxplot by groups.
