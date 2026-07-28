test_that("big location works", {
  skip_on_cran()

  # Location search test ----------------------------------------------------
  loc1 <- cqc_locations_search(care_home = TRUE, local_authority = "Redbridge")

  expect_true(tibble::is_tibble(loc1))
  # this returns a tibble with 1 column, which contains a df with 3 cols
  expect_length(loc1, 1)

  loc2 <- cqc_locations_search(
    care_home = "blah",
    gac_service_type_description = "Acute services with overnight beds",
    local_authority = "Tower Hamlets"
  )

  expect_true(tibble::is_tibble(loc2))
  # this returns a tibble with 1 column, which contains a df with 3 cols
  expect_length(loc2, 1)
   expect_true("Mile End Hospital" %in% loc2$locations$locationName)


  loc3 <- cqc_locations_search(
    local_authority = "Redbridge", overall_rating = "Good",
    care_home = FALSE
  )

  expect_true(tibble::is_tibble(loc3))
  expect_length(loc3, 1)

  loc4 <- cqc_locations_search(
    local_authority = c("Redbridge", "Hackney"),
    inspection_directorate = "Hospitals"
  )

  expect_true(tibble::is_tibble(loc4))
  # this returns a tibble with 1 column, which contains a df with 3 cols
  expect_length(loc4, 1)
  expect_true("Homerton University Hospital" %in% loc4$locations$locationName)

  loc6 <- cqc_locations_search(
    regulated_activity = "Accommodation for persons who require treatment for substance misuse"
  )

  expect_true(tibble::is_tibble(loc6))
  expect_length(loc6, 1)
  expect_gte(nrow(loc6), 10) # reduced test from 400 - likely terminology change

  loc7 <- cqc_locations_search(
    report_type = "Location", local_authority = "Tower Hamlets"
  )

  expect_true(tibble::is_tibble(loc7))
  expect_length(loc7, 1)


  loc8 <- cqc_locations_search(local_authority = "Hackney&")

  expect_true(tibble::is_tibble(loc8))
  expect_length(loc8, 1)

  expect_message(loc9 <- cqc_locations_search(
    care_home = TRUE,
    region = "North West"
  ))

  expect_true(tibble::is_tibble(loc9))
  expect_length(loc9, 3)
  expect_gte(nrow(loc9), 3000)

  # Location details test ---------------------------------------------------
  loc4 <- loc4$locations
  loc4_details <- cqc_location_details(loc4
                                       , location_col = "locationId")

  expect_true(is.list(loc4_details))
  expect_equal(class(loc4_details[[1]]), "list")
  # cuz why not use two different ways of checking?

  loc3 <- loc3$locations
  loc3_details <- cqc_location_details(loc3
                                       , location_col = "locationId"
                                       , verbose = FALSE)
  expect_true(is.list(loc3_details))
  expect_equal(class(loc3_details[[1]]), "list")
})
