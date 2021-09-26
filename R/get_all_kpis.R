library(httr)
library(jsonlite)
library(tidyr)

all_kpi_groups <- GET(url="http://api.kolada.se/v2/kpi_groups")
all_kpi_groups <- fromJSON(rawToChar(all_kpi_groups$content))

kpi_df <- all_kpi_groups_unpack$values

kpi_groups_df <- kpi_df[, c("id", "title")]

hallo <- kpi_df %>% unnest(cols="members")


c[6,]$values
