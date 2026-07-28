
#' API Subscription Key
#'
#' Function to add a subscription key to API queries.
#'
#' @details The CQC requires all organisations using this API to obtain
#' an API key from their website and append to queries
#'
#' @details According to the CQC's documentation,
#' Users will now need to authenticate.
#' Authentication helps us understand how people use our API
#' and make sure that it fits with your needs.
#' It also means that we can tell you about any future changes.
#'
#' @param check_env If TRUE, will check the environment variable
#'   `CQC_SUBSCRIPTION_KEY` first before asking for user input.
#'
#' @export

cqc_subscription_key <- function(check_env = FALSE) {
  if (check_env) {
    code <- Sys.getenv("CQC_SUBSCRIPTION_KEY")
    if (code != "") {
      message("Updating CQC_SUBSCRIPTION_KEY environment variable...")
      options("cqc.subscription.key" = paste0(code))
      return(invisible())
    } else {
      warning("Couldn't find environment variable 'CQC_SUBSCRIPTION_KEY'")
    }
  }

  if (interactive()) {
    code <- readline("Please enter your subscription key and press enter: ")
  } else {
    cat("Please enter your subscription key and press enter: ")
    code <- readLines(con = "stdin", n = 1)
  }

  if (identical(code, "")) {
    stop("CQC subscription key entry failed", call. = FALSE)
  }

  message("Updating CQC_SUBSCRIPTION_KEY environment variable...")
  options("cqc.subscription.key" = paste0(code))
  invisible()
}
