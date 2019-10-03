
#' Individual providers
#'
#' Return information on individual providers
#' @param provider_id The ID of a given provider
#' @inheritParams cqc_locations_search
#' @return A tibble with information on a given CQC provider or providers.
#'
#' @rdname indproviders
#' @export
cqc_provider <- function(provider_id, clean_names = TRUE) {
  query <- paste0("providers/", provider_id, "?")

  df <- cqc_basic_query(query, clean_names)

  df
}


# Single provider's locations
#' @rdname indproviders
#' @export
cqc_provider_locations <- function(provider_id, clean_names = TRUE) {
  query <- paste0("providers/", provider_id, "/locations")

  cont <- cqc_basic_query(query, clean_names, type = "locations")

  cont
}

#' @rdname indproviders
#' @return A tibble with information the inspection area of a given provider.
#' @export
cqc_provider_inspection_areas <- function(provider_id, clean_names = TRUE) {
  query <- paste0("providers/", provider_id, "/inspection-areas")

  cont <- cqc_basic_query(query, clean_names)

  cont
}
