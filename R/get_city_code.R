get_city_code <- function(city_name) {

  stopifnot("The entered city name is not a string." = is.character(city_name))

  city_url <- paste("http://api.kolada.se/v2/municipality?title=", city_name, sep = "")

  city_response <- GET(url=city_url)
  city_response <- fromJSON(rawToChar(city_response$content))

  if (city_response$count == 0) {
    stop("Entered city is not a valid city name.")
  }

  city_value <- city_response$values$id[which(city_response$values$title == city_name)]

  return(city_value)
}




get_city_codes <- function(city_names) {

  #get city codes for multiple cities in api-format: city1,city2,...
  all_cities_string <- ""

  for (city in city_names) {
    city_code <- get_city_code(city)
    all_cities_string <- paste(all_cities_string, city_code, sep = ",")
  }

  return(substring(all_cities_string, 2))
}
