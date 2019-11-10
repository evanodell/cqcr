


cqc_get_data <- function(query, verbose, type, clean_names) {
  if (substr(query, (nchar(query) + 1) - 1, nchar(query)) %in% c("?", "&")) {
    pages_query <- "perPage=500&page="
  } else {
    pages_query <- "&perPage=500&page="
  }

  query2 <- paste0(query, pages_query, "1")

  cont <- cqc_query_construction(query2)

  if (cont$totalPages > 1) {
    if (verbose == TRUE) {
      message(paste("Downloading 1 of", cont$totalPages))
    }

    df <- cqc_multi_page_get_data(
      cont, query, pages_query,
      verbose, type
    )
  } else {
    df <- dplyr::bind_rows(cont[type])
  }

  df <- dplyr::as_tibble(df)

  if (clean_names == TRUE) {
    names(df) <- snakecase::to_snake_case(names(df))
  }

  df
}
