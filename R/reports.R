

## Not working

#' Title
#'
#' @param inspection_report_link_id
#' @param related_document_type
#' @param plain_text
#' @param verbose
#'
#' @return
#' @export
#'
#' @examples
#'
cqc_reports <- function(inspection_report_link_id,
                        related_document_type = NULL,
                        plain_text = TRUE, verbose = TRUE) {
  query <- paste0(
    baseurl, "reports/",
    inspection_report_link_id, related_document_type
  )

  x <- httr::VERB(
    verb = "GET", url = query,
    httr::add_headers(Accept = "text/plain")
  )

  if (httr::http_type(x) == "text/plain") {
    cont <- httr::content(x)
  } else {
    # SAVE PDF LOCALLY?
  }
}
