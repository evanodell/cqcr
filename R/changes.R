
# https://anypoint.mulesoft.com/exchange/portals/care-quality-commission-5/4d36bd23-127d-4acf-8903-ba292ea615d4/cqc-syndication-1/1.0.37/console/method/%231570/

#' Changes
#'
#' Return ID's of CQC providers or locations that have reported changes in a
#' given time period.
#'
#' @param organisation_type One of "provider" or "location".
#' @param start_date The start of the date range, in `"YYYY-MM-DD"` format,
#' or any vector of character, integer or numeric that can be be parsed
#' with [anytime::anytime][anytime::anytime].
#' @param end_date The end of the date range, in `"YYYY-MM-DD"` format,
#' or any vector of character, integer or numeric that can be be parsed
#' with [anytime::anytime][anytime::anytime].
#' @inheritParams cqc_locations
#'
#' @return A tibble of all providers or locations that had reported changes in
#' the given period
#' @export
#'
#' @examples
#' \donttest{
#' changes_location <- cqc_changes(
#'   organisation_type = "LoCAtiOn",
#'   start_date = "2019-03-10",
#'   end_date = "2019-03-12"
#' )
#' }
#'
cqc_changes <- function(organisation_type = c("provider", "location"),
                        start_date = "2000-01-01", end_date = Sys.Date(),
                        verbose = TRUE, clean_names = TRUE) {
  time_query <- paste0(
    "?startTimestamp=",
    anytime::iso8601(anytime::anytime(start_date)), "Z&",
    "endTimestamp=",
    anytime::iso8601(anytime::anytime(end_date)), "Z"
  )

  query <- paste0("changes/", tolower(organisation_type), time_query)

  df <- cqc_get_data(query,
    verbose = verbose, type = "changes",
    clean_names = clean_names
  )

  df
}
