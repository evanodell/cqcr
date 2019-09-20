
#' Individual locations
#'
#' Retrieve data on individual locations or the inspection area(s) of a given
#' location.
#'
#' @param location_id The ID of a specific location
#' @inheritParams cqc_locations
#'
#' @return A list with information on the given location
#' @rdname indlocations
#' @export
cqc_location <- function(location_id, verbose = TRUE, clean_names = TRUE) {
  query <- paste0("locations/", location_id)

  cont <- cqc_basic_query(query, clean_names)

  cont ## still returns a list
}




# "https://api.cqc.org.uk/public/v1/locations/{location_id}/inspection-areas"

# https://anypoint.mulesoft.com/exchange/portals/care-quality-commission-5/4d36bd23-127d-4acf-8903-ba292ea615d4/cqc-syndication-1/1.0.37/console/method/%23850/
#' @rdname indlocations
#' @export
cqc_location_inspection_area <- function(location_id, clean_names = TRUE) {
  query <- paste0("locations/", location_id, "/inspection-areas")

  cont <- cqc_basic_query(query, clean_names, type = "inspectionAreas")

  cont
}
