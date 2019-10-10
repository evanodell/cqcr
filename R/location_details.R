
#' Location Details
#'
#' @param x A data frame with location IDs, e.g. one
#' returned by [cqc_location_search()].
#' @param location_col The name of the column with location IDs, defaults to
#' `"location_id"`.
#' @inheritParams cqc_locations_search
#'
#' @return A list with location details
#' @export
#'
#' @examples \donttest{
#' loc1 <- cqc_locations_search(care_home = TRUE, local_authority = "Hackney")
#'
#' loc1_details <- cqc_location_details(loc1)
#' }

cqc_location_details <- function(x, location_col = "location_id",
                                 verbose = TRUE, clean_names = TRUE) {

  if (is.data.frame(x) == FALSE) {
    stop("x must be a data frame")
  }

  if (verbose) {
    if (!requireNamespace("pbapply", quietly = TRUE)) {
      stop("Package \"pbapply\" is needed if `verbose==TRUE`
      Please install or use `verbose==FALSE`",
           call. = FALSE)
    }

    loc_list <- pbapply::pblapply(x[[location_col]], cqc_location,
                                  clean_names = clean_names)
  } else {
    loc_list <- lapply(x[[location_col]], cqc_location,
                       clean_names = clean_names)
  }

    loc_list
}

# x <- dplyr::sample_n(loc1, 20)
#
# care_home_list <- lapply(x$location_id, cqc_location)
#
# test_function <- function(x) {
#
# loc_list <- list()
#
# for(i in 1:nrow(x)) {
#   loc_list[[i]] <- cqc_location(x$location_id[[i]])
# }
#
# loc_list
#
# }
#
# library(microbenchmark)
#
# mbm <- microbenchmark(
#   loop = test_function(x),
#   apply = lapply(x$location_id, cqc_location),
#   times=5
# )

