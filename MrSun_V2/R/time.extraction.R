#' time.extraction
#'
#' This function extracts data from a given data frame based on station ID, 
#' start date, and end date criteria. If no station ID is provided, it returns 
#' the entire data frame. If a station ID is provided but not found in the data, 
#' an error is raised. It then filters data based on the specified time range 
#' (start and end dates).
#'
#' @param data A data frame containing time-related data with columns such as 
#' WBANNO and LST_DATE.
#' @param id Optional. The ID of the station from which to extract data.
#' @param start Optional. The start date in the format "Y-m-d" for filtering 
#' data within a specific time range.
#' @param end Optional. The end date in the format "Y-m-d" for filtering data 
#' within a specific time range.
#' 
#' @returns A data.frame object
#' @examples
#' time.extraction(merging, "53878")
#' time.extraction(merging, "53878", start = "2024-02-07")
#' time.extraction(merging, "53878", end = "2024-02-07")
#' time.extraction(merging, "53878", start = "2024-02-07", end = "2024-02-27")
#'
#' @export

time.extraction <- function(data, id = NULL, start = NULL, end = NULL) {

  if(is.null(id)) {filtered <- data
  } else if(!(id %in% data$WBANNO)){
    stop("id not found in data argument's ID column")
  } else { filtered <- data[data$WBANNO == id, ] }

  if (!is.null(start) && !is.null(end)) {
    filtered <- filtered[filtered$LST_DATE >= start &
                           filtered$LST_DATE <= end, ]
  } else if (!is.null(start)) {
    filtered <- filtered[filtered$LST_DATE >= start, ]
  } else if (!is.null(end)) {
    filtered <- filtered[filtered$LST_DATE <= end, ]
  }

  return(filtered)

}



