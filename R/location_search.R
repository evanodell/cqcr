

#' Location Queries
#'
#' Returns all available locations, subject to given parameters.
#'
#' @details All parameters except `care_home`, `verbose` and `clean_names`
#' accept an array of values, and will return locations matching any of the
#' values of those arrays, subject to other parameters. Search parameters are
#' case sensitive, e.g. "hospitals"
#'
#' @param care_home If `TRUE`, only returns care homes. If `FALSE`, returns
#' all locations except care homes. Defaults to `NULL` and returns all
#' locations including care homes.
#' @param onspd_ccg_code Include only locations where the ONSPD CCG code
#' of the geographic area covering the Location's postcode matches one of
#' the values of this parameter.
#' @param onspd_ccg_name Include only locations where the ONSPD CCG name
#' of the geographic area covering the Location's postcode matches one of the
#' values of this parameter.
#' @param ods_ccg_code Include only locations where the ODS code of the CCG
#' selected by this organisation is known and matches one of the values of
#'  this parameter.
#' @param ods_ccg_name Include only locations where the ODS name of the CCG
#' selected by this organisation is known and matches one of the values of
#' this parameter.
#' @param gac_service_type_description GAC Service Type Descriptions,
#' matching one or more values of this parameter.
#' e.g. "Acute services with overnight beds".
#' @param constituency Location is in a given parliamentary constituency
#' @param local_authority Location is in a given local authority.
#' @param inspection_directorate The type of inspection directorate. Accepts
#' one or more off "Adult social care", "Hospitals",
#' "Primary medical services" or "Unspecified".
#' @param primary_inspection_category_code  The primary inspection
#' category code. e.g. "H1"
#' @param primary_inspection_category_name The primary inspection
#' category name. e.g. "Slimming Clinics"
#' @param non_primary_inspection_category_code The non-primary inspection
#'  category code. e.g. "H1"
#' @param non_primary_inspection_category_name The non-primary inspection
#'  category name. e.g. "Slimming Clinics".
#' @param overall_rating Include only locations with a given inspection rating.
#' e.g. "Good". Accepts character vector of multiple inspection ratings.
#' @param region Region of the UK, e.g. "London" or "North East".
#' @param regulated_activity The type of activity at a location, e.g.
#' "Accommodation for persons who require treatment for substance misuse".
#' @param report_type The type of report, e.g. "Location", "Provider"
#'  or "CoreService".
#' @param verbose If `TRUE` prints download progress to console if requesting
#' more than 1,000 records. Defaults to `TRUE`.
#' @param clean_names If `TRUE`, converts a column names to snake_case.
#' Defaults to `TRUE`.
#'
#' @return A tibble with the location ID, name and postcode of all locations
#' meeting the given parameters.
#' @rdname locations
#' @export
#'
#' @examples
#' \donttest{
#' ## Get all care homes in Redbridge
#' loc1 <- cqc_locations_search(care_home = TRUE, local_authority = "Redbridge")
#' }
cqc_locations_search <- function(care_home = NULL, onspd_ccg_code = NULL,
                                 onspd_ccg_name = NULL, ods_ccg_code = NULL,
                                 ods_ccg_name = NULL,
                                 gac_service_type_description = NULL,
                                 constituency = NULL, local_authority = NULL,
                                 inspection_directorate = NULL,
                                 primary_inspection_category_code = NULL,
                                 primary_inspection_category_name = NULL,
                                 non_primary_inspection_category_code = NULL,
                                 non_primary_inspection_category_name = NULL,
                                 overall_rating = NULL, region = NULL,
                                 regulated_activity = NULL, report_type = NULL,
                                 verbose = TRUE, clean_names = TRUE) {
  if (is.null(care_home)) {
    ch_query <- ""
  } else if (care_home == TRUE) {
    ch_query <- "&careHome=Y"
  } else if (care_home == FALSE) {
    ch_query <- "&careHome=N"
  } else {
    ch_query <- ""
  }

  dots <- rlang::list2(
    onspd_ccg_code = onspd_ccg_code,
    onspd_ccg_name = onspd_ccg_name,
    ods_ccg_code = ods_ccg_code,
    ods_ccg_name = ods_ccg_name,
    gac_service_type_description = gac_service_type_description,
    constituency = constituency,
    local_authority = local_authority,
    inspection_directorate = inspection_directorate,
    non_primary_inspection_category_code = non_primary_inspection_category_code,
    non_primary_inspection_category_name = non_primary_inspection_category_name,
    primary_inspection_category_code = primary_inspection_category_code,
    primary_inspection_category_name = primary_inspection_category_name,
    overall_rating = overall_rating,
    region = region,
    regulated_activity = regulated_activity,
    report_type = report_type
  )

  dots_query <- cqc_utils_dots(dots)

  query <- paste0("locations?", dots_query, ch_query)

  query <- gsub("locations?&", "locations?", query, fixed = TRUE)

  df <- cqc_get_data(query, verbose, type = "locations", clean_names)

  df
}
