test_that("basic locations works", {
  skip_on_cran()

  # valid location
  location1 <- cqc_location("1-1428643301")
  expect_true(is.list(location1))

  # valid location inspection area
  insp_loc1 <- cqc_location_inspection_area("1-122710325")
  expect_true(is.list(insp_loc1))

  # Invalid location raises a structured cqcr_api_error after retries
  err <- expect_error(cqc_location("blaah"), class = "cqcr_api_error")
  expect_false(is.na(err$status))
  expect_gt(nchar(err$message), 0)

  options("cqc.subscription.key" = NULL) # Clear the option after the test
})
