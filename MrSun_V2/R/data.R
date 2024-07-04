
#' WBANNO,names,state,longtidue,and latitude of all the stations around USA.
#'
#' A dataset containing station WBANNO, names, respective state information, longitude, latitude for 236 stations. 
#
#' @format a dataframe with 236 rows and 5 columns
#' \describe{
#'     \item{WBANNO}{station id}
#'     \item{station_name}{name of the station}
#'     \item{state}{state where the station locates}
#'     \item{LONGITUDE}{longitude of the station}
#'     \item{LATITUDE}{latitude of the station}
#' }
"unique_stations"

load("data/station_and_names.RData")

