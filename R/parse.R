#' Parse string dates into dates
#'
#' @param x a list of character dates
#'
#' @return a list of Date vectors
#' @export
#'
#' @examples 1 + 1
parse_dates <- function(x){
  lapply(x, lubridate::as_date)
}
