#' Request data from Kolade.se
#'
#' Request KPI data from Kolada.se for multiple cities and years
#'
#' @return Dataframe that contains the requested KPI data
#'
#' @examples
#' get_infos(kpis = c("N02904", "U28116"), cities = c("Helsingborg", "Askersund"), years = c(2019, 2013))
#'
#' @export
#'
get_infos <- function(kpis, cities, years) {


  # prepare kpis for request

  all_kpis_df <- get_all_kpis()

  kpi_string <- ""

  for (kpi in kpis) {
    # check whether kpi is a group
    if (kpi %in% all_kpis_df$id) {
      member_kpis <- all_kpis_df[all_kpis_df$id == kpi, ]$member_id
      for (member_kpi in member_kpis) {
        kpi_string <- paste(kpi_string, member_kpi, sep = ",")
      }
    }

    else if (kpi %in% all_kpis_df$member_id) {
      kpi_string <- paste(kpi_string, kpi, sep = ",")
    }

    else {
      stop("Not a valid KPI.")
    }
  }

  kpi_string <- substring(kpi_string, 2)

  # prepare cities for request
  city_string <- get_city_codes(cities)

  # prepare years for request
  years_string <- transform_years(years)


  #request API
  request_url <- paste("http://api.kolada.se/v2/data/kpi/", kpi_string,
               "/municipality/", city_string,
               "/year/", years_string, sep = "")

  request <- GET(url=request_url)
  request <- fromJSON(rawToChar(request$content))$values

  request_unnested <- unnest(request, cols = "values")

  return(request_unnested)
}
