#' Get vector of all cities
#'
#' Get a vector of all possible cities, that are covered by the KPI-information
#'
#' @return Vector with all cities as string
#'
#' @examples
#' get_all_cities()
#'
#' @export

get_all_cities <- function() {

  all_cities <- GET(url="http://api.kolada.se/v2/municipality?")
  all_cities <- fromJSON(rawToChar(all_cities$content))$values

  return(as.vector(all_cities[, "title"]))
}
