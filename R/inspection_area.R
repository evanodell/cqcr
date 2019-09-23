
#' Inspection areas
#'
#' Retrieves all CQC inspection areas.
#'
#' @inheritParams cqc_locations_search
#' @return A tibble with inspection areas.
#' @export

cqc_inspection_areas <- function(clean_names = TRUE) {
  query <- "inspection-areas"

  df <- cqc_basic_query(query, clean_names, "inspectionAreas")

  df
}
