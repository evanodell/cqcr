
#' Individual locations
#'
#' Retrieve data on individual locations or the inspection area(s) of a given
#' location.
#'
#' @param location_id The ID of a specific location
#' @inheritParams cqc_locations_search
#'
#' @return A list with information on the given location.
#' @rdname indlocations
#' @export
cqc_location <- function(location_id, verbose = TRUE, clean_names = TRUE) {
  query <- paste0("locations/", location_id)

  cont <- cqc_basic_query(query, clean_names)

  cont ## still returns a list - how best to process this list?
}


#' @rdname indlocations
#' @export
cqc_location_inspection_area <- function(location_id, clean_names = TRUE) {
  query <- paste0("locations/", location_id, "/inspection-areas")

  cont <- cqc_basic_query(query, clean_names, type = "inspectionAreas")

  cont
}
