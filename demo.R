# Charger les bibliothèques
library(sf)
library(ggplot2)

# Charger un jeu de données d'exemple (les contours des comtés de Caroline du Nord)
nc <- st_read(system.file("shape/nc.shp", package="sf"))

# Fonctionnalité pour tester les mises à l'échelle
demo <- function() {
  # Appliquer un agrandissement avec un facteur de dilatation de 1.5
  nc_mise_echelle_agrandie <- mise_echelle_carte(nc, 1.5)

  # Appliquer une réduction avec un facteur de dilatation de 0.8
  nc_mise_echelle_reduite <- mise_echelle_carte(nc, 0.8)

  # Créer un graphique pour la carte agrandie
  plot1 <- ggplot(data = nc_mise_echelle_agrandie) +
    geom_sf(fill = "lightblue", color = "darkred") +
    ggtitle("Carte Agrandie (Facteur 1.5)") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5))

  # Créer un graphique pour la carte réduite
  plot2 <- ggplot(data = nc_mise_echelle_reduite) +
    geom_sf(fill = "#8e44ad", color = "#d35400") +
    ggtitle("Carte Réduite (Facteur 0.8)") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5))

  # Afficher les graphiques
  print(plot1)
  print(plot2)
}

# Exécuter le test
()
