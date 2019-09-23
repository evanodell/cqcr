
#' CQC Providers
#'
#' Retrieve CQC providers, subject to given parameters.
#'
#' @inheritParams cqc_locations_search
#'
#' @return A tibble with the provider ID, name and postcode of all providers
#' meeting the given parameters.
#' @export
#'
#' @rdname providers
#' @examples
#' \donttest{
#' # All providers in Tower Hamlets
#' prov1 <- cqc_providers(local_authority = "Tower Hamlets")
#' }
#'
cqc_providers <- function(constituency = NULL, local_authority = NULL,
                          inspection_directorate = NULL,
                          non_primary_inspection_category_code = NULL,
                          non_primary_inspection_category_name = NULL,
                          primary_inspection_category_code = NULL,
                          primary_inspection_category_name = NULL,
                          overall_rating = NULL, region = NULL,
                          regulated_activity = NULL, report_type = NULL,
                          verbose = TRUE, clean_names = TRUE) {
  dots <- rlang::list2(
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

  query <- paste0("providers?", dots_query)

  query <- gsub("providers?&", "providers?", query)

  df <- cqc_get_data(query, verbose, type = "providers", clean_names)

  df
}
