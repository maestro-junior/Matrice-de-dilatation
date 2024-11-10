#' Apply a Dilation Matrix
#'
#' This function applies a dilation matrix to the geometry in an sf object.
#'
#' @param donnees_sf An sf object with spatial geometry data.
#' @param matrice_dilatation The dilation matrix.
#' @return An sf object with dilated geometry.
#' @export
#' @examples
#' library(sf)
#'
#' # Create a sample sf object
#' sample_sf <- st_as_sf(
#'   data.frame(id = 1:2, x = c(0, 1), y = c(0, 1)),
#'   coords = c("x", "y"),
#'   crs = 4326
#' )
#'
#' # Define a simple dilation matrix
#' dilation_matrix <- matrix(c(1.5, 0, 0, 1.5), nrow = 2)
#'
#' # Apply the dilation matrix
#' dilated_map <- appliquer_matrice_dilatation(sample_sf, dilation_matrix)
#'
#' # Print dilated map
#' print(dilated_map)
appliquer_matrice_dilatation <- function(donnees_sf, matrice_dilatation) {
  # Apply the dilation matrix to each geometry
  donnees_sf$geometry <- sf::st_geometry(donnees_sf) * matrice_dilatation
  return(donnees_sf)
}
