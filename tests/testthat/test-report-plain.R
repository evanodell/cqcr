
test_that("plaintext reports works", {
  skip_on_cran()

  cqc_subscription_key(check_env = FALSE) # get key

  report2 <- cqc_reports("41d035b1-43e7-4857-be33-cf1b57cf4311",
    plain_text = TRUE
  )

  expect_true(is.character(report2))
  expect_gt(nchar(report2), 10000)
})
