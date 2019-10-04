test_that("big location works", {
  skip_on_cran()

  loc1 <- cqc_locations_search(care_home = TRUE, local_authority = "Redbridge")

  expect_true(tibble::is_tibble(loc1))
  expect_length(loc1, 3)

  loc2 <- cqc_locations_search(
    care_home = "blah",
    gac_service_type_description = "Acute services with overnight beds",
    local_authority = "Tower Hamlets"
  )

  expect_true(tibble::is_tibble(loc2))
  expect_length(loc2, 3)
  # expect_true("Mile End Hospital" %in% loc2$locationName)


  loc3 <- cqc_locations_search(
    local_authority = "Redbridge", overall_rating = "Good",
    care_home = FALSE
  )

  expect_true(tibble::is_tibble(loc3))
  expect_length(loc3, 3)

  loc4 <- cqc_locations_search(
    local_authority = c("Redbridge", "Hackney"),
    inspection_directorate = "Hospitals"
  )

  expect_true(tibble::is_tibble(loc4))
  expect_length(loc4, 3)
  expect_true("Homerton University Hospital" %in% loc4$location_name)


  loc5 <- cqc_locations_search(
    primary_inspection_category_name = "Slimming Clinics"
  )

  expect_true(tibble::is_tibble(loc5))
  expect_length(loc5, 3)

  loc6 <- cqc_locations_search(
    regulated_activity = "Accommodation for persons who require treatment for substance misuse"
  )

  expect_true(tibble::is_tibble(loc6))
  expect_length(loc6, 3)

  loc7 <- cqc_locations_search(
    report_type = "Location", local_authority = "Tower Hamlets"
  )

  expect_true(tibble::is_tibble(loc7))
  expect_length(loc7, 3)


  loc8 <- cqc_locations_search(local_authority = "Hackney&")

  expect_true(tibble::is_tibble(loc8))
  expect_length(loc8, 3)

  loc9 <- cqc_locations_search(care_home = TRUE, region = "North West")

  expect_true(tibble::is_tibble(loc9))
  expect_length(loc9, 3)
})
