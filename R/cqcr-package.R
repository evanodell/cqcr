
#' cqcr
#'
#' Access data from the 'Care Quality Commission', the health and adult social
#' care regulator for England. The 'Care Quality Commission' operates an
#' [API](https://www.cqc.org.uk/about-us/transparency/using-cqc-data#api),
#' with data available under the Open Government License. Data includes
#' information on service providers, locations such as hospitals, care homes
#' and medical clinics, and ratings and inspection reports. Registration is
#' not required, although you should use the [cqc_partner_code()] function
#' to set an indicator of the organisation you are from when querying the API.
#'
#' @importFrom utils URLencode download.file
#' @importFrom purrr compact
#' @importFrom dplyr as_tibble bind_rows
#' @importFrom httr VERB GET add_headers http_type content status_code
#' @importFrom jsonlite fromJSON
#' @importFrom anytime iso8601 anytime
#' @importFrom snakecase to_lower_camel_case to_snake_case
#' @importFrom rlang list2
#' @name cqcr
#' @aliases NULL cqcr-package
NULL

# Checking for API key on package load
.onLoad <- function(libname, pkgname) {
  if (is.null(getOption("cqc.partner.code"))) {
    key <- Sys.getenv("CQC_PARTNER_CODE")
    if (key != "") {
      if (substr(key, 1, 13) != "&partnerCode=") {
        key <- paste0("&partnerCode=", key)
      }
      options("cqc.partner.code" = key)
    }
  }
  invisible()
}
