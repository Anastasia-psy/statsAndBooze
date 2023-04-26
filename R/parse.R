#' Parse list of strings into dates
#'
#' @details Please notice that each date must be specified using the
#' YYYY-MM-DD format. A time interval should be specified using the following format:
#' "YYYY-MM-DD / YYYY-MM-DD", where the first date is the start of the interval,
#' and the second date is the end of the interval.
#'
#' @param x A list of strings that describe when someone is available for a beer
#'
#' @return A list of Dates when someone is available for a beer. The strings are
#' converted into objects of class Date. The intervals are represented by a sequence of
#' Dates within the interval.
#' @export
#'
#' @examples
#' list_dates <- list(
#'   a = c("2023-04-01", "2023-04-03 / 2023-04-05"),
#'   b = c("2023-04-02", "2023-04-03"),
#'   c = "2023-04-02 / 2023-04-03"
#' )
#' (parse_dates(list_dates))
parse_dates<-function(x) {
  lapply(x, function(x) {
    lubridate::as_date(unlist(mapply(function(x,y) seq(x, y, by=1),
                                     lubridate::ymd(lubridate::int_start(lubridate::interval(x))),
                                     lubridate::ymd(lubridate::int_end(lubridate::interval(x))))), origin="1970-01-01")
  }
  )
}
