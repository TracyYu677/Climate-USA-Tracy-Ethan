#' plot_interpolations
#'
#' This function plots gridded interpolations of daily mean temperature data on 
#' a map using ggplot2. It takes a data frame with columns for latitude, 
#' longitude, and a column of interest (value) as input and generates a tile 
#' plot on a map.
#'
#' @param interpolated_data A data frame containing interpolated data with 
#' columns for at least latitude (LATITUDE), longitude (LONGITUDE), and a 
#' variable of interest (value).
#' @param title gives a title to the resulting plot, is "Gridded Interpolations 
#' of Daily Mean Temperature" by default.
#' @param leg gives a name to the legend for the resulting plot, is "Celsius" 
#' by default.
#' 
#' @returns A data.frame object
#' @examples
#' plot_interpolations(data)
#' plot_interpolations(data, title = "This is a title", leg = "Years")
#' 
#' @export

plot_interpolations <- function(interpolated_data, 
                    title = "Gridded Interpolations of Daily Mean Temperature", 
                    leg = "Celsius") {
  # Plot interpolated data on a map
  library(ggplot2)
  ggplot() +
    geom_tile(data = interpolated_data, 
              aes(x = LATITUDE, y = LONGITUDE, fill = value)) +
    scale_fill_viridis_c() +
    labs(title = title, fill = leg) +
    geom_polygon(data = map_data("state"), 
                 aes(x = long, y = lat, group = group), 
                 fill = NA, color = "black", alpha = 0.3) +
    theme_minimal() +
    theme(panel.grid = element_blank())
}
