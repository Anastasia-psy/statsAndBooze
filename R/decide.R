#' Title Decide the best day gor a happy hour.
#'
#' @param x A list of date vectors
#'
#' @return The set of common dates
#' @export
#'
#' @examples 1+1
decide_happy_hour <- function(x) {
  lubridate::as_date(Reduce(lubridate::intersect , x))
}
