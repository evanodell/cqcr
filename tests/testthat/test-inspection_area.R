test_that("inspection_area works", {
  skip_on_cran()

  insp1 <- cqc_inspection_areas()

  expect_length(insp1, 8)
  expect_true(tibble::is_tibble(insp1))
})
