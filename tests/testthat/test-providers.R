test_that("big providers works", {
  skip_on_cran()

  prov1 <- cqc_providers(local_authority = "Tower Hamlets")

  expect_true(tibble::is_tibble(prov1))
  # returns a list containing data frame
  expect_length(prov1, 1)
})
