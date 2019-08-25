
#' Inspection areas
#'
#' Retrieves all CQC inspection areas.
#'
#' @inheritParams cqc_locations
#' @return A tibble with inspection areas.
#' @export

cqc_inspection_areas <- function(clean_names = TRUE) {
  query <- paste0("inspection-areas")

  cont <- cqc_basic_query(query, clean_names)

  df <- dplyr::as_tibble(cont[["inspectionAreas"]])

  if (clean_names == TRUE) {
    names(df) <- snakecase::to_snake_case(names(df))
  }

  df
}
