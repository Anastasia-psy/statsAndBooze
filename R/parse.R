#' Parse list of strings into dates
#'
#' @details Please notice that each date must be specified using the
#' YYYY-MM-DD format. A time interval should be specified using the following format:
#' "YYYY-MM-DD / YYYY-MM-DD", where the first date is the start of the interval,
#' and the second date is the end of the interval. A day can also be specified as a day of
#' week in the local language in abbreviated form. To see the available values
#' for days of week run the function lubridate::wday(x, label = TRUE), e.g. lubridate::wday("2023-04-20", label = TRUE).
#' You can specify more than one day of week, but cannot use intervals for days of week.
#' The names of the weekdays refer to the subsequent 7 days with respect to the current day
#' (including) when the function is run. For each person the dates should be specified or in
#' date form or as days of the week, but not in a mixed form.
#'
#' @param x A list of strings that describe when someone is available for a beer
#' (dates in string format or days of week).
#'
#' @return A list of Dates when someone is available for a beer. The strings are
#' converted into objects of class Date. The intervals are represented by a sequence of
#' Dates within the interval.
#' @export
#'
#' @examples
#' list_dates <- list(
#'   a = c("sab", "gio", "dom"),
#'   b = c("2023-04-27", "2023-04-30"),
#'   c = "2023-04-28 / 2023-04-30"
#' )
#' (parse_dates(list_dates))
parse_dates<-function(x) {
  lapply(x, function(x){
    if (all(!stringr::str_detect(unlist(x), paste(c("lun", "mar", "mer", "gio", "ven", "sab", "dom"),collapse = '|')) == TRUE)) {
      lubridate::as_date(unlist(mapply(function(x,y) seq(x, y, by=1),
                                       lubridate::ymd(lubridate::int_start(lubridate::interval(x))),
                                       lubridate::ymd(lubridate::int_end(lubridate::interval(x))))), origin="1970-01-01")

    }
    else {
      d<-lubridate::today()
      next_week <- seq(d,d+6,by = "1 day")
      next_week_dd<-data.frame(
        date = next_week,
        weekday = lubridate::wday(next_week, label = TRUE))
      next_week_dd[next_week_dd$weekday %in% unlist(x), "date"]
    }
  }
  )
}
