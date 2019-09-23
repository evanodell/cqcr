test_that("basic providers", {
  skip_on_cran()

  basic_prov1 <- cqc_provider("1-101639192")
  expect_true(is.list(basic_prov1))

  basic_prov2 <- cqc_provider_locations("1-101639192")
  expect_true(tibble::is_tibble(basic_prov2))
})
