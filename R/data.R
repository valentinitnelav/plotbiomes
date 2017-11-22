###############################################################################
## This file documents the data objects included in the package.
###############################################################################

# =============================================================================
# The data frame object Whittaker_biomes
# =============================================================================
#' @title
#' Whittaker's biomes
#'
#' @description
#' A dataset containing boundaries of biomes with respect to average annual
#' temperature and precipitation. Digitized from **Figure 5.5** in *Ricklefs, R. E.
#' (2008). The economy of nature. W. H. Freeman and Company.* (Chapter 5,
#' Biological Communities, The biome concept).
#'
#' @format
#' A data frame with 1121 rows and 4 variables:
#' \tabular{rlllllr}{
#'          \tab **Variable** \tab   \tab **Type**    \tab \tab **Description** \cr
#'   \[, 1] \tab **temp_c**   \tab , \tab *numeric*   \tab : \tab Average annual temperature (degree Celsius)\cr
#'   \[, 2] \tab **precp_cm** \tab , \tab *numeric*   \tab : \tab Average annual precipitation (cm)\cr
#'   \[, 3] \tab **biome_id** \tab , \tab *numeric*   \tab : \tab Biome's id. Important for plotting order in ggplot.\cr
#'   \[, 4] \tab **biome**    \tab , \tab *character* \tab : \tab Biome's name
#' }
#'
#' @details
#' Values in **temp_c** and **precp_cm** represent edge points on the borders
#' between biome polygons as they were digitized.
#' For more details see the vignette:
#' \code{RShowDoc("Whittaker_biomes_dataset", package = "plotbiomes")}
#'
#' @examples
#' require(plotbiomes)
#' require(ggplot2)
#' ggplot() +
#'  geom_polygon(data = Whittaker_biomes,
#'               aes(x      = temp_c,
#'                   y      = precp_cm,
#'                   fill   = biome,
#'                   group  = biome_id),
#'               colour = "gray98", # colour of polygon border
#'               size   = 0.5)      # thickness of polygon border
#'
#' # Run example in console with: example(Whittaker_biomes)
#' @md
"Whittaker_biomes"

# =============================================================================
# The character vector Ricklefs_colors
# =============================================================================
#' @title
#' Biome colors from *Ricklefs (2008)*
#'
#' @description
#' Colors used for biome polygons in Figure 5.5 from *Ricklefs, R. E. (2008),
#' The economy of nature. W. H. Freeman and Company.*
#' (Chapter 5, Biological Communities, The biome concept).
#'
#' @format
#' Named character vector
#'
#' @examples
#' require(plotbiomes)
#' require(ggplot2)
#' ggplot() +
#'  geom_polygon(data = Whittaker_biomes,
#'               aes(x      = temp_c,
#'                   y      = precp_cm,
#'                   fill   = biome,
#'                   group  = biome_id),
#'               colour = "gray98", # colour of polygon border
#'               size   = 0.5) +    # thickness of polygon border
#'  # fill the polygons with predefined colors
#'  scale_fill_manual(name   = "Whittaker biomes",
#'                    breaks = names(Ricklefs_colors),
#'                    labels = names(Ricklefs_colors),
#'                    values = Ricklefs_colors)
#'
#' # Run example in console with: example(Ricklefs_colors)
#' @md
"Ricklefs_colors"
