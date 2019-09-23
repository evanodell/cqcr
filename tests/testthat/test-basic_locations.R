test_that("basic locations works", {
  skip_on_cran()

  location1 <- cqc_location("1-1428643301")
  expect_true(is.list(location1))

  expect_error(cqc_location("blaah"))

  insp_loc1 <- cqc_location_inspection_area("1-122710325")

  expect_true(is.list(insp_loc1))
})
