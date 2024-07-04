#' yearly_cycle
#'
#' This function calculates the yearly temperature cycle for a specific weather 
#' station using sinusoidal regression based on daily average temperatures. It 
#' filters the input data for the specified station ID, converts dates to day 
#' of the year, fits a sinusoidal regression model using lm, and predicts the 
#' expected temperatures for each day of the year. 
#'
#' @param data A data frame containing temperature data with columns such as 
#' WBANNO, LST_DATE, and T_DAILY_AVG.
#' @param station_id The ID of the weather station for which to estimate the 
#' yearly temperature cycle.
#' 
#' @returns A data.frame object
#' @examples
#' yearly_cycle(merging, "53878")
#' yearly_cycle(merging, "3063")
#' 
#' @export

yearly_cycle <- function(data, station_id) {
  library(dplyr)
  data_subset <- data |>
    filter(WBANNO == station_id) |>
    select(LST_DATE, T_DAILY_AVG) # Give T_DAILY_MEAN as a option if you have time

  # Convert LST_DATE to day of the year
  data_subset$day_of_year <- as.numeric(format(as.Date(data_subset$LST_DATE),
                                               "%j"))

  # Fit a model using lm()
  model <- lm(T_DAILY_AVG ~ day_of_year + sin(2*pi*day_of_year/365.25) +
                cos(2*pi*day_of_year/365.25), data = data_subset)

  # Create a data frame with expected temperatures for each day of the year
  days <- 1:365
  expected_temps <- predict(model, newdata = data.frame(day_of_year = days))
  yearly_cycle <- data.frame(day_of_year = days, expected_temperature =
                               expected_temps)

  return(yearly_cycle)
}
