
#' Inspection reports
#'
#' Return CQC inspection reports, either as a plain text character vector,
#' or by saving a PDF to the chosen directory.
#'
#' @param inspection_report_link_id The ID of the report to return.
#' @param related_document_type An optional qualifier to retrieve a document
#' related to the main report. This parameter is the Related Document Type
#' found from the relatedDocuments response object. e.g.
#' "Use%20of%20Resources". When this parameter is absent, the main report
#' for the inspection is returned.
#' @param plain_text If `TRUE`, returns plain text of report. Otherwise returns
#'  a PDF. Defaults to `TRUE`.
#' @param attempt_pdf Set behaviour when attempting to retrieve plain text
#' of reports. If `TRUE`, attempts to retrieve a PDF if the plain text of the
#' report is not available and saves it to `directory`.
#' Ignored if `plain_text == FALSE`. Defaults to `FALSE`.
#' @param directory The directory to save PDF files in. Defaults to
#' current working directory.
#' @param file_name A custom file name given to a PDF file being saved locally.
#' If `NULL`, saves files as `inspection_report_link_id`.pdf.
#' Defaults to `NULL`.
#' @inheritParams cqc_locations_search
#'
#' @return Either a PDF of the inspection report saved to the working directory,
#' or a character vector with the plain text of the inspection report,
#' depending on parameters used.
#' @export
#'
#' @examples
#' \donttest{
#' report2 <- cqc_reports("41d035b1-43e7-4857-be33-cf1b57cf4311")
#' }
#'
cqc_reports <- function(inspection_report_link_id,
                        related_document_type = NULL,
                        plain_text = TRUE, attempt_pdf = FALSE,
                        directory = NULL, file_name = NULL, verbose = TRUE) {

  # Retrieve the API key from the R options
  subscription_key <- getOption("cqc.subscription.key")

  # Check if the API key is set
  if (is.null(subscription_key)) {
    stop("API key not set. Please run cqc_subscription_key() first.", call. = FALSE)
  }

  rel_doc_query <- if (is.null(related_document_type)) {
    ""
  } else {
    paste0("/", URLencode(related_document_type))
  }

  query <- paste0(
    baseurl, "reports/",
    inspection_report_link_id, rel_doc_query
  )

  if (plain_text) {
    x <- httr::VERB(
      verb = "GET", url = query,
      httr::add_headers(Accept = "text/plain", `Ocp-Apim-Subscription-Key` = subscription_key)
    )

    if (httr::http_type(x) == "text/plain") {
      cont <- httr::content(x)
      cont
    } else if (attempt_pdf) {
      x <- httr::VERB(
        verb = "GET", url = query,
        httr::add_headers(`Ocp-Apim-Subscription-Key` = subscription_key)
      )
      writeBin(httr::content(x, "raw"), paste0(directory, inspection_report_link_id, ".pdf"))
    } else {
      code_result <- httr::status_code(x)
      if (code_result == 200) {
        stop(paste("Error: Report is available, but not in chosen format"),
             call. = FALSE
        )
      } else {
        stop(paste("Error code:", httr::status_code(x)), call. = FALSE)
      }
    }
  } else {
    x <- httr::VERB(
      verb = "GET", url = query,
      httr::add_headers(`Ocp-Apim-Subscription-Key` = subscription_key)
    )
    writeBin(httr::content(x, "raw"), paste0(directory, inspection_report_link_id, ".pdf"))
  }
}
