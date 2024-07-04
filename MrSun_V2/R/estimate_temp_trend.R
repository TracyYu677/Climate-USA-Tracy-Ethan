#' estimate_temp_trend
#'
#' This function estimates the temperature trend over time for a specific 
#' weather station using linear regression. It filters the input data for the 
#' specified station ID, converts dates to years, fits a linear model using 
#' lm(), and extracts the trend coefficient (slope) in degrees Celsius per year 
#' to represent the temperature trend.
#'
#' @param data A data frame containing temperature data with columns such as 
#' WBANNO, LST_DATE, and T_DAILY_AVG.
#' @param station_id The ID of the weather station for which to estimate the 
#' temperature trend.
#' 
#' @returns A data.frame object
#' @examples
#' estimate_temp_trend(merging, "53878")
#' estimate_temp_trend(merging, "3063")
#'
#' @export

estimate_temp_trend <- function(data, station_id) {
  library(dplyr)
  data_subset <- data %>%
    filter(WBANNO == station_id) %>%
    select(LST_DATE, T_DAILY_AVG)
  
  # Convert LST_DATE to years
  data_subset$day_of_year <- as.numeric(format(as.Date(data_subset$LST_DATE), 
                                               "%j"))
  
  # Fit a linear model using lm() to estimate the trend
  trend_model <- lm(T_DAILY_AVG ~ day_of_year + sin(2*pi*day_of_year/365.25) +
                      cos(2*pi*day_of_year/365.25), data = data_subset) 
  
  # Extract the trend coefficient (slope) in degrees Celsius per year
  t <- summary(trend_model)
  trend <- data.frame(
    trend = coef(trend_model)[2],
    std_error = t$coefficients[2, "Std. Error"],
    p_value = t$coefficients[2, "Pr(>|t|)"]
  )
  
  return(trend)
}