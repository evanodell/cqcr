
## Basic query function
cqc_basic_query <- function(query, clean_names, type = "") {
  cont <- cqc_query_construction(query)

  if (type %in% c("inspectionAreas", "locations")) {
    cont <- dplyr::as_tibble(cont[[type]])
  }

  if ("list" %in% class(cont)) {
    cont <- purrr::compact(cont)
  }

  if (clean_names == TRUE) {
    names(cont) <- snakecase::to_snake_case(names(cont))
  }

  cont
}
