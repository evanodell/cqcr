test_that("big providers works", {

  prov1 <- cqc_providers(local_authority = "Tower Hamlets")

  expect_true(tibble::is_tibble(prov1))
  expect_length(prov1, 2)

})
