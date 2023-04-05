test_that("basic parsing works", {
  my_string_dates<-list(
    andrea="2023-04-05"
  )
  my_output<-list(
    andrea = lubridate::as_date("2023-04-05")
  )
  expect_equal(parse_dates(my_string_dates), my_output)
})
