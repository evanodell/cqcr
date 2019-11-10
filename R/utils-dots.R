

## Dots utility function
cqc_utils_dots <- function(dots) {
  dots_vector <- c()

  for (i in seq_along(dots)) { # retrieve the dots
    if (length(dots[[i]]) == 0) {
      dots_vector[i] <- ""
    } else if (length(dots[[i]]) == 1) {
      dots_vector[i] <- paste0(
        "&", snakecase::to_lower_camel_case(names(dots[i])), "=",
        paste0(dots[[i]], collapse = ",")
      )
    } else if (length(dots[[i]] > 1)) {
      dots_seq <- seq(from = 1, to = length(dots[[i]]))

      array_list <- list()

      for (j in seq_along(dots_seq)) {
        array_list[[j]] <- paste0(
          "&", snakecase::to_lower_camel_case(names(dots[i])), "=",
          paste0(dots[[i]][dots_seq[[j]]], collapse = ",")
        )
      }

      dots_vector[i] <- paste0(array_list, collapse = "")
    }
  }

  dots_query <- paste0(dots_vector, collapse = "")

  dots_query <- utils::URLencode(
    gsub("^&", "", dots_query)
  )

  dots_query
}
