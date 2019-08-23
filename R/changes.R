
#https://anypoint.mulesoft.com/exchange/portals/care-quality-commission-5/4d36bd23-127d-4acf-8903-ba292ea615d4/cqc-syndication-1/1.0.37/console/method/%231570/

cqc_changes <- function(organisation_type = c("provider", "location"),
                        start_date = "2000-01-01", end_date = Sys.Date(),
                        verbose = TRUE, clean_names = TRUE) {

  time_query <- paste0("?startTimestamp=",
                       anytime::iso8601(anytime::anytime(start_date)), "Z&",
                       "endTimestamp=",
                       anytime::iso8601(anytime::anytime(end_date)), "Z")

  query <- paste0("changes/", tolower(organisation_type), time_query)

  df <- cqcr:::cqc_get_data(query, verbose = verbose, type = "changes",
                            clean_names)

  df

}
