#' Intersect a list of dates
#'
#' @param x A list of elements of class Date that describe when someone is
#' available for a beer. Commonly an output of the parse_dates() function.
#'
#' @return A list of Dates that are common for all elements of the list
#' (the Dates when everyone is available for a beer).
#' @export
#'
#' @examples
#' list_dates <- list(
#'   a = c("sab", "gio", "dom"),
#'   b = c("2023-04-27", "2023-04-30"),
#'   c = "2023-04-28 / 2023-04-30"
#' )
#'
#' parsed_dates <- parse_dates(list_dates)
#' decide_happy_hour(parsed_dates)
decide_happy_hour <- function(x) {
  lubridate::as_date(Reduce(lubridate::intersect , x))
}
