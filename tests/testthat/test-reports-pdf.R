test_that("report PDF retrieval works", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  skip_on_covr()

  cqc_subscription_key(check_env = FALSE) # get key

  report1 <- cqc_reports(
    inspection_report_link_id = "5c4e83b5-68da-4bae-941b-694a4cd9e808",
    plain_text = FALSE
  )

  expect_true(file.exists("5c4e83b5-68da-4bae-941b-694a4cd9e808.pdf"))

  file.remove("5c4e83b5-68da-4bae-941b-694a4cd9e808.pdf")
  ## Only run this test locally
})
