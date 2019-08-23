


#' Inspection areas
#'
#' Retrieves all CQC inspection areas. See the
#' [full documentation](https://anypoint.mulesoft.com/exchange/portals/care-quality-commission-5/4d36bd23-127d-4acf-8903-ba292ea615d4/cqc-syndication-1/1.0.37/console/endpoint/%231646/)
#' for more details.
#'
#' @inheritParams cqc_locations
#' @return A tibble with inspection areas.
#' @export
cqc_inspection_areas <- function (clean_names = TRUE) {

  query <- paste0("inspection-areas")

  cont <- cqc_basic_query(query, clean_names)

  df <- dplyr::as_tibble(cont[["inspectionAreas"]])

  if (clean_names == TRUE) {
    names(df) <- snakecase::to_snake_case(names(df))
  }

  df

}
