test_that("inspection_area works", {

  insp1 <- cqc_inspection_areas()

  expect_length(insp1, 7)
  expect_true(tibble::is_tibble(insp1))

})
