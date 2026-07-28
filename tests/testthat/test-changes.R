test_that("cqc_changes works", {
  skip_on_cran()

  changes_provider <- cqc_changes(
    organisation_type = "provider",
    start_date = "2025-03-10",
    end_date = "2025-03-15"
  )

  expect_true(tibble::is_tibble(changes_provider))

  changes_location <- cqc_changes(
    organisation_type = "LoCAtiOn",
    start_date = "2025-03-10",
    end_date = "2025-03-15"
  )

  expect_true(tibble::is_tibble(changes_location))
})
