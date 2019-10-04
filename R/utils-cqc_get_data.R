


cqc_get_data <- function(query, verbose, type, clean_names) {
  if (substr(query, (nchar(query) + 1) - 1, nchar(query)) %in% c("?", "&")) {
    pages_query <- "perPage=1000&page="
  } else {
    pages_query <- "&perPage=1000&page="
  }

  query2 <- paste0(
    baseurl, query, pages_query, "1",
    getOption("cqc.partner.code")
  )

  query2 <- gsub("?&partnerCode=", "?partnerCode=", query2, fixed = TRUE)

  x <- httr::GET(query2)

  if (httr::status_code(x) != "200") {
    stop(paste("Request returned error code:", httr::status_code(x)), call. = FALSE)
  }

  suppressMessages(cont <- jsonlite::fromJSON(httr::content(x, "text")))

  if (cont$totalPages > 1) {
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
