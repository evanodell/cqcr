## Query construction function to reduce code-reuse

#' Perform a CQC API GET request, retrying transient failures
#'
#' Retries on non-200 responses (the CQC API has frequent transient blips)
#' with a short exponential backoff. If all attempts fail, raises a
#' structured `cqcr_api_error` condition carrying the HTTP status, the
#' request URL, and the response body, so callers can `tryCatch()` on it
#' and decide how to proceed (e.g. skip one item and keep going) instead of
#' receiving a malformed, mismatched-shape object.
#'
#' @param query the query string to append to the API base URL
#' @param max_tries number of attempts before giving up (default 3)
#' @param backoff_seconds base backoff in seconds between attempts,
#'   doubled after each failure (default 1)
cqc_query_construction <- function(query, max_tries = 3, backoff_seconds = 1) {
  subscription_key <- getOption("cqc.subscription.key")

  if (is.null(subscription_key)) {
    stop("CQC Subscription Key not set. The API will reject your request")
  } else if (!grepl("&", query)) {
    #do nothing
  }

  query2 <- paste0(
    baseurl, query
  )

  last_status <- NA
  last_body <- NA

  for (attempt in seq_len(max_tries)) {
    x <- httr::GET(query2, add_headers(`Ocp-Apim-Subscription-Key` = subscription_key))

    if (httr::status_code(x) == 200) {
      suppressMessages(cont <- jsonlite::fromJSON(httr::content(x, "text")))
      return(cont)
    }

    last_status <- httr::status_code(x)
    last_body <- httr::content(x, "text")

    if (attempt < max_tries) {
      Sys.sleep(backoff_seconds * (2 ^ (attempt - 1)))
    }
  }

  rlang::abort(
    message = paste0(
      "CQC API request failed after ", max_tries,
      " attempt(s) with status ", last_status, ": ", query2
    ),
    class = "cqcr_api_error",
    status = last_status,
    url = query2,
    body = last_body
  )
}
