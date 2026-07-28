
library(testthat)
library(cqcr)



# Load the package and run tests
devtools::load_all(".")

test_check("cqcr")

# Optionally, clear the R option after tests
options("cqc.subscription.key" = NULL)
