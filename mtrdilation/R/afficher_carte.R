#' Display the Rescaled Map
#'
#' This function displays the resized map and indicates whether it has been reduced or enlarged.
#'
#' @param carte_mise_echelle The resized map data (sf object).
#' @param facteur_dilatation The dilation factor used for resizing.
#' @return A ggplot object displaying the resized map.
#' @import ggplot2
#' @export
#' @examples
#' library(sf)
#' library(ggplot2)
#'
#' # Create a sample sf object
#' sample_sf <- st_as_sf(
#'   data.frame(id = 1:2, x = c(0, 1), y = c(0, 1)),
#'   coords = c("x", "y"),
#'   crs = 4326
#' )
#'
#' # Define a dilation factor
#' facteur_dilatation <- 1.5
#'
#' # Scale the map
#' scaled_map <- mise_echelle_carte(sample_sf, facteur_dilatation)
#'
#' # Display the scaled map
#' afficher_carte_mise_echelle(scaled_map, facteur_dilatation)
afficher_carte_mise_echelle <- function(carte_mise_echelle, facteur_dilatation) {
  if (inherits(carte_mise_echelle, "sf")) {
    plot <- ggplot(data = carte_mise_echelle) +
      geom_sf() +
      ggtitle(ifelse(facteur_dilatation > 1, "Enlarged Map", "Reduced Map")) +
      theme_minimal()

    # Status message
    if (facteur_dilatation > 1) {
      message("The map has been enlarged.")
    } else if (facteur_dilatation < 1) {
      message("The map has been reduced.")
    }

    return(plot)
  } else {
    stop("Display is only supported for 'sf' objects.")
  }
}
