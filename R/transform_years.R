transform_years <- function(years) {

  years_string <- ""

  for (year in years) {
    stopifnot("invalid year" = year >= 1998 & year <= 2021)
    years_string <- paste(years_string, as.character(year), sep = ",")
  }

  return(substring(years_string, 2))
}
