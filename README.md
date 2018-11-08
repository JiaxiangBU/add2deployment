
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

<!-- README.md is generated from README.Rmd. Please edit that file -->

# add2deployment

The goal of add2deployment is to R functions for translating R to SQL
for deployment.

In the early phase of modeling, the user data is not large, thus the
modelers choose to deploy the model they train on Mysql or Impala.

I do such sort of things a lot and think build some defined functions to
reduce the translating time (from R code to SQL-like code).

## Installation

You can install the released version of add2deployment from
[Github](https://github.com/JiaxiangBU/add2deployment) with:

``` r
devtools::install_github('JiaxiangBU/add2deployment')
```

``` r
library(add2deployment)
```

## Example

See the vignettes.
