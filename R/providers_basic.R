
#' Individual providers
#'
#' Return information on individual providers
#'
#' @inheritParams cqc_locations
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
#' @export
cqc_provider_inspection_areas <- function(provider_id, clean_names = TRUE) {
  query <- paste0("providers/", provider_id, "/inspection-areas")

  cont <- cqc_basic_query(query, clean_names)

  cont
}
