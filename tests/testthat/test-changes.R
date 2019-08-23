test_that("cqc_changes works", {

  changes_provider <- cqc_changes(organisation_type = "provider",
                                   start_date = "2019-03-10",
                                  end_date = "2019-03-12")

  expect_equal(nrow(changes_provider), 31)

  changes_location <- cqc_changes(organisation_type = "LoCAtiOn",
                                  start_date = "2019-03-10",
                                  end_date = "2019-03-14")

})
