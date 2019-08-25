
cqc_multi_page_get_data <- function(cont, query, pages_query, verbose, type) {
  df_list <- list()

  df_list[[1]] <- dplyr::bind_rows(cont[[type]])
  ## Need a way to do this generically. Maybe type of object?

  seq_list <- seq(from = 2, to = cont$totalPages)

  for (i in seq_along(seq_list)) { ## Sequence along pages

    if (verbose == TRUE) {
      message(paste("Downloading", seq_list[[i]], "of", max(seq_list)))
    }

    query2 <- paste0(
      baseurl, query, pages_query, seq_list[[i]],
      getOption("cqc.partner.code")
    )

    x <- httr::GET(query2)

    if (httr::status_code(x) != "200") {
      stop(paste("Error code:", httr::status_code(x)), call. = FALSE)
    }

    suppressMessages(cont <- jsonlite::fromJSON(httr::content(x, "text")))

    df_list[[seq_list[[i]]]] <- dplyr::bind_rows(cont[[type]])
  }

  df <- dplyr::bind_rows(df_list)

  df
}
