

#' @importFrom utils URLencode download.file
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
