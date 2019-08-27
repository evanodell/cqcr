
#' Partner Code
#'
#' The CQC wants all organisations using this API to add an additional query
#' identifying themselves to all queries.
#' If you are a CQC Syndication partner the value for this code
#' will be provided to you, otherwise an informative but concise code
#' representing your organisation should be chosen. The partner code can be set
#' as an environmental variable named `CQC_PARTNER_CODE`, or using this
#' function. If set, it will automatically be included in all queries.
#'
#' @param check_env If TRUE, will check the environment variable
#'   `CQC_PARTNER_CODE` first before asking for user input.
#'
#' @export

cqc_partner_code <- function(check_env = FALSE) {
  if (check_env) {
    code <- Sys.getenv("CQC_PARTNER_CODE")
    if (code != "") {
      message("Updating CQC_PARTNER_CODE environment variable...")
      options("cqc.partner.code" = paste0("&partnerCode=", code))
      return(invisible())
    } else {
      warning("Couldn't find environment variable 'CQC_PARTNER_CODE'")
    }
  }

  if (interactive()) {
    code <- readline("Please enter your partner code and press enter: ")
  } else {
    cat("Please enter your partner code and press enter: ")
    code <- readLines(con = "stdin", n = 1)
  }

  if (identical(code, "")) {
    stop("CQC partner code entry failed", call. = FALSE)
  }

  message("Updating CQC_PARTNER_CODE environment variable...")
  options("cqc.partner.code" = paste0("&partnerCode=", utils::URLencode(code)))
  invisible()
}
