transform_years <- function(years) {

  years_string <- ""

  for (year in years) {
    years_string <- paste(years_string, as.character(year), sep = ",")
  }

  return(substring(years_string, 2))
}
