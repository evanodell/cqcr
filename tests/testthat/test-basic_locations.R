test_that("basic locations works", {
  location1 <- cqc_location("1-1428643301")

  location2 <- cqc_location("1-122710325")

  location3 <- cqc_location("1-1000210669")

  insp_loc1 <- cqc_location_inspection_area("1-122710325")

  insp_loc2 <- cqc_location_inspection_area("1-545611283")
})
