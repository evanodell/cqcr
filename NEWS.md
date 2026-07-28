
# 0.1.5.9000

* `cqc_query_construction()` now retries non-200 API responses (up to 3
  attempts, with exponential backoff) instead of failing on the first blip.
* If all retries are exhausted, it now raises a structured `cqcr_api_error`
  condition (with `status`, `url`, and `body` fields) via `rlang::abort()`
  instead of silently returning a mismatched-shape data frame. Previously
  this caused confusing downstream errors like
  `argument is of length zero` in `cqc_get_data()` rather than a clear
  message about the actual API failure.

# 0.1.3.9000

* Page size options

# cqcr 0.1.3

* New `cqc_location_details` function.

## Internal changes

* Reduced json page sizes on calls

* Code-reorganising to streamline maintenance

## Non-breaking changes

* Package now displays a message if cqc_partner_code is not set. Message will 
be displayed even if `verbose=FALSE`.


# cqcr 0.1.2

Improvements to MAN pages

# cqcr 0.1.1

Fixed error in CITATION file.

# cqcr 0.1.0

* First version release
