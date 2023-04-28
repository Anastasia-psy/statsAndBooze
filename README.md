
<!-- README.md is generated from README.Rmd. Please edit that file -->

# statsAndBooze

<!-- badges: start -->
<!-- badges: end -->

The goal of statsAndBooze is to facilitate finding the nearest date for
a beer when all the participants are available.

## Installation

You can install the development version of statsAndBooze from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Anastasia-psy/statsAndBooze")
```

## Usage and Examples

To load the package:

``` r
library(statsAndBooze)
```

For defining a suitable date for a beer first the input (a list of names
with the available dates for each participant) should be transformed
from string to data format. Use the function `parse_dates()` for this
task.

In the list you should specify the dates in YYYY-MM-DD format like in
the example below:

``` r
dates<- list(
  andrea = "2023-03-29", # exactly with this format
  federico = "2023-03-30" # exactly with this format
)

parse_dates(dates)
#> $andrea
#> [1] "2023-03-29"
#> 
#> $federico
#> [1] "2023-03-30"
```

You can also specify a time interval when a participant is available.
This should be done in the following format: YYYY-MM-DD / YYYY-MM-DD
(see example).

``` r
dates <- list(
  andrea = c("2023-04-01", "2023-04-03 / 2023-04-05"),
  federico = c("2023-04-02", "2023-04-03"),
  chiara = "2023-04-02 / 2023-04-03"
)

parse_dates(dates)
#> $andrea
#> [1] "2023-04-01" "2023-04-03" "2023-04-04" "2023-04-05"
#> 
#> $federico
#> [1] "2023-04-02" "2023-04-03"
#> 
#> $chiara
#> [1] "2023-04-02" "2023-04-03"
```

You can also specify the dates using the workdays names in your local
language in the abbreviated form. To see the available values for days
of week run the function lubridate::wday(x, label = TRUE).The names of
the weekdays refer to the subsequent 7 days with respect to the current
day (including) when the function is run. For each person the dates
should be specified or in date form or as days of the week, but not in a
mixed form. See example below:

``` r
lubridate::wday("2023-04-28", label = TRUE)
#> [1] ven
#> Levels: dom < lun < mar < mer < gio < ven < sab

dates <- list(
  andrea = c("sab", "gio", "dom"),
  federico = c("2023-04-27", "2023-04-30"),
  chiara = "2023-04-28 / 2023-04-30"
)

parse_dates(dates)
#> $andrea
#> [1] "2023-04-29" "2023-04-30" "2023-05-04"
#> 
#> $federico
#> [1] "2023-04-27" "2023-04-30"
#> 
#> $chiara
#> [1] "2023-04-28" "2023-04-29" "2023-04-30"
```

Finally to define the date for a beer you need the function
`decide_happy_hour()`, which takes the output of the function
`parse_dates` as input. In case there are several dates when all the
participants are available, the function returns the nearest suitable
date. See the exampel below.

    #> [1] "2023-04-30"

The function returns `Date of length 0` if there is no date when all the
paricipants are available.
