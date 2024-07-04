
#' WBANNO, station name, state, the local standard time, the version number of the station datalogger program, the longitude, the latitude, the maximum 
#' air temperature, the minimum air temperature, mean air temperature, average air temperature, total amount of precipitation, total solar energy
#' of all the stations around USA, recording yearly temperature information for the 236 different stations.
#'
#' A dataset containing WBANNO, station name, state, the local standard time, the version number of the station datalogger program, the longitude, the latitude, the maximum 
#' air temperature, the minimum air temperature, mean air temperature, average air temperature, total amount of precipitation, total solar energy for 236 stations in US 
#' for multiple years starting from year 2000.
#
#' @format a dataframe with 1134351 rows and 13 columns
#' \describe{
#'     \item{WBANNO}{station id}
#'     \item{state}{state where the station locates}
#'     \item{station_name}{name of the station}
#'     \item{LST_DATE}{The Local Standard Time (LST) date of the observation}
#'     \item{CRX_VN}{The version number of the station datalogger program that was in 
#' effect at the time of the observation}
#'     \item{LONGITUDE}{Station longitude, using WGS-84}
#'     \item{LATITUDE}{Station latitude, using WGS-84.}
#'     \item{T_DAILY_MAX}{Maximum air temperature, in degrees C}
#'     \item{T_DAILY_MIN}{Minimum air temperature, in degrees C}
#'     \item{T_DAILY_MEAN}{Mean air temperature, in degrees C}
#'     \item{T_DAILY_AVG}{Average air temperature, in degrees C}
#'     \item{P_DAILY_CALC}{Total amount of precipitation, in mm}
#'     \item{SOLARAD_DAILY}{Total solar energy, in MJ/Meter^2}
#' }
"merging"

load("data/bigger_1.RData")
