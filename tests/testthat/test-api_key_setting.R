test_that("api key is set in simple test", {
  cqc_subscription_key(check_env = FALSE)
  key <- getOption("cqc.subscription.key")
  expect_true(!is.null(key))
})
