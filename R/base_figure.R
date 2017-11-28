#' Create the Whittaker biome base figure
#'
#' @description Creates the Whittaker biome figure from the vignette example.
#' This can be modified by passing additional \code{\link{ggplot2}} style
#' arguments to it
#' @param color_palette A named vector of length 9 that contains either
#' color names or values. The names should correspond to biome names in the
#' \code{Whittaker_biomes} data object. See details for additional information.
#' The default is to use the colors from Figure 5.5 in Ricklefs, R. E. (2008),
#' \emph{The economy of nature} (Chapter 5, Biological Communities, The biome concept).
#' @param extra_features Additional arguments to customize the Whittaker biome plot
#'
#' @return An object of class \code{gg} and \code{ggplot}.
#'
#' @details To specify your own color palette, create a named vector
#' where the names correspond to biome type and the values correspond to the
#' colors you'd like to use. This can either be numeric (e.g. 1,2,3, etc) or
#' character (e.g. 'red' or '#C1E1DD'). The names for each biome are as follows:
#' \itemize{
#'   \item{\code{Tundra}}
#'   \item{\code{Boreal forest}}
#'   \item{\code{Temperate seasonal forest}}
#'   \item{\code{Temperate rain forest}}
#'   \item{\code{Tropical rain forest}}
#'   \item{\code{Tropical seasonal forest/savanna}}
#'   \item{\code{Subtropical desert}}
#'   \item{\code{Temperate grassland/desert}}
#'   \item{\code{Temperate grassland/desert}}
#'   \item{\code{Woodland/shrubland}}
#' }
#'
#' @author Valentin Stefan, Sam Levin
#'
#' @import ggplot2
#' @importFrom utils data
#' @export

whittaker_base_plot <- function(color_palette = NULL,
                                extra_features = NULL) {
  utils::data('Whittaker_biomes', envir = environment())

  # degree symbol debugging source:
  # https://stackoverflow.com/questions/37554118/ggplot-inserting-space-before-degree-symbol-on-axis-label
  xlabel <- expression("Temperature " ( degree*C))
  if(is.null(color_palette)) {
    utils::data("Ricklefs_colors", envir = environment())
    colors <- Ricklefs_colors
  }

  plt <- ggplot2::ggplot() +
    # add biome polygons
    ggplot2::geom_polygon(data = Whittaker_biomes,
                          ggplot2::aes(x      = temp_c,
                                       y      = precp_cm,
                                       fill   = biome,
                                       group  = biome_id),
                          # adjust polygon border
                          colour = "gray98",
                          size   = 1) +
  # fill the polygons with predefined colors
    ggplot2::scale_fill_manual(name   = "Whittaker biomes",
                               breaks = names(color_palette),
                               labels = names(color_palette),
                               values = color_palette) +
    ggplot2::scale_x_continuous(xlabel) +
    ggplot2::scale_y_continuous('Precipitation (cm)') +
    extra_features


  return(plt)
}
