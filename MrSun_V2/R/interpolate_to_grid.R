#' interpolate_to_grid
#'
#' This function interpolates daily average temperature data from weather 
#' stations to grid points using Gaussian process regression (GpGp) with a 
#' Matérn covariance function on a spherical surface. It first filters the 
#' stations_data for a specific year (if provided), selects the necessary 
#' columns, and fits a spatial model using fit_model from GpGp. The fitted 
#' model is then used to predict T_DAILY_AVG for the grid points, and the 
#' results, standard error, and p-value are returned as a data frame.
#'
#' @param grid A data frame containing grid points with columns for latitude 
#' (LATITUDE) and longitude (LONGITUDE).
#' @param stations_data A data frame containing weather station data with 
#' columns containing at least a column for latitude (LATITUDE), longitude 
#' (LONGITUDE), date (LST_DATE), and the column of interest
#' @param interest_var The names of the column of interest, is "T_DAILY_AVG" by
#' default.
#' @param year Optional, filters out the year of using LST_DATE.
#' 
#' @returns A data.frame object
#' @examples
#' grid_data <- interpolate_to_grid(grid, stations_data, interest_var = "mean")
#' grid_data <- interpolate_to_grid(grid, stations_data, year = 2024)
#' 
#' @export

interpolate_to_grid <- function(grid, stations_data, 
                                interest_var = "T_DAILY_AVG", year = NULL) {
  library(GpGp)
  library(dplyr)
  library(lubridate)
  
  # Filter stations data for a specific year if not NULL
  if (!is.null(year)) {
    stations_data <- stations_data %>% 
      filter(format(LST_DATE, "%Y") == year)
  }
  
  stations_data <- stations_data[, c(interest_var, "LATITUDE", "LONGITUDE")]

  # Fit spatial model
  grid_a <- data.frame(LONGITUDE = stations_data$LONGITUDE,
                       LATITUDE = stations_data$LATITUDE)
  fit_spatial_model <- fit_model(stations_data[, interest_var], loc = grid_a,
                                 covfun_name = "matern_sphere", silent = TRUE)
  
  # Predict interest_var for grid points
  X_pred <- matrix(1, nrow = nrow(grid), ncol = 1)
  pred_2 <- predictions(fit_spatial_model, locs_pred = grid, X_pred = X_pred)
  
  # Create final data frame
  final_data <- data.frame(LATITUDE = grid$x, LONGITUDE = grid$y, 
                           value = pred_2)
  return(final_data)
}