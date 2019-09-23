
## Basic query function
cqc_basic_query <- function(query, clean_names, type = "") {
  query2 <- paste0(baseurl, query, getOption("cqc.partner.code"))

  query2 <- gsub("?&partnerCode=", "?partnerCode=", query2)

  x <- httr::GET(query2)

  if (httr::status_code(x) != "200") {
    stop(paste("Error code:", httr::status_code(x)), call. = FALSE)
  }

  suppressMessages(cont <- jsonlite::fromJSON(httr::content(x, "text"),
    flatten = TRUE
  ))

  if (type %in% c("inspectionAreas", "locations")) {
    cont <- cont[[type]]
  }

  if (class(cont) == "list") {
    cont <- purrr::compact(cont)
  }

  if (clean_names == TRUE) {
    names(cont) <- snakecase::to_snake_case(names(cont))
  }

  cont
}
