#' Create the Whittaker biome base figure
#'
#' @description Creates the Whittaker biome figure from the vignette example.
#' This can be modified by passing additional \code{\link{ggplot2}} style
#' arguments to it
#'
#' @param extra_features Additional arguments to customize the Whittaker biome plot
#'
#' @return An object of class \code{gg} and \code{ggplot}.
#'
#' @author Sam Levin, Valentin Stefan
#'
#' @import ggplot2
#' @importFrom utils data
#' @export

whittaker_base_plot <- function(extra_features = NULL) {
  utils::data('Whittaker_biomes', envir = environment())
  utils::data("Ricklefs_colors", envir = environment())

  # degree symbol debugging source:
  # https://stackoverflow.com/questions/37554118/ggplot-inserting-space-before-degree-symbol-on-axis-label
  xlabel <- expression("Temperature " ( degree*C))

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
                               breaks = names(Ricklefs_colors),
                               labels = names(Ricklefs_colors),
                               values = Ricklefs_colors) +
    ggplot2::scale_x_continuous(xlabel) +
    ggplot2::scale_y_continuous('Precipitation (cm)') +
    extra_features


  return(plt)
}
