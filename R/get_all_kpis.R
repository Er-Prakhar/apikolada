#' Get overview of all possible KPIs
#'
#' Get all KPI-groups with ids and title together with their individual KPI members including
#' member_title and member_id.
#'
#' @return Dataframe with KPI-Id, KPI-title, group-Id and title it belongs to
#'
#' @examples
#' get_all_kpis()
#'
#' @import httr
#' @import jsonlite
#' @import tidyr
#'
#' @export

get_all_kpis <- function() {

# get all kpi groups with ids and title + their individual kpis members including
# member_title and member_id

# get json file of all kpis and transform it to data.frame
all_kpi_groups <- GET(url="http://api.kolada.se/v2/kpi_groups")
all_kpi_groups <- fromJSON(rawToChar(all_kpi_groups$content))

kpi_df <- all_kpi_groups$values

#data.frame with all kpi groups
kpi_groups_df <- kpi_df[, c("id", "title")]

#data.frame with all individual kpis
all_kpis <- kpi_df %>% unnest(cols="members")

return(all_kpis)

}
