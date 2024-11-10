#' Scale the Map
#'
#' This function resizes an urban map generated from a graphical package
#' (e.g., ggplot2, sf) using a dilation matrix.
#'
#' @param carte_donnees The spatial data in the form of an sf object.
#' @param facteur_dilatation Scaling factor. If >1, the map is enlarged;
#'                             if between 0 and 1, the map is reduced;
#'                             if =1, it remains unchanged.
#' @return A resized sf object.
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
#' # Define a dilation factor (e.g., 1.5 for enlargement)
#' facteur_dilatation <- 1.5
#'
#' # Scale the map
#' scaled_map <- mise_echelle_carte(sample_sf, facteur_dilatation)
#'
#' # Print scaled map
#' print(scaled_map)
mise_echelle_carte <- function(carte_donnees, facteur_dilatation) {
  if (facteur_dilatation <= 0) stop("The dilation factor must be greater than 0.")

  # If factor = 1, the map remains unchanged
  if (facteur_dilatation == 1) {
    message("No resizing, dilation factor = 1.")
    return(carte_donnees)
  }

  # Apply the dilation matrix
  matrice_dilatation <- matrix(c(facteur_dilatation, 0,
                                 0, facteur_dilatation), nrow = 2)

  if (inherits(carte_donnees, "sf")) {
    # Apply dilation to the sf geometry data
    donnees_mise_echelle <- appliquer_matrice_dilatation(carte_donnees, matrice_dilatation)
  } else {
    stop("Unsupported data type: please provide an 'sf' object.")
  }

  return(donnees_mise_echelle)
}
