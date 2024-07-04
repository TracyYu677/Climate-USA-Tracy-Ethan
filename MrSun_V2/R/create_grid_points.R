#' create_grid_points
#'
#' This function generates a grid of points within the bounding box of the USA 
#' map. It first loads USA map data using ggplot2::map_data("usa") and filters 
#' it to include only the main landmass (group == 1). It then calculates the 
#' bounding box coordinates of the USA map, creates grid points with a specified 
#' resolution within this bounding box, and checks if each point falls within 
#' the USA polygon. Grid points outside the USA polygon are excluded from the 
#' final output.
#'
#' @param resolution The resolution of the grid points, specifying the distance 
#' between each point in degrees. Default is 0.1 degrees.
#' 
#' @returns A data.frame object
#' @examples
#' create_grid_points(0.8)
#' create_grid_points()
#' create_grid_points(4)
#'
#' @export

create_grid_points <- function(resolution = 0.1) {
  # Load USA map data
  usa_map <- ggplot2::map_data("usa") |> dplyr::filter(group==1)

  # Extract bounding box coordinates
  xmin <- min(usa_map$long)
  xmax <- max(usa_map$long)
  ymin <- min(usa_map$lat)
  ymax <- max(usa_map$lat)

  # Create grid points within the bounding box
  x <- seq(from = xmin, to = xmax, by = resolution)
  y <- seq(from = ymin, to = ymax, by = resolution)
  grid_points <- expand.grid(x = x, y = y)

  # Check if points are inside the USA polygon
  inside_usa <- sp::point.in.polygon(grid_points$x, grid_points$y, usa_map$long,
                                     usa_map$lat)
  grid_points <- grid_points[as.logical(inside_usa), ]
  return(grid_points)
}
