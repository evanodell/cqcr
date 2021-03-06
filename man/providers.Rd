% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/providers.R
\name{cqc_providers}
\alias{cqc_providers}
\title{CQC Providers}
\usage{
cqc_providers(
  constituency = NULL,
  local_authority = NULL,
  inspection_directorate = NULL,
  non_primary_inspection_category_code = NULL,
  non_primary_inspection_category_name = NULL,
  primary_inspection_category_code = NULL,
  primary_inspection_category_name = NULL,
  overall_rating = NULL,
  region = NULL,
  regulated_activity = NULL,
  report_type = NULL,
  verbose = TRUE,
  clean_names = TRUE
)
}
\arguments{
\item{constituency}{Location is in a given parliamentary constituency}

\item{local_authority}{Location is in a given local authority.}

\item{inspection_directorate}{The type of inspection directorate. Accepts
one or more off "Adult social care", "Hospitals",
"Primary medical services" or "Unspecified".}

\item{non_primary_inspection_category_code}{The non-primary inspection
category code. e.g. "H1"}

\item{non_primary_inspection_category_name}{The non-primary inspection
category name. e.g. "Slimming Clinics".}

\item{primary_inspection_category_code}{The primary inspection
category code. e.g. "H1"}

\item{primary_inspection_category_name}{The primary inspection
category name. e.g. "Slimming Clinics"}

\item{overall_rating}{Include only locations with a given inspection rating.
e.g. "Good". Accepts character vector of multiple inspection ratings.}

\item{region}{Region of the UK, e.g. "London" or "North East".}

\item{regulated_activity}{The type of activity at a location, e.g.
"Accommodation for persons who require treatment for substance misuse".}

\item{report_type}{The type of report, e.g. "Location", "Provider"
or "CoreService".}

\item{verbose}{If \code{TRUE} prints download progress to console if requesting
more than 1,000 records. Defaults to \code{TRUE}.}

\item{clean_names}{If \code{TRUE}, converts a column names to snake_case.
Defaults to \code{TRUE}.}
}
\value{
A tibble with the provider ID, name and postcode of all providers
meeting the given parameters.
}
\description{
Retrieve CQC providers, subject to given parameters.
}
\examples{
\donttest{
# All providers in Tower Hamlets
prov1 <- cqc_providers(local_authority = "Tower Hamlets")
}

}
