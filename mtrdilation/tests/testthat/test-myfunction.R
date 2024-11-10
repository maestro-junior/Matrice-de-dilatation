library(testthat)
library(sf)
library(ggplot2)

# Sample data for testing
sample_sf <- st_as_sf(data.frame(id = 1:2, x = c(0, 1), y = c(0, 1)), coords = c("x", "y"), crs = 4326)

test_that("mise_echelle_carte correctly scales the map", {
  # Case where factor > 1 (enlargement)
  enlarged_map <- mise_echelle_carte(sample_sf, 1.5)
  expect_s3_class(enlarged_map, "sf")  # Check if the output is an sf object
  expect_message(mise_echelle_carte(sample_sf, 1), "No resizing")  # Check message for factor = 1

  # Case where factor < 1 (reduction)
  reduced_map <- mise_echelle_carte(sample_sf, 0.5)
  expect_s3_class(reduced_map, "sf")

  # Case where factor is invalid
  expect_error(mise_echelle_carte(sample_sf, -1), "The dilation factor must be greater than 0.")
})

test_that("appliquer_matrice_dilatation correctly applies dilation matrix", {
  # Define a simple dilation matrix
  dilation_matrix <- matrix(c(1.5, 0, 0, 1.5), nrow = 2)

  # Apply dilation
  dilated_map <- appliquer_matrice_dilatation(sample_sf, dilation_matrix)
  expect_s3_class(dilated_map, "sf")  # Check if the output is an sf object
})

test_that("afficher_carte_mise_echelle displays resized map correctly", {
  # Scale a map for display
  scaled_map <- mise_echelle_carte(sample_sf, 1.5)

  # Display map and check output type
  plot <- afficher_carte_mise_echelle(scaled_map, 1.5)
  expect_s3_class(plot, "gg")  # Check if the output is a ggplot object
})
