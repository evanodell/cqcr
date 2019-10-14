
#' Location Details
#'
#' @param x A data frame with location IDs, e.g. one
#' returned by [cqc_locations_search()].
#' @param location_col The name of the column with location IDs, defaults to
#' `"location_id"`.
#' @param verbose If `TRUE`, displays progress bar on data retrieval. Requires
#' the [pkg::abc-pbapply] package to be installed. If `verbose=TRUE` and
#' [pkg::abc-pbapply] is not not installed, will display a warning and
#' continue silently.
#' @inheritParams cqc_locations_search
#'
#' @return A list with location details
#' @export
#'
#' @examples
#' \donttest{
#' loc1 <- cqc_locations_search(care_home = TRUE, local_authority = "Hackney")
#'
#' loc1_details <- cqc_location_details(loc1)
#' }
#'
cqc_location_details <- function(x, location_col = "location_id",
                                 verbose = TRUE, clean_names = TRUE) {
  if (is.data.frame(x) == FALSE) {
    stop("x must be a data frame")
  }

  if (verbose) {
    if (requireNamespace("pbapply", quietly = TRUE)) {
      loc_list <- pbapply::pblapply(x[[location_col]], cqc_location,
                                    clean_names = clean_names)
    } else {
      warning("Package \"pbapply\" is needed if `verbose=TRUE`
      Please install to see a progress bar.",
              call. = TRUE, immediate. = TRUE
      )

      loc_list <- lapply(x[[location_col]], cqc_location,
                         clean_names = clean_names
      )

    }

  } else {
    loc_list <- lapply(x[[location_col]], cqc_location,
      clean_names = clean_names
    )
  }

  loc_list
}
