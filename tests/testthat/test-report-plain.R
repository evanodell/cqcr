test_that("plaintext reports works", {
  skip_on_cran()

  report2 <- cqc_reports("41d035b1-43e7-4857-be33-cf1b57cf4311",
    plain_text = TRUE
  )
})
