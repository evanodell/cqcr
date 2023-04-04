
## Utility retrieval function
cqc_get_data <- function(query, verbose, type, clean_names, page_size = 500) {
  if (substr(query, (nchar(query) + 1) - 1, nchar(query)) %in% c("?", "&")) {
    pages_query <- paste0("perPage=", page_size, "&page=")
  } else {
    pages_query <- paste0("&perPage=", page_size, "&page=")
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
    df <- cont[type]
  }

  df <- dplyr::as_tibble(df)

  if (clean_names == TRUE) {
    names(df) <- snakecase::to_snake_case(names(df))
  }

  df
}
